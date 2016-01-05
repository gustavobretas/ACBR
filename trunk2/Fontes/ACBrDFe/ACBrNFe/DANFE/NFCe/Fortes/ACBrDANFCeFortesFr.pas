{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}


{******************************************************************************
|* Historico
|*
|* 04/04/2013:  André Ferreira de Moraes
|*   Inicio do desenvolvimento
******************************************************************************}
{$I ACBr.inc}
unit ACBrDANFCeFortesFr;

interface

uses Classes, SysUtils,
     {$IFDEF FPC}
       LResources,
     {$ENDIF}
     Forms, Graphics,
     ACBrNFeDANFEClass, ACBrUtil,
     pcnNFe, pcnConversao, pcnAuxiliar, ACBrDFeUtil,
     RLConsts, RLReport, RLBarcode, RLPDFFilter, RLHTMLFilter, RLPrintDialog,
     RLFilters, RLPrinters, Controls;

const
  CACBrNFeDANFCeFortes_Versao = '0.1.0' ;

type
  TACBrSATExtratoFiltro = (fiNenhum, fiPDF, fiHTML ) ;

  { TACBrNFeDANFCeFortes }

  TACBrNFeDANFCeFortes = class( TACBrNFeDANFEClass )
  private
  protected
    FpNFe: TNFe;

    procedure Imprimir(const DanfeResumido : Boolean = False; const AFiltro : TACBrSATExtratoFiltro = fiNenhum);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ImprimirDANFE(NFE : TNFe = nil); override ;
    procedure ImprimirDANFEResumido(NFE : TNFe = nil); override ;
    procedure ImprimirDANFEPDF(NFE : TNFe = nil); override;
    procedure ImprimirDANFEResumidoPDF(NFE : TNFe = nil);override;
  published
  end ;

  { TACBrNFeDANFCeFortesFr }

  TACBrNFeDANFCeFortesFr = class(TForm)
    lFonteTributos: TRLLabel;
    rlVenda: TRLReport;
    rlbRodape: TRLBand;
    RLDraw2: TRLDraw;
    lConsultaQRCode: TRLLabel;
    imgQRCode: TRLImage;
    pGap05: TRLPanel;
    lSistema: TRLLabel;
    lProtocolo: TRLLabel;
    pGap8: TRLPanel;
    rlsbDetItem: TRLSubDetail;
    rlbDetItem: TRLBand;
    mLinhaItem: TRLMemo;
    rlbDescItem: TRLBand;
    lTitDesconto: TRLLabel;
    lTitDescValLiq: TRLLabel;
    lDesconto: TRLLabel;
    lDescValLiq: TRLLabel;
    rlbOutroItem: TRLBand;
    lTitAcrescimo: TRLLabel;
    lTitOutroValLiq: TRLLabel;
    lOutro: TRLLabel;
    lOutroValLiq: TRLLabel;
    rlbGap: TRLBand;
    rlsbPagamentos: TRLSubDetail;
    rlbPagamento: TRLBand;
    lPagamento: TRLLabel;
    lMeioPagamento: TRLLabel;
    rlbTroco: TRLBand;
    lTitTroco: TRLLabel;
    lTroco: TRLLabel;
    rlbTotal: TRLBand;
    lTitTotal: TRLLabel;
    lTotal: TRLLabel;
    lQtdItens: TRLLabel;
    lQtdTotalItensVal: TRLLabel;
    lTitFormaPagto: TRLLabel;
    lTitValorPago: TRLLabel;
    RLDraw7: TRLDraw;
    rlbLei12741: TRLBand;
    RLDraw6: TRLDraw;
    lTitLei12741: TRLLabel;
    lTitLei12742: TRLLabel;
    lValLei12741: TRLLabel;
    rlbsCabecalho: TRLSubDetail;
    rlbMsgDANFe: TRLBand;
    lMsgDANFCe: TRLLabel;
    lMsgDANFCe1: TRLLabel;
    lMsgDANFCe2: TRLLabel;
    rlbDadosCliche: TRLBand;
    pLogoeCliche: TRLPanel;
    lRazaoSocial: TRLLabel;
    lEmitCNPJ_IE_IM: TRLLabel;
    lEndereco: TRLMemo;
    RLDraw1: TRLDraw;
    lNomeFantasia: TRLLabel;
    imgLogo: TRLImage;
    rlbLegenda: TRLBand;
    RLDraw4: TRLDraw;
    lCPF_CNPJ1: TRLLabel;
    RLDraw5: TRLDraw;
    rlbConsumidor: TRLBand;
    RLDraw10: TRLDraw;
    lTitConsumidor: TRLLabel;
    lEnderecoConsumidor: TRLMemo;
    lCPF_CNPJ_ID: TRLMemo;
    rlbMensagemFiscal: TRLBand;
    RLDraw12: TRLDraw;
    lMensagemFiscal: TRLLabel;
    lChaveDeAcesso: TRLLabel;
    lTitChaveAcesso: TRLLabel;
    lNumeroSerie: TRLLabel;
    lTitConsulteChave: TRLMemo;
    rlbMensagemContribuinte: TRLBand;
    lMensagemContribuinte: TRLLabel;
    RLDraw3: TRLDraw;
    lObservacoes: TRLMemo;
    RLHTMLFilter1: TRLHTMLFilter;
    RLPDFFilter1: TRLPDFFilter;
    lEmissaoVia: TRLLabel;
    RLDraw8: TRLDraw;
    lCancelada: TRLLabel;

    procedure FormDestroy(Sender: TObject);
    procedure pAsteriscoBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlbConsumidorBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlbMensagemFiscalBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlbsCabecalhoDataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
    procedure rlbLegendaBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlbPagamentoBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlbGapBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlbTotalBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlbTrocoBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlVendaBeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure FormCreate(Sender: TObject);
    procedure rlVendaDataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
    procedure rlbLei12741BeforePrint(Sender: TObject; var PrintIt: boolean);
    procedure rlsbDetItemDataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
    procedure rlsbPagamentosDataRecord(Sender: TObject; RecNo: integer;
      CopyNo: integer; var Eof: boolean; var RecordAction: TRLRecordAction);
    procedure rlbMensagemContribuinteBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure lSistemaBeforePrint(Sender: TObject; var Text: string;
      var PrintIt: Boolean);
    procedure rlbDetItemBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbDescItemBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbOutroItemBeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    fACBrNFeDANFCeFortes: TACBrNFeDANFCeFortes;
    fNumItem : Integer;
    fNumPagto: Integer;
    fTotalPagto : Currency;
    fNumObs  : Integer;
    fObsFisco: TStringList;
    fHeightDetItem: Integer;
    fResumido: Boolean;
    fFiltro: TACBrSATExtratoFiltro;

    procedure PintarQRCode(QRCodeData: String; APict: TPicture);
    function CompoemEnderecoCFe: String ;
    function CompoemCliche: String;
  public
    { Public declarations }
    property ACBrNFeDANFCeFortes : TACBrNFeDANFCeFortes read fACBrNFeDANFCeFortes ;
    property Resumido : Boolean read fResumido write fResumido;
    property Filtro         : TACBrSATExtratoFiltro read fFiltro write fFiltro default fiNenhum ;
  end ;

