object FrCalculadora: TFrCalculadora
  Left = 348
  Top = 167
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsDialog
  Caption = 'Calculadora'
  ClientHeight = 295
  ClientWidth = 243
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Icon.Data = {
    0000010001002020100000000000E80200001600000028000000200000004000
    0000010004000000000080020000000000000000000000000000000000000000
    0000000080000080000000808000800000008000800080800000C0C0C0008080
    80000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00F777
    77777777777777777700000000007E4444444444444444444470000000007E66
    66666666666666666470000000007E6644464446444444466470000000007E66
    77467746777777466470000000007E66F746F746FFFFF7466470000000007E66
    66666666666666666470000000007E6644464446444644466470000000007E66
    77467746774677466470000000007E66F746F746F746F7466470000000007E66
    66666666666666666470000000007E6644464446444644466470000000007E66
    77467746774677466470000000007E66F746F746F746F7466470000000007E66
    66666666666666666470000000007E6644464446444644466470000000007E66
    77467746774677466470000000007E66F746F746F746F7466470000000007E66
    66666666666666666470000000007E6644464446444644466470000000007E66
    77467746774677466470000000007E66F746F746F746F7466470000000007E66
    66666666666666666470000000007E6666666666666666666470000000007E60
    7EEEEEEEEEEEEEE66470000000007E607FFFFFFFFFFFFFE66470000000007E60
    77777777777777766470000000007E6000000000000000066470000000007E66
    66666666666666666470000000007EEEEEEEEEEEEEEEEEEEE470000000000777
    7777777777777777770000000000000000000000000000000000000000000000
    03FF000001FF000001FF000001FF000001FF000001FF000001FF000001FF0000
    01FF000001FF000001FF000001FF000001FF000001FF000001FF000001FF0000
    01FF000001FF000001FF000001FF000001FF000001FF000001FF000001FF0000
    01FF000001FF000001FF000001FF000001FF000001FF800003FFFFFFFFFF}
  KeyPreview = True
  OldCreateOrder = False
  PopupMenu = PopupMenu1
  ShowHint = True
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  OnKeyUp = FormKeyUp
  PixelsPerInch = 96
  TextHeight = 13
  object b1: TButton
    Left = 52
    Top = 216
    Width = 42
    Height = 33
    Caption = '1'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 13
    OnClick = b1Click
  end
  object b0: TButton
    Left = 52
    Top = 256
    Width = 42
    Height = 33
    Caption = '0'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 18
    OnClick = b0Click
  end
  object b2: TButton
    Left = 100
    Top = 216
    Width = 42
    Height = 33
    Caption = '2'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 14
    OnClick = b1Click
  end
  object b3: TButton
    Left = 148
    Top = 216
    Width = 43
    Height = 33
    Caption = '3'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 15
    OnClick = b1Click
  end
  object b4: TButton
    Left = 52
    Top = 176
    Width = 42
    Height = 33
    Caption = '4'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 8
    OnClick = b1Click
  end
  object b5: TButton
    Left = 100
    Top = 176
    Width = 42
    Height = 33
    Caption = '5'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 9
    OnClick = b1Click
  end
  object b6: TButton
    Left = 148
    Top = 176
    Width = 43
    Height = 33
    Caption = '6'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 10
    OnClick = b1Click
  end
  object b7: TButton
    Left = 52
    Top = 136
    Width = 42
    Height = 33
    Caption = '7'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 3
    OnClick = b1Click
  end
  object b8: TButton
    Left = 100
    Top = 136
    Width = 42
    Height = 33
    Caption = '8'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 4
    OnClick = b1Click
  end
  object b9: TButton
    Left = 148
    Top = 136
    Width = 43
    Height = 33
    Caption = '9'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 5
    OnClick = b1Click
  end
  object bponto: TButton
    Left = 100
    Top = 256
    Width = 43
    Height = 33
    Caption = ','
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 19
    OnClick = bpontoClick
  end
  object bigual: TButton
    Left = 148
    Top = 256
    Width = 42
    Height = 33
    Caption = '='
    Default = True
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 20
    OnClick = AcaoClick
  end
  object bmais: TButton
    Left = 196
    Top = 256
    Width = 42
    Height = 33
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 21
    OnClick = AcaoClick
  end
  object bmenos: TButton
    Left = 196
    Top = 216
    Width = 42
    Height = 33
    Caption = '-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 16
    OnClick = AcaoClick
  end
  object bmulti: TButton
    Left = 196
    Top = 176
    Width = 42
    Height = 32
    Caption = 'x'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 11
    OnClick = AcaoClick
  end
  object bdiv: TButton
    Left = 196
    Top = 136
    Width = 43
    Height = 33
    Caption = '/'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 6
    OnClick = AcaoClick
  end
  object bapaga: TButton
    Left = 4
    Top = 136
    Width = 42
    Height = 33
    Caption = '<-'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    OnClick = bapagaClick
  end
  object bc: TButton
    Left = 4
    Top = 256
    Width = 42
    Height = 33
    Caption = '&C'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 17
    OnClick = bcClick
  end
  object bce: TButton
    Left = 4
    Top = 216
    Width = 42
    Height = 33
    Caption = 'C&E'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 12
    OnClick = bceClick
  end
  object bporc: TButton
    Left = 4
    Top = 176
    Width = 42
    Height = 33
    Caption = '%'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 7
    OnClick = bporcClick
  end
  object pValor: TPanel
    Left = 4
    Top = 96
    Width = 234
    Height = 33
    Hint = 'CTRL+ENTER copia Valor e encerra'
    Alignment = taRightJustify
    BevelOuter = bvNone
    BorderWidth = 5
    BorderStyle = bsSingle
    Caption = '0  '
    Color = clBlack
    Font.Charset = ANSI_CHARSET
    Font.Color = clLime
    Font.Height = -16
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = True
  end
  object mBobina: TMemo
    Left = 4
    Top = 4
    Width = 234
    Height = 87
    Hint = 'CTRL+ENTER copia Valor e encerra'
    Alignment = taRightJustify
    PopupMenu = PopupMenu1
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
    WantReturns = False
  end
  object PopupMenu1: TPopupMenu
    Left = 60
    Top = 24
    object Limpar1: TMenuItem
      Caption = 'Limpar'
      ShortCut = 69
      OnClick = bceClick
    end
    object Salvar1: TMenuItem
      Caption = 'Salvar'
      ShortCut = 16467
      OnClick = Salvar1Click
    end
    object Copias1: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      OnClick = Copiar1Click
    end
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'TXT'
    Filter = 'Arquivo Texto|*.TXT'
    Options = [ofOverwritePrompt, ofHideReadOnly, ofEnableSizing]
    Left = 100
    Top = 24
  end
end
