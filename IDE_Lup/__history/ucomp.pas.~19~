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
    procedure getLine(Sender: TObject);

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
 var arq: TextFile;
     linha: String;

begin

end;

procedure TFormLup.btnCompilarClick(Sender: TObject);
begin
         path := (edtNomeArquivo.text + '.last');
         //MemoCode.Lines.SaveToFile(edtNomeArquivo.text + '.last');
         RichCode.Lines.SaveToFile(path);
         readLine(path);
end;

procedure TFormLup.FormActivate(Sender: TObject);
begin
               RichOut.Lines.Clear;

end;
function TFormLup.readLine(s: String): String;
begin
      RichOut.Lines.LoadFromFile(s);

end;

procedure TFormLup.getLine(Sender: TObject);
begin
                                    //
 end;
procedure TFormLup.lexer(Sender: TObject);
begin
         // memoteste:= memoCode.Lines.Equals('Init:');

end;

end.
