{******************************************************************************}
{ Projeto: Componente ACBrMDFe                                                 }
{  Biblioteca multiplataforma de componentes Delphi                            }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
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
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{*******************************************************************************
|* Historico
|*
|* 01/08/2012: Italo Jurisato Junior
|*  - Doa��o do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrMDFeWebServices;

interface

uses
  Classes, SysUtils, synacode,
  ACBrDFe, ACBrDFeWebService,
  pmdfeMDFe,
  pcnRetConsReciDFe, pcnAuxiliar, pcnConversao, pmdfeConversaoMDFe,
  pmdfeProcMDFe, pmdfeEnvEventoMDFe, pmdfeRetEnvEventoMDFe,
  pmdfeRetConsSitMDFe, pmdfeRetConsMDFeNaoEnc, pmdfeRetEnvMDFe,
  pcnDistDFeInt, pcnRetDistDFeInt,
  ACBrMDFeManifestos, ACBrMDFeConfiguracoes;

type

  { TMDFeWebService }

  TMDFeWebService = class(TDFeWebService)
  private
  protected
    FPStatus: TStatusACBrMDFe;
    FPLayout: TLayOutMDFe;
    FPConfiguracoesMDFe: TConfiguracoesMDFe;

  protected
    procedure InicializarServico; override;
    procedure DefinirURL; override;
    function GerarVersaoDadosSoap: String; override;
    procedure FinalizarServico; override;

  public
    constructor Create(AOwner: TACBrDFe); override;
    procedure Clear; override;

    property Status: TStatusACBrMDFe read FPStatus;
    property Layout: TLayOutMDFe read FPLayout;
  end;

  { TMDFeStatusServico }

  TMDFeStatusServico = class(TMDFeWebService)
  private
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FdhRecbto: TDateTime;
    FTMed: Integer;
    FdhRetorno: TDateTime;
    FxObs: String;
  protected
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarMsgErro(E: Exception): String; override;
  public
    procedure Clear; override;

    property versao: String read Fversao;
    property tpAmb: TpcnTipoAmbiente read FtpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property xMotivo: String read FxMotivo;
    property cUF: Integer read FcUF;
    property dhRecbto: TDateTime read FdhRecbto;
    property TMed: Integer read FTMed;
    property dhRetorno: TDateTime read FdhRetorno;
    property xObs: String read FxObs;
  end;

  { TMDFeRecepcao }

  TMDFeRecepcao = class(TMDFeWebService)
  private
    FLote: String;
    FRecibo: String;
    FManifestos: TManifestos;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FcUF: Integer;
    FxMotivo: String;
    FdhRecbto: TDateTime;
    FTMed: Integer;
    FVersaoDF: TVersaoMDFe;
    FSincrono: Boolean;
    FMsgUnZip: String;

    FMDFeRetornoSincrono: TRetConsSitMDFe;
    FMDFeRetorno: TretEnvMDFe;

    function GetLote: String;
    function GetRecibo: String;
  protected
    procedure InicializarServico; override;
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; AManifestos: TManifestos);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property Recibo: String read GetRecibo;
    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property cUF: Integer read FcUF;
    property xMotivo: String read FxMotivo;
    property dhRecbto: TDateTime read FdhRecbto;
    property TMed: Integer read FTMed;
    property Lote: String read GetLote write FLote;
    property Sincrono: Boolean read FSincrono write FSincrono;
    property MsgUnZip: String read FMsgUnZip write FMsgUnZip;
  end;

  { TMDFeRetRecepcao }

  TMDFeRetRecepcao = class(TMDFeWebService)
  private
    FRecibo: String;
    FProtocolo: String;
    FChaveMDFe: String;
    FManifestos: TManifestos;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FcUF: Integer;
    FxMotivo: String;
    FcMsg: Integer;
    FxMsg: String;
    FVersaoDF: TVersaoMDFe;

    FMDFeRetorno: TRetConsReciDFe;

    function GetRecibo: String;
    function TratarRespostaFinal: Boolean;
  protected
    procedure InicializarServico; override;
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; AManifestos: TManifestos);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    function Executar: Boolean; override;

    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property cUF: Integer read FcUF;
    property xMotivo: String read FxMotivo;
    property cMsg: Integer read FcMsg;
    property xMsg: String read FxMsg;
    property Recibo: String read GetRecibo write FRecibo;
    property Protocolo: String read FProtocolo write FProtocolo;
    property ChaveMDFe: String read FChaveMDFe write FChaveMDFe;

    property MDFeRetorno: TRetConsReciDFe read FMDFeRetorno;
  end;

  { TMDFeRecibo }

  TMDFeRecibo = class(TMDFeWebService)
  private
    FManifestos: TManifestos;
    FRecibo: String;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FxMsg: String;
    FcMsg: Integer;
    FVersaoDF: TVersaoMDFe;

    FMDFeRetorno: TRetConsReciDFe;
  protected
    procedure InicializarServico; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirURL; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
  public
    constructor Create(AOwner: TACBrDFe; AManifestos: TManifestos);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property xMotivo: String read FxMotivo;
    property cUF: Integer read FcUF;
    property xMsg: String read FxMsg;
    property cMsg: Integer read FcMsg;
    property Recibo: String read FRecibo write FRecibo;

    property MDFeRetorno: TRetConsReciDFe read FMDFeRetorno;
  end;

  { TMDFeConsulta }

  TMDFeConsulta = class(TMDFeWebService)
  private
    FOwner: TACBrDFe;
    FManifestos: TManifestos;
    FMDFeChave: String;
    FProtocolo: String;
    FDhRecbto: TDateTime;
    FXMotivo: String;
    Fversao: String;
    FTpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FcUF: Integer;
    FRetMDFeDFe: String;

    FprotMDFe: TProcMDFe;
    FprocEventoMDFe: TRetEventoMDFeCollection;
    procedure SetMDFeChave(const AValue: String);
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function GerarUFSoap: String; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; AManifestos: TManifestos);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property MDFeChave: String read FMDFeChave write SetMDFeChave;
    property Protocolo: String read FProtocolo;
    property DhRecbto: TDateTime read FDhRecbto;
    property XMotivo: String read FXMotivo;
    property versao: String read Fversao;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;
    property verAplic: String read FverAplic;
    property cStat: Integer read FcStat;
    property cUF: Integer read FcUF;
    property RetMDFeDFe: String read FRetMDFeDFe;

    property protMDFe: TProcMDFe read FprotMDFe;
    property procEventoMDFe: TRetEventoMDFeCollection read FprocEventoMDFe;
  end;

  { TMDFeEnvEvento }

  TMDFeEnvEvento = class(TMDFeWebService)
  private
    FidLote: Integer;
    FEvento: TEventoMDFe;
    FcStat: Integer;
    FxMotivo: String;
    FTpAmb: TpcnTipoAmbiente;
    FCNPJ: String;

    FEventoRetorno: TRetEventoMDFe;

    function GerarPathEvento(const ACNPJ: String = ''; const AIE: String = ''): String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    procedure SalvarEnvio; override;
    function TratarResposta: Boolean; override;
    procedure SalvarResposta; override;

    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; AEvento: TEventoMDFe);
      reintroduce; overload;
    destructor Destroy; override;
    procedure Clear; override;

    property idLote: Integer read FidLote write FidLote;
    property cStat: Integer read FcStat;
    property xMotivo: String read FxMotivo;
    property TpAmb: TpcnTipoAmbiente read FTpAmb;

    property EventoRetorno: TRetEventoMDFe read FEventoRetorno;
  end;

  { TMDFeConsultaMDFeNaoEnc }

  TMDFeConsultaMDFeNaoEnc = Class(TMDFeWebService)
  private
    FOwner: TACBrDFe;
    FCNPJCPF: String;
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FInfMDFe: TRetInfMDFeCollection;
    FRetConsMDFeNaoEnc: TRetConsMDFeNaoEnc;
    FMsg: String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarMsgErro(E: Exception): String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;
    procedure Clear; override;

    property CNPJCPF: String                read FCNPJCPF write FCNPJCPF;
    property versao: String                 read Fversao;
    property tpAmb: TpcnTipoAmbiente        read FtpAmb;
    property verAplic: String               read FverAplic;
    property cStat: Integer                 read FcStat;
    property xMotivo: String                read FxMotivo;
    property cUF: Integer                   read FcUF;
    property InfMDFe: TRetInfMDFeCollection read FInfMDFe;
    property Msg: String                    read FMsg;
  end;

  { TDistribuicaoDFe }

  TDistribuicaoDFe = class(TMDFeWebService)
  private
    FCNPJCPF: String;
    FultNSU: String;
    FNSU: String;
    FchMDFe: String;
    FNomeArq: String;
    FlistaArqs: TStringList;

    FretDistDFeInt: TretDistDFeInt;

    function GerarPathDistribuicao(AItem :TdocZipCollectionItem): String;
  protected
//    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgLog: String; override;
    function GerarMsgErro(E: Exception): String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;
    procedure Clear; override;

    property CNPJCPF: String read FCNPJCPF write FCNPJCPF;
    property ultNSU: String read FultNSU write FultNSU;
    property NSU: String read FNSU write FNSU;
    property chMDFe: String read FchMDFe write FchMDFe;
    property NomeArq: String read FNomeArq;
    property ListaArqs: TStringList read FlistaArqs;

    property retDistDFeInt: TretDistDFeInt read FretDistDFeInt;
  end;

 { TMDFeEnvioWebService }

  TMDFeEnvioWebService = class(TMDFeWebService)
  private
    FXMLEnvio: String;
    FPURLEnvio: String;
    FVersao: String;
    FSoapActionEnvio: String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;

    function GerarMsgErro(E: Exception): String; override;
    function GerarVersaoDadosSoap: String; override;
  public
    constructor Create(AOwner: TACBrDFe); override;
    destructor Destroy; override;
    procedure Clear; override;

    function Executar: Boolean; override;

    property Versao: String read FVersao;
    property XMLEnvio: String read FXMLEnvio write FXMLEnvio;
    property URLEnvio: String read FPURLEnvio write FPURLEnvio;
    property SoapActionEnvio: String read FSoapActionEnvio write FSoapActionEnvio;
  end;

  { TWebServices }

  TWebServices = class
  private
    FACBrMDFe: TACBrDFe;
    FStatusServico: TMDFeStatusServico;
    FEnviar: TMDFeRecepcao;
    FRetorno: TMDFeRetRecepcao;
    FRecibo: TMDFeRecibo;
    FConsulta: TMDFeConsulta;
    FEnvEvento: TMDFeEnvEvento;
    FConsMDFeNaoEnc: TMDFeConsultaMDFeNaoEnc;
    FDistribuicaoDFe: TDistribuicaoDFe;
    FEnvioWebService: TMDFeEnvioWebService;
  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;

    function Envia(ALote: Integer; ASincrono:  Boolean = False): Boolean; overload;
    function Envia(const ALote: String; ASincrono:  Boolean = False): Boolean; overload;
    function ConsultaMDFeNaoEnc(const ACNPJCPF: String): Boolean;

    property ACBrMDFe: TACBrDFe read FACBrMDFe write FACBrMDFe;
    property StatusServico: TMDFeStatusServico read FStatusServico write FStatusServico;
    property Enviar: TMDFeRecepcao read FEnviar write FEnviar;
    property Retorno: TMDFeRetRecepcao read FRetorno write FRetorno;
    property Recibo: TMDFeRecibo read FRecibo write FRecibo;
    property Consulta: TMDFeConsulta read FConsulta write FConsulta;
    property EnvEvento: TMDFeEnvEvento read FEnvEvento write FEnvEvento;
    property ConsMDFeNaoEnc: TMDFeConsultaMDFeNaoEnc read FConsMDFeNaoEnc write FConsMDFeNaoEnc;
    property DistribuicaoDFe: TDistribuicaoDFe read FDistribuicaoDFe write FDistribuicaoDFe;
    property EnvioWebService: TMDFeEnvioWebService read FEnvioWebService write FEnvioWebService;
  end;

implementation

uses
  StrUtils, Math,
  ACBrUtil, ACBrCompress, ACBrMDFe,
  pcnGerador, pcnLeitor, pcnConsStatServ, pcnRetConsStatServ,
  pmdfeConsSitMDFe, pcnConsReciDFe, pmdfeConsMDFeNaoEnc;