procedure Register;

implementation

uses StrUtils, math,
     ACBrDelphiZXingQRCode, ACBrNFe, ACBrValidador ;

{$ifdef FPC}
  {$R *.lfm}
{$else}
  {$R *.dfm}
{$ENDIF}

procedure Register;
begin
  RegisterComponents('ACBrNFe',[TACBrNFeDANFCeFortes]);
end;

{ TACBrNFeDANFCeFortesFr }

procedure TACBrNFeDANFCeFortesFr.FormCreate(Sender: TObject);
begin
  fNumItem  := 0 ;
  fNumPagto := 0 ;
  fTotalPagto := 0;
  fNumObs   := 0 ;
  fObsFisco := TStringList.Create ;
  fHeightDetItem := rlbDetItem.Height;

  fACBrNFeDANFCeFortes          := TACBrNFeDANFCeFortes(Owner) ;  // Link para o Pai

  //Pega as marges que for defina na classe pai.
  rlVenda.Margins.LeftMargin    := fACBrNFeDANFCeFortes.MargemEsquerda ;
  rlVenda.Margins.RightMargin   := fACBrNFeDANFCeFortes.MargemDireita ;
  rlVenda.Margins.TopMargin     := fACBrNFeDANFCeFortes.MargemSuperior ;
  rlVenda.Margins.BottomMargin  := fACBrNFeDANFCeFortes.MargemInferior ;
