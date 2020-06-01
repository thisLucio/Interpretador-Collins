unit ucomp;

interface

uses
  Winapi.Windows, Winapi.Messages, StrUtils, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.TabNotBk, Vcl.ExtDlgs, Vcl.DBCtrls, Vcl.Buttons;

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
    procedure FormActivate(Sender: TObject);
    procedure btnCompilarClick(Sender: TObject);
    procedure leitura(Sender: TRichEdit);
    procedure btnAbrirArquivoClick(Sender: TObject);



  private
    { Private declarations }
    function readLine(s: String): String;
   // function getLine(a1: integer): integer;
  //  function lexer(g: String): String;
   // function getToken(a: String): String;

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
               MessageDlg('N�o pode deixar em branco n� amig�o', mtError, [mbOK], 0);
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

end;
function TFormLup.readLine(s: String): String;
begin

        // RichOut.Lines.LoadFromFile(s);
end;
{
function TFormLup.getLine(a1: integer): integer;
var
peloamor: integer;
i, ipos, linha,tamanho : Integer;
charArray: Char;
buffer : string;
begin
   linha := 0;
    for I := 0 to RichCode.Lines.Count - 1 do
       if Pos(RichCode.Lines.Strings[I], 'Init:') > 0 then
          begin
             // RichCode.Lines.SaveToFile(path);
             //RichOut.Lines.LoadFromFile(path);
              //RichOut.Lines.Delete(linha);

             if RichCode.Lines.strings[linha].Contains('Lout:=') then
                  begin
                      //RichOut.Lines.strings[linha].Replace(#13#10, 'Lout:=');
                      RichCode.Lines.SaveToFile(path);

                  end
             else
                 //  begin
                 //       MessageDlg('Esperado "Lout:=" '+ RichCode.Lines.strings[linha], mtError, [mbOK], 0);
                 //        RichOut.Lines.Clear;
                    // end;
             Break;

          end
       else
           begin
              MessageDlg('Esperado "Init:" na linha '+ RichCode.Lines.Strings[linha], mtError, [mbOK], 0);
               RichOut.Lines.Clear;
           end;


       // if Pos(RichCode.Lines.Strings[I], 'Lout:=') > 0 then
       // begin

       // end;
   //   RichOut.Lines.Strings[I].Replace('Lout:=', '');
      if Pos(RichCode.Lines.Strings[RichCode.Lines.Count - 1], 'Finish:')>0 then
             begin
               RichCode.Lines.SaveToFile(path);
               RichOut.Lines.LoadFromFile(path);
               RichOut.Lines.delete(RichCode.Lines.Count-1);
               RichOut.Lines.Delete(0);

          end
       else
           begin
                    MessageDlg('Esperado "Finish:" na �tilma linha: ', mtError, [mbOK], 0);
                     RichOut.Lines.Clear;
           end;

    for I := 0 to RichOut.Lines.Count - 1 do
            if RichOut.Lines.strings[linha].Contains('Lout:=') then
                  begin
                      RichOut.Lines.strings[linha].Replace('Lout:=',sLineBreak);
                      //RichCode.Lines.SaveToFile(path);

                  end




//       if Pos(RichCode.Lines.Strings[0], 'Init:') > 0 then
  //      begin
 //         RichCode.Lines.SaveToFile(path);
 //          readLine(path);
   //     end
     //   else
       // begin
        //      MessageDlg('Esperado "Init:" na linha 1 ', mtError, [mbOK], 0);
        //end;
 end;

  }
  procedure TFormLup.leitura(Sender: TRichEdit);
  var
   I: Integer;
   Token: String;
    linha : Integer;
    NovoConteudo: String;
     lista: TStringList;
  begin
    linha := 0;
    if Sender = RichCode then
        for I := 0 to RichCode.Lines.Count - 1 do
          if Pos(RichCode.Lines.Strings[I], 'Init:') > 0 then
            begin
               if RichCode.Lines.strings[I].Contains('Lout:=') then
                    begin
                        //RichOut.Lines.strings[linha].Replace(#13#10, 'Lout:=');
                        //RemovePalavra(RichOut.Lines.strings[I], 'Lout:=');

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
                      MessageDlg('Esperado "Finish:" na �tilma linha: ', mtError, [mbOK], 0);
                       RichOut.Lines.Clear;
             end;
        for I := 0 to RichOut.Lines.Count - 1 do
            if RichOut.Lines.strings[I].Contains('Lout:=') then
                   begin
                      //Cria uma lista de string
                      lista := TStringList.Create;
                      //Adiciona Strings
                      lista.Add(RichOut.Lines.strings[I]);
                      //Substitui a v�rgula pelo ponto
                      RichOut.Lines.Clear;
                      lista.Text := StringReplace(lista.text, 'Lout:=', '', [rfReplaceAll]);
                      showmessage(lista.Text);


                 end;

  end;
end.
