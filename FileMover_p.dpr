program FileMover_p;

uses
  Vcl.Forms,
  frmFileMover_u in 'frmFileMover_u.pas' {frmFileMover},
  frmChangeFileName_u in 'frmChangeFileName_u.pas' {frmChangeFileName},
  TFMImpl_u in 'TFMImpl_u.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmFileMover, frmFileMover);
  Application.CreateForm(TfrmChangeFileName, frmChangeFileName);
  Application.Run;
end.