end;

procedure TACBrNFeDANFCeFortesFr.rlVendaDataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
  Eof := (RecNo > 1);
  RecordAction := raUseIt;
end;

procedure TACBrNFeDANFCeFortesFr.rlbMensagemFiscalBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  with ACBrNFeDANFCeFortes.FpNFe do
  begin
    PrintIt := True ;

    if Ide.tpAmb = taHomologacao then
    begin
      lMensagemFiscal.Caption := ACBrStr( 'EMITIDA EM AMBIENTE DE HOMOLOGA��O - SEM VALOR FISCAL');
    end
    else
    begin
      if Ide.tpEmis <> teNormal then
        lMensagemFiscal.Caption := ACBrStr('EMITIDA EM CONTING�NCIA')
      else
        lMensagemFiscal.Caption := ACBrStr('�REA DE MENSAGEM FISCAL');
    end;

    lNumeroSerie.Caption := ACBrStr(
      'N�mero ' + IntToStrZero(Ide.nNF, 9) + ' - ' +
      'S�rie ' + IntToStrZero(Ide.serie, 3)
    );

    lEmissaoVia.Caption := ACBrStr(
      'Emiss�o ' + DateTimeToStr(Ide.dEmi) + ' - ' +
      'Via ' + IfThen(fACBrNFeDANFCeFortes.ViaConsumidor, 'Consumidor', 'Estabelecimento')
    );

    lTitConsulteChave.Lines.Text := ACBrStr('Consulte pela Chave de Acesso em '+
       TACBrNFe(fACBrNFeDANFCeFortes.ACBrNFe).GetURLConsultaNFCe(Ide.cUF,Ide.tpAmb));

    lChaveDeAcesso.Caption := FormatarChaveAcesso(OnlyNumber(infNFe.ID));

    if procNFe.cStat = 0 then
    begin
      lChaveDeAcesso.Caption    := ACBrStr('NFC-E N�O ENVIADA PARA SEFAZ');
      lChaveDeAcesso.Font.Color := clRed;
    end;

    if ACBrNFeDANFCeFortes.NFeCancelada then
      lCancelada.Caption := ACBrStr('NF-e CANCELADA');
  end;
end;

procedure TACBrNFeDANFCeFortesFr.rlbOutroItemBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  with ACBrNFeDANFCeFortes.FpNFe.Det.Items[fNumItem] do
  begin
    PrintIt := (not Resumido) and (Prod.vOutro > 0) and (ACBrNFeDANFCeFortes.ImprimirDetalhamentoEspecifico);

    if PrintIt then
    begin
      lOutro.Caption       := FormatFloatBr(Prod.vOutro,'+#,###,##0.00');
      lOutroValLiq.Caption := FormatFloatBr(Prod.vProd+Prod.vOutro-Prod.vDesc,'#,###,##0.00');
    end;
  end;
end;

procedure TACBrNFeDANFCeFortesFr.rlsbDetItemDataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
  fNumItem := RecNo - 1 ;

  Eof := (RecNo > ACBrNFeDANFCeFortes.FpNFe.Det.Count) ;
  RecordAction := raUseIt ;
end;

procedure TACBrNFeDANFCeFortesFr.rlsbPagamentosDataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
  fNumPagto := RecNo - 1 ;

  Eof := (RecNo > ACBrNFeDANFCeFortes.FpNFe.pag.Count) ;
  RecordAction := raUseIt ;
end;

procedure TACBrNFeDANFCeFortesFr.PintarQRCode(QRCodeData: String; APict: TPicture);
var
  QRCode: TDelphiZXingQRCode;
  QRCodeBitmap: TBitmap;
  Row, Column: Integer;
begin
  QRCode       := TDelphiZXingQRCode.Create;
  QRCodeBitmap := TBitmap.Create;
  try
    QRCode.Data      := QRCodeData;
    QRCode.Encoding  := qrUTF8NoBOM;
    QRCode.QuietZone := 1;

    //QRCodeBitmap.SetSize(QRCode.Rows, QRCode.Columns);
    QRCodeBitmap.Width  := QRCode.Columns;
    QRCodeBitmap.Height := QRCode.Rows;

    for Row := 0 to QRCode.Rows - 1 do
    begin
      for Column := 0 to QRCode.Columns - 1 do
      begin
        if (QRCode.IsBlack[Row, Column]) then
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clBlack
        else
          QRCodeBitmap.Canvas.Pixels[Column, Row] := clWhite;
      end;
    end;

    APict.Assign(QRCodeBitmap);
  finally
    QRCode.Free;
    QRCodeBitmap.Free;
  end;
