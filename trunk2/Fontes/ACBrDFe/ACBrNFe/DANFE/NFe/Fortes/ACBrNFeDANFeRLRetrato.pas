{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                             }

{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }

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
unit ACBrNFeDANFeRLRetrato;

interface

uses
  SysUtils, Variants, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, Qt, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls,
  {$ENDIF}
  RLReport, RLFilters, RLPDFFilter, RLPrinters,
  {$IFDEF BORLAND}
  XMLIntf, XMLDoc,
    {$IF CompilerVersion > 22}
  Vcl.Imaging.jpeg,
    {$ELSE}
  jpeg,
    {$IFEND}
  {$ENDIF}
  ACBrNFeDANFeRL, pcnConversao, RLBarcode, StrUtils;

type
  TfrlDANFeRLRetrato = class(TfrlDANFeRL)
    rlbEmitente: TRLBand;
    rliEmitente: TRLDraw;
    RLDraw6: TRLDraw;
    rliChave: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    rllDANFE: TRLLabel;
    rllDocumento1: TRLLabel;
    rllDocumento2: TRLLabel;
    rllTipoEntrada: TRLLabel;
    rllTipoSaida: TRLLabel;
    rliTipoEntrada: TRLDraw;
    rllEntradaSaida: TRLLabel;
    rllNumNF1: TRLLabel;
    rllSERIE1: TRLLabel;
    rliChave2: TRLDraw;
    rliChave3: TRLDraw;
    rlbCodigoBarras: TRLBarcode;
    rlbCabecalhoItens: TRLBand;
    rlbDadosAdicionais: TRLBand;
    rlsRectProdutos: TRLDraw;
    lblDadosDoProduto: TRLLabel;
    RLDraw50: TRLDraw;
    RLLabel23: TRLLabel;
    RLDraw51: TRLDraw;
    rlsDivProd1: TRLDraw;
    rlsDivProd2: TRLDraw;
    rlsDivProd3: TRLDraw;
    rlsDivProd4: TRLDraw;
    rlsDivProd5: TRLDraw;
    rlsDivProd6: TRLDraw;
    rlsDivProd7: TRLDraw;
    rlsDivProd8: TRLDraw;
    rlsDivProd9: TRLDraw;
    rlsDivProd10: TRLDraw;
    rlsDivProd11: TRLDraw;
    rlsDivProd12: TRLDraw;
    rlsDivProd13: TRLDraw;
    RLDraw54: TRLDraw;
    rllChaveAcesso: TRLLabel;
    rllDadosVariaveis1a: TRLLabel;
    rllDadosVariaveis1b: TRLLabel;
    rllDadosVariaveis3_Descricao: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel77: TRLLabel;
    RLLabel78: TRLLabel;
    RLLabel82: TRLLabel;
    lblCST: TRLLabel;
    RLLabel84: TRLLabel;
    RLLabel85: TRLLabel;
    RLLabel86: TRLLabel;
    RLLabel87: TRLLabel;
    RLLabel88: TRLLabel;
    RLLabel89: TRLLabel;
    RLLabel90: TRLLabel;
    RLLabel91: TRLLabel;
    RLLabel92: TRLLabel;
    RLLabel93: TRLLabel;
    RLLabel94: TRLLabel;
    RLLabel95: TRLLabel;
    RLLabel96: TRLLabel;
    RLLabel97: TRLLabel;
    RLLabel98: TRLLabel;
    rlmEmitente: TRLMemo;
    rlmEndereco: TRLMemo;
    rllFone: TRLLabel;
    rliLogo: TRLImage;
    rllNatOperacao: TRLLabel;
    rllDadosVariaveis3: TRLLabel;
    rllInscricaoEstadual: TRLLabel;
    rllInscrEstSubst: TRLLabel;
    rllCNPJ: TRLLabel;
    rlmDadosAdicionais: TRLMemo;
    rllChave: TRLLabel;
    rllEmitente: TRLLabel;
    rlbCodigoBarrasFS: TRLBarcode;
    rllXmotivo: TRLLabel;
    rllDadosVariaveis1c: TRLLabel;
    rlbDestinatario: TRLBand;
    RLLabel18: TRLLabel;
    RLLabel32: TRLLabel;
    rllDestNome: TRLLabel;
    RLLabel35: TRLLabel;
    rllDestEndereco: TRLLabel;
    RLLabel39: TRLLabel;
    rllDestCidade: TRLLabel;
    RLLabel40: TRLLabel;
    rllDestFone: TRLLabel;
    RLLabel36: TRLLabel;
    rllDestBairro: TRLLabel;
    RLLabel41: TRLLabel;
    rllDestUF: TRLLabel;
    RLLabel33: TRLLabel;
    rllDestCNPJ: TRLLabel;
    RLLabel37: TRLLabel;
    rllDestCEP: TRLLabel;
    RLLabel42: TRLLabel;
    rllDestIE: TRLLabel;
    RLLabel34: TRLLabel;
    rllEmissao: TRLLabel;
    RLLabel38: TRLLabel;
    rllSaida: TRLLabel;
    RLLabel43: TRLLabel;
    rllHoraSaida: TRLLabel;
    RLDraw16: TRLDraw;
    RLDraw17: TRLDraw;
    RLDraw22: TRLDraw;
    RLDraw23: TRLDraw;
    RLDraw20: TRLDraw;
    RLDraw19: TRLDraw;
    RLDraw24: TRLDraw;
    RLDraw21: TRLDraw;
    RLDraw18: TRLDraw;
    RLDraw15: TRLDraw;
    rlbFatura: TRLBand;
    RLLabel19: TRLLabel;
    rllFatNum1: TRLLabel;
    rllFatNum5: TRLLabel;
    rllFatNum9: TRLLabel;
    rllFatData1: TRLLabel;
    rllFatData5: TRLLabel;
    rllFatData9: TRLLabel;
    rllFatValor1: TRLLabel;
    rllFatValor5: TRLLabel;
    rllFatValor9: TRLLabel;
    rllFatNum2: TRLLabel;
    rllFatNum6: TRLLabel;
    rllFatNum10: TRLLabel;
    rllFatData2: TRLLabel;
    rllFatData6: TRLLabel;
    rllFatData10: TRLLabel;
    rllFatValor2: TRLLabel;
    rllFatValor6: TRLLabel;
    rllFatValor10: TRLLabel;
    rllFatNum3: TRLLabel;
    rllFatNum7: TRLLabel;
    rllFatNum11: TRLLabel;
    rllFatData3: TRLLabel;
    rllFatData7: TRLLabel;
    rllFatData11: TRLLabel;
    rllFatValor3: TRLLabel;
    rllFatValor7: TRLLabel;
    rllFatValor11: TRLLabel;
    rllFatNum4: TRLLabel;
    rllFatNum8: TRLLabel;
    rllFatNum12: TRLLabel;
    rllFatData4: TRLLabel;
    rllFatData8: TRLLabel;
    rllFatData12: TRLLabel;
    rllFatValor4: TRLLabel;
    rllFatValor8: TRLLabel;
    rllFatValor12: TRLLabel;
    rliFatura1: TRLDraw;
    rliFatura2: TRLDraw;
    rliFatura3: TRLDraw;
    rliFatura: TRLDraw;
    rlbImposto: TRLBand;
    RLLabel20: TRLLabel;
    rllTituloBaseICMS: TRLLabel;
    rllBaseICMS: TRLLabel;
    RLLabel49: TRLLabel;
    rllValorFrete: TRLLabel;
    rllTituloValorICMS: TRLLabel;
    rllValorICMS: TRLLabel;
    RLLabel50: TRLLabel;
    rllValorSeguro: TRLLabel;
    RLLabel51: TRLLabel;
    rllDescontos: TRLLabel;
    rllTituloBaseICMSST: TRLLabel;
    rllBaseICMSST: TRLLabel;
    RLLabel52: TRLLabel;
    rllAcessorias: TRLLabel;
    rllTituloValorICMSST: TRLLabel;
    rllValorICMSST: TRLLabel;
    RLLabel53: TRLLabel;
    rllValorIPI: TRLLabel;
    RLLabel48: TRLLabel;
    rllTotalProdutos: TRLLabel;
    RLLabel54: TRLLabel;
    rllTotalNF: TRLLabel;
    RLDraw30: TRLDraw;
    rliDivImposto1: TRLDraw;
    RLDraw33: TRLDraw;
    RLDraw34: TRLDraw;
    RLDraw35: TRLDraw;
    rliDivImposto2: TRLDraw;
    RLDraw29: TRLDraw;
    rlbTransportadora: TRLBand;
    RLLabel21: TRLLabel;
    RLLabel55: TRLLabel;
    rllTransNome: TRLLabel;
    RLLabel63: TRLLabel;
    rllTransEndereco: TRLLabel;
    RLLabel67: TRLLabel;
    rllTransQTDE: TRLLabel;
    RLLabel68: TRLLabel;
    rllTransEspecie: TRLLabel;
    RLLabel69: TRLLabel;
    rllTransMarca: TRLLabel;
    RLLabel56: TRLLabel;
    RLLabel64: TRLLabel;
    rllTransCidade: TRLLabel;
    RLLabel70: TRLLabel;
    rllTransNumeracao: TRLLabel;
    rllTransModFrete: TRLLabel;
    RLLabel59: TRLLabel;
    rllTransCodigoANTT: TRLLabel;
    RLLabel60: TRLLabel;
    rllTransPlaca: TRLLabel;
    RLLabel71: TRLLabel;
    rllTransPesoBruto: TRLLabel;
    RLLabel61: TRLLabel;
    rllTransUFPlaca: TRLLabel;
    RLLabel65: TRLLabel;
    rllTransUF: TRLLabel;
    RLLabel62: TRLLabel;
    rllTransCNPJ: TRLLabel;
    RLLabel66: TRLLabel;
    rllTransIE: TRLLabel;
    RLLabel72: TRLLabel;
    rllTransPesoLiq: TRLLabel;
    RLDraw38: TRLDraw;
    RLDraw39: TRLDraw;
    RLDraw46: TRLDraw;
    RLDraw45: TRLDraw;
    RLDraw41: TRLDraw;
    RLDraw44: TRLDraw;
    RLDraw47: TRLDraw;
    RLDraw48: TRLDraw;
    RLDraw49: TRLDraw;
    RLDraw42: TRLDraw;
    RLDraw40: TRLDraw;
    RLLabel25: TRLLabel;
    RLLabel26: TRLLabel;
    rlbItens: TRLBand;
    rlbISSQN: TRLBand;
    RLLabel24: TRLLabel;
    RLLabel73: TRLLabel;
    RLLabel74: TRLLabel;
    RLLabel75: TRLLabel;
    RLLabel76: TRLLabel;
    RLDraw56: TRLDraw;
    RLDraw57: TRLDraw;
    RLDraw58: TRLDraw;
    RLDraw52: TRLDraw;
    LinhaDescricao: TRLDraw;
    LinhaNCM: TRLDraw;
    LinhaCST: TRLDraw;
    LinhaCFOP: TRLDraw;
    LinhaUnidade: TRLDraw;
    LinhaQuantidade: TRLDraw;
    LinhaValorUnitario: TRLDraw;
    LinhaValorTotal: TRLDraw;
    LinhaBaseICMS: TRLDraw;
    LinhaValorICMS: TRLDraw;
    LinhaValorIPI: TRLDraw;
    LinhaAliqICMS: TRLDraw;
    LinhaAliqIPI: TRLDraw;
    LinhaCodigo: TRLDraw;
    LinhaFinal: TRLDraw;
    rliMarcaDagua1: TRLImage;
    txtCodigo: TRLDBText;
    txtNCM: TRLDBText;
    txtCST: TRLDBText;
    txtCFOP: TRLDBText;
    txtUnidade: TRLDBText;
    txtQuantidade: TRLDBText;
    txtValorUnitario: TRLDBText;
    txtValorTotal: TRLDBText;
    txtBaseICMS: TRLDBText;
    txtValorICMS: TRLDBText;
    txtValorIPI: TRLDBText;
    txtAliqICMS: TRLDBText;
    txtAliqIPI: TRLDBText;
    rllPageNumber: TRLSystemInfo;
    rllLastPage: TRLSystemInfo;
    rlbAvisoContingencia: TRLBand;
    rllAvisoContingencia: TRLLabel;
    rlbContinuacaoInformacoesComplementares: TRLBand;
    RLLabel16: TRLLabel;
    rlmContinuacaoDadosAdicionais: TRLMemo;
    rllHomologacao: TRLLabel;
    rlmDadosAdicionaisAuxiliar: TRLMemo;
    rlmDescricao: TRLDBMemo;
    LinhaDCSuperior: TRLDraw;
    LinhaDCInferior: TRLDraw;
    LinhaDCEsquerda: TRLDraw;
    LinhaDCDireita: TRLDraw;
    rllCabFatura1: TRLLabel;
    rllCabFatura2: TRLLabel;
    rllCabFatura3: TRLLabel;
    RLDraw69: TRLDraw;
    rllISSQNValorServicos: TRLLabel;
    rllISSQNBaseCalculo: TRLLabel;
    rllISSQNValorISSQN: TRLLabel;
    rllISSQNInscricao: TRLLabel;
    rlbObsItem: TRLBand;
    LinhaFimItens: TRLDraw;
    LinhaFimObsItem: TRLDraw;
    LinhaInicioItem: TRLDraw;
    rlmObsItem: TRLMemo;
    LinhaObsItemEsquerda: TRLDraw;
    LinhaObsItemDireita: TRLDraw;
    RLDraw70: TRLDraw;
    RLDraw71: TRLDraw;
    rlmDescricaoProduto: TRLMemo;
    rlmCodProd: TRLMemo;
    rlmSiteEmail: TRLMemo;
    rlbDivisaoRecibo: TRLBand;
    rliDivisao: TRLDraw;
    rllUsuario: TRLLabel;
    rllSistema: TRLLabel;
    rllCabFatura4: TRLLabel;
    rllCabFatura5: TRLLabel;
    rllCabFatura6: TRLLabel;
    rllCabFatura7: TRLLabel;
    rllCabFatura8: TRLLabel;
    rllCabFatura9: TRLLabel;
    rllCabFatura10: TRLLabel;
    rllCabFatura11: TRLLabel;
    rllCabFatura12: TRLLabel;
    lblPercValorDesc: TRLLabel;
    RLLabel11: TRLLabel;
    RLDraw1: TRLDraw;
    txtValorDesconto: TRLDBText;
    RLDraw2: TRLDraw;
    rllContingencia: TRLLabel;
    RLDraw4: TRLDraw;
    rllFatNum13: TRLLabel;
    rllFatData13: TRLLabel;
    rllFatValor13: TRLLabel;
    rllFatNum14: TRLLabel;
    rllFatData14: TRLLabel;
    rllFatValor14: TRLLabel;
    rllFatNum15: TRLLabel;
    rllFatData15: TRLLabel;
    rllFatValor15: TRLLabel;
    rllFatNum16: TRLLabel;
    rllFatData16: TRLLabel;
    rllFatValor16: TRLLabel;
    rllFatNum17: TRLLabel;
    rllFatData17: TRLLabel;
    rllFatValor17: TRLLabel;
    rllFatNum18: TRLLabel;
    rllFatData18: TRLLabel;
    rllFatValor18: TRLLabel;
    rllFatNum19: TRLLabel;
    rllFatData19: TRLLabel;
    rllFatValor19: TRLLabel;
    rllFatNum20: TRLLabel;
    rllFatData20: TRLLabel;
    rllFatValor20: TRLLabel;
    rllFatNum21: TRLLabel;
    rllFatData21: TRLLabel;
    rllFatValor21: TRLLabel;
    rllFatNum22: TRLLabel;
    rllFatData22: TRLLabel;
    rllFatValor22: TRLLabel;
    rllFatNum23: TRLLabel;
    rllFatData23: TRLLabel;
    rllFatValor23: TRLLabel;
    rllFatNum24: TRLLabel;
    rllFatData24: TRLLabel;
    rllFatValor24: TRLLabel;
    rllFatNum25: TRLLabel;
    rllFatData25: TRLLabel;
    rllFatValor25: TRLLabel;
    rllFatNum26: TRLLabel;
    rllFatData26: TRLLabel;
    rllFatValor26: TRLLabel;
    rllFatNum27: TRLLabel;
    rllFatData27: TRLLabel;
    rllFatValor27: TRLLabel;
    rllFatNum28: TRLLabel;
    rllFatData28: TRLLabel;
    rllFatValor28: TRLLabel;
    rllFatNum29: TRLLabel;
    rllFatData29: TRLLabel;
    rllFatValor29: TRLLabel;
    rllFatNum30: TRLLabel;
    rllFatData30: TRLLabel;
    rllFatValor30: TRLLabel;
    rllFatNum31: TRLLabel;
    rllFatData31: TRLLabel;
    rllFatValor31: TRLLabel;
    rllFatNum32: TRLLabel;
    rllFatData32: TRLLabel;
    rllFatValor32: TRLLabel;
    rllFatNum33: TRLLabel;
    rllFatData33: TRLLabel;
    rllFatValor33: TRLLabel;
    rllFatNum34: TRLLabel;
    rllFatData34: TRLLabel;
    rllFatValor34: TRLLabel;
    rllFatNum35: TRLLabel;
    rllFatData35: TRLLabel;
    rllFatValor35: TRLLabel;
    rllFatNum36: TRLLabel;
    rllFatData36: TRLLabel;
    rllFatValor36: TRLLabel;
    rllFatNum37: TRLLabel;
    rllFatData37: TRLLabel;
    rllFatValor37: TRLLabel;
    rllFatNum38: TRLLabel;
    rllFatData38: TRLLabel;
    rllFatValor38: TRLLabel;
    rllFatNum39: TRLLabel;
    rllFatData39: TRLLabel;
    rllFatValor39: TRLLabel;
    rllFatNum40: TRLLabel;
    rllFatData40: TRLLabel;
    rllFatValor40: TRLLabel;
    rllFatNum41: TRLLabel;
    rllFatData41: TRLLabel;
    rllFatValor41: TRLLabel;
    rllFatNum42: TRLLabel;
    rllFatData42: TRLLabel;
    rllFatValor42: TRLLabel;
    rllFatNum43: TRLLabel;
    rllFatData43: TRLLabel;
    rllFatValor43: TRLLabel;
    rllFatNum44: TRLLabel;
    rllFatData44: TRLLabel;
    rllFatValor44: TRLLabel;
    rllFatNum45: TRLLabel;
    rllFatData45: TRLLabel;
    rllFatValor45: TRLLabel;
    rllFatNum46: TRLLabel;
    rllFatData46: TRLLabel;
    rllFatValor46: TRLLabel;
    rllFatNum47: TRLLabel;
    rllFatData47: TRLLabel;
    rllFatValor47: TRLLabel;
    rllFatNum48: TRLLabel;
    rllFatData48: TRLLabel;
    rllFatValor48: TRLLabel;
    rllFatNum49: TRLLabel;
    rllFatData49: TRLLabel;
    rllFatValor49: TRLLabel;
    rllFatNum50: TRLLabel;
    rllFatData50: TRLLabel;
    rllFatValor50: TRLLabel;
    rllFatNum51: TRLLabel;
    rllFatData51: TRLLabel;
    rllFatValor51: TRLLabel;
    rllFatNum52: TRLLabel;
    rllFatData52: TRLLabel;
    rllFatValor52: TRLLabel;
    rllFatNum53: TRLLabel;
    rllFatData53: TRLLabel;
    rllFatValor53: TRLLabel;
    rllFatNum54: TRLLabel;
    rllFatData54: TRLLabel;
    rllFatValor54: TRLLabel;
    rllFatNum55: TRLLabel;
    rllFatData55: TRLLabel;
    rllFatValor55: TRLLabel;
    rllFatNum56: TRLLabel;
    rllFatData56: TRLLabel;
    rllFatValor56: TRLLabel;
    rllFatNum57: TRLLabel;
    rllFatData57: TRLLabel;
    rllFatValor57: TRLLabel;
    rllFatNum58: TRLLabel;
    rllFatData58: TRLLabel;
    rllFatValor58: TRLLabel;
    rllFatNum59: TRLLabel;
    rllFatData59: TRLLabel;
    rllFatValor59: TRLLabel;
    rllFatNum60: TRLLabel;
    rllFatData60: TRLLabel;
    rllFatValor60: TRLLabel;
    RLLabel12: TRLLabel;
    RLDraw3: TRLDraw;
    RLDraw5: TRLDraw;
    rliDivImposto3: TRLDraw;
    rliDivImposto4: TRLDraw;
    rliDivImposto5: TRLDraw;
    rllTituloTotalTributos: TRLLabel;
    rllTotalTributos: TRLLabel;
    rlbReciboHeader: TRLBand;
    rliCanhoto: TRLDraw;
    rliCanhoto1: TRLDraw;
    rliCanhoto2: TRLDraw;
    rllRecebemosDe: TRLLabel;
    rllDataRecebimento: TRLLabel;
    rllIdentificacao: TRLLabel;
    rliCanhoto3: TRLDraw;
    rllNFe: TRLLabel;
    rllNumNF0: TRLLabel;
    rllSERIE0: TRLLabel;
    rllResumo: TRLLabel;
    procedure RLNFeBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbEmitenteBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbItensAfterPrint(Sender: TObject);
    procedure rlbDadosAdicionaisBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbItensBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure rlbEmitenteAfterPrint(Sender: TObject);
    procedure rlbCabecalhoItensBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
  private
    FRecebemoDe: String;
    procedure InitDados;
    procedure Header;
    procedure Emitente;
    procedure Destinatario;
    procedure EnderecoRetirada;
    procedure EnderecoEntrega;
    procedure Imposto;
    procedure Transporte;
    procedure DadosAdicionais;
    procedure Observacoes;
    procedure Itens;
    procedure ISSQN;
    procedure AddFatura;
    procedure ConfigureDataSource;
    function ManterVeiculos(inItem: integer): String;
    function ManterMedicamentos(inItem: integer): String;
    Function ManterArma( inItem:  integer  ) : String;
    Function ManterCombustivel( inItem:  integer  ) : String;
    function ManterDesPro(dvDesc, dvProd: Double): Double;
    function ManterXpod(sXProd: String; inItem: Integer): String;
  public

  end;

