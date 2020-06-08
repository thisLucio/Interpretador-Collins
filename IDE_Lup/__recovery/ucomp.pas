unit ucomp;

interface

uses
  Winapi.Windows, Winapi.Messages, StrUtils, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    function readLine(s: String): String;

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
     linha: String;

begin
    arq := edtAbrirArquivo.text;
     //  ShowMessage(Copy('texto', 2, 3));
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
               MessageDlg('Não pode deixar em branco né amigão', mtError, [mbOK], 0);
          end
        else
        begin
           path := (edtNomeArquivo.text + '.last');

           //MemoCode.Lines.SaveToFile(edtNomeArquivo.text + '.last');
           peloamor := 'a';

           if peloamor = 'a' then
           begin
             // getLine(peloamor);
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
               Image1.Picture.LoadFromFile('../images/omg.bmp');

end;
function TFormLup.readLine(s: String): String;
begin

        // RichOut.Lines.LoadFromFile(s);
end;

  procedure TFormLup.vaipracaClick(Sender: TObject);
begin
        Image1.Picture.LoadFromFile('../images/omg.bmp');
end;

procedure TFormLup.vaipralaClick(Sender: TObject);
begin

         Image1.Picture.LoadFromFile('../images/page1.bmp');
end;

procedure TFormLup.leitura(Sender: TRichEdit);
  var
   I: Integer;
   Token: String;
    linha : Integer;
    NovoConteudo: String;
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
       // for I := 0 to RichOut.Lines.Count - 1 do
          //  if RichOut.Lines.strings[I].Contains('Lout:=') then
                 //  begin
                     {
                      lista := TStringList.Create;

                      lista.Add(RichOut.Lines.strings[I]);
                        RichOut.Lines.Clear;
                      RichOut.Lines.Add('Compilou legal Bro!');
                      lista.Text := StringReplace(lista.text, 'Lout:=', '', [rfReplaceAll]);
                      showmessage(lista.Text + #13#10);
                      }

                     //  for j:= 0 to -1 Count do
                     //  begin
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
                                        //  break;
                                end;

                    //   end;

                      RichOut.Lines.Clear;
                      RichOut.Lines.Add('Compilou legal Bro!');
              //   end;

  end;

end.