end;

function TACBrNFeDANFCeFortesFr.CompoemEnderecoCFe: String;
var
  Endereco, CEP: String;
begin
  with ACBrNFeDANFCeFortes.FpNFe do
  begin
    // Definindo dados do Cliche //
    Endereco := Emit.EnderEmit.xLgr ;
    if (Emit.EnderEmit.nro <> '') then
      Endereco := Endereco + ', '+Emit.EnderEmit.nro;
    if (Emit.EnderEmit.xCpl <> '') then
      Endereco := Endereco + ' - '+Emit.EnderEmit.xCpl;
    if (Emit.EnderEmit.xBairro <> '') then
      Endereco := Endereco + ' - '+Emit.EnderEmit.xBairro;
    if (Emit.EnderEmit.xMun <> '') then
      Endereco := Endereco + ' - '+Emit.EnderEmit.xMun;
    if (Emit.EnderEmit.UF <> '') then
      Endereco := Endereco + ' - '+Emit.EnderEmit.UF;
    if (Emit.EnderEmit.CEP <> 0) then
    begin
      CEP := IntToStr(Emit.EnderEmit.CEP);
      Endereco := Endereco + ' - '+copy(CEP,1,5)+'-'+copy(CEP,6,3);
    end;
    if (Emit.EnderEmit.fone <> '') then
      Endereco := Endereco + ' - FONE: '+Emit.EnderEmit.fone;
  end;

  Result := Endereco;
end;

function TACBrNFeDANFCeFortesFr.CompoemCliche: String;
var
  CNPJ_IE_IM: String;
begin
  with ACBrNFeDANFCeFortes.FpNFe do
  begin
    CNPJ_IE_IM := 'CNPJ:'+Emit.CNPJCPF ;
    if (Emit.IE <> '') then
      CNPJ_IE_IM := CNPJ_IE_IM + ' IE:'+Emit.IE;
    if (Emit.IM <> '') then
      CNPJ_IE_IM := CNPJ_IE_IM + ' IM:'+Emit.IM;
  end;

  Result := CNPJ_IE_IM;
end;

procedure TACBrNFeDANFCeFortesFr.rlVendaBeforePrint(Sender: TObject;
  var PrintIt: boolean);
var
  qrcode: String;
  TotalPaginaPixel: Integer;
  LogoStream: TStringStream;
begin
  fNumItem  := 0;
  fNumPagto := 0;
  fTotalPagto := 0;
  fNumObs   := 0;
  fObsFisco.Clear;

  imgLogo.Height:=100;

  with ACBrNFeDANFCeFortes.FpNFe do
  begin
    lNomeFantasia.Caption   := Emit.xFant ;
    lRazaoSocial.Caption    := Emit.xNome ;
    lEmitCNPJ_IE_IM.Caption := CompoemCliche;
    lEndereco.Lines.Text    := CompoemEnderecoCFe;

    if ACBrNFeDANFCeFortes.Logo <> '' then
    begin
      if FileExists (ACBrNFeDANFCeFortes.Logo) then
        imgLogo.Picture.LoadFromFile(ACBrNFeDANFCeFortes.Logo)
      else
      begin
        LogoStream := TStringStream.Create(ACBrNFeDANFCeFortes.Logo);
        try
          imgLogo.Picture.Bitmap.LoadFromStream(LogoStream);
        finally
          LogoStream.Free;
        end;
      end;
    end;

    // QRCode  //
    if EstaVazio(Trim(infNFeSupl.qrCode)) then
      qrcode := TACBrNFe(ACBrNFeDANFCeFortes.ACBrNFe).GetURLQRCode( ide.cUF, ide.tpAmb,
                                     OnlyNumber(InfNFe.ID),  //correcao para pegar somente numeros, estava indo junto o NFE
                                     ifthen(Dest.idEstrangeiro <> '',Dest.idEstrangeiro, OnlyNumber(Dest.CNPJCPF)),
                                     ide.dEmi,
                                     Total.ICMSTot.vNF, Total.ICMSTot.vICMS,
                                     signature.DigestValue)
    else
      qrcode := infNFeSupl.qrCode;

    PintarQRCode( qrcode, imgQRCode.Picture );

    lProtocolo.Caption := ACBrStr('Protocolo de Autoriza��o: '+procNFe.nProt+
                           ' '+ifthen(procNFe.dhRecbto<>0,DateTimeToStr(procNFe.dhRecbto),''));

  end;


  // Calculando o tamanho da Pagina em Pixels //
  TotalPaginaPixel := rlbsCabecalho.Height +
                      rlbRodape.Height +
                      rlbLegenda.Height +
                      rlbPagamento.Height +
                      rlbLei12741.Height +
                      rlbMensagemContribuinte.Height +
                      rlbMensagemFiscal.Height +
                      rlbConsumidor.Height +
                      rlsbDetItem.Height +
                      Trunc(rlbDetItem.Height * ACBrNFeDANFCeFortes.FpNFe.Det.Count) ;
  // Pixel para Milimitros //
  rlVenda.PageSetup.PaperHeight := max( 100, 10+Trunc( TotalPaginaPixel / 3.75 ));