implementation

uses DateUtils,
  ACBrNFeDANFeRLClass, ACBrDFeUtil, ACBrValidador, ACBrUtil,
  pcnNFe, pcnConversaoNFe;

{$IFnDEF FPC}
  {$R *.dfm}
{$ELSE}
  {$R *.lfm}
{$ENDIF}

procedure TfrlDANFeRLRetrato.RLNFeBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  q := 0;

  ConfigureVariavies(tiRetrato);

  with RLNFe.Margins do
  begin
    TopMargin := FMargemSuperior * 10;
    BottomMargin := FMargemInferior * 10;
    LeftMargin := FMargemEsquerda * 10;
    RightMargin := FMargemDireita * 10;
  end;

  ConfigureDataSource;
  InitDados;

  //  Removido para que o quadro Fatura seja mostrado mesmo a vista
  //  if FNFe.Cobr.Dup.Count > 0 then
  //    rlbFatura.Visible := True
  //  else
  //    rlbFatura.Visible := False;

  RLNFe.Title := Copy(FNFe.InfNFe.Id, 4, 44);
  if FNumCopias > 0 then
    RLPrinters.RLPrinter.Copies := FNumCopias
  else
    RLPrinters.RLPrinter.Copies := 1;
end;

procedure TfrlDANFeRLRetrato.rlbEmitenteBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  rlbCodigoBarras.BringToFront;
  if RLNFe.PageNumber > 1 then
  begin
    rlbISSQN.Visible := False;
    rlbDadosAdicionais.Visible := False;
    rlbReciboHeader.Visible := False;
    rlbReciboHeader.Height := 66;
    rlbDivisaoRecibo.Visible := False;
    if iQuantItens > q then
    begin
      rlbCabecalhoItens.Visible := True;
      lblDadosDoProduto.Caption := ACBrStr('CONTINUA��O DOS DADOS DO PRODUTO / SERVI�OS');
      rliMarcaDagua1.Top := 300;
    end
    else
      rlbCabecalhoItens.Visible := False;
  end;

