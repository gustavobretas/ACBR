inherited frmDACTeRLRetrato: TfrmDACTeRLRetrato
  Left = 187
  Height = 858
  Top = 84
  Width = 956
  Caption = 'DACTe - Retrato'
  ClientHeight = 858
  ClientWidth = 956
  Font.Height = -8
  Font.Name = 'Arial'
  Font.Style = [fsBold]
  inherited RLCTe: TRLReport
    Left = 24
    Top = -304
    Background.Arrange = baDistributed
    Background.Height = 96
    Background.Width = 175
    DataSource = Datasource1
    Font.Height = -8
    Font.Name = 'Courier New'
    Margins.LeftMargin = 7
    Margins.TopMargin = 7
    Margins.RightMargin = 7
    Margins.BottomMargin = 7
    PreviewOptions.FormStyle = fsStayOnTop
    PreviewOptions.ShowModal = True
    PreviewOptions.Caption = 'DACT-e '
    Title = 'DACT-e Retrato'
    BeforePrint = RLCTeBeforePrint
    object rlb_01_Recibo: TRLBand[0]
      Left = 26
      Height = 80
      Top = 26
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_01_ReciboBeforePrint
      object rllResumoCanhotoCTe: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'RESUMO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
        Visible = False
      end
      object RLDraw46: TRLDraw
        Left = 0
        Height = 69
        Top = 0
        Width = 741
        Angle = 0
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw49: TRLDraw
        Left = 1
        Height = 1
        Top = 39
        Width = 201
        HelpContext = 1
        Angle = 0
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw48: TRLDraw
        Left = 1
        Height = 1
        Top = 12
        Width = 740
        HelpContext = 1
        Angle = 0
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllSerie2: TRLLabel
        Left = 636
        Height = 13
        Top = 45
        Width = 50
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllNumCTe2: TRLLabel
        Left = 636
        Height = 16
        Top = 31
        Width = 86
        AutoSize = False
        Caption = '999999999'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel3: TRLLabel
        Left = 480
        Height = 16
        Top = 47
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = '__/__/__    __:__'
        Color = clWhite
        Font.CharSet = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel143: TRLLabel
        Left = 480
        Height = 16
        Top = 23
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = '__/__/__    __:__'
        Color = clWhite
        Font.CharSet = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlLabel140: TRLLabel
        Left = 647
        Height = 13
        Top = 15
        Width = 28
        Caption = 'CT-E'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel139: TRLLabel
        Left = 616
        Height = 12
        Top = 33
        Width = 14
        Caption = 'N� '
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlLabel138: TRLLabel
        Left = 600
        Height = 12
        Top = 46
        Width = 30
        Caption = 'S�RIE:'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel137: TRLLabel
        Left = 6
        Height = 11
        Top = 1
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'DECLARO QUE RECEBI OS VOLUMES DESTE CONHECIMENTO EM PERFEITO ESTADO PELO QUE DOU POR CUMPRIDO O PRESENTE CONTRATO DE TRANSPORTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel136: TRLLabel
        Left = 6
        Height = 12
        Top = 16
        Width = 30
        Caption = 'NOME'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel135: TRLLabel
        Left = 480
        Height = 9
        Top = 15
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = 'CHEGADA DATA/HORA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel134: TRLLabel
        Left = 480
        Height = 9
        Top = 38
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = 'SA�DA DATA/HORA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel133: TRLLabel
        Left = 207
        Height = 11
        Top = 57
        Width = 262
        Alignment = taCenter
        AutoSize = False
        Caption = 'ASSINATURA / CARIMBO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel132: TRLLabel
        Left = 6
        Height = 12
        Top = 44
        Width = 15
        Caption = 'RG'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlsLinhaPontilhada: TRLDraw
        Left = 0
        Height = 1
        Top = 74
        Width = 741
        Angle = 0
        DrawKind = dkLine
        Pen.Style = psDot
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw51: TRLDraw
        Left = 203
        Height = 56
        Top = 12
        Width = 1
        Angle = 90
        Center = False
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw52: TRLDraw
        Left = 475
        Height = 56
        Top = 12
        Width = 1
        Angle = 90
        Center = False
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw50: TRLDraw
        Left = 595
        Height = 56
        Top = 12
        Width = 1
        Angle = 90
        Center = False
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_07_HeaderItens: TRLBand[1]
      Left = 26
      Height = 76
      Top = 1026
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_07_HeaderItensBeforePrint
      object rlsQuadro07: TRLDraw
        Left = 0
        Height = 110
        Top = 0
        Width = 741
        Angle = 0
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw32: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw34: TRLDraw
        Left = 370
        Height = 95
        Top = 14
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel96: TRLLabel
        Left = 174
        Height = 8
        Top = 17
        Width = 86
        Caption = 'S�RIE/NRO. DOCUMENTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel92: TRLLabel
        Left = 88
        Height = 8
        Top = 17
        Width = 69
        Caption = 'CNPJ/CPF EMITENTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel91: TRLLabel
        Left = 5
        Height = 8
        Top = 17
        Width = 29
        Caption = 'TP DOC.'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel20: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'DOCUMENTOS ORIGIN�RIOS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel109: TRLLabel
        Left = 373
        Height = 8
        Top = 17
        Width = 29
        Caption = 'TP DOC.'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel106: TRLLabel
        Left = 456
        Height = 8
        Top = 17
        Width = 69
        Caption = 'CNPJ/CPF EMITENTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel100: TRLLabel
        Left = 542
        Height = 8
        Top = 17
        Width = 86
        Caption = 'S�RIE/NRO. DOCUMENTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlDocOrig_tpDoc1: TRLMemo
        Left = 5
        Height = 50
        Top = 27
        Width = 363
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1                        COMP 1                          COMP 1'
          'COMP 2                        COMP 2                          COMP 2'
          'COMP 3                        COMP 3                          COMP 3'
          'COMP 4                        COMP 4                          COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlDocOrig_tpDoc2: TRLMemo
        Left = 373
        Height = 50
        Top = 27
        Width = 363
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1                        COMP 1                          COMP 1'
          'COMP 2                        COMP 2                          COMP 2'
          'COMP 3                        COMP 3                          COMP 3'
          'COMP 4                        COMP 4                          COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_09_Obs: TRLBand[2]
      Left = 26
      Height = 68
      Top = 1102
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_09_ObsBeforePrint
      object rlsQuadro08: TRLDraw
        Left = 0
        Height = 64
        Top = 2
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw1: TRLDraw
        Left = 1
        Height = 1
        Top = 18
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmObs: TRLMemo
        Left = 5
        Height = 45
        Top = 19
        Width = 730
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'OBS LINHA 1'
          'OBS LINHA 2'
          'OBS LINHA 3'
          'OBS LINHA 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMsgTeste: TRLLabel
        Left = 8
        Height = 31
        Top = 29
        Width = 724
        Alignment = taCenter
        Caption = 'AMBIENTE DE HOMOLOGA��O - SEM VALOR FISCAL'
        Color = clWhite
        Font.Color = clGray
        Font.Height = -27
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel10: TRLLabel
        Left = 6
        Height = 13
        Top = 4
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'OBSERVA��ES'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
    end
    object rlb_02_Cabecalho: TRLBand[3]
      Left = 26
      Height = 188
      Top = 263
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_02_CabecalhoBeforePrint
      object rlsQuadro01: TRLDraw
        Left = 0
        Height = 183
        Top = 2
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH02: TRLDraw
        Left = 332
        Height = 1
        Top = 58
        Width = 408
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH03: TRLDraw
        Left = 332
        Height = 1
        Top = 94
        Width = 408
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV01: TRLDraw
        Left = 174
        Height = 60
        Top = 124
        Width = 3
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV04: TRLDraw
        Left = 332
        Height = 182
        Top = 2
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV05: TRLDraw
        Left = 366
        Height = 26
        Top = 32
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV06: TRLDraw
        Left = 390
        Height = 26
        Top = 32
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV07: TRLDraw
        Left = 614
        Height = 27
        Top = 32
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV08: TRLDraw
        Left = 464
        Height = 26
        Top = 32
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV09: TRLDraw
        Left = 508
        Height = 26
        Top = 32
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV10: TRLDraw
        Left = 627
        Height = 31
        Top = 2
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rliLogo: TRLImage
        Left = 7
        Height = 62
        Top = 26
        Width = 94
        Center = True
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Scaled = True
      end
      object rlsLinhaH04: TRLDraw
        Left = 0
        Height = 1
        Top = 124
        Width = 332
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmEmitente: TRLMemo
        Left = 7
        Height = 18
        Top = 3
        Width = 322
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlmDadosEmitente: TRLMemo
        Left = 113
        Height = 71
        Top = 22
        Width = 216
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          '1 Linha - LOGRADOURO - COMPLEMENTO - BAIRRO'
          '2 Linha - CEP - MUNICIPIO - UF'
          '3 Linha - CNPJ INSCRICAO ESTADUAL'
          '4 Linha - TELEFONE'
          '5 Linha - URL'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel17: TRLLabel
        Left = 371
        Height = 14
        Top = 4
        Width = 218
        Alignment = taCenter
        AutoSize = False
        Caption = 'DACTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel18: TRLLabel
        Left = 344
        Height = 13
        Top = 19
        Width = 278
        Alignment = taCenter
        AutoSize = False
        Caption = 'Documento Auxiliar do Conhecimento de Transporte Eletr�nico'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel6: TRLLabel
        Left = 646
        Height = 13
        Top = 5
        Width = 76
        Alignment = taCenter
        AutoSize = False
        Caption = 'MODAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllModal: TRLLabel
        Left = 633
        Height = 14
        Top = 18
        Width = 104
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.CharSet = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 334
        Height = 8
        Top = 34
        Width = 32
        Alignment = taCenter
        Caption = 'MODELO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllModelo: TRLLabel
        Left = 334
        Height = 15
        Top = 42
        Width = 30
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel21: TRLLabel
        Left = 368
        Height = 8
        Top = 34
        Width = 22
        Alignment = taCenter
        Caption = 'S�RIE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllSerie: TRLLabel
        Left = 368
        Height = 15
        Top = 42
        Width = 20
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel23: TRLLabel
        Left = 392
        Height = 9
        Top = 34
        Width = 70
        Alignment = taCenter
        AutoSize = False
        Caption = 'N�MERO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllNumCte: TRLLabel
        Left = 392
        Height = 15
        Top = 42
        Width = 72
        Alignment = taRightJustify
        Caption = '999.999.999'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel25: TRLLabel
        Left = 466
        Height = 9
        Top = 34
        Width = 42
        Alignment = taCenter
        AutoSize = False
        Caption = 'FOLHA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel33: TRLLabel
        Left = 510
        Height = 9
        Top = 34
        Width = 95
        AutoSize = False
        Caption = 'DATA E HORA DE EMISS�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllEmissao: TRLLabel
        Left = 510
        Height = 13
        Top = 42
        Width = 58
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel74: TRLLabel
        Left = 334
        Height = 11
        Top = 103
        Width = 58
        Caption = 'Chave de acesso'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllChave: TRLLabel
        Left = 398
        Height = 14
        Top = 102
        Width = 332
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTipoCte: TRLLabel
        Left = 4
        Height = 15
        Top = 137
        Width = 76
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllTipoServico: TRLLabel
        Left = 178
        Height = 15
        Top = 137
        Width = 91
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel28: TRLLabel
        Left = 4
        Height = 8
        Top = 156
        Width = 81
        Caption = 'TOMADOR DO SERVI�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTomaServico: TRLLabel
        Left = 4
        Height = 15
        Top = 166
        Width = 150
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel78: TRLLabel
        Left = 178
        Height = 8
        Top = 156
        Width = 83
        Caption = 'FORMA DE PAGAMENTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllFormaPagamento: TRLLabel
        Left = 178
        Height = 15
        Top = 166
        Width = 150
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllDescricao: TRLLabel
        Left = 334
        Height = 8
        Top = 156
        Width = 55
        Caption = 'N� PROTOCOLO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllProtocolo: TRLLabel
        Left = 336
        Height = 15
        Top = 166
        Width = 402
        Alignment = taCenter
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel77: TRLLabel
        Left = 616
        Height = 8
        Top = 34
        Width = 120
        Caption = 'INSC. SUFRAMA DO DESTINAT�RIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllInscSuframa: TRLLabel
        Left = 616
        Height = 12
        Top = 42
        Width = 56
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw88: TRLDraw
        Left = 0
        Height = 1
        Top = 154
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllVariavel1: TRLLabel
        Left = 344
        Height = 13
        Top = 127
        Width = 386
        Alignment = taCenter
        AutoSize = False
        Caption = 'Consulta de autenticidade no portal nacional do CT-e, no site da Sefaz'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlsLinhaH01: TRLDraw
        Left = 332
        Height = 1
        Top = 32
        Width = 408
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw99: TRLDraw
        Left = 332
        Height = 1
        Top = 124
        Width = 408
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLBarcode1: TRLBarcode
        Left = 342
        Height = 34
        Top = 60
        Width = 376
        AutoSize = False
        BarcodeType = bcCode128C
        Margins.LeftMargin = 1
        Margins.RightMargin = 1
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlbCodigoBarras: TRLBarcode
        Left = 339
        Height = 32
        Top = 60
        Width = 396
        Alignment = taCenter
        AutoSize = False
        BarcodeType = bcCode128C
        Margins.LeftMargin = 1
        Margins.RightMargin = 1
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel198: TRLLabel
        Left = 344
        Height = 13
        Top = 140
        Width = 386
        Alignment = taCenter
        AutoSize = False
        Caption = 'Autorizadora, ou em http://www.cte.fazenda.gov.br/portal'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel199: TRLLabel
        Left = 178
        Height = 8
        Top = 127
        Width = 61
        Caption = 'TIPO DO SERVI�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel200: TRLLabel
        Left = 4
        Height = 8
        Top = 127
        Width = 46
        Caption = 'TIPO DO CT-E'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 468
        Height = 13
        Top = 42
        Width = 38
        Alignment = taCenter
        AutoSize = False
        Font.CharSet = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        Info = itPagePreview
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Text = '0#/0#'
      end
    end
    object rlb_10_ModRodFracionado: TRLBand[4]
      Left = 26
      Height = 44
      Top = 1170
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_10_ModRodFracionadoBeforePrint
      object rlsQuadro09: TRLDraw
        Left = 0
        Height = 43
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw24: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw36: TRLDraw
        Left = 150
        Height = 28
        Top = 15
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw37: TRLDraw
        Left = 192
        Height = 28
        Top = 15
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw38: TRLDraw
        Left = 300
        Height = 28
        Top = 15
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllTituloLotacao: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'DADOS ESPEC�FICOS DO MODAL RODOVI�RIO - CARGA FRACIONADA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllRntrcEmpresa: TRLLabel
        Left = 6
        Height = 12
        Top = 25
        Width = 64
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllLotacao: TRLLabel
        Left = 154
        Height = 13
        Top = 25
        Width = 34
        Alignment = taCenter
        AutoSize = False
        Caption = 'SIM'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllDtPrevEntrega: TRLLabel
        Left = 196
        Height = 12
        Top = 25
        Width = 69
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel85: TRLLabel
        Left = 304
        Height = 11
        Top = 24
        Width = 434
        Alignment = taCenter
        AutoSize = False
        Caption = 'ESTE CONHECIMENTO DE TRANSPORTE ATENDE � LEGISLA��O DE TRANSPORTE RODOVI�RIO EM VIGOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -8
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel84: TRLLabel
        Left = 196
        Height = 8
        Top = 17
        Width = 101
        Caption = 'DATA PREVISTA DE ENTREGA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel83: TRLLabel
        Left = 154
        Height = 8
        Top = 17
        Width = 35
        Caption = 'LOTA��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel11: TRLLabel
        Left = 6
        Height = 8
        Top = 17
        Width = 72
        Caption = 'RNTRC DA EMPRESA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object lblCIOT: TRLLabel
        Left = 84
        Height = 8
        Top = 17
        Width = 18
        Caption = 'CIOT'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllCIOT: TRLLabel
        Left = 84
        Height = 12
        Top = 25
        Width = 32
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsCIOT: TRLDraw
        Left = 80
        Height = 28
        Top = 15
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_11_ModRodLot103: TRLBand[5]
      Left = 26
      Height = 108
      Top = 1214
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_11_ModRodLot103BeforePrint
      object RLDraw11: TRLDraw
        Left = 0
        Height = 107
        Top = 0
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw43: TRLDraw
        Left = 425
        Height = 53
        Top = 29
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw40: TRLDraw
        Left = 207
        Height = 1
        Top = 42
        Width = 532
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw39: TRLDraw
        Left = 1
        Height = 1
        Top = 29
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw12: TRLDraw
        Left = 207
        Height = 105
        Top = 0
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw13: TRLDraw
        Left = 1
        Height = 1
        Top = 14
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw14: TRLDraw
        Left = 42
        Height = 69
        Top = 13
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw31: TRLDraw
        Left = 100
        Height = 69
        Top = 13
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw33: TRLDraw
        Left = 122
        Height = 69
        Top = 13
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw42: TRLDraw
        Left = 345
        Height = 92
        Top = 13
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw44: TRLDraw
        Left = 585
        Height = 69
        Top = 13
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw41: TRLDraw
        Left = 1
        Height = 1
        Top = 82
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmVigencias: TRLMemo
        Left = 348
        Height = 35
        Top = 45
        Width = 76
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Vigencia 1'
          'Vigencia 2'
          'Vigencia 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmUF: TRLMemo
        Left = 102
        Height = 50
        Top = 32
        Width = 16
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Uf1'
          'Uf2'
          'Uf3'
          'Uf4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmTipo: TRLMemo
        Left = 2
        Height = 50
        Top = 32
        Width = 36
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Tipo 1'
          'Tipo 2'
          'Tipo 3'
          'Tipo 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmRNTRC: TRLMemo
        Left = 124
        Height = 50
        Top = 32
        Width = 77
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'RNTRC 1'
          'RNTRC 2'
          'RNTRC 3'
          'RNTRC 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmPlaca: TRLMemo
        Left = 44
        Height = 50
        Top = 32
        Width = 53
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Placa 1'
          'Placa 2'
          'Placa 3'
          'Placa 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNumDispositivo: TRLMemo
        Left = 428
        Height = 35
        Top = 45
        Width = 156
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Dispositivo 1'
          'Dispositivo 2'
          'Dispositivo 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmEmpresas: TRLMemo
        Left = 210
        Height = 35
        Top = 45
        Width = 133
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Empresa 1'
          'Empresa 2'
          'Empresa 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCodTransacao: TRLMemo
        Left = 588
        Height = 35
        Top = 45
        Width = 149
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Transacao 1'
          'Transacao 2'
          'Transacao 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllValorTotal: TRLLabel
        Left = 640
        Height = 13
        Top = 15
        Width = 95
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllResponsavel: TRLLabel
        Left = 404
        Height = 12
        Top = 15
        Width = 60
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllNumRegEsp: TRLLabel
        Left = 272
        Height = 12
        Top = 15
        Width = 59
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllNomeMotorista: TRLLabel
        Left = 4
        Height = 12
        Top = 93
        Width = 71
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllLacres: TRLLabel
        Left = 351
        Height = 12
        Top = 93
        Width = 36
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCPFMotorista: TRLLabel
        Left = 212
        Height = 12
        Top = 93
        Width = 66
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel76: TRLLabel
        Left = 2
        Height = 12
        Top = 15
        Width = 23
        Caption = 'TIPO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel75: TRLLabel
        Left = 214
        Height = 13
        Top = 1
        Width = 524
        Alignment = taCenter
        AutoSize = False
        Caption = 'INFORMA��ES REFERENTES AO VALE-PED�GIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel71: TRLLabel
        Left = 2
        Height = 13
        Top = 1
        Width = 202
        Alignment = taCenter
        AutoSize = False
        Caption = 'IDENTIFICA��O DO CONJ. TRANSPORTADOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel131: TRLLabel
        Left = 351
        Height = 8
        Top = 84
        Width = 148
        Caption = 'IDENTIFICA��O DOS LACRES EM TR�NSITO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel130: TRLLabel
        Left = 212
        Height = 8
        Top = 84
        Width = 69
        Caption = 'CPF DO MOTORISTA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel129: TRLLabel
        Left = 4
        Height = 8
        Top = 84
        Width = 76
        Caption = 'NOME DO MOTORISTA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel127: TRLLabel
        Left = 588
        Height = 8
        Top = 31
        Width = 86
        Caption = 'C�DIGO DA TRANSA��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel126: TRLLabel
        Left = 428
        Height = 8
        Top = 31
        Width = 88
        Caption = 'N�MERO DO DISPOSITIVO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel124: TRLLabel
        Left = 348
        Height = 8
        Top = 31
        Width = 35
        Caption = 'VIG�NCIA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel122: TRLLabel
        Left = 210
        Height = 8
        Top = 31
        Width = 86
        Caption = 'EMPRESA CREDENCIADA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel121: TRLLabel
        Left = 588
        Height = 8
        Top = 15
        Width = 50
        Caption = 'VALOR TOTAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel120: TRLLabel
        Left = 348
        Height = 8
        Top = 15
        Width = 51
        Caption = 'RESPONS�VEL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel118: TRLLabel
        Left = 210
        Height = 8
        Top = 15
        Width = 53
        Caption = 'NRO. REG. ESP.'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel117: TRLLabel
        Left = 124
        Height = 12
        Top = 15
        Width = 32
        Caption = 'RNTRC'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel115: TRLLabel
        Left = 102
        Height = 12
        Top = 15
        Width = 14
        Caption = 'UF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel112: TRLLabel
        Left = 44
        Height = 12
        Top = 15
        Width = 34
        Caption = 'PLACA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
    end
    object rlb_03_DadosDACTe: TRLBand[6]
      Left = 26
      Height = 202
      Top = 451
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_03_DadosDACTeBeforePrint
      object rlsQuadro02: TRLDraw
        Left = 0
        Height = 201
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH08: TRLDraw
        Left = 1
        Height = 1
        Top = 167
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaV11: TRLDraw
        Left = 370
        Height = 141
        Top = 27
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH07: TRLDraw
        Left = 1
        Height = 1
        Top = 109
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH06: TRLDraw
        Left = 1
        Height = 1
        Top = 51
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlsLinhaH05: TRLDraw
        Left = 1
        Height = 1
        Top = 26
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllRazaoToma: TRLLabel
        Left = 88
        Height = 13
        Top = 169
        Width = 280
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllRazaoRemet: TRLLabel
        Left = 48
        Height = 13
        Top = 54
        Width = 318
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllRazaoReceb: TRLLabel
        Left = 424
        Height = 15
        Top = 111
        Width = 310
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllRazaoExped: TRLLabel
        Left = 48
        Height = 13
        Top = 111
        Width = 318
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllRazaoDest: TRLLabel
        Left = 432
        Height = 13
        Top = 54
        Width = 303
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllPaisToma: TRLLabel
        Left = 520
        Height = 13
        Top = 177
        Width = 214
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllPaisRemet: TRLLabel
        Left = 48
        Height = 13
        Top = 96
        Width = 209
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllPaisReceb: TRLLabel
        Left = 424
        Height = 13
        Top = 153
        Width = 209
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllPaisExped: TRLLabel
        Left = 48
        Height = 13
        Top = 153
        Width = 212
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllPaisDest: TRLLabel
        Left = 432
        Height = 13
        Top = 96
        Width = 203
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllOrigPrestacao: TRLLabel
        Left = 4
        Height = 15
        Top = 36
        Width = 360
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllNatOperacao: TRLLabel
        Left = 4
        Height = 15
        Top = 11
        Width = 733
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMunToma: TRLLabel
        Left = 416
        Height = 13
        Top = 169
        Width = 233
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMunRemet: TRLLabel
        Left = 48
        Height = 19
        Top = 78
        Width = 234
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMunReceb: TRLLabel
        Left = 424
        Height = 13
        Top = 135
        Width = 226
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMunExped: TRLLabel
        Left = 48
        Height = 13
        Top = 135
        Width = 234
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMunDest: TRLLabel
        Left = 432
        Height = 13
        Top = 78
        Width = 225
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllInscEstToma: TRLLabel
        Left = 256
        Height = 13
        Top = 187
        Width = 111
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllInscEstRemet: TRLLabel
        Left = 256
        Height = 13
        Top = 87
        Width = 109
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllInscEstReceb: TRLLabel
        Left = 632
        Height = 13
        Top = 144
        Width = 102
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllInscEstExped: TRLLabel
        Left = 256
        Height = 13
        Top = 144
        Width = 109
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllInscEstDest: TRLLabel
        Left = 632
        Height = 13
        Top = 87
        Width = 102
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllFoneToma: TRLLabel
        Left = 398
        Height = 13
        Top = 187
        Width = 85
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllFoneRemet: TRLLabel
        Left = 288
        Height = 13
        Top = 96
        Width = 77
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllFoneReceb: TRLLabel
        Left = 664
        Height = 13
        Top = 153
        Width = 70
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllFoneExped: TRLLabel
        Left = 288
        Height = 13
        Top = 153
        Width = 77
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllFoneDest: TRLLabel
        Left = 664
        Height = 13
        Top = 96
        Width = 70
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoToma: TRLLabel
        Left = 48
        Height = 13
        Top = 177
        Width = 445
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoRemet2: TRLLabel
        Left = 48
        Height = 13
        Top = 70
        Width = 318
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoRemet1: TRLLabel
        Left = 48
        Height = 13
        Top = 62
        Width = 318
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoReceb2: TRLLabel
        Left = 424
        Height = 13
        Top = 127
        Width = 310
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoReceb1: TRLLabel
        Left = 424
        Height = 13
        Top = 119
        Width = 310
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoExped2: TRLLabel
        Left = 48
        Height = 13
        Top = 127
        Width = 318
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoExped1: TRLLabel
        Left = 48
        Height = 13
        Top = 119
        Width = 318
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoDest2: TRLLabel
        Left = 432
        Height = 13
        Top = 70
        Width = 303
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllEnderecoDest1: TRLLabel
        Left = 432
        Height = 19
        Top = 62
        Width = 303
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllDestPrestacao: TRLLabel
        Left = 374
        Height = 15
        Top = 36
        Width = 360
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCnpjToma: TRLLabel
        Left = 41
        Height = 13
        Top = 187
        Width = 130
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCnpjRemet: TRLLabel
        Left = 48
        Height = 13
        Top = 87
        Width = 124
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCnpjReceb: TRLLabel
        Left = 424
        Height = 13
        Top = 144
        Width = 121
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCnpjExped: TRLLabel
        Left = 48
        Height = 13
        Top = 144
        Width = 124
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCnpjDest: TRLLabel
        Left = 432
        Height = 18
        Top = 87
        Width = 115
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCEPToma: TRLLabel
        Left = 670
        Height = 13
        Top = 169
        Width = 64
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCEPRemet: TRLLabel
        Left = 301
        Height = 13
        Top = 78
        Width = 64
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCEPReceb: TRLLabel
        Left = 670
        Height = 13
        Top = 135
        Width = 64
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCEPExped: TRLLabel
        Left = 301
        Height = 13
        Top = 135
        Width = 64
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCEPDest: TRLLabel
        Left = 677
        Height = 13
        Top = 78
        Width = 57
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel99: TRLLabel
        Left = 374
        Height = 8
        Top = 111
        Width = 44
        Caption = 'RECEBEDOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel98: TRLLabel
        Left = 284
        Height = 8
        Top = 78
        Width = 15
        Caption = 'CEP'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel97: TRLLabel
        Left = 374
        Height = 8
        Top = 170
        Width = 38
        Caption = 'MUNIC�PIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel95: TRLLabel
        Left = 262
        Height = 8
        Top = 96
        Width = 20
        Caption = 'FONE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel94: TRLLabel
        Left = 653
        Height = 8
        Top = 170
        Width = 15
        Caption = 'CEP'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel93: TRLLabel
        Left = 174
        Height = 8
        Top = 87
        Width = 78
        Caption = 'INSCRI��O ESTADUAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel90: TRLLabel
        Left = 4
        Height = 8
        Top = 153
        Width = 17
        Caption = 'PAIS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel89: TRLLabel
        Left = 4
        Height = 8
        Top = 144
        Width = 34
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel88: TRLLabel
        Left = 4
        Height = 8
        Top = 135
        Width = 38
        Caption = 'MUNIC�PIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel87: TRLLabel
        Left = 4
        Height = 8
        Top = 119
        Width = 39
        Caption = 'ENDERE�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel86: TRLLabel
        Left = 4
        Height = 8
        Top = 111
        Width = 41
        Caption = 'EXPEDIDOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel82: TRLLabel
        Left = 4
        Height = 8
        Top = 187
        Width = 34
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel81: TRLLabel
        Left = 4
        Height = 8
        Top = 178
        Width = 39
        Caption = 'ENDERE�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel80: TRLLabel
        Left = 4
        Height = 8
        Top = 170
        Width = 81
        Caption = 'TOMADOR DO SERVI�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel79: TRLLabel
        Left = 374
        Height = 8
        Top = 96
        Width = 17
        Caption = 'PAIS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel32: TRLLabel
        Left = 374
        Height = 8
        Top = 87
        Width = 34
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel31: TRLLabel
        Left = 374
        Height = 8
        Top = 78
        Width = 38
        Caption = 'MUNIC�PIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel30: TRLLabel
        Left = 374
        Height = 8
        Top = 62
        Width = 39
        Caption = 'ENDERE�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel29: TRLLabel
        Left = 4
        Height = 8
        Top = 2
        Width = 115
        Caption = 'CFOP - NATUREZA DA OPERA��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel27: TRLLabel
        Left = 374
        Height = 8
        Top = 54
        Width = 52
        Caption = 'DESTINAT�RIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel26: TRLLabel
        Left = 4
        Height = 8
        Top = 96
        Width = 17
        Caption = 'PA�S'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel24: TRLLabel
        Left = 4
        Height = 8
        Top = 87
        Width = 34
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel22: TRLLabel
        Left = 4
        Height = 8
        Top = 78
        Width = 38
        Caption = 'MUNIC�PIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel16: TRLLabel
        Left = 4
        Height = 8
        Top = 62
        Width = 39
        Caption = 'ENDERE�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel14: TRLLabel
        Left = 374
        Height = 8
        Top = 28
        Width = 86
        Caption = 'DESTINO DA PRESTA��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel13: TRLLabel
        Left = 4
        Height = 8
        Top = 54
        Width = 42
        Caption = 'REMETENTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel128: TRLLabel
        Left = 653
        Height = 8
        Top = 135
        Width = 15
        Caption = 'CEP'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel125: TRLLabel
        Left = 640
        Height = 8
        Top = 153
        Width = 20
        Caption = 'FONE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel123: TRLLabel
        Left = 551
        Height = 8
        Top = 144
        Width = 78
        Caption = 'INSCRI��O ESTADUAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel12: TRLLabel
        Left = 4
        Height = 8
        Top = 28
        Width = 84
        Caption = 'ORIGEM DA PRESTA��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel119: TRLLabel
        Left = 660
        Height = 8
        Top = 78
        Width = 15
        Caption = 'CEP'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel116: TRLLabel
        Left = 640
        Height = 8
        Top = 96
        Width = 20
        Caption = 'FONE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel114: TRLLabel
        Left = 551
        Height = 8
        Top = 87
        Width = 78
        Caption = 'INSCRI��O ESTADUAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel113: TRLLabel
        Left = 500
        Height = 8
        Top = 178
        Width = 17
        Caption = 'PA�S'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel111: TRLLabel
        Left = 374
        Height = 8
        Top = 187
        Width = 20
        Caption = 'FONE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel110: TRLLabel
        Left = 284
        Height = 8
        Top = 135
        Width = 15
        Caption = 'CEP'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel108: TRLLabel
        Left = 174
        Height = 8
        Top = 187
        Width = 78
        Caption = 'INSCRI��O ESTADUAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel107: TRLLabel
        Left = 262
        Height = 8
        Top = 153
        Width = 20
        Caption = 'FONE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel105: TRLLabel
        Left = 174
        Height = 8
        Top = 144
        Width = 78
        Caption = 'INSCRI��O ESTADUAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel104: TRLLabel
        Left = 374
        Height = 8
        Top = 153
        Width = 17
        Caption = 'PA�S'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel103: TRLLabel
        Left = 374
        Height = 8
        Top = 144
        Width = 34
        Caption = 'CNPJ/CPF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel102: TRLLabel
        Left = 374
        Height = 8
        Top = 135
        Width = 38
        Caption = 'MUNIC�PIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel101: TRLLabel
        Left = 374
        Height = 8
        Top = 119
        Width = 39
        Caption = 'ENDERE�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
    end
    object rlb_04_DadosNotaFiscal: TRLBand[7]
      Left = 26
      Height = 90
      Top = 653
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_04_DadosNotaFiscalBeforePrint
      object rlsQuadro03: TRLDraw
        Left = 0
        Height = 88
        Top = 1
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw9: TRLDraw
        Left = 283
        Height = 25
        Top = 1
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw8: TRLDraw
        Left = 632
        Height = 30
        Top = 59
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw7: TRLDraw
        Left = 526
        Height = 30
        Top = 59
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw62: TRLDraw
        Left = 414
        Height = 1
        Top = 59
        Width = 326
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw61: TRLDraw
        Left = 414
        Height = 62
        Top = 27
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw60: TRLDraw
        Left = 324
        Height = 62
        Top = 27
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw59: TRLDraw
        Left = 164
        Height = 62
        Top = 27
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw58: TRLDraw
        Left = 84
        Height = 62
        Top = 27
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw56: TRLDraw
        Left = 540
        Height = 25
        Top = 1
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw55: TRLDraw
        Left = 1
        Height = 1
        Top = 26
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmQtdUnidMedida5: TRLMemo
        Left = 328
        Height = 36
        Top = 38
        Width = 84
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmQtdUnidMedida3: TRLMemo
        Left = 166
        Height = 36
        Top = 38
        Width = 76
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmQtdUnidMedida2: TRLMemo
        Left = 86
        Height = 36
        Top = 38
        Width = 76
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmQtdUnidMedida1: TRLMemo
        Left = 5
        Height = 36
        Top = 38
        Width = 76
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllVlrTotalMerc: TRLLabel
        Left = 549
        Height = 13
        Top = 13
        Width = 185
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllProdPredominante: TRLLabel
        Left = 4
        Height = 13
        Top = 13
        Width = 275
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllOutrasCaracCarga: TRLLabel
        Left = 287
        Height = 13
        Top = 13
        Width = 249
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel5: TRLLabel
        Left = 418
        Height = 8
        Top = 28
        Width = 84
        AutoSize = False
        Caption = 'NOME DA SEGURADORA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel43: TRLLabel
        Left = 328
        Height = 9
        Top = 29
        Width = 84
        Alignment = taCenter
        AutoSize = False
        Caption = 'QTDE. VOLUMES (Unid)'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel41: TRLLabel
        Left = 166
        Height = 9
        Top = 29
        Width = 76
        Alignment = taCenter
        AutoSize = False
        Caption = 'PESO AFERIDO (Kg)'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel40: TRLLabel
        Left = 634
        Height = 8
        Top = 63
        Width = 90
        AutoSize = False
        Caption = 'N�MERO DA AVERBA��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel4: TRLLabel
        Left = 286
        Height = 8
        Top = 3
        Width = 135
        AutoSize = False
        Caption = 'OUTRAS CARACTER�STICAS DA CARGA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel39: TRLLabel
        Left = 528
        Height = 8
        Top = 63
        Width = 75
        AutoSize = False
        Caption = 'N�MERO DA AP�LICE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel37: TRLLabel
        Left = 416
        Height = 8
        Top = 63
        Width = 51
        AutoSize = False
        Caption = 'RESPONS�VEL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel36: TRLLabel
        Left = 86
        Height = 9
        Top = 29
        Width = 76
        Alignment = taCenter
        AutoSize = False
        Caption = 'PESO BASE C�LC. (Kg)'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel35: TRLLabel
        Left = 5
        Height = 9
        Top = 29
        Width = 76
        Alignment = taCenter
        AutoSize = False
        Caption = 'PESO BRUTO (Kg)'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel34: TRLLabel
        Left = 546
        Height = 8
        Top = 3
        Width = 111
        AutoSize = False
        Caption = 'VALOR TOTAL DA MERCADORIA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel1: TRLLabel
        Left = 4
        Height = 8
        Top = 3
        Width = 91
        AutoSize = False
        Caption = 'PRODUTO PREDOMINANTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlmQtdUnidMedida4: TRLMemo
        Left = 246
        Height = 36
        Top = 38
        Width = 76
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel73: TRLLabel
        Left = 246
        Height = 9
        Top = 29
        Width = 76
        Alignment = taCenter
        AutoSize = False
        Caption = 'CUBAGEM (M3)'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw100: TRLDraw
        Left = 244
        Height = 62
        Top = 27
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNomeSeguradora: TRLMemo
        Left = 419
        Height = 19
        Top = 39
        Width = 315
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Seguradora 1'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmRespSeguroMerc: TRLMemo
        Left = 418
        Height = 14
        Top = 72
        Width = 105
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Resp Seguro 1'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNroApolice: TRLMemo
        Left = 530
        Height = 14
        Top = 72
        Width = 99
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Nro Apolice 1'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNroAverbacao: TRLMemo
        Left = 636
        Height = 14
        Top = 72
        Width = 99
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Nro Averbacao 1'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_05_Complemento: TRLBand[8]
      Left = 26
      Height = 81
      Top = 743
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_05_ComplementoBeforePrint
      object rlsQuadro04: TRLDraw
        Left = 0
        Height = 79
        Top = 1
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw6: TRLDraw
        Left = 372
        Height = 64
        Top = 16
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw5: TRLDraw
        Left = 1
        Height = 1
        Top = 16
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel64: TRLLabel
        Left = 645
        Height = 8
        Top = 19
        Width = 90
        Caption = 'VALOR COMPLEMENTADO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel63: TRLLabel
        Left = 377
        Height = 8
        Top = 19
        Width = 119
        Caption = 'CHAVE DO CT-E COMPLEMENTADO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel62: TRLLabel
        Left = 280
        Height = 8
        Top = 19
        Width = 90
        Caption = 'VALOR COMPLEMENTADO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel61: TRLLabel
        Left = 5
        Height = 8
        Top = 19
        Width = 119
        Caption = 'CHAVE DO CT-E COMPLEMENTADO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel59: TRLLabel
        Left = 6
        Height = 13
        Top = 3
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'CT-e COMPLEMENTADO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlmComplChave1: TRLMemo
        Left = 5
        Height = 48
        Top = 28
        Width = 269
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmComplValor1: TRLMemo
        Left = 280
        Height = 48
        Top = 28
        Width = 89
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmComplChave2: TRLMemo
        Left = 377
        Height = 48
        Top = 28
        Width = 264
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmComplValor2: TRLMemo
        Left = 645
        Height = 48
        Top = 28
        Width = 89
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_17_Sistema: TRLBand[9]
      Left = 26
      Height = 16
      Top = 1702
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_17_SistemaBeforePrint
      object RLLabel15: TRLLabel
        Left = 2
        Height = 12
        Top = 0
        Width = 140
        Caption = 'DATA E HORA DA IMPRESS�O: '
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllblSistema: TRLLabel
        Left = 352
        Height = 13
        Top = 0
        Width = 387
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Desenvolvido por Projeto ACBr - http://acbr.sourceforge.net/'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 143
        Height = 12
        Top = 0
        Width = 27
        Font.CharSet = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Info = itNow
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_16_DadosExcEmitente: TRLBand[10]
      Left = 26
      Height = 70
      Top = 1632
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_16_DadosExcEmitenteBeforePrint
      object RLDraw71: TRLDraw
        Left = 0
        Height = 67
        Top = 1
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel165: TRLLabel
        Left = 566
        Height = 12
        Top = 4
        Width = 102
        Caption = 'RESERVADO AO FISCO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 142
        Height = 12
        Top = 4
        Width = 171
        Caption = 'USO EXCLUSIVO DO EMISSOR DO CT-E'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlmObsExcEmitente: TRLMemo
        Left = 5
        Height = 49
        Top = 17
        Width = 492
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'OBS LINHA 1'
          'OBS LINHA 2'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw27: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw3: TRLDraw
        Left = 500
        Height = 67
        Top = 1
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmObsFisco: TRLMemo
        Left = 509
        Height = 49
        Top = 17
        Width = 228
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'OBS LINHA 1'
          'OBS LINHA 2'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_06_ValorPrestacao: TRLBand[11]
      Left = 26
      Height = 118
      Top = 908
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_06_ValorPrestacaoBeforePrint
      object rlsQuadro05: TRLDraw
        Left = 0
        Height = 115
        Top = 1
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw16: TRLDraw
        Left = 557
        Height = 1
        Top = 47
        Width = 184
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw17: TRLDraw
        Left = 1
        Height = 1
        Top = 16
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw18: TRLDraw
        Left = 372
        Height = 62
        Top = 16
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw19: TRLDraw
        Left = 556
        Height = 62
        Top = 16
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw20: TRLDraw
        Left = 448
        Height = 26
        Top = 90
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw22: TRLDraw
        Left = 346
        Height = 26
        Top = 90
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw23: TRLDraw
        Left = 500
        Height = 26
        Top = 90
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw25: TRLDraw
        Left = 586
        Height = 26
        Top = 90
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw26: TRLDraw
        Left = 650
        Height = 26
        Top = 90
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw45: TRLDraw
        Left = 1
        Height = 1
        Top = 78
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw15: TRLDraw
        Left = 186
        Height = 62
        Top = 16
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw21: TRLDraw
        Left = 1
        Height = 1
        Top = 93
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCompValor3: TRLMemo
        Left = 476
        Height = 50
        Top = 28
        Width = 78
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCompValor2: TRLMemo
        Left = 290
        Height = 50
        Top = 28
        Width = 78
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCompValor1: TRLMemo
        Left = 104
        Height = 50
        Top = 28
        Width = 78
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCompNome3: TRLMemo
        Left = 377
        Height = 50
        Top = 28
        Width = 96
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCompNome2: TRLMemo
        Left = 190
        Height = 50
        Top = 28
        Width = 96
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCompNome1: TRLMemo
        Left = 5
        Height = 50
        Top = 28
        Width = 96
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'COMP 1'
          'COMP 2'
          'COMP 3'
          'COMP 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllVlrTotServico: TRLLabel
        Left = 570
        Height = 14
        Top = 29
        Width = 164
        Alignment = taRightJustify
        AutoSize = False
        Caption = '999999999'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllVlrTotReceber: TRLLabel
        Left = 570
        Height = 14
        Top = 61
        Width = 164
        Alignment = taRightJustify
        AutoSize = False
        Caption = '999999999'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllVlrICMS: TRLLabel
        Left = 504
        Height = 13
        Top = 102
        Width = 79
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllSitTrib: TRLLabel
        Left = 3
        Height = 13
        Top = 102
        Width = 340
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllRedBaseCalc: TRLLabel
        Left = 590
        Height = 13
        Top = 102
        Width = 57
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllICMS_ST: TRLLabel
        Left = 656
        Height = 13
        Top = 102
        Width = 81
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllBaseCalc: TRLLabel
        Left = 350
        Height = 13
        Top = 102
        Width = 95
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllAliqICMS: TRLLabel
        Left = 454
        Height = 13
        Top = 102
        Width = 41
        Alignment = taRightJustify
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel58: TRLLabel
        Left = 656
        Height = 8
        Top = 95
        Width = 29
        Caption = 'ICMS ST'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel56: TRLLabel
        Left = 454
        Height = 8
        Top = 95
        Width = 39
        Caption = 'AL�Q. ICMS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel55: TRLLabel
        Left = 350
        Height = 8
        Top = 95
        Width = 66
        Caption = 'BASE DE C�LCULO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel54: TRLLabel
        Left = 504
        Height = 8
        Top = 95
        Width = 45
        Caption = 'VALOR ICMS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel53: TRLLabel
        Left = 590
        Height = 8
        Top = 95
        Width = 59
        Caption = '% RED.BC.CALC.'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel52: TRLLabel
        Left = 3
        Height = 8
        Top = 95
        Width = 81
        Caption = 'SITUA��O TRIBUT�RIA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel51: TRLLabel
        Left = 8
        Height = 13
        Top = 80
        Width = 728
        Alignment = taCenter
        AutoSize = False
        Caption = 'INFORMA��ES RELATIVAS AO IMPOSTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel50: TRLLabel
        Left = 560
        Height = 9
        Top = 49
        Width = 96
        AutoSize = False
        Caption = 'VALOR A RECEBER'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel49: TRLLabel
        Left = 560
        Height = 9
        Top = 19
        Width = 96
        AutoSize = False
        Caption = 'VALOR TOTAL DO SERVI�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel48: TRLLabel
        Left = 528
        Height = 8
        Top = 19
        Width = 26
        Caption = 'VALOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel47: TRLLabel
        Left = 377
        Height = 8
        Top = 19
        Width = 22
        Caption = 'NOME'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel46: TRLLabel
        Left = 156
        Height = 8
        Top = 19
        Width = 26
        Caption = 'VALOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel45: TRLLabel
        Left = 342
        Height = 8
        Top = 19
        Width = 26
        Caption = 'VALOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel44: TRLLabel
        Left = 5
        Height = 8
        Top = 19
        Width = 22
        Caption = 'NOME'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel42: TRLLabel
        Left = 190
        Height = 8
        Top = 19
        Width = 22
        Caption = 'NOME'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel38: TRLLabel
        Left = 6
        Height = 12
        Top = 3
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'COMPONENTES DO VALOR DA PRESTA��O DE SERVI�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
    end
    object rlb_12_ModAereo: TRLBand[12]
      Left = 26
      Height = 97
      Top = 1429
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_12_ModAereoBeforePrint
      object RLDraw47: TRLDraw
        Left = 0
        Height = 96
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw66: TRLDraw
        Left = 68
        Height = 22
        Top = 49
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw67: TRLDraw
        Left = 90
        Height = 22
        Top = 49
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw68: TRLDraw
        Left = 154
        Height = 22
        Top = 49
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw69: TRLDraw
        Left = 540
        Height = 24
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw65: TRLDraw
        Left = 260
        Height = 56
        Top = 15
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw57: TRLDraw
        Left = 1
        Height = 1
        Top = 38
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw72: TRLDraw
        Left = 596
        Height = 56
        Top = 39
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw70: TRLDraw
        Left = 34
        Height = 26
        Top = 70
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllTrecho: TRLLabel
        Left = 2
        Height = 12
        Top = 58
        Width = 37
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTarifaValor: TRLLabel
        Left = 158
        Height = 13
        Top = 58
        Width = 95
        Alignment = taRightJustify
        AutoSize = False
        Caption = '0,00'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTarifaCodigo: TRLLabel
        Left = 95
        Height = 12
        Top = 58
        Width = 22
        Caption = '1234'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTarifaCL: TRLLabel
        Left = 72
        Height = 12
        Top = 58
        Width = 12
        Caption = '12'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllRetira: TRLLabel
        Left = 2
        Height = 13
        Top = 81
        Width = 26
        Alignment = taCenter
        AutoSize = False
        Caption = 'SIM'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllMinuta: TRLLabel
        Left = 672
        Height = 19
        Top = 50
        Width = 65
        AutoSize = False
        Caption = '123456789'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllLojaAgenteEmissor: TRLLabel
        Left = 598
        Height = 12
        Top = 81
        Width = 88
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllDadosRetira: TRLLabel
        Left = 39
        Height = 14
        Top = 81
        Width = 554
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllContaCorrente: TRLLabel
        Left = 262
        Height = 12
        Top = 49
        Width = 67
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCaracAdTransporte: TRLLabel
        Left = 262
        Height = 12
        Top = 25
        Width = 85
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCaracAdServico: TRLLabel
        Left = 6
        Height = 12
        Top = 25
        Width = 73
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllAWB: TRLLabel
        Left = 632
        Height = 19
        Top = 16
        Width = 105
        AutoSize = False
        Caption = '000-0-000000000-0'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel157: TRLLabel
        Left = 598
        Height = 8
        Top = 72
        Width = 92
        Caption = 'LOJA OU AGENTE EMISSOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel156: TRLLabel
        Left = 262
        Height = 8
        Top = 40
        Width = 65
        Caption = 'CONTA CORRENTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel155: TRLLabel
        Left = 262
        Height = 8
        Top = 16
        Width = 167
        Caption = 'CARACTERISTICAS ADICIONAIS DO TRANSPORTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel154: TRLLabel
        Left = 6
        Height = 8
        Top = 16
        Width = 152
        Caption = 'CARACTERISTICAS ADICIONAIS DO SERVI�O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel153: TRLLabel
        Left = 8
        Height = 13
        Top = 2
        Width = 730
        Alignment = taCenter
        AutoSize = False
        Caption = 'INFORMA��ES ESPEC�FICAS DO MODAL A�REO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel150: TRLLabel
        Left = 39
        Height = 8
        Top = 72
        Width = 149
        Caption = 'DADOS RELATIVOS A RETIRADA DA CARGA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel149: TRLLabel
        Left = 2
        Height = 8
        Top = 72
        Width = 27
        Caption = 'RETIRA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel148: TRLLabel
        Left = 598
        Height = 8
        Top = 40
        Width = 73
        Caption = 'N�MERO DA MINUTA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel147: TRLLabel
        Left = 158
        Height = 8
        Top = 50
        Width = 26
        Caption = 'VALOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel146: TRLLabel
        Left = 95
        Height = 8
        Top = 50
        Width = 29
        Caption = 'C�DIGO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel145: TRLLabel
        Left = 72
        Height = 8
        Top = 50
        Width = 11
        Caption = 'CL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel144: TRLLabel
        Left = 2
        Height = 8
        Top = 50
        Width = 30
        Caption = 'TRECHO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel142: TRLLabel
        Left = 8
        Height = 9
        Top = 40
        Width = 250
        Alignment = taCenter
        AutoSize = False
        Caption = 'DADOS DA TARIFA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel141: TRLLabel
        Left = 543
        Height = 8
        Top = 16
        Width = 83
        Caption = 'N�MERO OPERACIONAL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw54: TRLDraw
        Left = 1
        Height = 1
        Top = 14
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw63: TRLDraw
        Left = 0
        Height = 1
        Top = 70
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw64: TRLDraw
        Left = 0
        Height = 1
        Top = 48
        Width = 260
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_13_ModAquaviario: TRLBand[13]
      Left = 26
      Height = 92
      Top = 1526
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_13_ModAquaviarioBeforePrint
      object RLDraw73: TRLDraw
        Left = 0
        Height = 89
        Top = 1
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel151: TRLLabel
        Left = 6
        Height = 13
        Top = 4
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'DADOS ESPEC�FICOS DO MODAL AQUAVI�RIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw74: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel152: TRLLabel
        Left = 6
        Height = 8
        Top = 17
        Width = 77
        Caption = 'PORTO DE EMBARQUE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllPortoEmbarque: TRLLabel
        Left = 6
        Height = 12
        Top = 26
        Width = 71
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel158: TRLLabel
        Left = 406
        Height = 8
        Top = 17
        Width = 67
        Caption = 'PORTO DE DESTINO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllPortoDestino: TRLLabel
        Left = 406
        Height = 12
        Top = 26
        Width = 64
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw75: TRLDraw
        Left = 1
        Height = 1
        Top = 39
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel159: TRLLabel
        Left = 6
        Height = 8
        Top = 41
        Width = 141
        Caption = 'IDENTIFICA��O DO NAVIO / REBOCADOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllIndNavioRebocador: TRLLabel
        Left = 6
        Height = 12
        Top = 50
        Width = 89
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw76: TRLDraw
        Left = 1
        Height = 1
        Top = 63
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel160: TRLLabel
        Left = 6
        Height = 8
        Top = 65
        Width = 108
        Caption = 'IDENTIFICA��O DA(S) BALSA(S)'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllIndConteiners: TRLLabel
        Left = 406
        Height = 12
        Top = 74
        Width = 66
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw77: TRLDraw
        Left = 402
        Height = 73
        Top = 16
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel162: TRLLabel
        Left = 406
        Height = 8
        Top = 41
        Width = 95
        Caption = 'VR DA B. DE CALC. AFRMM'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllBCAFRMM: TRLLabel
        Left = 406
        Height = 12
        Top = 50
        Width = 57
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel164: TRLLabel
        Left = 518
        Height = 8
        Top = 41
        Width = 56
        Caption = 'VLR DO AFRMM'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllValorAFRMM: TRLLabel
        Left = 518
        Height = 12
        Top = 50
        Width = 66
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel166: TRLLabel
        Left = 614
        Height = 8
        Top = 41
        Width = 74
        Caption = 'TIPO DE NAVEGA��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllTipoNav: TRLLabel
        Left = 614
        Height = 12
        Top = 50
        Width = 45
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel168: TRLLabel
        Left = 694
        Height = 8
        Top = 41
        Width = 33
        Caption = 'DIRE��O'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllDirecao: TRLLabel
        Left = 694
        Height = 12
        Top = 50
        Width = 41
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw78: TRLDraw
        Left = 690
        Height = 24
        Top = 40
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw79: TRLDraw
        Left = 610
        Height = 24
        Top = 40
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw80: TRLDraw
        Left = 514
        Height = 24
        Top = 40
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel178: TRLLabel
        Left = 406
        Height = 8
        Top = 65
        Width = 116
        Caption = 'IDENTIFICA��O DOS CONTEINERS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllIndBalsas: TRLLabel
        Left = 6
        Height = 12
        Top = 74
        Width = 49
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_14_ModFerroviario: TRLBand[14]
      Left = 26
      Height = 7
      Top = 1618
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_14_ModFerroviarioBeforePrint
    end
    object rlb_15_ModDutoviario: TRLBand[15]
      Left = 26
      Height = 7
      Top = 1625
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_15_ModDutoviarioBeforePrint
    end
    object rlb_01_Recibo_Aereo: TRLBand[16]
      Left = 26
      Height = 157
      Top = 106
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_01_Recibo_AereoBeforePrint
      object RLDraw10: TRLDraw
        Left = 0
        Height = 145
        Top = 0
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw53: TRLDraw
        Left = 367
        Height = 78
        Top = 66
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw2: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel70: TRLLabel
        Left = 6
        Height = 12
        Top = 109
        Width = 15
        Caption = 'RG'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel66: TRLLabel
        Left = 6
        Height = 12
        Top = 80
        Width = 30
        Caption = 'NOME'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel65: TRLLabel
        Left = 6
        Height = 13
        Top = 2
        Width = 730
        Alignment = taCenter
        AutoSize = False
        Caption = 'DECLARO QUE RECEBI OS VOLUMES DESTE CONHECIMENTO EM PERFEITO ESTADO PELO QUE DOU POR CUMPRIDO O PRESENTE CONTRATO DE TRANSPORTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel19: TRLLabel
        Left = 6
        Height = 48
        Top = 17
        Width = 730
        AutoSize = False
        Caption = 'O Transporte coberto por este conhecimento se rege pelo c�digo Brasileiro de Aeron�utica (Lei 7.565 de 19/12/1986), especificamente pelas regras relativas a responsabilidade Civil prevista nos artigos 193, 241, 244, 262 e 264, de cujo teor o Expedidor / Remetente declara concordar e ter plena ci�ncia. O Expedidor / Remetente aceita como corretas todas as especifica��es impressas, manuscritas, datilografadas ou carimbadas neste conhecimento, certificando que os artigos perigosos descritos pela regulamenta��o da I.C.A.O. foram devidamente informados e acondicionados para transporte A�reo.'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw81: TRLDraw
        Left = 1
        Height = 1
        Top = 66
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw82: TRLDraw
        Left = 1
        Height = 1
        Top = 77
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel57: TRLLabel
        Left = 121
        Height = 8
        Top = 68
        Width = 88
        Alignment = taCenter
        Caption = 'EXPEDIDOR / REMETENTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel60: TRLLabel
        Left = 508
        Height = 8
        Top = 68
        Width = 100
        Alignment = taCenter
        Caption = 'DESTINAT�RIO / RECEBEDOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel69: TRLLabel
        Left = 206
        Height = 12
        Top = 80
        Width = 62
        Caption = 'DATA / HORA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel161: TRLLabel
        Left = 206
        Height = 12
        Top = 109
        Width = 61
        Caption = 'ASSINATURA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel67: TRLLabel
        Left = 374
        Height = 12
        Top = 80
        Width = 30
        Caption = 'NOME'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel68: TRLLabel
        Left = 374
        Height = 12
        Top = 109
        Width = 15
        Caption = 'RG'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel72: TRLLabel
        Left = 574
        Height = 12
        Top = 80
        Width = 62
        Caption = 'DATA / HORA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel163: TRLLabel
        Left = 574
        Height = 12
        Top = 109
        Width = 61
        Caption = 'ASSINATURA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw108: TRLDraw
        Left = 0
        Height = 1
        Top = 150
        Width = 741
        Angle = 0
        DrawKind = dkLine
        Pen.Style = psDot
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_11_ModRodLot104: TRLBand[17]
      Left = 26
      Height = 107
      Top = 1322
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_11_ModRodLot104BeforePrint
      object RLDraw4: TRLDraw
        Left = 0
        Height = 104
        Top = 1
        Width = 740
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw30: TRLDraw
        Left = 207
        Height = 103
        Top = 1
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw83: TRLDraw
        Left = 1
        Height = 1
        Top = 15
        Width = 739
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw84: TRLDraw
        Left = 42
        Height = 66
        Top = 14
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw85: TRLDraw
        Left = 100
        Height = 66
        Top = 14
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw86: TRLDraw
        Left = 122
        Height = 66
        Top = 14
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw87: TRLDraw
        Left = 1
        Height = 1
        Top = 26
        Width = 739
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw89: TRLDraw
        Left = 1
        Height = 1
        Top = 79
        Width = 739
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw90: TRLDraw
        Left = 345
        Height = 25
        Top = 79
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw92: TRLDraw
        Left = 330
        Height = 66
        Top = 14
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel167: TRLLabel
        Left = 2
        Height = 8
        Top = 16
        Width = 17
        Caption = 'TIPO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel169: TRLLabel
        Left = 214
        Height = 13
        Top = 2
        Width = 524
        Alignment = taCenter
        AutoSize = False
        Caption = 'INFORMA��ES REFERENTES AO VALE-PED�GIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel170: TRLLabel
        Left = 2
        Height = 13
        Top = 2
        Width = 202
        Alignment = taCenter
        AutoSize = False
        Caption = 'IDENTIFICA��O DO CONJ. TRANSPORTADOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel171: TRLLabel
        Left = 351
        Height = 8
        Top = 82
        Width = 148
        Caption = 'IDENTIFICA��O DOS LACRES EM TR�NSITO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel172: TRLLabel
        Left = 212
        Height = 8
        Top = 82
        Width = 69
        Caption = 'CPF DO MOTORISTA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel173: TRLLabel
        Left = 4
        Height = 8
        Top = 82
        Width = 76
        Caption = 'NOME DO MOTORISTA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel174: TRLLabel
        Left = 334
        Height = 8
        Top = 16
        Width = 87
        Caption = 'N�MERO COMPROVANTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel177: TRLLabel
        Left = 618
        Height = 8
        Top = 16
        Width = 70
        Caption = 'CNPJ RESPONS�VEL'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel179: TRLLabel
        Left = 210
        Height = 8
        Top = 16
        Width = 68
        Caption = 'CNPJ FORNECEDOR'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel181: TRLLabel
        Left = 124
        Height = 8
        Top = 16
        Width = 26
        Caption = 'RNTRC'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel182: TRLLabel
        Left = 102
        Height = 8
        Top = 16
        Width = 11
        Caption = 'UF'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel183: TRLLabel
        Left = 44
        Height = 8
        Top = 16
        Width = 25
        Caption = 'PLACA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rlmUF2: TRLMemo
        Left = 102
        Height = 50
        Top = 28
        Width = 16
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Uf1'
          'Uf2'
          'Uf3'
          'Uf4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmTipo2: TRLMemo
        Left = 2
        Height = 50
        Top = 28
        Width = 36
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Tipo 1'
          'Tipo 2'
          'Tipo 3'
          'Tipo 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmRNTRC2: TRLMemo
        Left = 124
        Height = 50
        Top = 28
        Width = 77
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'RNTRC 1'
          'RNTRC 2'
          'RNTRC 3'
          'RNTRC 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmPlaca2: TRLMemo
        Left = 44
        Height = 50
        Top = 28
        Width = 53
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Placa 1'
          'Placa 2'
          'Placa 3'
          'Placa 4'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCNPJForn: TRLMemo
        Left = 210
        Height = 48
        Top = 28
        Width = 117
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Empresa 1'
          'Empresa 2'
          'Empresa 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNumCompra: TRLMemo
        Left = 334
        Height = 48
        Top = 28
        Width = 275
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Transacao 1'
          'Transacao 2'
          'Transacao 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllNomeMotorista2: TRLLabel
        Left = 4
        Height = 12
        Top = 91
        Width = 76
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllLacres2: TRLLabel
        Left = 351
        Height = 12
        Top = 91
        Width = 41
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rllCPFMotorista2: TRLLabel
        Left = 212
        Height = 12
        Top = 91
        Width = 71
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw98: TRLDraw
        Left = 614
        Height = 66
        Top = 14
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmCNPJPg: TRLMemo
        Left = 618
        Height = 48
        Top = 28
        Width = 117
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Empresa 1'
          'Empresa 2'
          'Empresa 3'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_18_Recibo: TRLBand[18]
      Left = 26
      Height = 97
      Top = 1718
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_18_ReciboBeforePrint
      object RLDraw97: TRLDraw
        Left = 0
        Height = 78
        Top = 14
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw91: TRLDraw
        Left = 202
        Height = 52
        Top = 39
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw93: TRLDraw
        Left = 473
        Height = 52
        Top = 39
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw94: TRLDraw
        Left = 593
        Height = 52
        Top = 39
        Width = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw95: TRLDraw
        Left = 1
        Height = 1
        Top = 65
        Width = 201
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw96: TRLDraw
        Left = 1
        Height = 1
        Top = 39
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel175: TRLLabel
        Left = 480
        Height = 16
        Top = 73
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = '__/__/__    __:__'
        Color = clWhite
        Font.CharSet = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel176: TRLLabel
        Left = 480
        Height = 16
        Top = 49
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = '__/__/__    __:__'
        Color = clWhite
        Font.CharSet = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel180: TRLLabel
        Left = 647
        Height = 13
        Top = 41
        Width = 28
        Caption = 'CT-E'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel184: TRLLabel
        Left = 605
        Height = 12
        Top = 57
        Width = 14
        Caption = 'N� '
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel185: TRLLabel
        Left = 605
        Height = 12
        Top = 71
        Width = 30
        Caption = 'S�RIE:'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel186: TRLLabel
        Left = 6
        Height = 13
        Top = 16
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'DECLARO QUE RECEBI OS VOLUMES DESTE CONHECIMENTO EM PERFEITO ESTADO PELO QUE DOU POR CUMPRIDO O PRESENTE CONTRATO DE TRANSPORTE'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel187: TRLLabel
        Left = 6
        Height = 12
        Top = 46
        Width = 30
        Caption = 'NOME'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel188: TRLLabel
        Left = 480
        Height = 9
        Top = 41
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = 'CHEGADA DATA/HORA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel189: TRLLabel
        Left = 480
        Height = 9
        Top = 64
        Width = 108
        Alignment = taCenter
        AutoSize = False
        Caption = 'SA�DA DATA/HORA'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel190: TRLLabel
        Left = 207
        Height = 13
        Top = 72
        Width = 262
        Alignment = taCenter
        AutoSize = False
        Caption = 'ASSINATURA / CARIMBO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel191: TRLLabel
        Left = 6
        Height = 12
        Top = 70
        Width = 15
        Caption = 'RG'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllSerie3: TRLLabel
        Left = 655
        Height = 13
        Top = 71
        Width = 50
        Alignment = taCenter
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllNumCTe3: TRLLabel
        Left = 638
        Height = 16
        Top = 57
        Width = 86
        Alignment = taRightJustify
        AutoSize = False
        Caption = '999999999'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Times New Roman'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object rllResumoCanhotoCTe2: TRLLabel
        Left = 6
        Height = 13
        Top = 26
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'RESUMO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw109: TRLDraw
        Left = 0
        Height = 1
        Top = 7
        Width = 741
        Angle = 0
        DrawKind = dkLine
        Pen.Style = psDot
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
    object rlb_06_ProdutosPerigosos: TRLBand[19]
      Left = 26
      Height = 84
      Top = 824
      Width = 742
      BandType = btHeader
      Color = clWhite
      ParentColor = False
      RealBounds.Left = 0
      RealBounds.Top = 0
      RealBounds.Width = 0
      RealBounds.Height = 0
      BeforePrint = rlb_06_ProdutosPerigososBeforePrint
      object RLDraw101: TRLDraw
        Left = 0
        Height = 81
        Top = 1
        Width = 741
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel192: TRLLabel
        Left = 6
        Height = 13
        Top = 3
        Width = 732
        Alignment = taCenter
        AutoSize = False
        Caption = 'INFORMA��ES SOBRE OS PRODUTOS PERIGOSOS'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw102: TRLDraw
        Left = 1
        Height = 1
        Top = 16
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLLabel193: TRLLabel
        Left = 5
        Height = 8
        Top = 19
        Width = 36
        Caption = 'NRO. ONU'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel194: TRLLabel
        Left = 84
        Height = 8
        Top = 19
        Width = 69
        Caption = 'NOME APROPRIADO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel195: TRLLabel
        Left = 310
        Height = 8
        Top = 19
        Width = 145
        Caption = 'CLASSE/SUBCLASSE E RISCO SUBSIDI�RIO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel196: TRLLabel
        Left = 510
        Height = 8
        Top = 19
        Width = 83
        Caption = 'GRUPO DE EMBALAGEM'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLLabel197: TRLLabel
        Left = 625
        Height = 8
        Top = 19
        Width = 79
        Caption = 'QTDE TOTAL PRODUTO'
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -7
        Font.Name = 'Times New Roman'
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
        Transparent = False
      end
      object RLDraw103: TRLDraw
        Left = 80
        Height = 66
        Top = 16
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw104: TRLDraw
        Left = 300
        Height = 66
        Top = 16
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw105: TRLDraw
        Left = 500
        Height = 66
        Top = 16
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw106: TRLDraw
        Left = 620
        Height = 66
        Top = 16
        Width = 1
        Angle = 90
        Brush.Style = bsClear
        DrawKind = dkLine
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNumONU: TRLMemo
        Left = 5
        Height = 45
        Top = 33
        Width = 68
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'NUM ONU'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmNomeApropriado: TRLMemo
        Left = 85
        Height = 45
        Top = 33
        Width = 212
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Nome Apropriado'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmClasse: TRLMemo
        Left = 309
        Height = 45
        Top = 33
        Width = 188
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Classe'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmGrupoEmbalagem: TRLMemo
        Left = 509
        Height = 45
        Top = 33
        Width = 108
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Grupo de Embalagem'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object rlmQtdeProduto: TRLMemo
        Left = 625
        Height = 45
        Top = 33
        Width = 112
        AutoSize = False
        Color = clWhite
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'Times New Roman'
        Lines.Strings = (
          'Quantidade'
        )
        ParentColor = False
        ParentFont = False
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
      object RLDraw107: TRLDraw
        Left = 1
        Height = 1
        Top = 30
        Width = 740
        HelpContext = 1
        Angle = 0
        Brush.Style = bsClear
        RealBounds.Left = 0
        RealBounds.Top = 0
        RealBounds.Width = 0
        RealBounds.Height = 0
      end
    end
  end
end