{ TMDFeWebService }

constructor TMDFeWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPConfiguracoesMDFe := TConfiguracoesMDFe(FPConfiguracoes);
  FPLayout := LayMDFeStatusServico;

  FPHeaderElement := 'mdfeCabecMsg';
  FPBodyElement := 'mdfeDadosMsg';
end;

procedure TMDFeWebService.Clear;
begin
  inherited Clear;

  FPStatus := stMDFeIdle;
  FPDFeOwner.SSL.UseCertificateHTTP := True;
end;

procedure TMDFeWebService.InicializarServico;
begin
  { Sobrescrever apenas se necess�rio }
  inherited InicializarServico;

  TACBrMDFe(FPDFeOwner).SetStatus(FPStatus);
end;

procedure TMDFeWebService.DefinirURL;
var
  Versao: Double;
begin
  { sobrescrever apenas se necess�rio.
    Voc� tamb�m pode mudar apenas o valor de "FLayoutServico" na classe
    filha e chamar: Inherited;     }

  Versao := 0;
  FPVersaoServico := '';
  FPURL := '';

  TACBrMDFe(FPDFeOwner).LerServicoDeParams(FPLayout, Versao, FPURL);
  FPVersaoServico := FloatToString(Versao, '.', '0.00');
end;

function TMDFeWebService.GerarVersaoDadosSoap: String;
begin
  { Sobrescrever apenas se necess�rio }

  if EstaVazio(FPVersaoServico) then
    FPVersaoServico := TACBrMDFe(FPDFeOwner).LerVersaoDeParams(FPLayout);

  Result := '<versaoDados>' + FPVersaoServico + '</versaoDados>';
end;

procedure TMDFeWebService.FinalizarServico;
begin
  { Sobrescrever apenas se necess�rio }

  TACBrMDFe(FPDFeOwner).SetStatus(stMDFeIdle);
end;

{ TMDFeStatusServico }

procedure TMDFeStatusServico.Clear;
begin
  inherited Clear;

  FPStatus := stMDFeStatusServico;
  FPLayout := LayMDFeStatusServico;
  FPArqEnv := 'ped-sta';
  FPArqResp := 'sta';

  Fversao := '';
  FverAplic := '';
  FcStat := 0;
  FxMotivo := '';
  FdhRecbto := 0;
  FTMed := 0;
  FdhRetorno := 0;
  FxObs := '';

  if Assigned(FPConfiguracoesMDFe) then
  begin
    FtpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end
end;

procedure TMDFeStatusServico.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'MDFeStatusServico';
  FPSoapAction := FPServico + '/mdfeStatusServicoMDF';
end;

procedure TMDFeStatusServico.DefinirDadosMsg;
var
  ConsStatServ: TConsStatServ;
begin
  ConsStatServ := TConsStatServ.Create(FPVersaoServico, NAME_SPACE_MDFE, 'MDFe', False);
  try
    ConsStatServ.TpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    ConsStatServ.CUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
//    ConsStatServ.Versao := FPVersaoServico;

    AjustarOpcoes( ConsStatServ.Gerador.Opcoes );

    ConsStatServ.GerarXML;

    // Atribuindo o XML para propriedade interna //
    FPDadosMsg := ConsStatServ.Gerador.ArquivoFormatoXML;
  finally
    ConsStatServ.Free;
  end;
end;

function TMDFeStatusServico.TratarResposta: Boolean;
var
  MDFeRetorno: TRetConsStatServ;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'mdfeStatusServicoMDFResult');

  MDFeRetorno := TRetConsStatServ.Create('MDFe');
  try
    MDFeRetorno.Leitor.Arquivo := ParseText(FPRetWS);
    MDFeRetorno.LerXml;

    Fversao := MDFeRetorno.versao;
    FtpAmb := MDFeRetorno.tpAmb;
    FverAplic := MDFeRetorno.verAplic;
    FcStat := MDFeRetorno.cStat;
    FxMotivo := MDFeRetorno.xMotivo;
    FcUF := MDFeRetorno.cUF;
    FdhRecbto := MDFeRetorno.dhRecbto;
    FTMed := MDFeRetorno.TMed;
    FdhRetorno := MDFeRetorno.dhRetorno;
    FxObs := MDFeRetorno.xObs;
    FPMsg := FxMotivo + LineBreak + FxObs;

    if FPConfiguracoesMDFe.WebServices.AjustaAguardaConsultaRet then
      FPConfiguracoesMDFe.WebServices.AguardarConsultaRet := FTMed * 1000;

    Result := (FcStat = 107);

  finally
    MDFeRetorno.Free;
  end;
end;

function TMDFeStatusServico.GerarMsgLog: String;
begin
  Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                           'Ambiente: %s' + LineBreak +
                           'Vers�o Aplicativo: %s ' + LineBreak +
                           'Status C�digo: %s' + LineBreak +
                           'Status Descri��o: %s' + LineBreak +
                           'UF: %s' + LineBreak +
                           'Recebimento: %s' + LineBreak +
                           'Tempo M�dio: %s' + LineBreak +
                           'Retorno: %s' + LineBreak +
                           'Observa��o: %s' + LineBreak),
                   [Fversao, TpAmbToStr(FtpAmb), FverAplic, IntToStr(FcStat),
                    FxMotivo, CodigoParaUF(FcUF),
                    IfThen(FdhRecbto = 0, '', FormatDateTimeBr(FdhRecbto)),
                    IntToStr(FTMed),
                    IfThen(FdhRetorno = 0, '', FormatDateTimeBr(FdhRetorno)),
                    FxObs]);
end;

function TMDFeStatusServico.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService Consulta Status servi�o:' + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

{ TMDFeRecepcao }

constructor TMDFeRecepcao.Create(AOwner: TACBrDFe; AManifestos: TManifestos);
begin
  inherited Create(AOwner);

  FManifestos := AManifestos;
end;

destructor TMDFeRecepcao.Destroy;
begin
  FMDFeRetornoSincrono.Free;
  FMDFeRetorno.Free;

  inherited Destroy;
end;

procedure TMDFeRecepcao.Clear;
begin
  inherited Clear;

  FPStatus := stMDFeRecepcao;
  FPLayout := LayMDFeRecepcao;
  FPArqEnv := 'env-lot';
  FPArqResp := 'rec';

  Fversao := '';
  FTMed := 0;
  FverAplic := '';
  FcStat    := 0;
  FxMotivo  := '';
  FRecibo   := '';
  FdhRecbto := 0;

  if Assigned(FPConfiguracoesMDFe) then
  begin
    FtpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  if Assigned(FMDFeRetornoSincrono) then
    FMDFeRetornoSincrono.Free;

  if Assigned(FMDFeRetorno) then
    FMDFeRetorno.Free;

  FMDFeRetornoSincrono := TRetConsSitMDFe.Create;
  FMDFeRetorno := TretEnvMDFe.Create;
end;

function TMDFeRecepcao.GetLote: String;
begin
  Result := Trim(FLote);
end;

function TMDFeRecepcao.GetRecibo: String;
begin
  Result := Trim(FRecibo);
end;

procedure TMDFeRecepcao.InicializarServico;
var
  ok: Boolean;
begin
  if FManifestos.Count > 0 then    // Tem MDFe ? Se SIM, use as informa��es do XML
    FVersaoDF := DblToVersaoMDFe(ok, FManifestos.Items[0].MDFe.infMDFe.Versao)
  else
    FVersaoDF := FPConfiguracoesMDFe.Geral.VersaoDF;

  inherited InicializarServico;
end;

procedure TMDFeRecepcao.DefinirURL;
var
  Modelo: String;
  VerServ: Double;
