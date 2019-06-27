{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                             }


{ Colaboradores nesse arquivo:                                                 }

{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }


{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }

{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }

{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }

{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }

{******************************************************************************}

{$I ACBr.inc}

unit ACBrNFeDANFeRLSimplificado;

interface

uses
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, Qt,
  {$ELSE}
  Graphics, Controls, Forms,
  {$ENDIF}
  RLReport, RLBarcode, ACBrNFeDANFeRL;

type

  { TfrlDANFeRLSimplificado }

  TfrlDANFeRLSimplificado = class(TfrlDANFeRL)
    RLb02_Emitente: TRLBand;
    RLb03_DadosGerais: TRLBand;
    RLb04_Destinatario: TRLBand;
    RLb05c_Lin_Itens: TRLBand;
    RLiLogo: TRLImage;
    RLLabel1: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel9: TRLLabel;
    RLlChave: TRLLabel;
    RLlDescricao: TRLLabel;
    RLlEmissao: TRLLabel;
    RLlEntradaSaida: TRLLabel;
    RLlMsgTipoEmissao: TRLLabel;
    RLlProtocolo: TRLLabel;
    RLlTipoEmissao: TRLLabel;
    RLmDestinatario: TRLMemo;
    RLmEmitente: TRLMemo;
    RLShape102: TRLDraw;
    RLShape68: TRLDraw;
    rlb01_Chave: TRLBand;
    RLBarcode1: TRLBarcode;
    RLLabel17: TRLLabel;
    lblNumero: TRLLabel;
    subItens: TRLSubDetail;
    rlb05a_Cab_Itens: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel3: TRLLabel;
    rlb05b_Desc_Itens: TRLBand;
    rlmProdutoCodigo: TRLLabel;
    rlmProdutoDescricao: TRLLabel;
    rlmProdutoUnidade: TRLLabel;
    rlmProdutoQTDE: TRLLabel;
    rlmProdutoValor: TRLLabel;
    rlmProdutoTotal: TRLLabel;
    rlmProdutoItem: TRLLabel;
    rlb06a_Totais: TRLBand;
    rlmPagDesc: TRLMemo;
    rlmPagValor: TRLMemo;
    rlb06b_Tributos: TRLBand;
    rllTributos: TRLLabel;
    procedure RLb02_EmitenteBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLb03_DadosGeraisBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLb04_DestinatarioBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLb06a_TotaisBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLb06b_TributosBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLNFeBeforePrint(Sender: TObject; var PrintReport: Boolean);
    procedure rlb01_ChaveBeforePrint(Sender: TObject; var PrintBand: Boolean);
    procedure subItensDataRecord(Sender: TObject; RecNo, CopyNo: Integer; var EOF: Boolean; var RecordAction: TRLRecordAction);
    procedure rlb05b_Desc_ItensBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLNFeDataRecord(Sender: TObject; RecNo, CopyNo: Integer; var EOF: Boolean; var RecordAction: TRLRecordAction);
  private
    FNumItem: Integer;
    FTotalPages: Integer;
  public
    procedure ProtocoloNFE(const sProtocolo: String);
  end;

implementation

uses
  StrUtils, DateUtils,
  ACBrUtil, ACBrValidador, ACBrDFeUtil,
  ACBrDFeReportFortes,
  pcnNFe, pcnConversao, pcnConversaoNFe;

{$IfNDef FPC}
  {$R *.dfm}
{$Else}
  {$R *.lfm}
{$ENDIF}

const
  _NUM_ITEMS_PAGE1 = 18;
  _NUM_ITEMS_OTHERPAGES = 50;

procedure TfrlDANFeRLSimplificado.RLNFeBeforePrint(Sender: TObject; var PrintReport: Boolean);
var
  nRestItens: Integer;
begin
  inherited;

  FTotalPages := 1;

  if (fpNFe.Det.Count > _NUM_ITEMS_PAGE1) then
  begin
    nRestItens := fpNFe.Det.Count - _NUM_ITEMS_PAGE1;
    if (nRestItens <= _NUM_ITEMS_OTHERPAGES) then
      Inc(FTotalPages)
    else
    begin
      Inc(FTotalPages, nRestItens div _NUM_ITEMS_OTHERPAGES);
      if ((nRestItens mod _NUM_ITEMS_OTHERPAGES) > 0) then
        Inc(FTotalPages);
    end;
  end;

  RLNFe.Title := 'NF-e: ' + FormatFloat('000,000,000', fpNFe.Ide.nNF);
  TDFeReportFortes.AjustarMargem(RLNFe, fpDANFe);
end;

