object frmChangeFileName: TfrmChangeFileName
  Left = 0
  Top = 0
  Caption = 'Edit File Name'
  ClientHeight = 145
  ClientWidth = 449
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object pnlChangeName: TPanel
    Left = 0
    Top = 8
    Width = 449
    Height = 141
    TabOrder = 0
    object lblOriginalName: TLabel
      Left = 16
      Top = 0
      Width = 101
      Height = 15
      Caption = 'Original File Name:'
    end
    object lblNewName: TLabel
      Left = 16
      Top = 50
      Width = 83
      Height = 15
      Caption = 'New File Name:'
    end
    object edtOriginalName: TEdit
      Left = 16
      Top = 21
      Width = 425
      Height = 23
      TabOrder = 0
    end
    object edtNewName: TEdit
      Left = 16
      Top = 71
      Width = 425
      Height = 23
      TabOrder = 1
    end
    object btnChangeName: TButton
      Left = 208
      Top = 100
      Width = 123
      Height = 25
      Caption = 'Change File Name'
      TabOrder = 2
    end
    object btnCancel: TBitBtn
      Left = 344
      Top = 100
      Width = 81
      Height = 25
      Caption = '&Cancel'
      Kind = bkClose
      NumGlyphs = 2
      TabOrder = 3
    end
  end
end