begin
  if FManifestos.Count > 0 then    // Tem MDFe ? Se SIM, use as informa��es do XML
  begin
    FcUF := FManifestos.Items[0].MDFe.Ide.cUF;

    if FPConfiguracoesMDFe.WebServices.Ambiente <> FManifestos.Items[0].MDFe.Ide.tpAmb then
      raise EACBrMDFeException.Create( ACBRMDFE_CErroAmbDiferente );
  end
  else
  begin                              // Se n�o tem MDFe, use as configura��es do componente
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  if Sincrono then
    FPLayout := LayMDFeRecepcaoSinc
  else
    FPLayout := LayMDFeRecepcao;

  VerServ := VersaoMDFeToDbl(FVersaoDF);
  Modelo := 'MDFe';
  FTpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
  FPVersaoServico := '';
  FPURL := '';

  TACBrMDFe(FPDFeOwner).LerServicoDeParams(
    Modelo,
    CUFtoUF(FcUF),
    FTpAmb,
    LayOutToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TMDFeRecepcao.DefinirServicoEAction;
begin
  if Sincrono then
  begin
    FPServico := GetUrlWsd + 'MDFeRecepcaoSinc';
    FPSoapAction := FPServico + '/mdfeRecepcao';
  end
  else
  begin
    FPServico := GetUrlWsd + 'MDFeRecepcao';
    FPSoapAction := FPServico + '/mdfeRecepcaoLote';
  end;
end;

procedure TMDFeRecepcao.DefinirDadosMsg;
var
  I: Integer;
  vMDFe: String;
begin
  if Sincrono then
  begin
    // No envio s� podemos ter apena UM MDF-e, pois o seu processamento � s�ncrono
    if FManifestos.Count > 1 then
      GerarException(ACBrStr('ERRO: Conjunto de MDF-e transmitidos (m�ximo de 1 MDF-e)' +
             ' excedido. Quantidade atual: ' + IntToStr(FManifestos.Count)));

    if FManifestos.Count > 0 then
      FPDadosMsg := '<MDFe' +
        RetornarConteudoEntre(FManifestos.Items[0].XMLAssinado, '<MDFe', '</MDFe>') +
        '</MDFe>';

    FMsgUnZip := FPDadosMsg;

    FPDadosMsg := EncodeBase64(GZipCompress(FPDadosMsg));
  end
  else
  begin
    vMDFe := '';

    for I := 0 to FManifestos.Count - 1 do
      vMDFe := vMDFe + '<MDFe' + RetornarConteudoEntre(
        FManifestos.Items[I].XMLAssinado, '<MDFe', '</MDFe>') + '</MDFe>';

    FPDadosMsg := '<enviMDFe xmlns="' + ACBRMDFE_NAMESPACE + '" versao="' +
      FPVersaoServico + '">' + '<idLote>' + FLote + '</idLote>' +
      vMDFe + '</enviMDFe>';
  end;

  // Lote tem mais de 1024kb ? //
  if Length(FPDadosMsg) > (1024 * 1024) then
    GerarException(ACBrStr('Tamanho do XML de Dados superior a 1024 Kbytes. Tamanho atual: ' +
      IntToStr(trunc(Length(FPDadosMsg) / 1024)) + ' Kbytes'));

  FRecibo := '';
end;

function TMDFeRecepcao.TratarResposta: Boolean;
var
  I: integer;
  chMDFe, AXML, NomeXMLSalvo: String;
  AProcMDFe: TProcMDFe;
  SalvarXML: Boolean;
begin
  FPRetWS := SeparaDadosArray(['mdfeRecepcaoLoteResult',
                               'mdfeRecepcaoResult'],FPRetornoWS );

  if Sincrono then
  begin
    if pos('retMDFe', FPRetWS) > 0 then
      AXML := StringReplace(FPRetWS, 'retMDFe', 'retConsSitMDFe',
                                     [rfReplaceAll, rfIgnoreCase])
    else
      AXML := FPRetWS;

    FMDFeRetornoSincrono.Leitor.Arquivo := ParseText(AXML);
    FMDFeRetornoSincrono.LerXml;

    Fversao := FMDFeRetornoSincrono.versao;
    FTpAmb := FMDFeRetornoSincrono.TpAmb;
    FverAplic := FMDFeRetornoSincrono.verAplic;

    FcUF := FMDFeRetornoSincrono.cUF;
    chMDFe := FMDFeRetornoSincrono.ProtMDFe.chMDFe;

    if (FMDFeRetornoSincrono.protMDFe.cStat > 0) then
      FcStat := FMDFeRetornoSincrono.protMDFe.cStat
    else
      FcStat := FMDFeRetornoSincrono.cStat;

    if (FMDFeRetornoSincrono.protMDFe.xMotivo <> '') then
    begin
      FPMsg := FMDFeRetornoSincrono.protMDFe.xMotivo;
      FxMotivo := FMDFeRetornoSincrono.protMDFe.xMotivo;
    end
    else
    begin
      FPMsg := FMDFeRetornoSincrono.xMotivo;
      FxMotivo := FMDFeRetornoSincrono.xMotivo;
    end;

    // Verificar se a MDF-e foi autorizado com sucesso
    Result := (FMDFeRetornoSincrono.cStat = 100) and
      (TACBrMDFe(FPDFeOwner).CstatProcessado(FMDFeRetornoSincrono.protMDFe.cStat));

    if Result then
    begin
      for I := 0 to TACBrMDFe(FPDFeOwner).Manifestos.Count - 1 do
      begin
        with TACBrMDFe(FPDFeOwner).Manifestos.Items[I] do
        begin
          if OnlyNumber(chMDFe) = NumID then
          begin
            if (FPConfiguracoesMDFe.Geral.ValidarDigest) and
               (FMDFeRetornoSincrono.protMDFe.digVal <> '') and
               (MDFe.signature.DigestValue <> FMDFeRetornoSincrono.protMDFe.digVal) then
            begin
              raise EACBrMDFeException.Create('DigestValue do documento ' + NumID + ' n�o confere.');
            end;

            MDFe.procMDFe.cStat := FMDFeRetornoSincrono.protMDFe.cStat;
            MDFe.procMDFe.tpAmb := FMDFeRetornoSincrono.tpAmb;
            MDFe.procMDFe.verAplic := FMDFeRetornoSincrono.verAplic;
            MDFe.procMDFe.chMDFe := FMDFeRetornoSincrono.protMDFe.chMDFe;
            MDFe.procMDFe.dhRecbto := FMDFeRetornoSincrono.protMDFe.dhRecbto;
            MDFe.procMDFe.nProt := FMDFeRetornoSincrono.protMDFe.nProt;
            MDFe.procMDFe.digVal := FMDFeRetornoSincrono.protMDFe.digVal;
            MDFe.procMDFe.xMotivo := FMDFeRetornoSincrono.protMDFe.xMotivo;

            AProcMDFe := TProcMDFe.Create;
            try
              // Processando em UTF8, para poder gravar arquivo corretamente //
              AProcMDFe.XML_MDFe := RemoverDeclaracaoXML(XMLAssinado);
              AProcMDFe.XML_Prot := FMDFeRetornoSincrono.XMLprotMDFe;
              AProcMDFe.Versao := FPVersaoServico;
              AjustarOpcoes( AProcMDFe.Gerador.Opcoes );
              AProcMDFe.GerarXML;

              XMLOriginal := AProcMDFe.Gerador.ArquivoFormatoXML;

              if FPConfiguracoesMDFe.Arquivos.Salvar then
              begin
                SalvarXML := (not FPConfiguracoesMDFe.Arquivos.SalvarApenasMDFeProcessados) or
                             Processado;

                // Salva o XML do MDF-e assinado e protocolado
                if SalvarXML then
                begin
                  NomeXMLSalvo := '';
                  if NaoEstaVazio(NomeArq) and FileExists(NomeArq) then
                  begin
                    FPDFeOwner.Gravar( NomeArq, XMLOriginal ); // Atualiza o XML carregado
                    NomeXMLSalvo := NomeArq;
                  end;

                  if (NomeXMLSalvo <> CalcularNomeArquivoCompleto()) then
                    GravarXML; // Salva na pasta baseado nas configura��es do PathMDFe
                end;
              end ;
            finally
              AProcMDFe.Free;
            end;

            Break;
          end;
        end;
      end;
    end;
  end
  else
  begin
    FMDFeRetorno.Leitor.Arquivo := ParseText(FPRetWS);
    FMDFeRetorno.LerXml;

    Fversao := FMDFeRetorno.versao;
    FTpAmb := FMDFeRetorno.TpAmb;
    FverAplic := FMDFeRetorno.verAplic;
    FcStat := FMDFeRetorno.cStat;
    FxMotivo := FMDFeRetorno.xMotivo;
    FdhRecbto := FMDFeRetorno.infRec.dhRecbto;
    FTMed := FMDFeRetorno.infRec.tMed;
    FcUF := FMDFeRetorno.cUF;
    FPMsg := FMDFeRetorno.xMotivo;
    FRecibo := FMDFeRetorno.infRec.nRec;

    Result := (FMDFeRetorno.CStat = 103);
  end;
end;

function TMDFeRecepcao.GerarMsgLog: String;
begin
  {(*}
  if Sincrono then
    Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Vers�o Aplicativo: %s ' + LineBreak +
                           'Status C�digo: %s ' + LineBreak +
                           'Status Descri��o: %s ' + LineBreak +
                           'UF: %s ' + sLineBreak +
                           'dhRecbto: %s ' + sLineBreak +
                           'chMDFe: %s ' + LineBreak),
                     [FMDFeRetornoSincrono.versao,
                      TpAmbToStr(FMDFeRetornoSincrono.TpAmb),
                      FMDFeRetornoSincrono.verAplic,
                      IntToStr(FMDFeRetornoSincrono.protMDFe.cStat),
                      FMDFeRetornoSincrono.protMDFe.xMotivo,
                      CodigoParaUF(FMDFeRetornoSincrono.cUF),
                      FormatDateTimeBr(FMDFeRetornoSincrono.protMDFe.dhRecbto),
                      FMDFeRetornoSincrono.chMDFe])
  else
    Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                             'Ambiente: %s ' + LineBreak +
                             'Vers�o Aplicativo: %s ' + LineBreak +
                             'Status C�digo: %s ' + LineBreak +
                             'Status Descri��o: %s ' + LineBreak +
                             'UF: %s ' + sLineBreak +
                             'Recibo: %s ' + LineBreak +
                             'Recebimento: %s ' + LineBreak +
                             'Tempo M�dio: %s ' + LineBreak),
                       [FMDFeRetorno.versao,
                        TpAmbToStr(FMDFeRetorno.TpAmb),
                        FMDFeRetorno.verAplic,
                        IntToStr(FMDFeRetorno.cStat),
                        FMDFeRetorno.xMotivo,
                        CodigoParaUF(FMDFeRetorno.cUF),
                        FMDFeRetorno.infRec.nRec,
                        IfThen(FMDFeRetorno.InfRec.dhRecbto = 0, '',
                               FormatDateTimeBr(FMDFeRetorno.InfRec.dhRecbto)),
                        IntToStr(FMDFeRetorno.InfRec.TMed)]);
  {*)}
end;

function TMDFeRecepcao.GerarPrefixoArquivo: String;
begin
  if Sincrono then  // Esta procesando nome do Retorno Sincrono ?
  begin
    if FRecibo <> '' then
    begin
      Result := Recibo;
      FPArqResp := 'pro-rec';
    end
    else
    begin
      Result := Lote;
      FPArqResp := 'pro-lot';
    end;
  end
  else
    Result := Lote;
end;

{ TMDFeRetRecepcao }

constructor TMDFeRetRecepcao.Create(AOwner: TACBrDFe; AManifestos: TManifestos);
begin
  inherited Create(AOwner);

  FManifestos := AManifestos;
end;

destructor TMDFeRetRecepcao.Destroy;
begin
  FMDFeRetorno.Free;

  inherited Destroy;
end;

procedure TMDFeRetRecepcao.InicializarServico;
var
  ok: Boolean;
begin
  if FManifestos.Count > 0 then    // Tem MDFe ? Se SIM, use as informa��es do XML
    FVersaoDF := DblToVersaoMDFe(ok, FManifestos.Items[0].MDFe.infMDFe.Versao)
  else
    FVersaoDF := FPConfiguracoesMDFe.Geral.VersaoDF;

  inherited InicializarServico;
end;

procedure TMDFeRetRecepcao.Clear;
var
  i, j: Integer;
begin
  inherited Clear;

  FPStatus := stMDFeRetRecepcao;
  FPLayout := LayMDFeRetRecepcao;
  FPArqEnv := 'ped-rec';
  FPArqResp := 'pro-rec';

  FverAplic := '';
  FcStat := 0;
  FxMotivo := '';
  Fversao := '';
  FxMsg := '';
  FcMsg := 0;

  if Assigned(FPConfiguracoesMDFe) then
  begin
    FtpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  if Assigned(FMDFeRetorno) and Assigned(FManifestos) then
  begin
    // Limpa Dados dos retornos dos manifestos
    for i := 0 to FMDFeRetorno.ProtDFe.Count - 1 do
    begin
      for j := 0 to FManifestos.Count - 1 do
      begin
        if OnlyNumber(FMDFeRetorno.ProtDFe.Items[i].chDFe) = FManifestos.Items[J].NumID then
        begin
          FManifestos.Items[j].MDFe.procMDFe.verAplic := '';
          FManifestos.Items[j].MDFe.procMDFe.chMDFe   := '';
          FManifestos.Items[j].MDFe.procMDFe.dhRecbto := 0;
          FManifestos.Items[j].MDFe.procMDFe.nProt    := '';
          FManifestos.Items[j].MDFe.procMDFe.digVal   := '';
          FManifestos.Items[j].MDFe.procMDFe.cStat    := 0;
          FManifestos.Items[j].MDFe.procMDFe.xMotivo  := '';
        end;
      end;
    end;

    FreeAndNil(FMDFeRetorno);
  end;

  FMDFeRetorno := TRetConsReciDFe.Create('MDFe');
end;

function TMDFeRetRecepcao.GetRecibo: String;
begin
  Result := Trim(FRecibo);
end;

function TMDFeRetRecepcao.Executar: Boolean;
var
  IntervaloTentativas, Tentativas: Integer;
begin
  Result := False;

  TACBrMDFe(FPDFeOwner).SetStatus(stMDFeRetRecepcao);
  try
    Sleep(FPConfiguracoesMDFe.WebServices.AguardarConsultaRet);

    Tentativas := 0; // Inicializa o contador de tentativas
    IntervaloTentativas := max(FPConfiguracoesMDFe.WebServices.IntervaloTentativas, 1000);

    while (inherited Executar) and
      (Tentativas < FPConfiguracoesMDFe.WebServices.Tentativas) do
    begin
      Inc(Tentativas);
      sleep(IntervaloTentativas);
    end;
  finally
    TACBrMDFe(FPDFeOwner).SetStatus(stMDFeIdle);
  end;

  if FMDFeRetorno.CStat = 104 then  // Lote processado ?
    Result := TratarRespostaFinal;
end;

procedure TMDFeRetRecepcao.DefinirURL;
var
  Modelo: String;
  VerServ: Double;
begin
  FPLayout := LayMDFeRetRecepcao;

  if FManifestos.Count > 0 then    // Tem MDFe ? Se SIM, use as informa��es do XML
  begin
    FcUF := FManifestos.Items[0].MDFe.Ide.cUF;

    if FPConfiguracoesMDFe.WebServices.Ambiente <> FManifestos.Items[0].MDFe.Ide.tpAmb then
      raise EACBrMDFeException.Create( ACBRMDFE_CErroAmbDiferente );
  end
  else
  begin     // Se n�o tem MDFe, use as configura��es do componente
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  VerServ := VersaoMDFeToDbl(FVersaoDF);
  Modelo := 'MDFe';
  FTpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
  FPVersaoServico := '';
  FPURL := '';

  TACBrMDFe(FPDFeOwner).LerServicoDeParams(
    Modelo,
    CUFtoUF(FcUF),
    FTpAmb,
    LayOutToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TMDFeRetRecepcao.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'MDFeRetRecepcao';
  FPSoapAction := FPServico + '/mdfeRetRecepcao';
end;

procedure TMDFeRetRecepcao.DefinirDadosMsg;
var
  ConsReciMDFe: TConsReciDFe;
begin
  ConsReciMDFe := TConsReciDFe.Create(FPVersaoServico, NAME_SPACE_MDFE, 'MDFe');
  try
    ConsReciMDFe.tpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    ConsReciMDFe.nRec := FRecibo;
//    ConsReciMDFe.Versao := FPVersaoServico;

    AjustarOpcoes( ConsReciMDFe.Gerador.Opcoes );

    ConsReciMDFe.GerarXML;

    FPDadosMsg := ConsReciMDFe.Gerador.ArquivoFormatoXML;
  finally
    ConsReciMDFe.Free;
  end;
end;

function TMDFeRetRecepcao.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'mdfeRetRecepcaoResult');

  FMDFeRetorno.Leitor.Arquivo := ParseText(FPRetWS);
  FMDFeRetorno.LerXML;

  Fversao := FMDFeRetorno.versao;
  FTpAmb := FMDFeRetorno.TpAmb;
  FverAplic := FMDFeRetorno.verAplic;
  FcStat := FMDFeRetorno.cStat;
  FcUF := FMDFeRetorno.cUF;
  FPMsg := FMDFeRetorno.xMotivo;
  FxMotivo := FMDFeRetorno.xMotivo;
  FcMsg := FMDFeRetorno.cMsg;
  FxMsg := FMDFeRetorno.xMsg;

  Result := (FMDFeRetorno.CStat = 105); // Lote em Processamento
