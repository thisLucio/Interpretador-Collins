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
    MemoCode: TMemo;
    btnCompilar: TBitBtn;
    edtNomeArquivo: TLabeledEdit;
    memo1: TMemo;
    edtAbrirArquivo: TLabeledEdit;
    btnAbrirArquivo: TBitBtn;
    procedure FormActivate(Sender: TObject);
    procedure btnCompilarClick(Sender: TObject);
    procedure lexer(Sender: TObject);
    procedure btnAbrirArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLup: TFormLup;
  memoteste: String;


implementation

{$R *.dfm}

procedure TFormLup.btnAbrirArquivoClick(Sender: TObject);
 var arq: TextFile;
     linha: String;
begin

end;

procedure TFormLup.btnCompilarClick(Sender: TObject);
begin
         MemoCode.Lines.SaveToFile(edtNomeArquivo.text + '.last');
end;

procedure TFormLup.FormActivate(Sender: TObject);
begin
               MemoCode.Lines.Clear;
               Memo1.Lines.Clear;
end;

procedure TFormLup.lexer(Sender: TObject);
begin
         // memoteste:= memoCode.Lines.Equals('Init:');

end;

end.
