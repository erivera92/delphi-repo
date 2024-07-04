unit frmChangeFileName_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmChangeFileName = class(TForm)
    pnlChangeName: TPanel;
    lblOriginalName: TLabel;
    edtOriginalName: TEdit;
    lblNewName: TLabel;
    edtNewName: TEdit;
    btnChangeName: TButton;
    btnCancel: TBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmChangeFileName: TfrmChangeFileName;

implementation

{$R *.dfm}

end.
