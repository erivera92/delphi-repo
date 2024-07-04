unit frmFileMover_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.FileCtrl,
  Vcl.StdCtrls, frmChangeFileName_u, IniFiles, System.IOUtils, StrUtils,
  TFMImpl_u;

type
  TfrmFileMover = class(TForm)
    pnlTitle: TPanel;
    pnlSource: TPanel;
    pnlDestination: TPanel;
    Panel4: TPanel;
    lblSourceDir: TLabel;
    dlbSourceDir: TDirectoryListBox;
    lbxSourceFiles: TFileListBox;
    lblDestinationDir: TLabel;
    dlbDestinationDir: TDirectoryListBox;
    edtSourceDir: TEdit;
    edtDestinationDir: TEdit;
    lbxDestinationFiles: TListBox;
    btnMoveFiles: TButton;
    rbnSaveSettings: TRadioButton;
    lblSourceFiles: TLabel;
    lblDestFiles: TLabel;
    Label1: TLabel;
    dlbLogFile: TDirectoryListBox;
    Label2: TLabel;
    edtLogFile: TEdit;
    lblLogFileName: TLabel;
    procedure dlbSourceDirChange(Sender: TObject);
    procedure dlbDestinationDirChange(Sender: TObject);
    procedure lbxDestinationFilesClick(Sender: TObject);
    procedure lbxSourceFilesClick(Sender: TObject);
    procedure dlbDestinationEnter(Sender: TObject);
    procedure btnMoveFilesClick(Sender: TObject);
    procedure rbnSaveSettingsClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure dlbLogFileChange(Sender: TObject);
    procedure setSourceDir(S: string);
    procedure setDestDir(S: string);
    procedure setLogFileDir(S: string);
    procedure setLogFileName(S: string);
    procedure setLogFileLocation(S: string);
  private
    { Private declarations }
    sourceDir: string;
    destDir: string;
    ini: TIniFile;
    logFileDir: string;
    logFileName: string;
    logFileLocation: string;
  public
    { Public declarations }
  end;

var
  frmFileMover: TfrmFileMover;

implementation

{$R *.dfm}

procedure TfrmFileMover.dlbSourceDirChange(Sender: TObject);
begin
  lbxSourceFiles.Directory := dlbSourceDir.Directory;
  edtSourceDir.Text := dlbSourceDir.Directory;
  setSourceDir(dlbSourceDir.Directory);
  // sourceDir := dlbSourceDir.Directory;
end;

procedure TfrmFileMover.FormCreate(Sender: TObject);
begin
  { check to see if previous settings exist if so, load settings
    when form is created }
  if FileExists('C:\Users\joedo\Desktop\directorySettings.ini') then
  begin
    ini := TIniFile.Create('C:\Users\joedo\Desktop\directorySettings.ini');
    setSourceDir(ini.ReadString('Settings', 'Source', ''));
    setDestDir(ini.ReadString('Settings', 'Destination', ''));
    setLogFileDir(ini.ReadString('Settings', 'LogDir', ''));
    setLogFileName(ini.ReadString('Settings', 'LogFileName', ''));
    dlbSourceDir.Directory := sourceDir;
    dlbDestinationDir.Directory := destDir;
    dlbLogFile.Directory := logFileDir;
    edtLogFile.Text := logFileName;
  end;
  lbxDestinationFiles.Items := lbxSourceFiles.Items;
end;

procedure TfrmFileMover.btnMoveFilesClick(Sender: TObject);
{ this is the move method. I would rather have much of this split into utils
  or helper classes or procedures, but I am still rusty on Delphi }
var
  sourceFilename: string;
  destFilename: string;
  sourcePath: string;
  destPath: string;
  isText: boolean;
  i: integer;
