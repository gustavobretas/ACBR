object Form1: TForm1
  Left = 562
  Top = 179
  Caption = 'Form1'
  ClientHeight = 289
  ClientWidth = 466
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  object btnGerarCD: TButton
    Left = 89
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Gerar CD'
    TabOrder = 0
    OnClick = btnGerarCDClick
  end
  object Button1: TButton
    Left = 8
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object ACBrADRCST1: TACBrADRCST
    Path = 'C:\lazarus\'
    Delimitador = '|'
    ReplaceDelimitador = False
    TrimString = True
    CurMascara = '#0.00'
    Left = 224
    Top = 152
  end
end