end;

procedure TACBrNFeDANFCeFortesFr.rlbDescItemBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  with ACBrNFeDANFCeFortes.FpNFe.Det.Items[fNumItem] do
  begin
    PrintIt := (not Resumido) and (Prod.vDesc > 0) and (ACBrNFeDANFCeFortes.ImprimirDescPorc) ;

    if PrintIt then
    begin
      lDesconto.Caption   := FormatFloatBr(Prod.vDesc,'-#,###,##0.00');
      if (Prod.vOutro > 0) then
      begin
        lTitDescValLiq.Visible := False;
        lDescValLiq.Visible := False;
        rlbDescItem.Height := 12;
      end
      else
      begin
        rlbDescItem.Height := 24;
        lTitDescValLiq.Visible := True;
        lDescValLiq.Visible := True;
        lDescValLiq.Caption := FormatFloatBr(Prod.vProd+Prod.vOutro-Prod.vDesc,'#,###,##0.00');
      end;
    end;
  end;
end;

procedure TACBrNFeDANFCeFortesFr.rlbDetItemBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
var
  LinhaTotal : string;
begin
  PrintIt := not Resumido;
  if not PrintIt then exit;

  mLinhaItem.Lines.Clear ;
  with ACBrNFeDANFCeFortes.FpNFe.Det.Items[fNumItem] do
  begin
    mLinhaItem.Lines.Add(IntToStrZero(Prod.nItem,3) + ' ' +
                             ACBrNFeDANFCeFortes.ManterCodigo( Prod.cEAN , Prod.cProd ) + ' ' +
                             Trim(Prod.xProd));

    //Centraliza os valores. A fonte dos itens foi mudada para Courier New, Pois esta o espa�o tem o mesmo tamanho dos demais caractere.
    LinhaTotal  := PadLeft( ACBrNFeDANFCeFortes.FormatQuantidade(Prod.qCom), 12) +
                   PadCenter(Trim(Prod.uCom), 5) + ' X ' +
                   PadLeft(ACBrNFeDANFCeFortes.FormatValorUnitario(Prod.vUnCom), 12) +
                   PadLeft(FormatFloatBr(Prod.vProd, '###,###,##0.00'), 12);

    mLinhaItem.Lines.Add(LinhaTotal);
  end;
end;

procedure TACBrNFeDANFCeFortesFr.rlbPagamentoBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  with ACBrNFeDANFCeFortes.FpNFe.pag.Items[fNumPagto] do
  begin
    lMeioPagamento.Caption  := ACBrStr(FormaPagamentoToDescricao(tPag));
    lPagamento.Caption      := FormatFloatBr(vPag,'#,###,##0.00');
    fTotalPagto             := fTotalPagto + vPag;
  end;
end;

procedure TACBrNFeDANFCeFortesFr.rlbGapBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  PrintIt := not Resumido;
end;

procedure TACBrNFeDANFCeFortesFr.rlbLegendaBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  PrintIt := not Resumido;
end;

procedure TACBrNFeDANFCeFortesFr.FormDestroy(Sender: TObject);
begin
  fObsFisco.Free;