end;

procedure TfrlDANFeRLRetrato.InitDados;
var
  i, b, h, iAlturaCanhoto: integer;
begin
  // Carrega logomarca
  if (FLogo <> '') and FileExists(FLogo) then
    rliLogo.Picture.LoadFromFile(FLogo);

  if (FMarcaDagua <> '') and FileExists(FMarcaDagua) then
  begin
    rliMarcaDagua1.Picture.LoadFromFile(FMarcaDagua);
  end;

  // Exibe o resumo da NF-e no canhoto
  if FResumoCanhoto = True then
  begin
    if FResumoCanhoto_Texto <> '' then
      rllResumo.Caption := FResumoCanhoto_Texto
    else
    begin
      rllResumo.Caption :=
        ACBrStr('EMISS�O: ') + FormatDateTime('DD/MM/YYYY', FNFe.Ide.dEmi) +
        '  -  ' + 'DEST. / REM.: ' +
        FNFe.Dest.xNome + '  -  ' + 'VALOR TOTAL: R$ ' +
        FormatFloatBr(FNFe.Total.ICMSTot.vNF,
        '###,###,###,##0.00');
    end;
    rllResumo.Visible := True;
    iAlturaCanhoto := 25;
  end
  else
  begin
    rllResumo.Visible := False;
    iAlturaCanhoto := 15;
  end;

  rliCanhoto1.Top := iAlturaCanhoto;
  rliCanhoto2.Top := rliCanhoto1.Top;
  rliCanhoto2.Height := (rliCanhoto.Top + rliCanhoto.Height) - rliCanhoto2.Top;
  rllDataRecebimento.Top := rliCanhoto1.Top + 3;
  rllIdentificacao.Top := rliCanhoto1.Top + 3;

  // Exibe o desenvolvedor do sistema
  if FSsitema <> '' then
  begin
    rllSistema.Caption := FSsitema;
    rllSistema.Visible := True;
  end
  else
    rllSistema.Visible := False;

  // Exibe o nome do usu�rio
  if FUsuario <> '' then
  begin
    rllUsuario.Caption := ACBrStr('DATA / HORA DA IMPRESS�O: ') +
      DateTimeToStr(Now) + ' - ' + FUsuario;
    rllUsuario.Visible := True;
  end
  else
    rllUsuario.Visible := False;

  // Exibe a informa��o de Ambiente de Homologa��o
  if FNFe.Ide.tpAmb = taHomologacao then
  begin
    rllHomologacao.Caption := ACBrStr('AMBIENTE DE HOMOLOGA��O - NF-E SEM VALOR FISCAL');
    rllHomologacao.Visible := True;
  end
  else
  begin
    rllHomologacao.Caption := '';
    rllHomologacao.Visible := False;
  end;
  // Exibe a informa��o correta no label da chave de acesso
  if FNFeCancelada then
  begin
    rllXmotivo.Caption := 'NF-e CANCELADA';
    rllDadosVariaveis3_Descricao.Caption := ACBrStr('PROTOCOLO DE HOMOLOGA��O DE CANCELAMENTO');
    rlbCodigoBarras.Visible := False;
    rllXmotivo.Visible := True;
    rllDadosVariaveis3_Descricao.Visible := True;
  end
  else
  begin
    if FNFe.procNFe.cStat > 0 then
    begin
      rlbCodigoBarras.Visible := False;
      rllXmotivo.Visible := True;
      rllDadosVariaveis3_Descricao.Visible := True;
      case FNFe.procNFe.cStat of
        100 : begin
                rlbCodigoBarras.Visible := True;
                rllXMotivo.Visible := False;
                rllDadosVariaveis3_Descricao.Caption := ACBrStr('PROTOCOLO DE AUTORIZA��O DE USO');
              end;
        101,
        135,
        151,
        155: begin
              rllXmotivo.Caption := 'NF-e CANCELADA';
              rllDadosVariaveis3_Descricao.Caption := ACBrStr('PROTOCOLO DE HOMOLOGA��O DE CANCELAMENTO');
            end;
        110,
        205,
        301,
        302: begin
              rllXmotivo.Caption := 'NF-e DENEGADA';
              rllDadosVariaveis3_Descricao.Caption := ACBrStr('PROTOCOLO DE DENEGA��O DE USO');
            end;
        else
            begin
              rllXmotivo.Caption := FNFe.procNFe.xMotivo;
              rllDadosVariaveis3_Descricao.Visible := False;
              rllDadosVariaveis3.Visible := False;
            end;
      end;
    end
    else
    begin
      if (FNFe.Ide.tpEmis in [teNormal, teSCAN]) then
      begin
        rlbCodigoBarras.Visible := False;
        rllXmotivo.Caption := ACBrStr('NF-E N�O ENVIADA PARA SEFAZ');
        rllXMotivo.Visible := True;
        rllDadosVariaveis3_Descricao.Visible := False;
        rllDadosVariaveis3.Visible := False;
      end;
    end;
  end;
  // Ajusta a largura da coluna "C�digo do Produto"
  txtCodigo.Width := FLarguraCodProd;
  rlmCodProd.Width := FLarguraCodProd;
  rlsDivProd1.Left := FLarguraCodProd + 2;
  LinhaDescricao.Left := FLarguraCodProd + 2;
  rlmDescricaoProduto.Left := rlsDivProd1.Left + 2;
  rlmDescricaoProduto.Width := (rlsDivProd2.Left - rlsDivProd1.Left) - 3;
  rlmDescricao.Left := LinhaDescricao.Left + 2;
  rlmDescricao.Width := (LinhaNCM.Left - LinhaDescricao.Left) - 24;
  rlmDescricaoProduto.Lines.BeginUpdate;
  rlmDescricaoProduto.Lines.Clear;
  rlmCodProd.Lines.BeginUpdate;
  rlmCodProd.Lines.Clear;

  // ajusta a posi��o do 'c�digo do produto'
  if rlmCodProd.Width > 90 then
  begin
    rlmCodProd.Top := 18;
    rlmCodProd.Height := 7;
  end
  else
  begin
    rlmCodProd.Top := 14;
    rlmCodProd.Height := 14;
  end;

  // Se a largura da coluna 'C�digo do produto' for suficiente,
  // exibe o t�tulo da coluna sem abrevia��es
  if rlmCodProd.Width > 113 then
    rlmCodProd.Lines.Add('C�DIGO DO PRODUTO / SERVI�O')
  else
    rlmCodProd.Lines.Add('C�DIGO DO PROD. / SERV.');

  // Ajusta a posi��o da coluna 'Descri��o do produto'
  if rlmDescricaoProduto.Width > 128 then
  begin
    rlmDescricaoProduto.Top := 18;
    rlmDescricaoProduto.Height := 7;
  end
  else
  begin
    rlmDescricaoProduto.Top := 14;
    rlmDescricaoProduto.Height := 14;
  end;

  // Se a largura da coluna 'Descri��o do produto' for suficiente,
  // exibe o t�tulo da coluna sem abrevia��es
  if rlmDescricaoProduto.Width > 72 then
    rlmDescricaoProduto.Lines.Add('DESCRI��O DO PRODUTO / SERVI�O')
  else
    rlmDescricaoProduto.Lines.Add('DESCR. PROD. / SERV.');

  rlmCodProd.Lines.EndUpdate;
  rlmDescricaoProduto.Lines.EndUpdate;

  // Posiciona o canhoto do DANFE no cabe�alho ou rodap�
  case FPosCanhoto of
    pcCabecalho:
    begin
      rlbReciboHeader.BandType := btHeader;
      rlbDivisaoRecibo.BandType := btHeader;
      rlbReciboHeader.Top := 0;
      rlbDivisaoRecibo.Top := rlbReciboHeader.Top + rlbDivisaoRecibo.Height;
    end;
    pcRodape:
    begin
      rlbReciboHeader.BandType := btFooter;
      rlbDivisaoRecibo.BandType := btFooter;
      rlbDivisaoRecibo.Top := rlbDadosAdicionais.Top + rlbDadosAdicionais.Height;
      rlbReciboHeader.Top := rlbDivisaoRecibo.Top + rlbDivisaoRecibo.Height;
    end;
  end;

  // Oculta alguns itens do DANFE
  if FFormularioContinuo = True then
  begin
    rllRecebemosDe.Visible := False;
    rllResumo.Visible := False;
    rllDataRecebimento.Visible := False;
    rllIdentificacao.Visible := False;
    rllNFe.Visible := False;
    rliCanhoto.Visible := False;
    rliCanhoto1.Visible := False;
    rliCanhoto2.Visible := False;
    rliCanhoto3.Visible := False;
    rliDivisao.Visible := False;
    rliTipoEntrada.Visible := False;
    rllDANFE.Visible := False;
    rllDocumento1.Visible := False;
    rllDocumento2.Visible := False;
    rllTipoEntrada.Visible := False;
    rllTipoSaida.Visible := False;
    rllEmitente.Visible := False;
    rliLogo.Visible := False;
    rlmEmitente.Visible := False;
    rlmEndereco.Visible := False;
    rllFone.Visible := False;
    rlmSiteEmail.Visible := False;
    rliEmitente.Visible := False;
    rllChaveAcesso.Visible := False;
    rliChave.Visible := False;
    rliChave2.Visible := False;
    rliChave3.Visible := False;
  end;

  // Expande a logomarca
  if FExpandirLogoMarca = True then
  begin
    rlmEmitente.Visible := False;
    rlmEndereco.Visible := False;
    rllFone.Visible := False;
    rlmSiteEmail.Visible := False;
    with rliLogo do
    begin
      Height := 101;
      Width := 268;
      Top := 14;
      Left := 2;
      Scaled := False;
      Stretch := True;
    end;
  end;

  DadosAdicionais;
  Header;
  Emitente;
  Destinatario;
  Imposto;
  Itens;
  ISSQN;
  Transporte;
  AddFatura;
  Observacoes;

  // Altera a fonte do DANFE
  case FNomeFonte of
    nfArial:
      for b := 0 to (RLNFe.ControlCount - 1) do
        for i := 0 to ((TRLBand(RLNFe.Controls[b]).ControlCount) - 1) do
        begin
          if TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag
            <> 20 then
            TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Name :=
              'Arial';
          if TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag = 3 then
            TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Size :=
              (TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Size) - 1;
        end;

    nfCourierNew:
    begin
      for b := 0 to (RLNFe.ControlCount - 1) do
        for i := 0 to ((TRLBand(RLNFe.Controls[b]).ControlCount) - 1) do
        begin
          TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Name := 'Courier New';
          case TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag of
             0 ,
           703 ,
           704 ,
           705 : begin
                  TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Size :=
                    (TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Size) - 1;

                  if TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag = 705 then
                    TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Top :=
                        (TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Top) - 1;
           end;
           end;
        end;

      rllNumNF1.Font.Size := rllNumNF1.Font.Size - 2;
      rllNumNF1.Top := rllNumNF1.Top + 1;
      rllChave.Font.Size := rllChave.Font.Size - 1;
      rllFone.Font.Size := rllFone.Font.Size - 1;
    end;

    nfTimesNewRoman:
      for b := 0 to (RLNFe.ControlCount - 1) do
        for i := 0 to ((TRLBand(RLNFe.Controls[b]).ControlCount) - 1) do
        begin
          if TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag
            <> 20 then
            TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Name :=
              'Times New Roman';
          if TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag = 3 then
            TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Size :=
              (TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Size) - 1;
        end;
  end;

  // Dados em negrito
  if FNegrito then
  begin
    for b := 0 to (RLNFe.ControlCount - 1) do
      for i := 0 to ((TRLBand(RLNFe.Controls[b]).ControlCount) - 1) do
      begin
        if TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag = 703 then
          TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Style := [fsBold];
      end;
  end
  else
  begin
    for b := 0 to (RLNFe.ControlCount - 1) do
      for i := 0 to ((TRLBand(RLNFe.Controls[b]).ControlCount) - 1) do
      begin
        if TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Tag = 703 then
          TRLLabel((TRLBand(RLNFe.Controls[b])).Controls[i]).Font.Style := [];
      end;
  end;

  // Altera a fonte da Raz�o Social do Emitente
  rlmEmitente.Font.Size := FTamanhoFonte_RazaoSocial;

  // Verifica se ser� exibida a 'continua��o das informa��es complementares'
  if rlmDadosAdicionaisAuxiliar.Lines.Count > iLimiteLinhas then
  begin
    rlbContinuacaoInformacoesComplementares.Visible := True;
    h := (rlmContinuacaoDadosAdicionais.Top +
      rlmContinuacaoDadosAdicionais.Height) + 2;
    LinhaDCInferior.Top := h;
    h := (h - LinhaDCSuperior.Top) + 1;
    LinhaDCEsquerda.Height := h;
    LinhaDCDireita.Height := h;
  end
  else
    rlbContinuacaoInformacoesComplementares.Visible := False;

  iQuantItens := FNFe.Det.Count;
