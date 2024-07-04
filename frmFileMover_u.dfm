object frmFileMover: TfrmFileMover
  Left = 0
  Top = 0
  Caption = 'File Mover'
  ClientHeight = 643
  ClientWidth = 617
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 15
  object pnlTitle: TPanel
    Left = 12
    Top = 8
    Width = 600
    Height = 41
    BevelOuter = bvNone
    Caption = 'File Mover'
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -27
    Font.Name = 'Perpetua Titling MT'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object pnlSource: TPanel
    Left = 8
    Top = 64
    Width = 600
    Height = 202
    TabOrder = 1
    object lblSourceDir: TLabel
      Left = 16
      Top = 8
      Width = 87
      Height = 15
      Caption = 'Source Directory'
    end
    object lblSourceFiles: TLabel
      Left = 224
      Top = 8
      Width = 126
      Height = 15
      Caption = 'Files in Source Directory'
    end
    object Label1: TLabel
      Left = 224
      Top = 132
      Width = 303
      Height = 15
      Caption = '*Double Click  Files To Change File Name In Destination'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dlbSourceDir: TDirectoryListBox
      Left = 16
      Top = 29
      Width = 145
      Height = 97
      TabOrder = 0
      OnChange = dlbSourceDirChange
    end
    object lbxSourceFiles: TFileListBox
      Left = 224
      Top = 29
      Width = 321
      Height = 97
      ItemHeight = 15
      TabOrder = 1
      OnChange = dlbSourceDirChange
      OnClick = lbxSourceFilesClick
    end
    object edtSourceDir: TEdit
      Left = 16
      Top = 153
      Width = 529
      Height = 23
      TabOrder = 2
    end
  end
  object pnlDestination: TPanel
    Left = 8
    Top = 272
    Width = 600
    Height = 209
    TabOrder = 2
    object lblDestinationDir: TLabel
      Left = 16
      Top = 8
      Width = 111
      Height = 15
      Caption = 'Destination Directory'
    end
    object lblDestFiles: TLabel
      Left = 224
      Top = 8
      Width = 268
      Height = 15
      Caption = 'Files which Will Be Written To Destination Directory'
    end
    object dlbDestinationDir: TDirectoryListBox
      Left = 16
      Top = 29
      Width = 145
      Height = 97
      TabOrder = 0
      OnChange = dlbDestinationDirChange
      OnEnter = dlbDestinationEnter
    end
    object edtDestinationDir: TEdit
      Left = 16
      Top = 144
      Width = 529
      Height = 23
      TabOrder = 1
    end
    object lbxDestinationFiles: TListBox
      Left = 224
      Top = 24
      Width = 321
      Height = 97
      ItemHeight = 15
      TabOrder = 2
      OnClick = lbxDestinationFilesClick
    end
  end
  object Panel4: TPanel
    Left = 8
    Top = 487
    Width = 601
    Height = 154
    TabOrder = 3
    object Label2: TLabel
      Left = 16
      Top = 8
      Width = 92
      Height = 15
      Caption = 'Log File Directory'
    end
    object lblLogFileName: TLabel
      Left = 184
      Top = 11
      Width = 200
      Height = 15
      Caption = 'Please Enter A Name For Your Log File'
    end
    object btnMoveFiles: TButton
      Left = 248
      Top = 104
      Width = 123
      Height = 25
      Caption = 'Move Files'
      TabOrder = 0
      OnClick = btnMoveFilesClick
    end
    object dlbLogFile: TDirectoryListBox
      Left = 16
      Top = 29
      Width = 145
      Height = 97
      TabOrder = 1
      OnChange = dlbLogFileChange
    end
    object edtLogFile: TEdit
      Left = 184
      Top = 32
      Width = 361
      Height = 23
      TabOrder = 2
    end
  end
  object rbnSaveSettings: TRadioButton
    Left = 24
    Top = 453
    Width = 113
    Height = 17
    Caption = 'Save Settings'
    TabOrder = 4
    OnClick = rbnSaveSettingsClick
  end
end