end;

function TMDFeRetRecepcao.TratarRespostaFinal: Boolean;
var
  I, J: Integer;
  AProcMDFe: TProcMDFe;
  AInfProt: TProtDFeCollection;
  SalvarXML: Boolean;
  NomeXMLSalvo: String;
begin
  Result := False;

  AInfProt := FMDFeRetorno.ProtDFe;

  if (AInfProt.Count > 0) then
  begin
    FPMsg := FMDFeRetorno.ProtDFe.Items[0].xMotivo;
    FxMotivo := FMDFeRetorno.ProtDFe.Items[0].xMotivo;
  end;

  //Setando os retornos dos Manifestos;
  for I := 0 to AInfProt.Count - 1 do
  begin
    for J := 0 to FManifestos.Count - 1 do
    begin
      if OnlyNumber(AInfProt.Items[I].chDFe) = FManifestos.Items[J].NumID then
      begin
        if (TACBrMDFe(FPDFeOwner).Configuracoes.Geral.ValidarDigest) and
          (FManifestos.Items[J].MDFe.signature.DigestValue <>
          AInfProt.Items[I].digVal) and (AInfProt.Items[I].digVal <> '') then
        begin
          raise EACBrMDFeException.Create('DigestValue do documento ' +
            FManifestos.Items[J].NumID + ' n�o confere.');
        end;

        with FManifestos.Items[J] do
        begin
          MDFe.procMDFe.tpAmb := AInfProt.Items[I].tpAmb;
          MDFe.procMDFe.verAplic := AInfProt.Items[I].verAplic;
          MDFe.procMDFe.chMDFe := AInfProt.Items[I].chDFe;
          MDFe.procMDFe.dhRecbto := AInfProt.Items[I].dhRecbto;
          MDFe.procMDFe.nProt := AInfProt.Items[I].nProt;
          MDFe.procMDFe.digVal := AInfProt.Items[I].digVal;
          MDFe.procMDFe.cStat := AInfProt.Items[I].cStat;
          MDFe.procMDFe.xMotivo := AInfProt.Items[I].xMotivo;
        end;

        // Monta o XML do MDF-e assinado e com o protocolo de Autoriza��o
        if (AInfProt.Items[I].cStat = 100) then
        begin
          AProcMDFe := TProcMDFe.Create;
          try
            AProcMDFe.XML_MDFe := RemoverDeclaracaoXML(FManifestos.Items[J].XMLAssinado);
            AProcMDFe.XML_Prot := AInfProt.Items[I].XMLprotDFe;
            AProcMDFe.Versao := FPVersaoServico;
            AProcMDFe.GerarXML;

            with FManifestos.Items[J] do
            begin
              XMLOriginal := AProcMDFe.Gerador.ArquivoFormatoXML;

              if FPConfiguracoesMDFe.Arquivos.Salvar then
              begin
                SalvarXML := (not FPConfiguracoesMDFe.Arquivos.SalvarApenasMDFeProcessados) or
                             Processado;

                // Salva o XML do MDF-e assinado e protocolado
                if SalvarXML then
                begin
                  NomeXMLSalvo := '';
                  if NaoEstaVazio(NomeArq) and FileExists(NomeArq) then
                  begin
                    FPDFeOwner.Gravar( NomeArq, XMLOriginal );  // Atualiza o XML carregado
                    NomeXMLSalvo := NomeArq;
                  end;

                  if (NomeXMLSalvo <> CalcularNomeArquivoCompleto()) then
                    GravarXML; // Salva na pasta baseado nas configura��es do PathMDFe

//                  FPDFeOwner.Gravar(AInfProt.Items[I].chMDFe + '-mdfe.xml',
//                                    XMLOriginal,
//                                    PathWithDelim(FPConfiguracoesMDFe.Arquivos.GetPathMDFe(0)));
                end;
              end;
            end;
          finally
            AProcMDFe.Free;
          end;
        end;

        break;
      end;
    end;
  end;

  //Verificando se existe algum Manifesto confirmado
  for I := 0 to FManifestos.Count - 1 do
  begin
    if FManifestos.Items[I].Confirmado then
    begin
      Result := True;
      break;
    end;
  end;

  //Verificando se existe algum Manifesto nao confirmado
  for I := 0 to FManifestos.Count - 1 do
  begin
    if not FManifestos.Items[I].Confirmado then
    begin
      FPMsg := ACBrStr('Manifesto(s) n�o confirmado(s):') + LineBreak;
      break;
    end;
  end;

  //Montando a mensagem de retorno para os Manifestos nao confirmados
  for I := 0 to FManifestos.Count - 1 do
  begin
    if not FManifestos.Items[I].Confirmado then
      FPMsg := FPMsg + IntToStr(FManifestos.Items[I].MDFe.Ide.nMDF) +
        '->' + IntToStr(FManifestos.Items[I].cStat) + '-' + FManifestos.Items[I].Msg + LineBreak;
  end;

  if AInfProt.Count > 0 then
  begin
    FChaveMDFe := AInfProt.Items[0].chDFe;
    FProtocolo := AInfProt.Items[0].nProt;
    FcStat := AInfProt.Items[0].cStat;
  end;
end;

procedure TMDFeRetRecepcao.FinalizarServico;
begin
  // Sobrescrito, para n�o liberar para stIdle... n�o ainda...;
end;

function TMDFeRetRecepcao.GerarMsgLog: String;
begin
  Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Vers�o Aplicativo: %s ' + LineBreak +
                           'Recibo: %s ' + LineBreak +
                           'Status C�digo: %s ' + LineBreak +
                           'Status Descri��o: %s ' + LineBreak +
                           'UF: %s ' + LineBreak +
                           'cMsg: %s ' + LineBreak +
                           'xMsg: %s ' + LineBreak),
                   [FMDFeRetorno.versao, TpAmbToStr(FMDFeRetorno.tpAmb),
                    FMDFeRetorno.verAplic, FMDFeRetorno.nRec,
                    IntToStr(FMDFeRetorno.cStat), FMDFeRetorno.xMotivo,
                    CodigoParaUF(FMDFeRetorno.cUF), IntToStr(FMDFeRetorno.cMsg),
                    FMDFeRetorno.xMsg]);
end;

function TMDFeRetRecepcao.GerarPrefixoArquivo: String;
begin
  Result := Recibo;
end;

{ TMDFeRecibo }

constructor TMDFeRecibo.Create(AOwner: TACBrDFe; AManifestos: TManifestos);
begin
  inherited Create(AOwner);

  FManifestos := AManifestos;
end;

destructor TMDFeRecibo.Destroy;
begin
  FMDFeRetorno.Free;

  inherited Destroy;
end;

procedure TMDFeRecibo.Clear;
begin
  inherited Clear;

  FPStatus := stMDFeRecibo;
  FPLayout := LayMDFeRetRecepcao;
  FPArqEnv := 'ped-rec';
  FPArqResp := 'pro-rec';

  Fversao := '';
  FxMsg := '';
  FcMsg := 0;
  FverAplic := '';
  FcStat    := 0;
  FxMotivo  := '';

  if Assigned(FPConfiguracoesMDFe) then
  begin
    FtpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  if Assigned(FMDFeRetorno) then
    FMDFeRetorno.Free;

  FMDFeRetorno := TRetConsReciDFe.Create('MDFe');
end;

procedure TMDFeRecibo.InicializarServico;
var
  ok: Boolean;
begin
  if FManifestos.Count > 0 then    // Tem MDFe ? Se SIM, use as informa��es do XML
    FVersaoDF := DblToVersaoMDFe(ok, FManifestos.Items[0].MDFe.infMDFe.Versao)
  else
    FVersaoDF := FPConfiguracoesMDFe.Geral.VersaoDF;

  inherited InicializarServico;
end;

procedure TMDFeRecibo.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'MDFeRetRecepcao';
  FPSoapAction := FPServico + '/mdfeRetRecepcao';
end;

procedure TMDFeRecibo.DefinirURL;
var
  Modelo: String;
  VerServ: Double;
begin
  FPLayout := LayMDFeRetRecepcao;

  if FManifestos.Count > 0 then    // Tem MDFe ? Se SIM, use as informa��es do XML
  begin
    FcUF := FManifestos.Items[0].MDFe.Ide.cUF;

    if FPConfiguracoesMDFe.WebServices.Ambiente <> FManifestos.Items[0].MDFe.Ide.tpAmb then
      raise EACBrMDFeException.Create( ACBRMDFE_CErroAmbDiferente );
  end
  else
  begin     // Se n�o tem MDFe, use as configura��es do componente
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  VerServ := VersaoMDFeToDbl(FVersaoDF);
  Modelo := 'MDFe';
  FTpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
  FPVersaoServico := '';
  FPURL := '';

  TACBrMDFe(FPDFeOwner).LerServicoDeParams(
    Modelo,
    CUFtoUF(FcUF),
    FTpAmb,
    LayOutToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TMDFeRecibo.DefinirDadosMsg;
var
  ConsReciMDFe: TConsReciDFe;
begin
  ConsReciMDFe := TConsReciDFe.Create(FPVersaoServico, NAME_SPACE_MDFE, 'MDFe');
  try
    ConsReciMDFe.tpAmb := FTpAmb;
    ConsReciMDFe.nRec := FRecibo;
//    ConsReciMDFe.Versao := FPVersaoServico;

    AjustarOpcoes( ConsReciMDFe.Gerador.Opcoes );

    ConsReciMDFe.GerarXML;

    FPDadosMsg := ConsReciMDFe.Gerador.ArquivoFormatoXML;
  finally
    ConsReciMDFe.Free;
  end;
end;

function TMDFeRecibo.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'mdfeRetRecepcaoResult');

  FMDFeRetorno.Leitor.Arquivo := ParseText(FPRetWS);
  FMDFeRetorno.LerXML;

  Fversao := FMDFeRetorno.versao;
  FTpAmb := FMDFeRetorno.TpAmb;
  FverAplic := FMDFeRetorno.verAplic;
  FcStat := FMDFeRetorno.cStat;
  FxMotivo := FMDFeRetorno.xMotivo;
  FcUF := FMDFeRetorno.cUF;
  FxMsg := FMDFeRetorno.xMsg;
  FcMsg := FMDFeRetorno.cMsg;
  FPMsg := FxMotivo;

  Result := (FMDFeRetorno.CStat = 104);
end;

function TMDFeRecibo.GerarMsgLog: String;
begin
  Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Vers�o Aplicativo: %s ' + LineBreak +
                           'Recibo: %s ' + LineBreak +
                           'Status C�digo: %s ' + LineBreak +
                           'Status Descri��o: %s ' + LineBreak +
                           'UF: %s ' + LineBreak),
                   [FMDFeRetorno.versao, TpAmbToStr(FMDFeRetorno.TpAmb),
                   FMDFeRetorno.verAplic, FMDFeRetorno.nRec,
                   IntToStr(FMDFeRetorno.cStat),
                   FMDFeRetorno.xMotivo,
                   CodigoParaUF(FMDFeRetorno.cUF)]);
end;

{ TMDFeConsulta }

constructor TMDFeConsulta.Create(AOwner: TACBrDFe; AManifestos: TManifestos);
begin
  inherited Create(AOwner);

  FOwner := AOwner;
  FManifestos := AManifestos;
