program compilador;

uses
  Vcl.Forms,
  ucomp in 'ucomp.pas' {FormLup};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLup, FormLup);
  Application.Run;
end.