end;

procedure TfrlDANFeRLRetrato.Header;
var
  sChaveContingencia: String;
begin
  with FNFe.InfNFe, FNFe.Ide do
  begin
    rllChave.Caption := FormatarChaveAcesso(OnlyNumber(FNFe.InfNFe.Id));
    rlbCodigoBarras.Caption := OnlyNumber(FNFe.InfNFe.Id);
    rllNumNF0.Caption       := ACBrStr('N� ') + FormatFloat('000,000,000', nNF);
    rllNumNF1.Caption       := rllNumNF0.Caption;
    rllSERIE0.Caption       := ACBrStr('S�RIE ') + IntToStr(Serie);
    rllSERIE1.Caption       := rllSERIE0.Caption;
    rllNatOperacao.Caption  := NatOp;
    rllEntradaSaida.Caption := tpNFToStr( tpNF );
    rllEmissao.Caption      := FormatDateBr(dEmi);
    rllSaida.Caption        := IfThen(DSaiEnt <> 0,FormatDateBr(dSaiEnt));
    //    rllHoraSaida.Caption := IfThen(hSaiEnt <> 0, FormatDateTime('hh:nn:ss', hSaiEnt));
    //    rllHoraSaida.Caption := IfThen(dSaiEnt <> 0, FormatDateTime('hh:nn:ss', dSaiEnt));     //..Rodrigo - substitui campo hSaiEnt por DSaiEnt
    if versao = 2.00 then
      rllHoraSaida.Caption := ifthen(hSaiEnt = 0, '', TimeToStr(hSaiEnt))
    else
      rllHoraSaida.Caption := ifthen(TimeOf(dSaiEnt) = 0, '', TimeToStr(dSaiEnt));

    if FNFe.Ide.tpEmis in [teNormal, teSCAN, teSVCAN, teSVCRS, teSVCSP] then
    begin
      if FNFe.procNFe.cStat > 0 then
      begin
        rllDadosVariaveis1a.Visible := True;
        rllDadosVariaveis1b.Visible := True;
        rllDadosVariaveis1c.Visible := True;
      end
      else
      begin
        rllDadosVariaveis1a.Visible := False;
        rllDadosVariaveis1b.Visible := False;
        rllDadosVariaveis1c.Visible := False;
      end;
      rlbCodigoBarrasFS.Visible := False;

      if FProtocoloNFe <> '' then
        rllDadosVariaveis3.Caption := FProtocoloNFe
      else
        rllDadosVariaveis3.Caption :=
          FNFe.procNFe.nProt + ' ' + DateTimeToStr(FNFe.procNFe.dhRecbto);
      rllAvisoContingencia.Visible := False;
      rlbAvisoContingencia.Visible := False;
    end
    else if FNFe.Ide.tpEmis in [teContingencia, teFSDA] then
    begin
      sChaveContingencia := FACBrNFe.GerarChaveContingencia(FNFe);
      rllDadosVariaveis1a.Visible := False;
      rllDadosVariaveis1b.Visible := False;
      rllDadosVariaveis1c.Visible := False;
      rlbCodigoBarras.Visible     := True;
      rlbCodigoBarrasFS.Caption   := sChaveContingencia;
      rlbCodigoBarrasFS.Visible   := True;
      rllDadosVariaveis3_Descricao.Caption := 'DADOS DA NF-E';
      rllDadosVariaveis3.Caption    := FormatarChaveAcesso(sChaveContingencia);
      rllAvisoContingencia.Caption  := ACBrStr(
        'DANFE em Conting�ncia - ' +
        'Impresso em decorr�ncia de problemas t�cnicos');
      if (dhCont > 0) and (xJust > '') then
        rllContingencia.Caption := ACBrStr(
          'Data / Hora da entrada em conting�ncia: ') +
          FormatDateTime('dd/mm/yyyy hh:nn:ss', dhCont) +
          '   Motivo: ' + xJust;
      rllAvisoContingencia.Visible := True;
      rlbAvisoContingencia.Visible := True;
    end;
  end;