end;

destructor TMDFeConsulta.Destroy;
begin
  FprotMDFe.Free;
  FprocEventoMDFe.Free;

  inherited Destroy;
end;

procedure TMDFeConsulta.Clear;
begin
  inherited Clear;

  FPStatus := stMDFeConsulta;
  FPLayout := LayMDFeConsulta;
  FPArqEnv := 'ped-sit';
  FPArqResp := 'sit';

  FverAplic := '';
  FcStat := 0;
  FxMotivo := '';
  FProtocolo := '';
  FDhRecbto := 0;
  Fversao := '';
  FRetMDFeDFe := '';

  if Assigned(FPConfiguracoesMDFe) then
  begin
    FtpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  if Assigned(FprotMDFe) then
    FprotMDFe.Free;

  if Assigned(FprocEventoMDFe) then
    FprocEventoMDFe.Free;

  FprotMDFe       := TProcMDFe.Create;
  FprocEventoMDFe := TRetEventoMDFeCollection.Create;
end;

procedure TMDFeConsulta.SetMDFeChave(const AValue: String);
var
  NumChave: String;
begin
  if FMDFeChave = AValue then Exit;
    NumChave := OnlyNumber(AValue);

  if not ValidarChave(NumChave) then
    raise EACBrMDFeException.Create(Format('Chave "%s" inv�lida.',[AValue]));

  FMDFeChave := NumChave;
end;

procedure TMDFeConsulta.DefinirURL;
var
  VerServ: Double;
  Modelo: String;
begin
  FPVersaoServico := '';
  FPURL   := '';
  Modelo  := 'MDFe';
  FcUF    := ExtrairUFChaveAcesso(FMDFeChave);
  VerServ := VersaoMDFeToDbl(FPConfiguracoesMDFe.Geral.VersaoDF);

  if FManifestos.Count > 0 then
    FTpAmb := FManifestos.Items[0].MDFe.Ide.tpAmb
  else
    FTpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;

  TACBrMDFe(FPDFeOwner).LerServicoDeParams(
    Modelo,
    CUFtoUF(FcUF),
    FTpAmb,
    LayOutToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TMDFeConsulta.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'MDFeConsulta';
  FPSoapAction := FPServico + '/mdfeConsultaMDF';
end;

procedure TMDFeConsulta.DefinirDadosMsg;
var
  ConsSitMDFe: TConsSitMDFe;
begin
  ConsSitMDFe := TConsSitMDFe.Create;
  try
    ConsSitMDFe.TpAmb := FTpAmb;
    ConsSitMDFe.chMDFe := FMDFeChave;
    ConsSitMDFe.Versao := FPVersaoServico;

    AjustarOpcoes( ConsSitMDFe.Gerador.Opcoes );

    ConsSitMDFe.GerarXML;

    FPDadosMsg := ConsSitMDFe.Gerador.ArquivoFormatoXML;
  finally
    ConsSitMDFe.Free;
  end;
end;

function TMDFeConsulta.GerarUFSoap: String;
begin
  Result := '<cUF>' + IntToStr(FcUF) + '</cUF>';
end;

function TMDFeConsulta.TratarResposta: Boolean;
var
  MDFeRetorno: TRetConsSitMDFe;
  SalvarXML, MDFCancelado, MDFEncerrado, Atualiza: Boolean;
  aEventos, sPathMDFe, NomeXMLSalvo: String;
  AProcMDFe: TProcMDFe;
  I, J, Inicio, Fim: Integer;
  dhEmissao: TDateTime;
begin
  MDFeRetorno := TRetConsSitMDFe.Create;

  try
    FPRetWS := SeparaDados(FPRetornoWS, 'mdfeConsultaMDFResult');

    MDFeRetorno.Leitor.Arquivo := ParseText(FPRetWS);
    MDFeRetorno.LerXML;

    MDFCancelado := False;
    MDFEncerrado := False;
    aEventos := '';

    // <retConsSitMDFe> - Retorno da consulta da situa��o da NF-e
    // Este � o status oficial da NF-e
    Fversao := MDFeRetorno.versao;
    FTpAmb := MDFeRetorno.tpAmb;
    FverAplic := MDFeRetorno.verAplic;
    FcStat := MDFeRetorno.cStat;
    FXMotivo := MDFeRetorno.xMotivo;
    FcUF := MDFeRetorno.cUF;
//    FMDFeChave := MDFeRetorno.chMDFe;
    FPMsg := FXMotivo;

    // <protMDFe> - Retorno dos dados do ENVIO da NF-e
    // Consider�-los apenas se n�o existir nenhum evento de cancelamento (110111)
    FprotMDFe.PathMDFe            := MDFeRetorno.protMDFe.PathMDFe;
    FprotMDFe.PathRetConsReciMDFe := MDFeRetorno.protMDFe.PathRetConsReciMDFe;
    FprotMDFe.PathRetConsSitMDFe  := MDFeRetorno.protMDFe.PathRetConsSitMDFe;
    FprotMDFe.tpAmb               := MDFeRetorno.protMDFe.tpAmb;
    FprotMDFe.verAplic            := MDFeRetorno.protMDFe.verAplic;
    FprotMDFe.chMDFe              := MDFeRetorno.protMDFe.chMDFe;
    FprotMDFe.dhRecbto            := MDFeRetorno.protMDFe.dhRecbto;
    FprotMDFe.nProt               := MDFeRetorno.protMDFe.nProt;
    FprotMDFe.digVal              := MDFeRetorno.protMDFe.digVal;
    FprotMDFe.cStat               := MDFeRetorno.protMDFe.cStat;
    FprotMDFe.xMotivo             := MDFeRetorno.protMDFe.xMotivo;

    if Assigned(MDFeRetorno.procEventoMDFe) and (MDFeRetorno.procEventoMDFe.Count > 0) then
    begin
      aEventos := '=====================================================' +
        LineBreak + '================== Eventos da MDF-e ==================' +
        LineBreak + '=====================================================' +
        LineBreak + '' + LineBreak + 'Quantidade total de eventos: ' +
        IntToStr(MDFeRetorno.procEventoMDFe.Count);

      FprocEventoMDFe.Clear;
      for I := 0 to MDFeRetorno.procEventoMDFe.Count - 1 do
      begin
        with FprocEventoMDFe.New.RetEventoMDFe do
        begin
          idLote := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.idLote;
          tpAmb := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.tpAmb;
          verAplic := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.verAplic;
          cOrgao := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.cOrgao;
          cStat := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.cStat;
          xMotivo := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.xMotivo;
          XML := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.XML;

          Infevento.ID              := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.ID;
          Infevento.tpAmb           := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.tpAmb;
          InfEvento.CNPJCPF         := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.CNPJCPF;
          InfEvento.chMDFe          := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.chMDFe;
          InfEvento.dhEvento        := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.dhEvento;
          InfEvento.TpEvento        := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.TpEvento;
          InfEvento.nSeqEvento      := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.nSeqEvento;
          InfEvento.VersaoEvento    := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.VersaoEvento;
          InfEvento.DetEvento.nProt := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.DetEvento.nProt;
          InfEvento.DetEvento.xJust := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.DetEvento.xJust;
          InfEvento.DetEvento.xNome := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.DetEvento.xNome;
          InfEvento.DetEvento.CPF   := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.DetEvento.CPF;
          InfEvento.DetEvento.cUF   := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.DetEvento.cUF;
          InfEvento.DetEvento.cMun  := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.DetEvento.cMun;
          InfEvento.DetEvento.dtEnc := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.InfEvento.DetEvento.dtEnc;

          retEvento.Clear;
          for J := 0 to MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Count-1 do
          begin
            with retEvento.New.RetInfEvento do
            begin
              Id          := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.Id;
              tpAmb       := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.tpAmb;
              verAplic    := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.verAplic;
              cOrgao      := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.cOrgao;
              cStat       := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.cStat;
              xMotivo     := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.xMotivo;
              chMDFe      := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.chMDFe;
              tpEvento    := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.tpEvento;
              xEvento     := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.xEvento;
              nSeqEvento  := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.nSeqEvento;
              CNPJDest    := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.CNPJDest;
              emailDest   := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.emailDest;
              dhRegEvento := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.dhRegEvento;
              nProt       := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.nProt;
              XML         := MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe.retEvento.Items[j].RetInfEvento.XML;
            end;
          end;
        end;

        with MDFeRetorno.procEventoMDFe.Items[I].RetEventoMDFe do
        begin
          for j := 0 to retEvento.Count -1 do
          begin
            aEventos := aEventos + LineBreak + LineBreak +
              Format(ACBrStr('N�mero de sequ�ncia: %s ' + LineBreak +
                             'C�digo do evento: %s ' + LineBreak +
                             'Descri��o do evento: %s ' + LineBreak +
                             'Status do evento: %s ' + LineBreak +
                             'Descri��o do status: %s ' + LineBreak +
                             'Protocolo: %s ' + LineBreak +
                             'Data/Hora do registro: %s '),
                     [IntToStr(InfEvento.nSeqEvento),
                      TpEventoToStr(InfEvento.TpEvento),
                      InfEvento.DescEvento,
                      IntToStr(retEvento.Items[J].RetInfEvento.cStat),
                      retEvento.Items[J].RetInfEvento.xMotivo,
                      retEvento.Items[J].RetInfEvento.nProt,
                      FormatDateTimeBr(retEvento.Items[J].RetInfEvento.dhRegEvento)]);

            if retEvento.Items[J].RetInfEvento.tpEvento = teCancelamento then
            begin
              MDFCancelado := True;
              FProtocolo := retEvento.Items[J].RetInfEvento.nProt;
              FDhRecbto := retEvento.Items[J].RetInfEvento.dhRegEvento;
              FPMsg := retEvento.Items[J].RetInfEvento.xMotivo;
            end;

            if retEvento.Items[J].RetInfEvento.tpEvento = teEncerramento then
            begin
              MDFEncerrado := True;
              FProtocolo := retEvento.Items[J].RetInfEvento.nProt;
              FDhRecbto := retEvento.Items[J].RetInfEvento.dhRegEvento;
              FPMsg := retEvento.Items[J].RetInfEvento.xMotivo;
            end;
          end;
        end;
      end;
    end;

    if (not MDFCancelado) and (not MDFEncerrado) and
       (NaoEstaVazio(MDFeRetorno.protMDFe.nProt))  then
    begin
      FProtocolo := MDFeRetorno.protMDFe.nProt;
      FDhRecbto := MDFeRetorno.protMDFe.dhRecbto;
      FPMsg := MDFeRetorno.protMDFe.xMotivo;
    end;

    with TACBrMDFe(FPDFeOwner) do
    begin
      // cStat = 132 indica que o MDF-e foi encerrado
      Result := cStatProcessado(MDFeRetorno.cStat) or
                cStatCancelado(MDFeRetorno.cStat) or
                (MDFeRetorno.cStat = 132);
    end;

    for i := 0 to TACBrMDFe(FPDFeOwner).Manifestos.Count - 1 do
    begin
      with TACBrMDFe(FPDFeOwner).Manifestos.Items[i] do
      begin
        if (OnlyNumber(FMDFeChave) = NumID) then
        begin
          Atualiza := (NaoEstaVazio(MDFeRetorno.XMLprotMDFe));

          if Atualiza and
             TACBrMDFe(FPDFeOwner).cStatCancelado(MDFeRetorno.cStat) then
            Atualiza := False;

          if (FPConfiguracoesMDFe.Geral.ValidarDigest) and
             (MDFeRetorno.protMDFe.digVal <> '') and (MDFe.signature.DigestValue <> '') and
             (UpperCase(MDFe.signature.DigestValue) <> UpperCase(MDFeRetorno.protMDFe.digVal)) then
          begin
            raise EACBrMDFeException.Create('DigestValue do documento ' +
                NumID + ' n�o confere.');
          end;

          // Atualiza o Status da MDFe interna //
          MDFe.procMDFe.cStat := MDFeRetorno.cStat;

          if Atualiza then
          begin
            MDFe.procMDFe.tpAmb := MDFeRetorno.tpAmb;
            MDFe.procMDFe.verAplic := MDFeRetorno.verAplic;
            MDFe.procMDFe.chMDFe := MDFeRetorno.chMDFe;
            MDFe.procMDFe.dhRecbto := FDhRecbto;
            MDFe.procMDFe.nProt := FProtocolo;
            MDFe.procMDFe.digVal := MDFeRetorno.protMDFe.digVal;
            MDFe.procMDFe.cStat := MDFeRetorno.cStat;
            MDFe.procMDFe.xMotivo := MDFeRetorno.xMotivo;

            AProcMDFe := TProcMDFe.Create;
            try
              AProcMDFe.XML_MDFe := RemoverDeclaracaoXML(XMLOriginal);
              AProcMDFe.XML_Prot := MDFeRetorno.XMLprotMDFe;
              AProcMDFe.Versao := FPVersaoServico;
              AProcMDFe.GerarXML;

              XMLOriginal := AProcMDFe.Gerador.ArquivoFormatoXML;

              FRetMDFeDFe := '';

              if (NaoEstaVazio(SeparaDados(FPRetWS, 'procEventoMDFe'))) then
              begin
                Inicio := Pos('<procEventoMDFe', FPRetWS);
                Fim    := Pos('</retConsSitMDFe', FPRetWS) -1;

                aEventos := Copy(FPRetWS, Inicio, Fim - Inicio + 1);

                FRetMDFeDFe := '<MDFeDFe>' +
                                '<procMDFe versao="' + FVersao + '">' +
                                  SeparaDados(XMLOriginal, 'mdfeProc') +
                                '</procMDFe>' +
                                '<procEventoMDFe versao="' + FVersao + '">' +
                                  aEventos +
                                '</procEventoMDFe>' +
                               '</MDFeDFe>';

              end;
            finally
              AProcMDFe.Free;
            end;

            SalvarXML := Result and
                       FPConfiguracoesMDFe.Arquivos.Salvar and
                       ((not FPConfiguracoesMDFe.Arquivos.SalvarApenasMDFeProcessados) or
                         Processado);

            if SalvarXML then
            begin
              if FPConfiguracoesMDFe.Arquivos.EmissaoPathMDFe then
                dhEmissao := MDFe.Ide.dhEmi
              else
                dhEmissao := Now;

              sPathMDFe := PathWithDelim(FPConfiguracoesMDFe.Arquivos.GetPathMDFe(dhEmissao, MDFe.Emit.CNPJCPF, MDFe.emit.IE));

              if (FRetMDFeDFe <> '') then
                FPDFeOwner.Gravar( FMDFeChave + '-MDFeDFe.xml', FRetMDFeDFe, sPathMDFe);

              // Salva o XML do MDF-e assinado e protocolado
              NomeXMLSalvo := '';
              if NaoEstaVazio(NomeArq) and FileExists(NomeArq) then
              begin
                FPDFeOwner.Gravar( NomeArq, XMLOriginal );  // Atualiza o XML carregado
                NomeXMLSalvo := NomeArq;
              end;

              // Salva na pasta baseado nas configura��es do PathCTe
              if (NomeXMLSalvo <> CalcularNomeArquivoCompleto()) then
                GravarXML;
            end;
          end;

          break;
        end;
      end;
    end;
  finally
    MDFeRetorno.Free;
  end;
end;

function TMDFeConsulta.GerarMsgLog: String;
begin
  Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                           'Identificador: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Vers�o Aplicativo: %s ' + LineBreak +
                           'Status C�digo: %s ' + LineBreak +
                           'Status Descri��o: %s ' + LineBreak +
                           'UF: %s ' + LineBreak +
                           'Chave Acesso: %s ' + LineBreak +
                           'Recebimento: %s ' + LineBreak +
                           'Protocolo: %s ' + LineBreak +
                           'Digest Value: %s ' + LineBreak),
                   [Fversao, FMDFeChave, TpAmbToStr(FTpAmb), FverAplic,
                    IntToStr(FcStat), FXMotivo, CodigoParaUF(FcUF), FMDFeChave,
                    FormatDateTimeBr(FDhRecbto), FProtocolo, FprotMDFe.digVal]);