end;

procedure TACBrNFeDANFCeFortesFr.lSistemaBeforePrint(Sender: TObject;
  var Text: string; var PrintIt: Boolean);
begin
  PrintIt := True;
  if trim(fACBrNFeDANFCeFortes.Sistema) <> '' then
    Text := fACBrNFeDANFCeFortes.Sistema ;
end;

procedure TACBrNFeDANFCeFortesFr.pAsteriscoBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  PrintIt := not Resumido;
end;

procedure TACBrNFeDANFCeFortesFr.rlbConsumidorBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  with ACBrNFeDANFCeFortes.FpNFe do
  begin
    if (Dest.idEstrangeiro = '') and
       (Dest.CNPJCPF = '') then
     begin
        lCPF_CNPJ_ID.Lines.Text := ACBrStr('CONSUMIDOR N�O IDENTIFICADO');
     end
    else if Dest.idEstrangeiro <> '' then
     begin
       lCPF_CNPJ_ID.Lines.Text  := 'CNPJ/CPF/ID Estrangeiro -'+Dest.idEstrangeiro+' '+Dest.xNome;
     end
    else
     begin
       if Length(trim(Dest.CNPJCPF)) > 11 then
          lCPF_CNPJ_ID.Lines.Text  := 'CNPJ/CPF/ID Estrangeiro -'+FormatarCNPJ(Dest.CNPJCPF)
       else
          lCPF_CNPJ_ID.Lines.Text  := 'CNPJ/CPF/ID Estrangeiro -'+FormatarCPF(Dest.CNPJCPF);

       lCPF_CNPJ_ID.Lines.Text  := lCPF_CNPJ_ID.Caption+' '+Dest.xNome;
     end;
     lEnderecoConsumidor.Lines.Text := Trim(Dest.EnderDest.xLgr)+' '+
                                       Trim(Dest.EnderDest.nro)+' '+
                                       Trim(Dest.EnderDest.xCpl)+' '+
                                       Trim(Dest.EnderDest.xBairro)+' '+
                                       Trim(Dest.EnderDest.xMun);
  end;
end;

procedure TACBrNFeDANFCeFortesFr.rlbLei12741BeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  with ACBrNFeDANFCeFortes.FpNFe do
  begin
    PrintIt := (Total.ICMSTot.vTotTrib > 0);

    if PrintIt then
      lValLei12741.Caption := FormatFloatBr(Total.ICMSTot.vTotTrib, '#,###,##0.00');
  end;

  if PrintIt then
    lFonteTributos.Caption := ACBrNFeDANFCeFortes.FonteTributos;
end;