end;

procedure TfrlDANFeRLRetrato.Emitente;
begin
  //emit
  with FNFe.Emit do
  begin
    if FRecebemoDe = '' then
      FRecebemoDe := rllRecebemosDe.Caption;

    rllRecebemosDe.Caption := Format(FRecebemoDe, [XNome]);
    rllInscricaoEstadual.Caption := IE;
    rllInscrEstSubst.Caption := IEST;
    rllCNPJ.Caption := FormatarCNPJouCPF(CNPJCPF);
    rlmEmitente.Lines.Text := XNome;
    with EnderEmit do
    begin
      rlmEndereco.Lines.Clear;
      if xCpl > '' then
        rlmEndereco.Lines.add(XLgr + IfThen(Nro = '0', '', ', ' + Nro) +
          ' ' + XCpl + ' - ' + XBairro)
      else
        rlmEndereco.Lines.add(XLgr + IfThen(Nro = '0', '', ', ' + Nro) +
          ' - ' + XBairro);

      rlmEndereco.Lines.add('CEP: ' + FormatarCEP(IntToStr(CEP)) +
        ' - ' + XMun + ' - ' + UF);

      if FFax <> '' then
      begin
        rllFone.Caption :=
          'TEL: ' + FormatarFone(Fone) + ' - FAX: ' +
          FormatarFone(FFax);
        rllFone.Font.Size := 7;
      end
      else
      begin
        rllFone.Caption := 'TEL: ' + FormatarFone(Fone);
        rllFone.Font.Size := 8;
      end;
    end;
  end;

  if (FSite <> '') or (FEmail <> '') then
  begin
    rlmSiteEmail.Lines.BeginUpdate;
    rlmSiteEmail.Lines.Clear;
    if FSite <> '' then
      rlmSiteEmail.Lines.Add(FSite);
    if FEmail <> '' then
      rlmSiteEmail.Lines.Add(FEmail);
    rlmSiteEmail.Lines.EndUpdate;
    rlmSiteEmail.Visible := True;
    rlmEndereco.Top := 48;
    rllFone.Top := 82;
    rlmSiteEmail.Top := 92;
  end
  else
  begin
    rlmSiteEmail.Visible := False;
    rlmEndereco.Top := 58;
    rllFone.Top := 96;
  end;
end;

procedure TfrlDANFeRLRetrato.Destinatario;
begin
  // destinatario
  with FNFe.Dest do
  begin
    rllDestCNPJ.Caption := FormatarCNPJouCPF(CNPJCPF);
    rllDestIE.Caption := IE;
    rllDestNome.Caption := XNome;
    with EnderDest do
    begin
      if xCpl > '' then
        rllDestEndereco.Caption :=
          XLgr + IfThen(Nro = '0', '', ', ' +
          Nro) + ' ' + xCpl
      else
        rllDestEndereco.Caption := XLgr + IfThen(Nro = '0', '', ', ' + Nro);
      rllDestBairro.Caption := XBairro;
      rllDestCidade.Caption := XMun;
      rllDestUF.Caption := UF;
      rllDestCEP.Caption := FormatarCEP(IntToStr(CEP));
      rllDestFONE.Caption := FormatarFone(Fone);
    end;
  end;
end;

procedure TfrlDANFeRLRetrato.EnderecoEntrega;
var
  sEndereco: WideString;
  sCNPJ: String;
begin
  if FNFe.Entrega.xLgr > '' then
  begin
    with FNFe.Entrega do
    begin
      sCNPJ := FormatarCNPJouCPF(CNPJCPF);

      if xCpl > '' then
        sEndereco := XLgr + IfThen(Nro = '0', '', ', ' + Nro) + ' - ' + xCpl
      else
        sEndereco := XLgr + IfThen(Nro = '0', '', ', ' + Nro);

      sEntrega := 'LOCAL DE ENTREGA: ' + sEndereco + ' - ' +
        xBairro + ' - ' + xMun + '-' + UF + '  CNPJ: ' + sCNPJ;
    end;
  end;
end;

procedure TfrlDANFeRLRetrato.EnderecoRetirada;
var
  sEndereco: WideString;
  sCNPJ: String;
begin
  if FNFe.Retirada.xLgr > '' then
  begin
    with FNFe.Retirada do
    begin
      sCNPJ := FormatarCNPJouCPF(CNPJCPF);

      if xCpl > '' then
        sEndereco := XLgr + IfThen(Nro = '0', '', ', ' + Nro) + ' - ' + xCpl
      else
        sEndereco := XLgr + IfThen(Nro = '0', '', ', ' + Nro);

      sRetirada := 'LOCAL DE RETIRADA: ' + sEndereco + ' - ' +
        xBairro + ' - ' + xMun + '-' + UF + '  CNPJ: ' + sCNPJ;
    end;
  end;
end;

procedure TfrlDANFeRLRetrato.Imposto;
var
  LarguraCampo: integer;
begin
  with FNFe.Total.ICMSTot do
  begin
    rllBaseICMS.Caption := FormatFloatBr(VBC, '###,###,###,##0.00');
    rllValorICMS.Caption := FormatFloatBr(VICMS, '###,###,###,##0.00');
    rllBaseICMSST.Caption := FormatFloatBr(VBCST, '###,###,###,##0.00');
    rllValorICMSST.Caption := FormatFloatBr(VST, '###,###,###,##0.00');
    rllTotalProdutos.Caption := FormatFloatBr(VProd, '###,###,###,##0.00');
    rllValorFrete.Caption := FormatFloatBr(VFrete, '###,###,###,##0.00');
    rllValorSeguro.Caption := FormatFloatBr(VSeg, '###,###,###,##0.00');
    rllDescontos.Caption := FormatFloatBr(VDesc, '###,###,###,##0.00');
    rllAcessorias.Caption := FormatFloatBr(VOutro, '###,###,###,##0.00');
    rllValorIPI.Caption := FormatFloatBr(VIPI, '###,###,###,##0.00');
    rllTotalNF.Caption := FormatFloatBr(VNF, '###,###,###,##0.00');

    //115 460 143
    // Exibe o Valor total dos tributos se vTotTrib for informado
    // e ajusta a posi��o dos outros campos para "abrir espa�o" para ele.
    if vTotTrib > 0 then
    begin
      rllTotalTributos.Caption := FormatFloatBr(vTotTrib, '###,###,###,##0.00');
      rliDivImposto4.Visible := True;
      rllTituloTotalTributos.Visible := True;
      rllTotalTributos.Visible := True;

      rliDivImposto4.Left := 460;
      rllTituloTotalTributos.Left := rliDivImposto4.Left + 3;
      rllTotalTributos.Left := rliDivImposto4.Left + 7;
      rllTotalTributos.Width := (rliDivImposto5.Left - 7) - (rliDivImposto4.Left + 3);

      LarguraCampo := 115;

      rliDivImposto3.Left := rliDivImposto4.Left - LarguraCampo - 1;
      rllTituloValorICMSST.Left := rliDivImposto3.Left + 3;
      rllValorICMSST.Left := rliDivImposto3.Left + 7;
      rllValorICMSST.Width := (rliDivImposto4.Left - 7) - (rliDivImposto3.Left + 3);
    end
    else
    begin
      rliDivImposto4.Visible := False;
      rllTituloTotalTributos.Visible := False;
      rllTotalTributos.Visible := False;

      LarguraCampo := 143;

      rliDivImposto3.Left := rliDivImposto5.Left - LarguraCampo - 1;
      rllTituloValorICMSST.Left := rliDivImposto3.Left + 3;
      rllValorICMSST.Left := rliDivImposto3.Left + 7;
      rllValorICMSST.Width := (rliDivImposto5.Left - 7) - (rliDivImposto3.Left + 3);
    end;

    rliDivImposto2.Left := rliDivImposto3.Left - LarguraCampo - 1;
    rllTituloBaseICMSST.Left := rliDivImposto2.Left + 3;
    rllBaseICMSST.Left := rliDivImposto2.Left + 7;
    rllBaseICMSST.Width := (rliDivImposto3.Left - 7) - (rliDivImposto2.Left + 3);

    rliDivImposto1.Left := rliDivImposto2.Left - LarguraCampo - 1;
    rllTituloValorICMS.Left := rliDivImposto1.Left + 3;
    rllValorICMS.Left := rliDivImposto1.Left + 7;
    rllValorICMS.Width := (rliDivImposto2.Left - 7) - (rliDivImposto1.Left + 3);

    rllBaseICMS.Width := (rliDivImposto1.Left - 10);
  end;
end;

procedure TfrlDANFeRLRetrato.Transporte;
begin
  with FNFe.Transp do
  begin
    rllTransModFrete.Caption := modFreteToDesStr( modFrete );
    with Transporta do
    begin
      if Trim(CNPJCPF) <> '' then
        rllTransCNPJ.Caption := FormatarCNPJouCPF(CNPJCPF)
      else
        rllTransCNPJ.Caption := '';

      rllTransNome.Caption := XNome;
      rllTransIE.Caption := IE;
      rllTransEndereco.Caption := XEnder;
      rllTransCidade.Caption := XMun;
      rllTransUF.Caption := UF;
    end;
  end;

  with FNFe.Transp.VeicTransp do
  begin
    rllTransCodigoANTT.Caption := RNTC;
    rllTransPlaca.Caption := Placa;
    rllTransUFPlaca.Caption := UF;
  end;

  if FNFe.Transp.Vol.Count > 0 then
  begin
    with FNFe.Transp.Vol[0] do
    begin
      if qVol > 0 then
        rllTransQTDE.Caption := IntToStr(QVol);
      rllTransEspecie.Caption := Esp;
      rllTransMarca.Caption := Marca;
      rllTransNumeracao.Caption := NVol;
      if pesoL > 0 then
        rllTransPesoLiq.Caption := FormatFloatBr(PesoL, '###,###,###,##0.000');
      if pesoB > 0 then
        rllTransPesoBruto.Caption := FormatFloatBr(PesoB, '###,###,###,##0.000');
    end;
  end
  else
  begin
    rllTransQTDE.Caption := '';
    rllTransEspecie.Caption := '';
    rllTransMarca.Caption := '';
    rllTransNumeracao.Caption := '';
    rllTransPesoLiq.Caption := '';
    rllTransPesoBruto.Caption := '';
  end;
