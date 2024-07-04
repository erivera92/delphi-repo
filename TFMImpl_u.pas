unit TFMImpl_u;

interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.IOUtils, StrUtils, Vcl.Dialogs;

type
  TFMFile = class
  private
    fileName: string;
    sourceName: string;
    destName: string;
    logFileName: string;
    isText: Boolean;
    logFile: TextFile;
  public
    constructor Create(F: string; S: string; D: string; L: string;
      B: Boolean); overload;
    procedure moveFile(F: string; S: string; D: string; L: string; B: Boolean);

  end;

implementation

constructor TFMFile.Create(F: string; S: string; D: string; L: string;
  B: Boolean);
begin
  fileName := F;
  sourceName := S;
  destName := D;
  logFileName := L;
  isText := B;
end;

procedure TFMFile.moveFile(F: string; S: string; D: string; L: string;
  B: Boolean);
var
  fs: TFileStream;
  tr: TTextReader;
begin
  AssignFile(logFile, L);
  if FileExists(L) then
    Append(logFile)
  else
    Rewrite(logFile);

  if B then
  begin
    fs := TFileStream.Create(S, fmOpenRead);
    tr := TStreamReader.Create(fs);
    try
      WriteLn(logFile, tr.ReadLine);
    finally
      tr.Free;
      fs.Free;
    end;

  end;
  if FileExists(D) then
  begin
    TFile.Delete(D);
  end;
  try
    TFile.Move(S, D);
    WriteLn(logFile, 'Moving File: ' + F + ' from ' + S + ' to ' + D);
    CloseFile(logFile);
  except
    on Exception do
    begin
      // This will raise an EOSError Exception with a better message.
      RaiseLastOsError;
    end;
  end;
end;

end.