procedure TACBrNFeDANFCeFortesFr.rlbMensagemContribuinteBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin

  Printit := False;

  with ACBrNFeDANFCeFortes.FpNFe.InfAdic do
  begin
    if infCpl <> '' then
    begin
      PrintIt := True ;

      lObservacoes.Lines.Add( StringReplace( infCpl, ';', #13, [rfReplaceAll] ) );
    end;
  end;
end;

procedure TACBrNFeDANFCeFortesFr.rlbsCabecalhoDataRecord(Sender: TObject;
  RecNo: integer; CopyNo: integer; var Eof: boolean;
  var RecordAction: TRLRecordAction);
begin
  Eof := (RecNo > 1);
  RecordAction := raUseIt;
end;

procedure TACBrNFeDANFCeFortesFr.rlbTotalBeforePrint(Sender: TObject;
  var PrintIt: boolean);
begin
  lQtdTotalItensVal.Caption := IntToStrZero(ACBrNFeDANFCeFortes.FpNFe.Det.Count,3);
  lTotal.Caption := FormatFloatBr(ACBrNFeDANFCeFortes.FpNFe.Total.ICMSTot.vNF,'#,###,##0.00');
end;

procedure TACBrNFeDANFCeFortesFr.rlbTrocoBeforePrint(Sender: TObject;
  var PrintIt: boolean);
var
  Troco : Currency ;
begin
  Troco   := fACBrNFeDANFCeFortes.vTroco;
  PrintIt := (Troco> 0);

  if PrintIt then
    lTroco.Caption := FormatFloatBr(fACBrNFeDANFCeFortes.vTroco,'#,###,##0.00');;
end;

{ TACBrNFeDANFCeFortes }

constructor TACBrNFeDANFCeFortes.Create(AOwner: TComponent);
begin
  inherited create( AOwner );

end;

destructor TACBrNFeDANFCeFortes.Destroy;
begin

  inherited Destroy ;
end;

procedure TACBrNFeDANFCeFortes.ImprimirDANFE(NFE: TNFe);
begin
  if NFe = nil then
   begin
     if not Assigned(ACBrNFe) then
        raise Exception.Create('Componente ACBrNFe n�o atribu�do');

     FpNFe := TACBrNFe(ACBrNFe).NotasFiscais.Items[0].NFe;
   end
  else
    FpNFe := NFE;

  Imprimir(False);
end;

procedure TACBrNFeDANFCeFortes.ImprimirDANFEResumido(NFE: TNFe);
begin
  if NFe = nil then
   begin
     if not Assigned(ACBrNFe) then
        raise Exception.Create('Componente ACBrNFe n�o atribu��do');

     FpNFe := TACBrNFe(ACBrNFe).NotasFiscais.Items[0].NFe;
   end
  else
    FpNFe := NFE;

  Imprimir(True);
end;

procedure TACBrNFeDANFCeFortes.ImprimirDANFEPDF(NFE: TNFe);
begin
//  inherited ImprimirDANFEPDF(NFE);
  if NFe = nil then
   begin
     if not Assigned(ACBrNFe) then
        raise Exception.Create('Componente ACBrNFe n�o atribu��do');

     FpNFe := TACBrNFe(ACBrNFe).NotasFiscais.Items[0].NFe;
   end
  else
    FpNFe := NFE;
  Imprimir(False, fiPDF);
end;

procedure TACBrNFeDANFCeFortes.ImprimirDANFEResumidoPDF(NFE: TNFe);
begin
  //  inherited ImprimirDANFEPDF(NFE);
    if NFe = nil then
     begin
       if not Assigned(ACBrNFe) then
          raise Exception.Create('Componente ACBrNFe n�o atribu��do');

       FpNFe := TACBrNFe(ACBrNFe).NotasFiscais.Items[0].NFe;
     end
    else
      FpNFe := NFE;

    Imprimir(True, fiPDF);
end;

procedure TACBrNFeDANFCeFortes.Imprimir(const DanfeResumido: Boolean;
  const AFiltro: TACBrSATExtratoFiltro);
var
  frACBrNFeDANFCeFortesFr: TACBrNFeDANFCeFortesFr;
  RLLayout: TRLReport;
  RLFiltro: TRLCustomSaveFilter;
begin
  frACBrNFeDANFCeFortesFr := TACBrNFeDANFCeFortesFr.Create(Self);
  try
    with frACBrNFeDANFCeFortesFr do
    begin
      Filtro := AFiltro;
      RLLayout := rlVenda;
      Resumido := DanfeResumido;

      RLPrinter.Copies := NumCopias ;

      if ACBrNFeDANFCeFortes.Impressora <> '' then
        RLPrinter.PrinterName := ACBrNFeDANFCeFortes.Impressora;

      RLLayout.PrintDialog := ACBrNFeDANFCeFortes.MostrarPreview;
      RLLayout.ShowProgress:= ACBrNFeDANFCeFortes.MostrarStatus;

      if Filtro = fiNenhum then
      begin
        if MostrarPreview then
          RLLayout.PreviewModal
        else
          RLLayout.Print;
      end
      else
      begin
        if RLLayout.Prepare then
        begin
          case Filtro of
            fiPDF  : RLFiltro := RLPDFFilter1;
            fiHTML : RLFiltro := RLHTMLFilter1;
          else
            exit ;
          end ;

          RLFiltro.ShowProgress := ACBrNFeDANFCeFortes.MostrarStatus;
          RLFiltro.FileName := ACBrNFeDANFCeFortes.PathPDF + OnlyNumber(ACBrNFeDANFCeFortes.FpNFe.infNFe.ID) + '-nfe.pdf';
          RLFiltro.FilterPages( RLLayout.Pages );
        end;
      end;
    end;
  finally
    frACBrNFeDANFCeFortesFr.Free ;
  end;
end;

{$ifdef FPC}
initialization
   {$I ACBrNFeDANFCeFortes.lrs}
{$endif}

end.