end;

procedure TfrlDANFeRLRetrato.DadosAdicionais;
var
  sInfCompl, sInfAdFisco, sInfContr, sObsFisco, sObsProcRef, sInfInteira,
  sProtocolo, sSuframa: WideString;
  sIndProc: String;
  i: integer;
begin
  rlmDadosAdicionaisAuxiliar.Lines.BeginUpdate;
  rlmDadosAdicionaisAuxiliar.Lines.Clear;

  // Protocolo de autoriza��o, nos casos de emiss�o em conting�ncia
  if (FNFe.Ide.tpEmis in [teContingencia, teFSDA, teSVCAN, teSVCRS]) and
    (FNFe.procNFe.cStat = 100) then
  begin
    sProtocolo := ACBrStr('PROTOCOLO DE AUTORIZA��O DE USO: ') +
      FNFe.procNFe.nProt + ' ' + DateTimeToStr(FNFe.procNFe.dhRecbto);
    InsereLinhas(sProtocolo, iLimiteCaracteresLinha, rlmDadosAdicionaisAuxiliar);
  end;

  // Inscri��o Suframa
  if FNFe.Dest.ISUF > '' then
  begin
    sSuframa := ACBrStr('INSCRI��O SUFRAMA: ') + FNFe.Dest.ISUF;
    InsereLinhas(sSuframa, iLimiteCaracteresLinha, rlmDadosAdicionaisAuxiliar);
  end;

  // Endere�o de retirada
  if FNFe.Retirada.xLgr > '' then
  begin
    EnderecoRetirada;
    InsereLinhas(sRetirada, iLimiteCaracteresLinha, rlmDadosAdicionaisAuxiliar);
  end;

  // Endere�o de entrega
  if FNFe.Entrega.xLgr > '' then
  begin
    EnderecoEntrega;
    InsereLinhas(sEntrega, iLimiteCaracteresLinha, rlmDadosAdicionaisAuxiliar);
  end;

  // Informa��es de interesse do fisco
  if FNFe.InfAdic.infAdFisco > '' then
  begin
    if FNFe.InfAdic.infCpl > '' then
      sInfAdFisco := FNFe.InfAdic.infAdFisco + '; '
    else
      sInfAdFisco := FNFe.InfAdic.infAdFisco;
  end
  else
    sInfAdFisco := '';

  // Informa��es de interesse do contribuinte
  if FNFe.InfAdic.infCpl > '' then
    sInfCompl := FNFe.InfAdic.infCpl
  else
    sInfCompl := '';

  // Informa��es de uso livre do contribuinte com "xCampo" e "xTexto"
  if FNFe.InfAdic.obsCont.Count > 0 then
  begin
    sInfContr := '';
    for i := 0 to (FNFe.InfAdic.obsCont.Count - 1) do
    begin
      if FNFe.InfAdic.obsCont.Items[i].Index =
        (FNFe.InfAdic.obsCont.Count - 1) then
        sInfContr := sInfContr + FNFe.InfAdic.obsCont.Items[i].xCampo +
          ': ' + FNFe.InfAdic.obsCont.Items[i].xTexto
      else
        sInfContr := sInfContr + FNFe.InfAdic.obsCont.Items[i].xCampo +
          ': ' + FNFe.InfAdic.obsCont.Items[i].xTexto + '; ';
    end; // for i := 0 to (FNFe.InfAdic.obsCont.Count - 1)
    if (sInfCompl > '') or (sInfAdFisco > '') then
      sInfContr := sInfContr + '; ';
  end // if FNFe.InfAdic.obsCont.Count > 0
  else
    sInfContr := '';

  // Informa��es de uso livre do fisco com "xCampo" e "xTexto"
  if FNFe.InfAdic.obsFisco.Count > 0 then
  begin
    sObsFisco := '';
    for i := 0 to (FNFe.InfAdic.obsFisco.Count - 1) do
    begin
      if FNFe.InfAdic.obsFisco.Items[i].Index =
        (FNFe.InfAdic.obsFisco.Count - 1) then
        sObsFisco := sObsFisco + FNFe.InfAdic.obsFisco.Items[i].xCampo +
          ': ' + FNFe.InfAdic.obsFisco.Items[i].xTexto
      else
        sObsFisco := sObsFisco + FNFe.InfAdic.obsFisco.Items[i].xCampo +
          ': ' + FNFe.InfAdic.obsFisco.Items[i].xTexto + '; ';
    end; // for i := 0 to (FNFe.InfAdic.obsFisco.Count - 1)
    if (sInfCompl > '') or (sInfAdFisco > '') then
      sObsFisco := sObsFisco + '; ';
  end // if FNFe.InfAdic.obsFisco.Count > 0
  else
    sObsFisco := '';

  // Informa��es do processo referenciado
  if FNFe.InfAdic.procRef.Count > 0 then
  begin
    sObsProcRef := '';

    for i := 0 to (FNFe.InfAdic.procRef.Count - 1) do
    begin
      sIndProc := ACBrStr( indProcToDescrStr(FNFe.InfAdic.procRef.Items[i].indProc ) );

      if FNFe.InfAdic.procRef.Items[i].Index =
        (FNFe.InfAdic.procRef.Count - 1) then
        sObsProcRef := sObsProcRef + ACBrStr('PROCESSO OU ATO CONCESS�RIO N�: ') +
          FNFe.InfAdic.procRef.Items[i].nProc +
          ' - ORIGEM: ' + sIndProc
      else
        sObsProcRef := sObsProcRef + ACBrStr('PROCESSO OU ATO CONCESS�RIO N�: ') +
          FNFe.InfAdic.procRef.Items[i].nProc +
          ' - ORIGEM: ' + sIndProc + '; ';
    end; // for i := 0 to (FNFe.InfAdic.procRef.Count - 1)
    if (sInfCompl > '') or (sInfAdFisco > '') then
      sObsProcRef := sObsProcRef + '; ';
  end // if FNFe.InfAdic.procRef.Count > 0
  else
    sObsProcRef := '';

  sInfInteira := sInfAdFisco + sObsFisco + sObsProcRef + sInfContr + sInfCompl;
  InsereLinhas(sInfInteira, iLimiteCaracteresLinha, rlmDadosAdicionaisAuxiliar);
  rlmDadosAdicionaisAuxiliar.Lines.EndUpdate;
end;

procedure TfrlDANFeRLRetrato.Observacoes;
var
  i, iMaximoLinhas, iRestanteLinhas: integer;
  sTexto: WideString;
begin
  rlmDadosAdicionais.Lines.BeginUpdate;
  rlmDadosAdicionais.Lines.Clear;

  if rlmDadosAdicionaisAuxiliar.Lines.Count > iLimiteLinhas then
  begin
    iMaximoLinhas := iLimiteLinhas;
    iRestanteLinhas := rlmDadosAdicionaisAuxiliar.Lines.Count - iLimiteLinhas;
    rlmContinuacaoDadosAdicionais.Lines.BeginUpdate;
    sTexto := '';
    for i := 0 to (iRestanteLinhas - 1) do
    begin
      sTexto := sTexto + rlmDadosAdicionaisAuxiliar.Lines.Strings[
        (iMaximoLinhas + i)];
    end;

    InsereLinhas(sTexto, iLimiteCaracteresContinuacao, rlmContinuacaoDadosAdicionais);
    rlmContinuacaoDadosAdicionais.Lines.Text :=
      StringReplace(rlmContinuacaoDadosAdicionais.Lines.Text,
      ';', '', [rfReplaceAll, rfIgnoreCase]);
    rlmContinuacaoDadosAdicionais.Lines.EndUpdate;
  end
  else
    iMaximoLinhas := rlmDadosAdicionaisAuxiliar.Lines.Count;

  for i := 0 to (iMaximoLinhas - 1) do
  begin
    rlmDadosAdicionais.Lines.Add(rlmDadosAdicionaisAuxiliar.Lines.Strings[i]);
  end;

  rlmDadosAdicionais.Lines.Text :=
    StringReplace(rlmDadosAdicionais.Lines.Text, ';',
    '', [rfReplaceAll, rfIgnoreCase]);

  rlmDadosAdicionais.Lines.EndUpdate;
end;

procedure TfrlDANFeRLRetrato.Itens;
var
  nItem : integer;
begin
  for nItem := 0 to (FNFe.Det.Count - 1) do
  begin
    with FNFe.Det.Items[nItem] do
    begin
      cdsItens.Append;
      cdsItens.FieldByName('CODIGO').AsString       := Prod.CProd;
      cdsItens.FieldByName('EAN').AsString          := Prod.cEAN;
      cdsItens.FieldByName('DESCRICAO').AsString    := ManterXpod( Prod.XProd , nItem );
      cdsItens.FieldByName('NCM').AsString          := Prod.NCM;
      cdsItens.FieldByName('CST').AsString          := OrigToStr(Imposto.ICMS.orig) + CSTICMSToStr(Imposto.ICMS.CST);
      cdsItens.FieldByName('CSOSN').AsString        := OrigToStr(Imposto.ICMS.orig) + CSOSNIcmsToStr(Imposto.ICMS.CSOSN);
      cdsItens.FieldByName('CFOP').AsString         := Prod.CFOP;
      cdsItens.FieldByName('UNIDADE').AsString      := Prod.UCom;
      cdsItens.FieldByName('QTDE').AsString         := FormatFloat(format(sDisplayFormat, [FCasasDecimaisqCom, 0]), Prod.qCom);
      cdsItens.FieldByName('VALOR').AsString        := FormatFloat(format(sDisplayFormat, [FCasasDecimaisvUnCom, 0]), Prod.vUnCom);
      cdsItens.FieldByName('TOTAL').AsString        := FormatFloat('###,###,###,##0.00', Prod.vProd);
      cdsItens.FieldByName('VALORDESC').AsString    := FormatFloat('###,###,###,##0.00', ManterDesPro( Prod.vDesc ,Prod.vProd));
      cdsItens.FieldByName('BICMS').AsString        := FormatFloat('###,###,###,##0.00', Imposto.ICMS.VBC);
      cdsItens.FieldByName('ALIQICMS').AsString     := FormatFloat('###,###,###,##0.00', Imposto.ICMS.PICMS);
      cdsItens.FieldByName('VALORICMS').AsString    := FormatFloat('###,###,###,##0.00', Imposto.ICMS.VICMS);
      cdsItens.FieldByName('BICMSST').AsString      := FormatFloat('###,###,###,##0.00', Imposto.ICMS.vBCST);
      cdsItens.FieldByName('VALORICMSST').AsString  := FormatFloat('###,###,###,##0.00', Imposto.ICMS.vICMSST);
      cdsItens.FieldByName('ALIQIPI').AsString      := FormatFloat('##0.00', Imposto.IPI.PIPI);
      cdsItens.FieldByName('VALORIPI').AsString     := FormatFloat('##0.00', Imposto.IPI.VIPI);
      cdsItens.Post;
    end;
  end;
  cdsItens.First;