procedure TfrlDANFeRLSimplificado.RLb02_EmitenteBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;

  if fpDANFe.ExpandeLogoMarca then
  begin
    rliLogo.top := 13;
    rliLogo.Left := 2;
    rliLogo.Height := 108;
    rliLogo.Width := 284;
    rliLogo.Stretch := True;
    rlmEmitente.Enabled := False;
  end;

  if not TDFeReportFortes.CarregarLogo(rliLogo, fpDANFe.Logo) then
  begin
    //TODO: implementar algum tratamento para logo vazio? Ex.: Veja: TfrlDANFeRLRetrato.InicializarDados
  end;

  if not fpDANFe.ExpandeLogoMarca then
  begin
    rlmEmitente.Enabled := True;
    rlmEmitente.Lines.Clear;

    with fpNFe.Emit do
    begin
      rlmEmitente.Lines.Add(fpDANFe.ManterNomeImpresso(XNome, XFant));
      with EnderEmit do
      begin
        rlmEmitente.Lines.Add(XLgr + IfThen(Nro = '0', '', ', ' + Nro) +
          IfThen(EstaVazio(XCpl), '', ', ' + XCpl) +
          IfThen(EstaVazio(XBairro), '', ', ' + XBairro) +
          ', ' + XMun + '/ ' + UF);
      end;

      rlmEmitente.Lines.Add('CNPJ: ' + FormatarCNPJouCPF(CNPJCPF) + ' IE: ' + IE);
    end;
  end;
end;

procedure TfrlDANFeRLSimplificado.RLb03_DadosGeraisBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  // Contingencia ********************************************************
  if fpNFe.Ide.tpEmis in [teContingencia, teFSDA] then
    rllTipoEmissao.Caption := 'CONTINGENCIA FS-DA';

  rllEntradaSaida.Caption := tpNFToStr(fpNFe.Ide.tpNF);

  lblNumero.Caption := ACBrStr('N�mero: ' + FormatFloat('000,000,000', fpNFe.Ide.nNF) +
    ' - S�rie: ' + FormatFloat('000', fpNFe.Ide.serie));

  rllEmissao.Caption := ACBrStr('Emiss�o: ' + FormatDateTimeBr(fpNFe.Ide.dEmi));
end;

procedure TfrlDANFeRLSimplificado.RLb04_DestinatarioBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;

  rlmDestinatario.Lines.Clear;
  with fpNFe.Dest do
  begin
    rlmDestinatario.Lines.Add(XNome);
    with EnderDest do
    begin
      rlmDestinatario.Lines.Add(XLgr + IfThen(Nro = '0', '', ', ' + Nro) +
        IfThen(EstaVazio(XCpl), '', ', ' + XCpl) +
        IfThen(EstaVazio(XBairro), '', ', ' + XBairro) +
        ', ' + XMun + '/ ' + UF);
    end;

    rlmDestinatario.Lines.Add(ACBrStr('CPF/CNPJ: ' + FormatarCNPJouCPF(CNPJCPF) + ' IE: ' + IE));
  end;

  rllMsgTipoEmissao.Visible := False;
  if (fpNFe.Ide.tpAmb = taHomologacao) then
  begin
    rllMsgTipoEmissao.Caption := ACBrStr('HOMOLOGA��O - SEM VALOR FISCAL');
    rllMsgTipoEmissao.Enabled := True;
    rllMsgTipoEmissao.Visible := True;
  end;

  if (fpNFe.procNFe.cStat > 0) then
  begin
    if (fpDANFe.Cancelada or (fpNFe.procNFe.cStat in [101, 151, 155])) then
    begin
      rllMsgTipoEmissao.Caption := 'NF-e CANCELADA';
      rllMsgTipoEmissao.Visible := True;
      rllMsgTipoEmissao.Enabled := True;
    end;

    if (fpNFe.procNFe.cStat = 110) then
    begin
      rllMsgTipoEmissao.Caption := 'NF-e DENEGADA';
      rllMsgTipoEmissao.Visible := True;
      rllMsgTipoEmissao.Enabled := True;
    end;

    if not (fpNFe.procNFe.cStat in [100, 101, 110, 151, 155]) then
    begin
      rllMsgTipoEmissao.Caption := fpNFe.procNFe.xMotivo;
      rllMsgTipoEmissao.Visible := True;
      rllMsgTipoEmissao.Enabled := True;
    end;
  end;

  case fpNFe.Ide.tpEmis of
    teContingencia:
    begin
      rllMsgTipoEmissao.Caption := ACBrStr('DANFE em Contingencia - impresso em decorrencia de problemas tecnicos');
      rllMsgTipoEmissao.Visible := True;
      rllMsgTipoEmissao.Enabled := True;
    end;

    teFSDA:
    begin
      rllMsgTipoEmissao.Caption := ACBrStr('DANFE em Contingencia - impresso em decorrencia de problemas tecnicos');
      rllMsgTipoEmissao.Visible := True;
      rllMsgTipoEmissao.Enabled := True;
    end;
  end;

  rllMsgTipoEmissao.Repaint;
