unit ucomp;

interface

uses
  Winapi.Windows, Winapi.Messages, StrUtils, pngimage, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.TabNotBk, Vcl.ExtDlgs, Vcl.DBCtrls, Vcl.Buttons, Vcl.OleCtrls, SHDocVw;

type
  TFormLup = class(TForm)
    pgcEdit: TPageControl;
    tbsComp: TTabSheet;
    tbsDoc: TTabSheet;
    btnCompilar: TBitBtn;
    edtNomeArquivo: TLabeledEdit;
    edtAbrirArquivo: TLabeledEdit;
    btnAbrirArquivo: TBitBtn;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    RichCode: TRichEdit;
    RichOut: TRichEdit;
    Image1: TImage;
    vaiprala: TButton;
    vaipraca: TButton;
    procedure FormActivate(Sender: TObject);
    procedure btnCompilarClick(Sender: TObject);
    procedure leitura(Sender: TRichEdit);
    procedure btnAbrirArquivoClick(Sender: TObject);
    procedure vaipralaClick(Sender: TObject);
    procedure vaipracaClick(Sender: TObject);



  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  FormLup: TFormLup;
  memoteste: String;
  path: String;


implementation

{$R *.dfm}



procedure TFormLup.btnAbrirArquivoClick(Sender: TObject);
 var arq: String;

begin
    arq := edtAbrirArquivo.text;
     RichCode.Lines.LoadFromFile(arq);
end;

procedure TFormLup.btnCompilarClick(Sender: TObject);
var
peloamor: String;
i, ipos, linha,tamanho : Integer;
Token : string;
begin

       if (RichCode.Text = '') or (edtNomeArquivo.Text = '') and (edtAbrirArquivo.Text = '')then
          begin
               MessageDlg('Insira o nome do novo arquivo e digite o código', mtError, [mbOK], 0);
          end
        else
        begin
           path := (edtNomeArquivo.text + '.last');

           peloamor := 'a';

           if peloamor = 'a' then
           begin

             leitura(RichCode);
           end
           else
           begin
               MessageDlg('Teste!', mtError, [mbOK], 0);
           end;
        end;
end;

procedure TFormLup.FormActivate(Sender: TObject);


begin

               RichOut.Lines.Clear;
               Image1.Picture.LoadFromFile('../images/lastjoke.png');
               vaipraca.Enabled := False;
               vaipraca.Visible := False;
end;


  procedure TFormLup.vaipracaClick(Sender: TObject);
begin
        vaipraca.Enabled := False;
        vaipraca.Visible := False;
        vaiprala.Enabled := True;
      vaiprala.Visible := True;
        Image1.Picture.LoadFromFile('../images/lastjoke.png');
end;

procedure TFormLup.vaipralaClick(Sender: TObject);

begin
      vaiprala.Enabled := False;
      vaiprala.Visible := False;
       vaipraca.Enabled := True;
      vaipraca.Visible := True;

             Image1.Picture.LoadFromFile('../images/page1.png');


end;

procedure TFormLup.leitura(Sender: TRichEdit);
  var
   I: Integer;
    linha : Integer;

     lista: TStringList;
     j:integer;
  begin
    linha := 0;
    if Sender = RichCode then
        for I := 0 to RichCode.Lines.Count - 1 do
          if Pos(RichCode.Lines.Strings[I], 'Init:') > 0 then
            begin
               if RichCode.Lines.strings[I].Contains('Lout:=') then
                    begin

                        RichCode.Lines.SaveToFile(path);

                    end
               else

               Break;

            end
         else
             begin
                MessageDlg('Esperado "Init:" na linha '+ RichCode.Lines.Strings[linha], mtError, [mbOK], 0);
                 RichOut.Lines.Clear;
             end;

        if Pos(RichCode.Lines.Strings[RichCode.Lines.Count - 1], 'Finish:')>0 then
               begin
                 RichCode.Lines.SaveToFile(path);
                 RichOut.Lines.LoadFromFile(path);

                 RichOut.Lines.delete(RichCode.Lines.Count-1);
                 RichOut.Lines.Delete(0);

            end
         else
             begin
                      MessageDlg('Esperado "Finish:" na útilma linha: ', mtError, [mbOK], 0);
                       RichOut.Lines.Clear;
             end;

                              lista := TStringList.Create;
                              for J := 0 to RichOut.Lines.Count - 1 do
                              begin

                                lista.Add (RichOut.Lines.strings[J]);

                                lista.Text := StringReplace(lista.text, 'Lout:=', EmptyStr, [rfReplaceAll]);
                                lista.Text := StringReplace(lista.text, 'var:', EmptyStr, [rfReplaceAll]);

                              end;
                                if lista.Text.IsEmpty then
                                begin
                                      lista.Destroy;
                                end
                                else
                                begin
                                          showmessage(lista.Text);
                                          RichOut.Lines.Clear;

                                end;



                      RichOut.Lines.Clear;
                      RichOut.Lines.Add('Compilou legal Bro!');
  end;



end.