end;

procedure TfrlDANFeRLRetrato.ISSQN;
begin
  with FNFe.Total.ISSQNtot do
  begin
    if FNFe.Emit.IM > '' then
    begin
      rlbISSQN.Visible := True;
      rllISSQNInscricao.Caption     := FNFe.Emit.IM;
      rllISSQNValorServicos.Caption := FormatFloatBr(FNFe.Total.ISSQNtot.vServ,'###,###,##0.00');
      rllISSQNBaseCalculo.Caption   := FormatFloatBr(FNFe.Total.ISSQNtot.vBC,'###,###,##0.00');
      rllISSQNValorISSQN.Caption    := FormatFloatBr(FNFe.Total.ISSQNtot.vISS,'###,###,##0.00');
    end
    else
      rlbISSQN.Visible := False;
  end;
end;

procedure TfrlDANFeRLRetrato.AddFatura;
var
  x, iQuantDup, iLinhas, iColunas, iPosQuadro, iAltLinha, iAltQuadro1Linha,
  iAltQuadro, iAltBand, iFolga: integer;
begin
  //zera
  iQuantDup := 0;
  for x := 1 to 60 do
  begin
    TRLLabel(FindComponent('rllFatNum' + IntToStr(x))).Caption := '';
    TRLLabel(FindComponent('rllFatData' + IntToStr(x))).Caption := '';
    TRLLabel(FindComponent('rllFatValor' + IntToStr(x))).Caption := '';
  end;

  case FNFe.Ide.indPag of
    ipVista:
    begin
      TRLLabel(FindComponent('rllFatNum1')).AutoSize := True;
      TRLLabel(FindComponent('rllFatNum1')).Caption := 'PAGAMENTO A VISTA';
      iQuantDup := 1;

      for x := 0 to 11 do
        TRLLabel(FindComponent('rllCabFatura' + IntToStr(x + 1))).Visible := False;

      rliFatura1.Visible := False;
      rliFatura2.Visible := False;
      rliFatura3.Visible := False;
    end;  // ipVista

    ipPrazo:
    begin
      if FNFe.Cobr.Dup.Count = 0 then
      begin
        TRLLabel(FindComponent('rllFatNum1')).AutoSize := True;
        TRLLabel(FindComponent('rllFatNum1')).Caption := 'PAGAMENTO A PRAZO';
        iQuantDup := 1;

        for x := 0 to 11 do
          TRLLabel(FindComponent('rllCabFatura' + IntToStr(x + 1))).Visible := False;

        rliFatura1.Visible := False;
        rliFatura2.Visible := False;
        rliFatura3.Visible := False;
      end
      else
      begin
        if FNFe.Cobr.Dup.Count > 60 then
          iQuantDup := 60
        else
          iQuantDup := FNFe.Cobr.Dup.Count;

        //adiciona
        for x := 0 to (iQuantDup - 1) do
          with FNFe.Cobr.Dup[x] do
          begin
            TRLLabel(FindComponent('rllFatNum' + IntToStr(x + 1))).Caption   := NDup;
            TRLLabel(FindComponent('rllFatData' + IntToStr(x + 1))).Caption  := FormatDateBr(DVenc);
            TRLLabel(FindComponent('rllFatValor' + IntToStr(x + 1))).Caption := FormatFloatBr(VDup);
          end;
      end; // if FNFe.Cobr.Dup.Count = 0
    end;  // ipPrazo

    ipOutras:
    begin
      rlbFatura.Visible := False;
    end;  // ipOutras
  end; // case FNFe.Ide.indPag

  {=============== Ajusta o tamanho do quadro das faturas ===============}
  if iQuantDup > 0 then
  begin
    iColunas := 4; // Quantidade de colunas
    iAltLinha := 13;  // Altura de cada linha
    iPosQuadro := 12; // Posi��o (Top) do Quadro
    iAltQuadro1Linha := 27; // Altura do quadro com 1 linha
    iFolga := 5; // Dist�ncia entre o final da Band e o final do quadro

    if (iQuantDup mod iColunas) = 0 then // Quantidade de linhas
      iLinhas := iQuantDup div iColunas
    else
      iLinhas := (iQuantDup div iColunas) + 1;

    if iLinhas = 1 then
      iAltQuadro := iAltQuadro1Linha
    else
      iAltQuadro := iAltQuadro1Linha + ((iLinhas - 1) * iAltLinha);

    iAltBand := iPosQuadro + iAltQuadro + iFolga;

    rlbFatura.Height := iAltBand;
    rliFatura.Height := iAltQuadro;
    rliFatura1.Height := iAltQuadro;
    rliFatura2.Height := iAltQuadro;
    rliFatura3.Height := iAltQuadro;
  end; // if iQuantDup > 0
end;

procedure TfrlDANFeRLRetrato.rlbItensAfterPrint(Sender: TObject);
var
  h: integer;
  str: WideString;