end;

function TMDFeConsulta.GerarPrefixoArquivo: String;
begin
  Result := Trim(FMDFeChave);
end;

{ TMDFeEnvEvento }

constructor TMDFeEnvEvento.Create(AOwner: TACBrDFe; AEvento: TEventoMDFe);
begin
  inherited Create(AOwner);

  FEvento := AEvento;
end;

destructor TMDFeEnvEvento.Destroy;
begin
  if Assigned(FEventoRetorno) then
    FEventoRetorno.Free;

  inherited;
end;

procedure TMDFeEnvEvento.Clear;
begin
  inherited Clear;

  FPStatus := stMDFeEvento;
  FPLayout := LayMDFeEvento;
  FPArqEnv := 'ped-eve';
  FPArqResp := 'eve';

  FcStat   := 0;
  FxMotivo := '';
  FCNPJ := '';

  if Assigned(FPConfiguracoesMDFe) then
    FtpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;

  if Assigned(FEventoRetorno) then
    FEventoRetorno.Free;

  FEventoRetorno := TRetEventoMDFe.Create;
end;

function TMDFeEnvEvento.GerarPathEvento(const ACNPJ, AIE: String): String;
begin
  with FEvento.Evento.Items[0].InfEvento do
  begin
    Result := FPConfiguracoesMDFe.Arquivos.GetPathEvento(tpEvento, ACNPJ, AIE);
  end;
end;

procedure TMDFeEnvEvento.DefinirURL;
var
  UF, Modelo : String;
  VerServ: Double;
begin
  { Verifica��o necess�ria pois somente os eventos de Cancelamento e CCe ser�o tratados pela SEFAZ do estado
    os outros eventos como manifestacao de destinat�rios ser�o tratados diretamente pela RFB }

  VerServ := VersaoMDFeToDbl(FPConfiguracoesMDFe.Geral.VersaoDF);
  FCNPJ   := FEvento.Evento.Items[0].InfEvento.CNPJCPF;
  FTpAmb  := FEvento.Evento.Items[0].InfEvento.tpAmb;
  Modelo  := 'MDFe';
  UF      := CUFtoUF(ExtrairUFChaveAcesso(FEvento.Evento.Items[0].InfEvento.chMDFe));

  FPLayout := LayMDFeEvento;

  FPURL := '';

  TACBrMDFe(FPDFeOwner).LerServicoDeParams(
    Modelo,
    UF,
    FTpAmb,
    LayOutToServico(FPLayout),
    VerServ,
    FPURL
  );

  FPVersaoServico := FloatToString(VerServ, '.', '0.00');
end;

procedure TMDFeEnvEvento.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'MDFeRecepcaoEvento';
  FPSoapAction := FPServico + '/mdfeRecepcaoEvento';
end;

procedure TMDFeEnvEvento.DefinirDadosMsg;
var
  EventoMDFe: TEventoMDFe;
  I, J, F: Integer;
  Evento, Eventos, EventosAssinados, AXMLEvento: AnsiString;
  FErroValidacao: String;
  EventoEhValido: Boolean;
  SchemaEventoMDFe: TSchemaMDFe;
begin
  EventoMDFe := TEventoMDFe.Create;
  try
    EventoMDFe.idLote := FidLote;
    SchemaEventoMDFe := schErro;
    
    for I := 0 to FEvento.Evento.Count - 1 do
    begin
      with EventoMDFe.Evento.New do
      begin
        infEvento.tpAmb      := FTpAmb;
        infEvento.CNPJCPF    := FEvento.Evento[i].InfEvento.CNPJCPF;
        infEvento.chMDFe     := FEvento.Evento[i].InfEvento.chMDFe;
        infEvento.dhEvento   := FEvento.Evento[i].InfEvento.dhEvento;
        infEvento.tpEvento   := FEvento.Evento[i].InfEvento.tpEvento;
        infEvento.nSeqEvento := FEvento.Evento[i].InfEvento.nSeqEvento;
        infEvento.versaoEvento := FEvento.Evento[i].InfEvento.versaoEvento;

        case InfEvento.tpEvento of
          teCancelamento:
          begin
            SchemaEventoMDFe := schevCancMDFe;
            infEvento.detEvento.nProt := FEvento.Evento[i].InfEvento.detEvento.nProt;
            infEvento.detEvento.xJust := FEvento.Evento[i].InfEvento.detEvento.xJust;
          end;

          teEncerramento:
          begin
            SchemaEventoMDFe := schevEncMDFe;
            infEvento.detEvento.nProt := FEvento.Evento[i].InfEvento.detEvento.nProt;
            infEvento.detEvento.dtEnc := FEvento.Evento[i].InfEvento.detEvento.dtEnc;
            infEvento.detEvento.cUF   := FEvento.Evento[i].InfEvento.detEvento.cUF;
            infEvento.detEvento.cMun  := FEvento.Evento[i].InfEvento.detEvento.cMun;
          end;

          teInclusaoCondutor:
          begin
            SchemaEventoMDFe := schevIncCondutorMDFe;
            infEvento.detEvento.xNome := FEvento.Evento[i].InfEvento.detEvento.xNome;
            infEvento.detEvento.CPF   := FEvento.Evento[i].InfEvento.detEvento.CPF;
          end;

          teInclusaoDFe:
          begin
            SchemaEventoMDFe := schevInclusaoDFeMDFe;
            infEvento.detEvento.nProt       := FEvento.Evento[i].InfEvento.detEvento.nProt;
            infEvento.detEvento.cMunCarrega := FEvento.Evento[i].InfEvento.detEvento.cMunCarrega;
            infEvento.detEvento.xMunCarrega := FEvento.Evento[i].InfEvento.detEvento.xMunCarrega;

            for j := 0 to FEvento.Evento[i].InfEvento.detEvento.infDoc.Count - 1 do
            begin
              with EventoMDFe.Evento[i].InfEvento.detEvento.infDoc.New do
              begin
                cMunDescarga := FEvento.Evento[i].InfEvento.detEvento.infDoc[j].cMunDescarga;
                xMunDescarga := FEvento.Evento[i].InfEvento.detEvento.infDoc[j].xMunDescarga;
                chNFe        := FEvento.Evento[i].InfEvento.detEvento.infDoc[j].chNFe;
              end;
            end;
          end;
        end;
      end;
    end;

    EventoMDFe.Versao := FPVersaoServico;

    AjustarOpcoes( EventoMDFe.Gerador.Opcoes );

    EventoMDFe.GerarXML;

    Eventos := NativeStringToUTF8( EventoMDFe.Gerador.ArquivoFormatoXML );
    EventosAssinados := '';

    // Realiza a assinatura para cada evento
    while Eventos <> '' do
    begin
      F := Pos('</eventoMDFe>', Eventos);

      if F > 0 then
      begin
        Evento := Copy(Eventos, 1, F + 12);
        Eventos := Copy(Eventos, F + 13, length(Eventos));

        AssinarXML(Evento, 'eventoMDFe', 'infEvento', 'Falha ao assinar o Envio de Evento ');
        EventosAssinados := EventosAssinados + FPDadosMsg;
      end
      else
        Break;
    end;

    // Separa o XML especifico do Evento para ser Validado.
    AXMLEvento := SeparaDados(FPDadosMsg, 'detEvento');

    case SchemaEventoMDFe of
      schevCancMDFe:
        begin
          AXMLEvento := '<evCancMDFe xmlns="' + ACBRMDFE_NAMESPACE + '">' +
                          Trim(RetornarConteudoEntre(AXMLEvento, '<evCancMDFe>', '</evCancMDFe>')) +
                        '</evCancMDFe>';
        end;

      schevEncMDFe:
        begin
          AXMLEvento := '<evEncMDFe xmlns="' + ACBRMDFE_NAMESPACE + '">' +
                          Trim(RetornarConteudoEntre(AXMLEvento, '<evEncMDFe>', '</evEncMDFe>')) +
                        '</evEncMDFe>';
        end;

      schevIncCondutorMDFe:
        begin
          AXMLEvento := '<evIncCondutorMDFe xmlns="' + ACBRMDFE_NAMESPACE + '">' +
                          Trim(RetornarConteudoEntre(AXMLEvento, '<evIncCondutorMDFe>', '</evIncCondutorMDFe>')) +
                        '</evIncCondutorMDFe>';
        end;

      schevInclusaoDFeMDFe:
        begin
          AXMLEvento := '<evIncDFeMDFe xmlns="' + ACBRMDFE_NAMESPACE + '">' +
                          Trim(RetornarConteudoEntre(AXMLEvento, '<evIncDFeMDFe>', '</evIncDFeMDFe>')) +
                        '</evIncDFeMDFe>';
        end;
    end;

    AXMLEvento := '<' + ENCODING_UTF8 + '>' + AXMLEvento;

    with TACBrMDFe(FPDFeOwner) do
    begin
      EventoEhValido := SSL.Validar(FPDadosMsg,
                                    GerarNomeArqSchema(FPLayout,
                                                       StringToFloatDef(FPVersaoServico, 0)),
                                    FPMsg) and
                        SSL.Validar(AXMLEvento,
                                    GerarNomeArqSchemaEvento(SchemaEventoMDFe,
                                                             StringToFloatDef(FPVersaoServico, 0)),
                                    FPMsg);
    end;

    if not EventoEhValido then
    begin
      FErroValidacao := ACBrStr('Falha na valida��o dos dados do Evento: ') +
        FPMsg;

      raise EACBrMDFeException.CreateDef(FErroValidacao);
    end;

    for I := 0 to FEvento.Evento.Count - 1 do
      FEvento.Evento[I].InfEvento.id := EventoMDFe.Evento[I].InfEvento.id;
  finally
    EventoMDFe.Free;
  end;