end;

procedure TfrlDANFeRLSimplificado.RLb06a_TotaisBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  inherited;

  rlmPagDesc.Lines.Clear;
  rlmPagValor.Lines.Clear;
  rlmPagDesc.Lines.Add('Qtde Total de Itens');
  rlmPagValor.Lines.Add(IntToStr(fpNFe.Det.Count));
  rlmPagDesc.Lines.Add('Valor Total');
  rlmPagValor.Lines.Add(FormatFloatBr(fpNFe.Total.ICMSTot.vNF));
end;

procedure TfrlDANFeRLSimplificado.RLb06b_TributosBeforePrint(Sender: TObject; var PrintIt: Boolean);
var
  Perc: Double;
begin
  inherited;

  Perc := 0;
  if (fpNFe.Total.ICMSTot.vNF > 0) then
    Perc := (fpNFe.Total.ICMSTot.vTotTrib / fpNFe.Total.ICMSTot.vNF) * 100;

  rllTributos.Caption := ACBrStr('Valor aprox. dos tributos: ') +
    FormatFloatBr(fpNFe.Total.ICMSTot.vTotTrib) +
    '(' + FormatFloatBr(Perc) + '%)(Fonte: IBPT)';
end;

procedure TfrlDANFeRLSimplificado.ProtocoloNFE(const sProtocolo: String);
begin
  fpDANFe.Protocolo := sProtocolo;
end;

procedure TfrlDANFeRLSimplificado.rlb01_ChaveBeforePrint(Sender: TObject; var PrintBand: Boolean);
begin
  inherited;

  PrintBand := (RLNFe.PageNumber = 1);
  RLBarcode1.Caption := OnlyNumber(fpNFe.InfNFe.Id);
  rllChave.Caption := FormatarChaveAcesso(fpNFe.InfNFe.Id);

  // Normal **************************************************************
  if (fpNFe.Ide.tpEmis in [teNormal, teSCAN]) then
  begin
    if (fpNFe.procNFe.cStat = 100) then
      rllDescricao.Caption := ACBrStr('Protocolo de Autoriza��o');

    if (fpNFe.procNFe.cStat in [101, 151, 155]) then
      rllDescricao.Caption := ACBrStr('Protocolo de Homologa��o de Cancelamento');

    if (fpNFe.procNFe.cStat = 110) then
      rllDescricao.Caption := ACBrStr('Protocolo de Denega��o de Uso');
  end;

  if NaoEstaVazio(fpDANFe.Protocolo) then
    rllProtocolo.Caption := fpDANFe.Protocolo
  else
    rllProtocolo.Caption := fpNFe.procNFe.nProt + ' ' +
      IfThen(fpNFe.procNFe.dhRecbto <> 0, FormatDateTimeBr(fpNFe.procNFe.dhRecbto), '');
end;

procedure TfrlDANFeRLSimplificado.rlb05b_Desc_ItensBeforePrint(Sender: TObject; var PrintIt: Boolean);

  function ManterinfAdProd(sXProd: String; sinfAdProd: String): String;
  begin
    Result := sXProd;
    if NaoEstaVazio(sinfAdProd) then
      Result := Result + sLineBreak + sLineBreak + 'InfAd: ' + sinfAdProd;
  end;

begin
  inherited;

  with fpNFe.Det.Items[FNumItem] do
  begin
    rlmProdutoItem.Caption := FormatFloat('000', FNumItem + 1);
    rlmProdutoCodigo.Caption := fpDANFe.ManterCodigo(Prod.cEAN, Prod.CProd);
    rlmProdutoDescricao.Caption := ManterinfAdProd(Prod.XProd, infAdProd);
    rlmProdutoQTDE.Caption := fpDANFe.FormatarQuantidade(Prod.qCom);
    rlmProdutoValor.Caption := fpDANFe.FormatarValorUnitario(Prod.vUnCom);
    rlmProdutoUnidade.Caption := Prod.UCom;
    rlmProdutoTotal.Caption := FormatFloatBr(Prod.vProd);
  end;
end;

procedure TfrlDANFeRLSimplificado.RLNFeDataRecord(Sender: TObject; RecNo, CopyNo: Integer; var EOF: Boolean; var RecordAction: TRLRecordAction);
begin
  inherited;

  EOF := (RecNo > 1);
  RecordAction := raUseIt;
end;

procedure TfrlDANFeRLSimplificado.subItensDataRecord(Sender: TObject; RecNo, CopyNo: Integer; var EOF: Boolean; var RecordAction: TRLRecordAction);
begin
  inherited;

  FNumItem := RecNo - 1;
  EOF := (RecNo > fpNFe.Det.Count);
  RecordAction := raUseIt;
end;

end.