begin
  q := q + 1;
  if FNFe.Det.Items[q - 1].infAdProd > '' then
  begin
    rlmObsItem.Lines.BeginUpdate;
    rlmObsItem.Lines.Clear;
    str := StringReplace((FNFe.Det.Items[q - 1].infAdProd), ';',
      #13#10, [rfReplaceAll, rfIgnoreCase]);
    rlmObsItem.Lines.Add(str);
    rlmObsItem.Lines.EndUpdate;
    rlbObsItem.Visible := True;

    h := (rlmObsItem.Top + rlmObsItem.Height) + 2;
    LinhaFimObsItem.Top := h;
    h := h + 1;
    LinhaObsItemEsquerda.Height := h;
    LinhaObsItemDireita.Height := h;
    if iQuantItens > q then
      LinhaInicioItem.Visible := True
    else
      LinhaInicioItem.Visible := False;
  end
  else
    rlbObsItem.Visible := False;

end;

procedure TfrlDANFeRLRetrato.rlbDadosAdicionaisBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  if FPosCanhoto = pcCabecalho then
  begin
    rlbReciboHeader.Visible := False;
    rlbReciboHeader.Height := 66;
    rlbDivisaoRecibo.Visible := False;
  end;

  // Posiciona a Marca D'�gua
  rliMarcaDagua1.Top := rlbCabecalhoItens.Top +
    ((rlbDadosAdicionais.Top - rlbCabecalhoItens.Top) div 2) -
    (rliMarcaDagua1.Height div 2);

end;

procedure TfrlDANFeRLRetrato.rlbItensBeforePrint(Sender: TObject; var PrintIt: Boolean);
begin
  // Controla os itens por p�gina
  if RLNFe.PageNumber >= 2 then
    FProdutosPorPagina := 60
  else
    FProdutosPorPagina := 20;
  // Controla os itens por p�gina
  if rlmDescricao.Height > 10 then
    iItemAtual := iItemAtual + 2
  else
    iItemAtual := iItemAtual + 1;

  if FProdutosPorPagina = 0 then
    rlbItens.PageBreaking := pbNone
  else
  begin
    if iItemAtual = FProdutosPorPagina then
    begin
      if RLNFe.PageNumber >= 2 then
        rlbItens.PageBreaking := pbAfterPrint
      else
        rlbItens.PageBreaking := pbBeforePrint;
    end
    else
      rlbItens.PageBreaking := pbNone;
  end;

end;

procedure TfrlDANFeRLRetrato.rlbEmitenteAfterPrint(Sender: TObject);
begin
  iItemAtual := 0;
end;

procedure TfrlDANFeRLRetrato.ConfigureDataSource;
begin
  rlmDescricao.DataSource := DataSource1;
  RLNFe.DataSource := DataSource1;
  txtCodigo.DataSource := DataSource1;
  txtNCM.DataSource := DataSource1;
  txtCST.DataSource := DataSource1;
  txtCFOP.DataSource := DataSource1;
  txtUnidade.DataSource := DataSource1;
  txtQuantidade.DataSource := DataSource1;
  txtValorUnitario.DataSource := DataSource1;
  txtValorTotal.DataSource := DataSource1;
  txtBaseICMS.DataSource := DataSource1;
  txtValorICMS.DataSource := DataSource1;
  txtValorIPI.DataSource := DataSource1;
  txtAliqICMS.DataSource := DataSource1;
  txtAliqIPI.DataSource := DataSource1;
  txtValorDesconto.DataSource := DataSource1;
end;

procedure TfrlDANFeRLRetrato.rlbCabecalhoItensBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  case FNFe.Emit.CRT of
    crtRegimeNormal,
    crtSimplesExcessoReceita :
      begin
        lblCST.Caption    := 'CST';
        lblCST.Font.Size  := 5;
        lblCST.Top        := 18;
        txtCST.DataField  := 'CST';
      end;

    crtSimplesNacional :
      begin
        lblCST.Caption    := 'CSOSN';
        lblCST.Font.Size  := 4;
        lblCST.Top        := 19;
        txtCST.DataField  := 'CSOSN';
      end;
  end;

  if FImprimirDescPorc = True then
    lblPercValorDesc.Caption := 'PERC.(%)'
  else
    lblPercValorDesc.Caption := 'VALOR';
end;

procedure TfrlDANFeRLRetrato.FormCreate(Sender: TObject);
begin
  inherited;

  iLimiteLinhas := 10;
  iLinhasUtilizadas := 0;
  iLimiteCaracteresLinha := 81;
  iLimiteCaracteresContinuacao := 129;
end;

Function TfrlDANFeRLRetrato.ManterVeiculos( inItem:  integer  ) : String;
begin
  Result := '';
  with FNFe.Det.Items[inItem].Prod do
  begin
    if veicProd.chassi > '' then
    begin
      if dv_tpOp in FDetVeiculos          then Result := Result + ACBrStr('TIPO DA OPERA��O: ' + VeiculosTipoOperStr( veicProd.tpOP ) ) + #13#10;
      if dv_Chassi in FDetVeiculos        then Result := Result + ACBrStr('CHASSI: ' )+ veicProd.chassi + #13#10;
      if dv_cCor in FDetVeiculos          then Result := Result + ACBrStr('C�DIGO DA COR: ' )+ veicProd.cCor + #13#10;
      if dv_xCor in FDetVeiculos          then Result := Result + ACBrStr('NOME DA COR: ') + veicProd.xCor + #13#10;
      if dv_pot in FDetVeiculos           then Result := Result + ACBrStr('POT�NCIA DO MOTOR: ') + veicProd.pot + #13#10;
      if dv_cilin in FDetVeiculos         then Result := Result + ACBrStr('CILINDRADAS: ') + veicProd.Cilin + #13#10;
      if dv_pesoL in FDetVeiculos         then Result := Result + ACBrStr('PESO L�QUIDO: ') + veicProd.pesoL + #13#10;
      if dv_pesoB in FDetVeiculos         then Result := Result + ACBrStr('PESO BRUTO: ' )+ veicProd.pesoB + #13#10;
      if dv_nSerie in FDetVeiculos        then Result := Result + ACBrStr('N�MERO DE S�RIE: ') + veicProd.nSerie + #13#10;
      if dv_tpComb in FDetVeiculos        then Result := Result + ACBrStr('COMBUST�VEL: ' + VeiculosCombustivelStr( veicProd.tpComb ) ) + #13#10;
      if dv_nMotor in FDetVeiculos        then Result := Result + ACBrStr('N�MERO DO MOTOR: ') + veicProd.nMotor + #13#10;
      if dv_CMT in FDetVeiculos           then Result := Result + ACBrStr('CAP. M�X. TRA��O: ') + veicProd.CMT + #13#10;
      if dv_dist in FDetVeiculos          then Result := Result + ACBrStr('DIST�NCIA ENTRE EIXOS: ') + veicProd.dist + #13#10;
      if dv_anoMod in FDetVeiculos        then Result := Result + ACBrStr('ANO DO MODELO: ' )+ IntToStr(veicProd.anoMod) + #13#10;
      if dv_anoFab in FDetVeiculos        then Result := Result + ACBrStr('ANO DE FABRICA��O: ') + IntToStr(veicProd.anoFab) + #13#10;
      if dv_tpPint in FDetVeiculos        then Result := Result + ACBrStr('TIPO DE PINTURA: ') + veicProd.tpPint + #13#10;
      if dv_tpVeic in FDetVeiculos        then Result := Result + ACBrStr('TIPO DE VE�CULO: ' +VeiculosTipoStr( veicProd.tpVeic ) )+ #13#10;
      if dv_espVeic in FDetVeiculos       then Result := Result + ACBrStr('ESP�CIE DO VE�CULO: ' +VeiculosEspecieStr( veicProd.espVeic )) + #13#10;
      if dv_VIN in FDetVeiculos           then Result := Result + ACBrStr('VIN (CHASSI): ' + VeiculosVinStr( veicProd.VIN ) )+ #13#10;
      if dv_condVeic in FDetVeiculos      then Result := Result + ACBrStr('CONDI��O DO VE�CULO: ' +VeiculosCondicaoStr( veicProd.condVeic)) + #13#10;
      if dv_cMod in FDetVeiculos          then Result := Result + ACBrStr('C�DIGO MARCA MODELO: ') + veicProd.cMod + #13#10;
      if dv_cCorDENATRAN in FDetVeiculos  then Result := Result + ACBrStr('C�DIGO COR DENATRAN: ' +VeiculosCorDENATRANSTr( veicProd.cCorDENATRAN )) + #13#10;
      if dv_lota in FDetVeiculos          then Result := Result + ACBrStr('CAPACIDADE M�XIMA DE LOTA��O: ') +IntToStr(veicProd.lota) + #13#10;
      if dv_tpRest in FDetVeiculos        then Result := Result + ACBrStr('RESTRI��O: ' +VeiculosRestricaoStr( veicProd.tpRest ) )+ #13#10;
    end;
  end;
end;


Function TfrlDANFeRLRetrato.ManterMedicamentos( inItem:  integer  ) : String;
Var
  i : Integer;
begin
  Result := '';
  with FNFe.Det.Items[inItem].Prod do
  begin
    if med.Count > 0 then
    begin
      for i := 0 to med.Count - 1 do
      begin
        if dm_nLote in FDetMedicamentos then Result := Result + ACBrStr('N�MERO DO LOTE: ') + med.Items[i].nLote + #13#10;
        if dm_qLote in FDetMedicamentos then Result := Result + ACBrStr('QUANTIDADE DO LOTE: ' )+ FormatFloat('###,##0.000', med.Items[i].qLote) + #13#10;
        if dm_dFab  in FDetMedicamentos then Result := Result + ACBrStr('DATA DE FABRICA��O: ') + DateToStr(med.Items[i].dFab) + #13#10;
        if dm_dVal  in FDetMedicamentos then Result := Result + ACBrStr('DATA DE VALIDADE: ')   + DateToStr(med.Items[i].dVal) + #13#10;
        if dm_vPMC  in FDetMedicamentos then Result := Result + ACBrStr('PRE�O M�X. CONSUMIDOR: R$ ') + FormatFloat('###,##0.00', med.Items[i].vPMC) + #13#10;
      end;
    end;
  end;
end;

Function TfrlDANFeRLRetrato.ManterArma( inItem:  integer  ) : String;
Var
  i : Integer;
begin
  Result := '';
  with FNFe.Det.Items[inItem].Prod do
  begin
    if arma.Count > 0 then
    begin
      for i := 0 to arma.Count - 1 do
      begin
        if da_tpArma in FDetArmamentos then Result := Result + ACBrStr('TIPO DE ARMA: ')   + ArmaTipoStr( arma.Items[i].tpArma ) + #13#10;
        if da_nSerie in FDetArmamentos then Result := Result + ACBrStr('No. S�RIE ARMA: ') + arma.Items[i].nSerie + #13#10;
        if da_nCano  in FDetArmamentos then Result := Result + ACBrStr('No. S�RIE CANO: ') + arma.Items[i].nCano + #13#10;
        if da_descr  in FDetArmamentos then Result := Result + ACBrStr('DESCRI��O ARMA: ') + arma.Items[i].descr + #13#10;
       end;
    end;
  end;
end;


Function TfrlDANFeRLRetrato.ManterCombustivel( inItem:  integer  ) : String;
begin
  Result := '';
  with FNFe.Det.Items[inItem].Prod do
  begin
    if comb.cProdANP > 0 then
    begin
      if dc_cProdANP    in FDetCombustiveis then Result := Result + ACBrStr('C�D. PRODUTO ANP: ') + IntToStr(comb.cProdANP) + #13#10;
      if dc_CODIF       in FDetCombustiveis then
                        if comb.CODIF > ''  then Result := Result + ACBrStr('AUTORIZA��O/CODIF: ') + comb.CODIF + #13#10;
      if dc_qTemp       in FDetCombustiveis then
                          if comb.qTemp > 0 then Result := Result + ACBrStr('QTD. FATURADA TEMP. AMBIENTE: ') +  FormatFloat('###,##0.0000', comb.qTemp) + #13#10;
      if dc_UFCons      in FDetCombustiveis then Result := Result + ACBrStr('UF DE CONSUMO: ') + comb.UFcons + #13#10;
      if comb.CIDE.qBCProd > 0 then
      begin
        if dc_qBCProd   in FDetCombustiveis then Result := Result + ACBrStr('BASE DE C�LCULO CIDE: ') + FormatFloat('###,##0.0000', comb.CIDE.qBCProd) + #13#10;
        if dc_vAliqProd in FDetCombustiveis then Result := Result + ACBrStr('AL�QUOTA CIDE: ') + FormatFloat('###,##0.0000', comb.CIDE.vAliqProd) + #13#10;
        if dc_vCIDE     in FDetCombustiveis then Result := Result + ACBrStr('VALOR CIDE: ') + FormatFloat('###,##0.00', comb.CIDE.vCIDE);
      end;

      if comb.encerrante.nBico > 0  then
      begin
        Result := Result + 'ENCERRANTE' + #13#10;
        Result := Result + 'BICO: ' +  IntToStr( comb.encerrante.nBico ) + #13#10;
        if comb.encerrante.nBomba > 0 then
          Result := Result + 'BOMBA: ' + IntToStr(comb.encerrante.nBomba) + #13#10;
        Result := Result + 'TANQUE: ' + IntToStr(comb.encerrante.nTanque) + #13#10;
        Result := Result + ACBrStr('NO IN�CIO: ' ) + comb.encerrante.vEncIni  + #13#10;
        Result := Result + 'NO FINAL: ' + comb.encerrante.vEncFin + #13#10;
      end;
    end;
  end;
end;

Function TfrlDANFeRLRetrato.ManterDesPro( dvDesc ,dvProd : Double) : Double;
begin
  if FImprimirDescPorc = True then
    Result := (dvDesc * 100) / dvProd
  else
    Result:= dvDesc;
end;

Function TfrlDANFeRLRetrato.ManterXpod( sXProd : String;  inItem : Integer ) : String;
begin
  Result := sXProd;
  if FImprimirDetalhamentoEspecifico = true then
  begin
    Result := Result + #13#10;
    Result := Result + ManterVeiculos( inItem );
    Result := Result + ManterMedicamentos( inItem );
    Result := Result + ManterArma( inItem );
    Result := Result + ManterCombustivel( inItem );
  end;
end;
end.