begin
  // check to see if a directory is chosen to write the log
  if logFileDir.IsNullOrEmpty(logFileDir) then
  begin
    MessageDlg('Please Choose A Directory For the Log File', mtInformation,
      [mbOk], 0, mbOk);
    rbnSaveSettings.Checked := false;
  end
  else
  begin
    setLogFileName(edtLogFile.Text);
    // if no file has been entered for the log, we will default the name
    if logFileName.IsNullOrEmpty(logFileName) then
    begin
      logFileName := 'logFile.txt';
    end;
    setLogFileLocation(logFileDir + '\' + logFileName);
  end;

  if (dlbSourceDir.ItemIndex >= 0) and (dlbDestinationDir.ItemIndex >= 0) then
    for i := 0 to lbxSourceFiles.Count - 1 do
    begin
      sourcePath := sourceDir + '\' + lbxSourceFiles.Items[i];
      destPath := destDir + '\' + lbxDestinationFiles.Items[i];
      if ContainsText(lbxSourceFiles.Items[i], '.txt') then
        isText := true;
      var
      tfmFile := tfmFile.Create();
      tfmFile.moveFile(lbxSourceFiles.Items[i], sourcePath, destPath,
        logFileLocation, isText);
      tfmFile.Destroy;
    end;
  MessageDlg('Files Successfully Moved From ' + sourceDir + ' to ' + destDir,
    mtInformation, [mbOk], 0, mbOk);

end;

procedure TfrmFileMover.dlbDestinationDirChange(Sender: TObject);
begin
  edtDestinationDir.Text := dlbDestinationDir.Directory;
  setDestDir(dlbDestinationDir.Directory);
end;

procedure TfrmFileMover.dlbDestinationEnter(Sender: TObject);
begin
  lbxDestinationFiles.Items := lbxSourceFiles.Items;
end;

procedure TfrmFileMover.lbxDestinationFilesClick(Sender: TObject);
begin
  lbxDestinationFiles.Items[lbxDestinationFiles.ItemIndex] :=
    InputBox('Change File Name', 'New Name',
    lbxDestinationFiles.Items[lbxDestinationFiles.ItemIndex]);
end;

procedure TfrmFileMover.dlbLogFileChange(Sender: TObject);
begin
  setLogFileDir(dlbLogFile.Directory);
end;

procedure TfrmFileMover.lbxSourceFilesClick(Sender: TObject);
var
  filename: string;
  newFilename: string;
  i: integer;
begin
  if lbxDestinationFiles.Items.IndexOf
    (lbxSourceFiles.Items[lbxSourceFiles.ItemIndex]) > -1 then
  begin
    filename := lbxSourceFiles.Items[lbxSourceFiles.ItemIndex];
    i := lbxDestinationFiles.Items.IndexOf(filename);
    newFilename := InputBox('Change File Name', 'New Name', filename);
    lbxDestinationFiles.Items[i] := newFilename;
  end;

end;

procedure TfrmFileMover.rbnSaveSettingsClick(Sender: TObject);
begin
  if (sourceDir.IsNullOrEmpty(sourceDir)) or (destDir.IsNullOrEmpty(destDir)) or
    (logFileDir.IsNullOrEmpty(logFileDir)) then
  begin
    MessageDlg('Please Choose Source, Destination and Log File Folders',
      mtInformation, [mbOk], 0, mbOk);
    rbnSaveSettings.Checked := false;
  end
  else
  begin
    try
      try
        ini := TIniFile.Create('C:\Users\joedo\Desktop\directorySettings.ini');
        ini.WriteString('Settings', 'Source', sourceDir);
        ini.WriteString('Settings', 'Destination', destDir);
        ini.WriteString('Settings', 'LogDir', logFileDir);
        ini.WriteString('Settings', 'LogFileName', logFileName);
      except
        on EIniFileException do
        begin
          // This will raise an EOSError Exception with a better message.
          RaiseLastOsError;
        end;
      end;
    finally
      ini.Free;
    end;
  end;
end;

procedure TfrmFileMover.setSourceDir(S: string);
begin
  sourceDir := S;
end;

procedure TfrmFileMover.setDestDir(S: string);
begin
  destDir := S;
end;

procedure TfrmFileMover.setLogFileDir(S: string);
begin
  logFileDir := S;
end;

procedure TfrmFileMover.setLogFileName(S: string);
begin
  logFileName := S;
end;

procedure TfrmFileMover.setLogFileLocation(S: string);
begin
  logFileLocation := S;
end;

end.