end;

function TMDFeEnvEvento.TratarResposta: Boolean;
var
  Leitor: TLeitor;
  I, J: Integer;
  NomeArq, PathArq, VersaoEvento, Texto: String;
begin
  FEvento.idLote := idLote;

  FPRetWS := SeparaDados(FPRetornoWS, 'mdfeRecepcaoEventoResult');

  EventoRetorno.Leitor.Arquivo := ParseText(FPRetWS);
  EventoRetorno.LerXml;

  FcStat := EventoRetorno.cStat;
  FxMotivo := EventoRetorno.xMotivo;
  FPMsg := EventoRetorno.xMotivo;
  FTpAmb := EventoRetorno.tpAmb;

  Result := (FcStat in [135, 136]);

  //gerar arquivo proc de evento
  if Result then
  begin
    Leitor := TLeitor.Create;
    try
      for I := 0 to FEvento.Evento.Count - 1 do
      begin
        for J := 0 to EventoRetorno.retEvento.Count - 1 do
        begin
          if FEvento.Evento.Items[I].InfEvento.chMDFe =
            EventoRetorno.retEvento.Items[J].RetInfEvento.chMDFe then
          begin
            FEvento.Evento.Items[I].RetInfEvento.tpAmb :=
              EventoRetorno.retEvento.Items[J].RetInfEvento.tpAmb;
            FEvento.Evento.Items[I].RetInfEvento.nProt :=
              EventoRetorno.retEvento.Items[J].RetInfEvento.nProt;
            FEvento.Evento.Items[I].RetInfEvento.dhRegEvento :=
              EventoRetorno.retEvento.Items[J].RetInfEvento.dhRegEvento;
            FEvento.Evento.Items[I].RetInfEvento.cStat :=
              EventoRetorno.retEvento.Items[J].RetInfEvento.cStat;
            FEvento.Evento.Items[I].RetInfEvento.xMotivo :=
              EventoRetorno.retEvento.Items[J].RetInfEvento.xMotivo;

            VersaoEvento := TACBrMDFe(FPDFeOwner).LerVersaoDeParams(LayMDFeEvento);


            Leitor.Arquivo := FPDadosMsg;
            Texto := '<procEventoMDFe versao="' + VersaoEvento + '" xmlns="' + ACBRMDFE_NAMESPACE + '">' +
                      '<eventoMDFe versao="' + VersaoEvento + '">' +
                       Leitor.rExtrai(1, 'infEvento', '', I + 1) +
                       '<Signature xmlns="http://www.w3.org/2000/09/xmldsig#">' +
                        Leitor.rExtrai(1, 'SignedInfo', '', I + 1) +
                        Leitor.rExtrai(1, 'SignatureValue', '', I + 1) +
                        Leitor.rExtrai(1, 'KeyInfo', '', I + 1) +
                       '</Signature>' +
                      '</eventoMDFe>';

            Leitor.Arquivo := FPRetWS;
            Texto := Texto +
                       '<retEventoMDFe versao="' + VersaoEvento + '">' +
                        Leitor.rExtrai(1, 'infEvento', '', J + 1) +
                       '</retEventoMDFe>' +
                      '</procEventoMDFe>';

            if FPConfiguracoesMDFe.Arquivos.Salvar then
            begin
              NomeArq := OnlyNumber(FEvento.Evento.Items[I].InfEvento.Id) + '-procEventoMDFe.xml';
              PathArq := PathWithDelim(GerarPathEvento(FEvento.Evento.Items[I].InfEvento.CNPJCPF));

              FPDFeOwner.Gravar(NomeArq, Texto, PathArq);
              FEventoRetorno.retEvento.Items[J].RetInfEvento.NomeArquivo := PathArq + NomeArq;
              FEvento.Evento.Items[I].RetInfEvento.NomeArquivo := PathArq + NomeArq;
            end;

            Texto := ParseText(Texto);
            FEventoRetorno.retEvento.Items[J].RetInfEvento.XML := Texto;
            FEvento.Evento.Items[I].RetInfEvento.XML := Texto;

            break;
          end;
        end;
      end;
    finally
      Leitor.Free;
    end;
  end;
end;

procedure TMDFeEnvEvento.SalvarEnvio;
begin
//  inherited SalvarEnvio;

  if ArqEnv = '' then
    exit;

  if FPConfiguracoesMDFe.Geral.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqEnv + '.xml',
      FPDadosMsg, GerarPathEvento(FCNPJ));

  if FPConfiguracoesMDFe.WebServices.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqEnv + '-soap.xml',
      FPEnvelopeSoap, GerarPathEvento(FCNPJ));
end;

procedure TMDFeEnvEvento.SalvarResposta;
begin
//  inherited SalvarResposta;

  if ArqResp = '' then
    exit;

  if FPConfiguracoesMDFe.Geral.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqResp + '.xml',
      FPRetWS, GerarPathEvento(FCNPJ));

  if FPConfiguracoesMDFe.WebServices.Salvar then
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqResp + '-soap.xml',
      FPRetornoWS, GerarPathEvento(FCNPJ));
end;

function TMDFeEnvEvento.GerarMsgLog: String;
var
  aMsg: String;
begin
  aMsg := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                         'Ambiente: %s ' + LineBreak +
                         'Vers�o Aplicativo: %s ' + LineBreak +
                         'Status C�digo: %s ' + LineBreak +
                         'Status Descri��o: %s ' + LineBreak),
                 [FEventoRetorno.versao, TpAmbToStr(FEventoRetorno.tpAmb),
                  FEventoRetorno.verAplic, IntToStr(FEventoRetorno.cStat),
                  FEventoRetorno.xMotivo]);

  if FEventoRetorno.retEvento.Count > 0 then
    aMsg := aMsg + Format(ACBrStr('Recebimento: %s ' + LineBreak),
       [IfThen(FEventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento = 0, '',
               FormatDateTimeBr(FEventoRetorno.retEvento.Items[0].RetInfEvento.dhRegEvento))]);

  Result := aMsg;
end;

function TMDFeEnvEvento.GerarPrefixoArquivo: String;
begin
//  Result := IntToStr(FEvento.idLote);
  Result := IntToStr(FidLote);
end;

{ TMDFeConsultaMDFeNaoEnc }

constructor TMDFeConsultaMDFeNaoEnc.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FOwner := AOwner;
end;

destructor TMDFeConsultaMDFeNaoEnc.Destroy;
begin
  FinfMDFe.Free;
  FRetConsMDFeNaoEnc.Free;

  inherited;
end;

procedure TMDFeConsultaMDFeNaoEnc.Clear;
begin
  inherited Clear;

  FPStatus  := stMDFeConsulta;
  FPLayout  := LayMDFeConsNaoEnc;
  FPArqEnv  := 'ped-cons';
  FPArqResp := 'cons';

  if Assigned(FPConfiguracoesMDFe) then
  begin
    FtpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    FcUF := FPConfiguracoesMDFe.WebServices.UFCodigo;
  end;

  if Assigned(FinfMDFe) then
    FinfMDFe.Free;

  if Assigned(FRetConsMDFeNaoEnc) then
    FRetConsMDFeNaoEnc.Free;

  FInfMDFe := TRetInfMDFeCollection.Create;
  FRetConsMDFeNaoEnc := TRetConsMDFeNaoEnc.Create;
end;

procedure TMDFeConsultaMDFeNaoEnc.DefinirServicoEAction;
begin
  FPServico    := GetUrlWsd + 'MDFeConsNaoEnc';
  FPSoapAction := FPServico + '/mdfeConsNaoEnc';
end;

procedure TMDFeConsultaMDFeNaoEnc.DefinirURL;
begin
  FPLayout := LayMDFeConsNaoEnc;

  inherited DefinirURL;
end;

procedure TMDFeConsultaMDFeNaoEnc.DefinirDadosMsg;
var
  ConsMDFeNaoEnc: TConsMDFeNaoEnc;
begin
  ConsMDFeNaoEnc := TConsMDFeNaoEnc.create;
  try
    ConsMDFeNaoEnc.TpAmb   := FPConfiguracoesMDFe.WebServices.Ambiente;
    ConsMDFeNaoEnc.CNPJCPF := OnlyNumber( FCNPJCPF );
    ConsMDFeNaoEnc.Versao  := FPVersaoServico;

    AjustarOpcoes( ConsMDFeNaoEnc.Gerador.Opcoes );
    ConsMDFeNaoEnc.Gerador.Opcoes.RetirarAcentos := False;  // N�o funciona sem acentos

    ConsMDFeNaoEnc.GerarXML;

    FPDadosMsg := ConsMDFeNaoEnc.Gerador.ArquivoFormatoXML;
  finally
    ConsMDFeNaoEnc.Free;
  end;
end;

function TMDFeConsultaMDFeNaoEnc.TratarResposta: Boolean;
var
  i: Integer;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'mdfeConsNaoEncResult');

  // Limpando variaveis internas
  FRetConsMDFeNaoEnc.Free;
  FRetConsMDFeNaoEnc := TRetConsMDFeNaoEnc.Create;

  FRetConsMDFeNaoEnc.Leitor.Arquivo := ParseText(FPRetWS);
  FRetConsMDFeNaoEnc.LerXml;

  Fversao    := FRetConsMDFeNaoEnc.versao;
  FtpAmb     := FRetConsMDFeNaoEnc.tpAmb;
  FverAplic  := FRetConsMDFeNaoEnc.verAplic;
  FcStat     := FRetConsMDFeNaoEnc.cStat;
  FxMotivo   := FRetConsMDFeNaoEnc.xMotivo;
  FcUF       := FRetConsMDFeNaoEnc.cUF;
  FMsg       := FxMotivo;

  for i := 0 to FRetConsMDFeNaoEnc.InfMDFe.Count -1 do
  begin
    FinfMDFe.New;
    FinfMDFe.Items[i].chMDFe := FRetConsMDFeNaoEnc.InfMDFe.Items[i].chMDFe;
    FinfMDFe.Items[i].nProt  := FRetConsMDFeNaoEnc.InfMDFe.Items[i].nProt;
  end;

    // 111 = MDF-e n�o encerrados localizados
    // 112 = MDF-e n�o encerrados n�o localizados
  Result := (FcStat in [111, 112]);
end;

function TMDFeConsultaMDFeNaoEnc.GerarMsgLog: String;
begin
  Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Vers�o Aplicativo: %s ' + LineBreak +
                           'Status C�digo: %s ' + LineBreak +
                           'Status Descri��o: %s ' + LineBreak +
                           'UF: %s ' + LineBreak),
                   [FRetConsMDFeNaoEnc.versao, TpAmbToStr(FRetConsMDFeNaoEnc.tpAmb),
                    FRetConsMDFeNaoEnc.verAplic, IntToStr(FRetConsMDFeNaoEnc.cStat),
                    FRetConsMDFeNaoEnc.xMotivo,
                    CodigoParaUF(FRetConsMDFeNaoEnc.cUF)]);
