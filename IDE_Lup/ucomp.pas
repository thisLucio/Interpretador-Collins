unit ucomp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
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
    procedure lexer(Sender: TObject);
    procedure btnAbrirArquivoClick(Sender: TObject);


  private
    { Private declarations }
    function readLine(s: String): String;
    function getLine(a1: integer): integer;
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
 var arq: TextFile;
     linha: String;

begin

end;

procedure TFormLup.btnCompilarClick(Sender: TObject);
var
peloamor: integer;
i, ipos, linha,tamanho : Integer;
buffer : string;
begin

       if (RichCode.Text = '') or (edtNomeArquivo.Text = '') then
          begin
               MessageDlg('N�o pode deixar em branco n� amig�o', mtError, [mbOK], 0);
          end
        else
        begin
           path := (edtNomeArquivo.text + '.last');

           //MemoCode.Lines.SaveToFile(edtNomeArquivo.text + '.last');


           peloamor := 1;

           if peloamor = 1 then
           begin
              getLine(peloamor);

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

function TFormLup.getLine(a1: integer): integer;
var
peloamor: integer;
i, ipos, linha,tamanho : Integer;
buffer : string;
begin
   linha := 0;
    for I := 0 to RichCode.Lines.Count - 1 do
     if Pos(RichCode.Lines.Strings[I], 'Init:') > 0 then
        begin
          // RichCode.Lines.SaveToFile(path);
           //RichOut.Lines.LoadFromFile(path);
            //RichOut.Lines.Delete(linha);
            Break;
        end
     else
         begin
            MessageDlg('Esperado "Init:" na linha 1 ', mtError, [mbOK], 0);
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
procedure TFormLup.lexer(Sender: TObject);
begin
         // memoteste:= memoCode.Lines.Equals('Init:');

end;

end.