end;

function TMDFeConsultaMDFeNaoEnc.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService Consulta MDF-e nao Encerradas:' + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

{ TDistribuicaoDFe }

constructor TDistribuicaoDFe.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);
end;

destructor TDistribuicaoDFe.Destroy;
begin
  FretDistDFeInt.Free;
  FlistaArqs.Free;

  inherited;
end;

procedure TDistribuicaoDFe.Clear;
begin
  inherited Clear;

  FPStatus := stMDFeDistDFeInt;
  FPLayout := LayMDFeDistDFeInt;
  FPArqEnv := 'con-dist-dfe';
  FPArqResp := 'dist-dfe';
//  FPBodyElement := 'mdfeDistDFeInteresse';
//  FPHeaderElement := '';

  if Assigned(FretDistDFeInt) then
    FretDistDFeInt.Free;

  FretDistDFeInt := TRetDistDFeInt.Create('MDFe');

  if Assigned(FlistaArqs) then
    FlistaArqs.Free;

  FlistaArqs := TStringList.Create;
end;

procedure TDistribuicaoDFe.DefinirServicoEAction;
begin
  FPServico := GetUrlWsd + 'MDFeDistribuicaoDFe';
  FPSoapAction := FPServico + '/mdfeDistDFeInteresse';
end;

procedure TDistribuicaoDFe.DefinirDadosMsg;
var
  DistDFeInt: TDistDFeInt;
begin
  DistDFeInt := TDistDFeInt.Create(FPVersaoServico, NAME_SPACE_MDFE,
                                   '', 'consChMDFe', 'chMDFe', False);
  try
    DistDFeInt.TpAmb := FPConfiguracoesMDFe.WebServices.Ambiente;
    DistDFeInt.CNPJCPF := FCNPJCPF;
    DistDFeInt.ultNSU := FultNSU;
    DistDFeInt.NSU := FNSU;
    DistDFeInt.Chave := trim(FchMDFe);

    AjustarOpcoes( DistDFeInt.Gerador.Opcoes );

    DistDFeInt.GerarXML;

    FPDadosMsg := DistDFeInt.Gerador.ArquivoFormatoXML;
  finally
    DistDFeInt.Free;
  end;
end;

function TDistribuicaoDFe.TratarResposta: Boolean;
var
  I: Integer;
  AXML: String;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'mdfeDistDFeInteresseResult');

  // Processando em UTF8, para poder gravar arquivo corretamente //
  FretDistDFeInt.Leitor.Arquivo := FPRetWS;
  FretDistDFeInt.LerXml;

  for I := 0 to FretDistDFeInt.docZip.Count - 1 do
  begin
    AXML := FretDistDFeInt.docZip.Items[I].XML;
    FNomeArq := '';
    if (AXML <> '') then
    begin
      case FretDistDFeInt.docZip.Items[I].schema of
        (*
        schresMDFe:
          FNomeArq := FretDistDFeInt.docZip.Items[I].resMDFe.chMDFe + '-resMDFe.xml';

        schresEvento:
          FNomeArq := OnlyNumber(TpEventoToStr(FretDistDFeInt.docZip.Items[I].resEvento.tpEvento) +
                     FretDistDFeInt.docZip.Items[I].resEvento.chMDFe +
                     Format('%.2d', [FretDistDFeInt.docZip.Items[I].resEvento.nSeqEvento])) +
                     '-resEventoMDFe.xml';
        *)
        schprocMDFe:
          FNomeArq := FretDistDFeInt.docZip.Items[I].resDFe.chDFe + '-mdfe.xml';

        schprocEventoMDFe:
          FNomeArq := OnlyNumber(FretDistDFeInt.docZip.Items[I].procEvento.Id) +
                     '-procEventoMDFe.xml';
      end;

      if NaoEstaVazio(NomeArq) then
        FlistaArqs.Add( FNomeArq );

      if (FPConfiguracoesMDFe.Arquivos.Salvar) and NaoEstaVazio(FNomeArq) then
      begin
        if (FretDistDFeInt.docZip.Items[I].schema in [schprocEventoMDFe]) then // salvar evento
          FPDFeOwner.Gravar(FNomeArq, AXML, GerarPathDistribuicao(FretDistDFeInt.docZip.Items[I]));

        if (FretDistDFeInt.docZip.Items[I].schema in [schprocMDFe]) then
          FPDFeOwner.Gravar(FNomeArq, AXML, GerarPathDistribuicao(FretDistDFeInt.docZip.Items[I]));
      end;
    end;
  end;

  { Processsa novamente, chamando ParseTXT, para converter de UTF8 para a String
    nativa e Decodificar caracteres HTML Entity }
  FretDistDFeInt.Free;   // Limpando a lista
  FretDistDFeInt := TRetDistDFeInt.Create('MDFe');

  FretDistDFeInt.Leitor.Arquivo := ParseText(FPRetWS);
  FretDistDFeInt.LerXml;

  FPMsg := FretDistDFeInt.xMotivo;
  Result := (FretDistDFeInt.CStat = 137) or (FretDistDFeInt.CStat = 138);
end;

function TDistribuicaoDFe.GerarMsgLog: String;
begin
  Result := Format(ACBrStr('Vers�o Layout: %s ' + LineBreak +
                           'Ambiente: %s ' + LineBreak +
                           'Vers�o Aplicativo: %s ' + LineBreak +
                           'Status C�digo: %s ' + LineBreak +
                           'Status Descri��o: %s ' + LineBreak +
                           'Resposta: %s ' + LineBreak +
                           '�ltimo NSU: %s ' + LineBreak +
                           'M�ximo NSU: %s ' + LineBreak),
                   [FretDistDFeInt.versao, TpAmbToStr(FretDistDFeInt.tpAmb),
                    FretDistDFeInt.verAplic, IntToStr(FretDistDFeInt.cStat),
                    FretDistDFeInt.xMotivo,
                    IfThen(FretDistDFeInt.dhResp = 0, '',
                           FormatDateTimeBr(RetDistDFeInt.dhResp)),
                    FretDistDFeInt.ultNSU, FretDistDFeInt.maxNSU]);
end;

function TDistribuicaoDFe.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService Distribui��o de DFe:' + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TDistribuicaoDFe.GerarPathDistribuicao(
  AItem: TdocZipCollectionItem): String;
var
  Data: TDateTime;
begin
  if FPConfiguracoesMDFe.Arquivos.EmissaoPathMDFe then
  begin
    Data := AItem.resDFe.dhEmi;
    if Data = 0 then
      Data := AItem.procEvento.dhEvento;
  end
  else
    Data := Now;

  case AItem.schema of
    schprocEventoMDFe:
      Result := FPConfiguracoesMDFe.Arquivos.GetPathDownloadEvento(AItem.procEvento.tpEvento,
                                                           AItem.resDFe.xNome,
                                                           AItem.procEvento.CNPJ,
                                                           AItem.resDFe.IE,
                                                           Data);

    schprocMDFe:
      Result := FPConfiguracoesMDFe.Arquivos.GetPathDownload(AItem.resDFe.xNome,
                                                             AItem.resDFe.CNPJCPF,
                                                             AItem.resDFe.IE,
                                                             Data);
  end;
end;
(*
procedure TDistribuicaoDFe.DefinirURL;
var
  UF, Modelo: String;
  Versao: Double;
begin
  { Esse m�todo � tratado diretamente pela RFB }

  UF := 'AN';
  Modelo := 'MDFe';
  Versao := 0;
  FPVersaoServico := '';
  FPURL := '';
  Versao := VersaoMDFeToDbl(FPConfiguracoesMDFe.Geral.VersaoDF);

  TACBrMDFe(FPDFeOwner).LerServicoDeParams(
    Modelo,
    UF ,
    FPConfiguracoesMDFe.WebServices.Ambiente,
    LayOutToServico(FPLayout),
    Versao,
    FPURL);

  FPVersaoServico := FloatToString(Versao, '.', '0.00');
end;
*)
{ TMDFeEnvioWebService }

constructor TMDFeEnvioWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPStatus := stMDFeEnvioWebService;
end;

destructor TMDFeEnvioWebService.Destroy;
begin
  inherited Destroy;
end;

procedure TMDFeEnvioWebService.Clear;
begin
  inherited Clear;

  FVersao := '';
end;

function TMDFeEnvioWebService.Executar: Boolean;
begin
  Result := inherited Executar;
end;

procedure TMDFeEnvioWebService.DefinirURL;
begin
  FPURL := FPURLEnvio;
end;

procedure TMDFeEnvioWebService.DefinirServicoEAction;
begin
  FPServico := FPSoapAction;
end;

procedure TMDFeEnvioWebService.DefinirDadosMsg;
var
  LeitorXML: TLeitor;
begin
  LeitorXML := TLeitor.Create;
  try
    LeitorXML.Arquivo := FXMLEnvio;
    LeitorXML.Grupo := FXMLEnvio;
    FVersao := LeitorXML.rAtributo('versao')
  finally
    LeitorXML.Free;
  end;

  FPDadosMsg := FXMLEnvio;
end;

function TMDFeEnvioWebService.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'soap:Body');
  Result := True;
end;

function TMDFeEnvioWebService.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService: '+FPServico + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TMDFeEnvioWebService.GerarVersaoDadosSoap: String;
begin
  Result := '<versaoDados>' + FVersao + '</versaoDados>';
end;

{ TWebServices }

constructor TWebServices.Create(AOwner: TACBrDFe);
begin
  FACBrMDFe := TACBrMDFe(AOwner);

  FStatusServico := TMDFeStatusServico.Create(FACBrMDFe);
  FEnviar := TMDFeRecepcao.Create(FACBrMDFe, TACBrMDFe(FACBrMDFe).Manifestos);
  FRetorno := TMDFeRetRecepcao.Create(FACBrMDFe, TACBrMDFe(FACBrMDFe).Manifestos);
  FRecibo := TMDFeRecibo.Create(FACBrMDFe, TACBrMDFe(FACBrMDFe).Manifestos);
  FConsulta := TMDFeConsulta.Create(FACBrMDFe, TACBrMDFe(FACBrMDFe).Manifestos);
  FEnvEvento := TMDFeEnvEvento.Create(FACBrMDFe, TACBrMDFe(FACBrMDFe).EventoMDFe);
  FConsMDFeNaoEnc := TMDFeConsultaMDFeNaoEnc.Create(FACBrMDFe);
  FDistribuicaoDFe := TDistribuicaoDFe.Create(FACBrMDFe);
  FEnvioWebService := TMDFeEnvioWebService.Create(FACBrMDFe);
end;

destructor TWebServices.Destroy;
begin
  FStatusServico.Free;
  FEnviar.Free;
  FRetorno.Free;
  FRecibo.Free;
  FConsulta.Free;
  FEnvEvento.Free;
  FConsMDFeNaoEnc.Free;
  FDistribuicaoDFe.Free;
  FEnvioWebService.Free;

  inherited Destroy;
end;

function TWebServices.Envia(ALote: Integer; ASincrono:  Boolean = False): Boolean;
begin
  Result := Envia(IntToStr(ALote), ASincrono);
end;

function TWebServices.Envia(const ALote: String; ASincrono:  Boolean = False): Boolean;
begin
  FEnviar.Clear;
  FRetorno.Clear;

  FEnviar.Lote := ALote;
  FEnviar.Sincrono := ASincrono;

  if not Enviar.Executar then
    Enviar.GerarException( Enviar.Msg );

  if not ASincrono or ((FEnviar.Recibo <> '') and (FEnviar.cStat = 103)) then
  begin
    FRetorno.Recibo := FEnviar.Recibo;
    if not FRetorno.Executar then
      FRetorno.GerarException( FRetorno.Msg );
  end;

  Result := True;
end;

function TWebServices.ConsultaMDFeNaoEnc(const ACNPJCPF: String): Boolean;
begin
  FConsMDFeNaoEnc.FCNPJCPF := ACNPJCPF;

  if not FConsMDFeNaoEnc.Executar then
    FConsMDFeNaoEnc.GerarException( FConsMDFeNaoEnc.Msg );

  Result := True;
end;

end.
