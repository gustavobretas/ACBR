{******************************************************************************}
{ Projeto: Componente ACBrNFSe                                                 }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{  de Servi�o eletr�nica - NFSe                                                }

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

unit ACBrNFSeWebServices;

interface

uses
  Classes, SysUtils,
  ACBrDFe, ACBrDFeWebService,
  ACBrNFSeNotasFiscais, ACBrNFSeConfiguracoes,
  pcnAuxiliar, pcnConversao, pnfsNFSe, pnfsConversao,
  pnfsLerListaNFSe,
  pnfsEnvLoteRpsResposta, pnfsConsSitLoteRpsResposta,
  pnfsConsLoteRpsResposta, pnfsConsNFSeporRpsResposta,
  pnfsConsNFSeResposta, pnfsCancNFSeResposta,
  pnfsGerarNFSeResposta, pnfsSubsNFSeResposta;

type

  { TNFSeWebService }

  TNFSeWebService = class(TDFeWebService)
  private
  protected
    FPConfiguracoesNFSe: TConfiguracoesNFSe;

    FNotasFiscais: TNotasFiscais;

    FProvedor: TNFSeProvedor;
    FPStatus: TStatusACBrNFSe;
    FPLayout: TLayOutNFSe;
    FNameSpaceDad: String;
    FNameSpaceCab: String;
    FURI: String;
    FURISig: String;
    FURIRef: String;
    FTagI: String;
    FTagF: String;
    FDadosSenha: String;
    FDadosEnvelope: String;
    FaMsg: String;
    FSeparador: String;
    FPrefixo2: String;
    FPrefixo3: String;
    FPrefixo4: String;
    FNameSpace: String;
    FDefTipos: String;
    FCabecalho: String;
    FxsdServico: String;
    FVersaoXML: String;
    FVersaoNFSe: TVersaoNFSe;

    FvNotas: String;
    FXML_NFSe: String;

    FProtocolo: String;
    FDataRecebimento: TDateTime;

    FRetornoNFSe: TRetornoNFSe;

    procedure DefinirURL; override;
    procedure DefinirEnvelopeSoap; override;
    procedure InicializarServico; override;
    function GerarVersaoDadosSoap: String; override;
    function GerarCabecalhoSoap: String; override;
    procedure InicializarDadosMsg;
    procedure FinalizarServico; override;
    function ExtrairRetorno(TAGResposta: String): String;
    function ExtrairNotasRetorno: Boolean;
    function GerarRetornoNFSe(ARetNFSe: String): String;
  public
    constructor Create(AOwner: TACBrDFe); override;

    property Provedor: TNFSeProvedor read FProvedor;
    property Status: TStatusACBrNFSe read FPStatus;
    property Layout: TLayOutNFSe read FPLayout;
    property NameSpaceCab: String read FNameSpaceCab;
    property NameSpaceDad: String read FNameSpaceDad;
    property URI: String read FURI;
    property URISig: String read FURISig;
    property URIRef: String read FURIRef;
    property TagI: String read FTagI;
    property TagF: String read FTagF;
    property DadosSenha: String read FDadosSenha;
    property DadosEnvelope: String read FDadosEnvelope;
    property aMsg: String read FaMsg;
    property Separador: String read FSeparador;
    property Prefixo2: String read FPrefixo2;
    property Prefixo3: String read FPrefixo3;
    property Prefixo4: String read FPrefixo4;
    property NameSpace: String read FNameSpace;
    property DefTipos: String read FDefTipos;
    property Cabecalho: String read FCabecalho;
    property xsdServico: String read FxsdServico;
    property VersaoXML: String read FVersaoXML;
    property VersaoNFSe: TVersaoNFSe read FVersaoNFSe;
    property vNotas: String read FvNotas;
    property XML_NFSe: String read FXML_NFSe;

    property DataRecebimento: TDateTime read FDataRecebimento;
    property Protocolo: String read FProtocolo;

    property RetornoNFSe: TRetornoNFSe read FRetornoNFSe write FRetornoNFSe;
  end;

  { TNFSeGerarLoteRPS }

  TNFSeGerarLoteRPS = Class(TNFSeWebService)
  private
    FNumeroLote: String;

  protected
    procedure EnviarDados; override;
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property NumeroLote: String read FNumeroLote;
  end;

  { TNFSeEnviarLoteRPS }

  TNFSeEnviarLoteRPS = class(TNFSeWebService)
  private
    FNumeroLote: String;

    FRetEnvLote: TRetEnvLote;

    function GetLote: String;
    function GetProtocolo: String;
  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property NumeroLote: String read FNumeroLote;

    property RetEnvLote: TRetEnvLote read FRetEnvLote write FRetEnvLote;
  end;

{ TNFSeEnviarSincrono }

  TNFSeEnviarSincrono = Class(TNFSeWebService)
  private
    FNumeroLote: String;
    FSituacao: String;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property NumeroLote: String read FNumeroLote;
    property Situacao: String read FSituacao;
  end;

{ TNFSeGerarNFSe }

  TNFSeGerarNFSe = Class(TNFSeWebService)
  private
    FNumeroRps: Integer;
    FSituacao: String;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property NumeroRps: Integer read FNumeroRps;
    property Situacao: String read FSituacao;
  end;

{ TNFSeConsultarSituacaoLoteRPS }

  TNFSeConsultarSituacaoLoteRPS = Class(TNFSeWebService)
  private
    FCNPJ: String;
    FInscMun: String;
    FNumeroLote: String;
    FSituacao: String;
    FSenha: String;
    FFraseSecreta: String;

    FRetSitLote: TRetSitLote;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    function TratarRespostaFinal: Boolean;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    function Executar: Boolean; override;

    property CNPJ: String read FCNPJ write FCNPJ;
    property InscMun: String read FInscMun write FInscMun;
    property NumeroLote: String read FNumeroLote write FNumeroLote;
    property Situacao: String read FSituacao;
    property Senha: String read FSenha write FSenha;
    property FraseSecreta: String read FFraseSecreta write FFraseSecreta;

    property RetSitLote: TRetSitLote read FRetSitLote write FRetSitLote;
  end;

{ TNFSeConsultarLoteRPS }

  TNFSeConsultarLoteRPS = Class(TNFSeWebService)
  private
    FNumeroLote: String;
    FCNPJ: String;
    FInscMun: String;
    FSenha: String;
    FFraseSecreta: String;
    FRazaoSocial: String;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    //usado pelo provedor IssDsf
    property NumeroLote: String read FNumeroLote write FNumeroLote;
    property CNPJ: String read FCNPJ write FCNPJ;
    property InscMun: String read FInscMun write FInscMun;
    property Senha: String read FSenha write FSenha;
    property FraseSecreta: String read FFraseSecreta write FFraseSecreta;
    //usado pelo provedor Tecnos
    property RazaoSocial: String read FRazaoSocial write FRazaoSocial;
  end;

{ TNFSeConsultarNFSeRPS }

  TNFSeConsultarNFSeRPS = Class(TNFSeWebService)
  private
    FNumero: String;
    FSerie: String;
    FTipo: String;
    FCNPJ: String;
    FInscMun: String;
    FSenha: String;
    FFraseSecreta: String;
    FRazaoSocial: String;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property Numero: String read FNumero write FNumero;
    property Serie: String read FSerie write FSerie;
    property Tipo: String read FTipo write FTipo;
    property CNPJ: String read FCNPJ write FCNPJ;
    property InscMun: String read FInscMun write FInscMun;
    property Senha: String read FSenha write FSenha;
    property FraseSecreta: String read FFraseSecreta write FFraseSecreta;
    property RazaoSocial: String read FRazaoSocial write FRazaoSocial;
  end;

{ TNFSeConsultarNFSe }

  TNFSeConsultarNFSe = Class(TNFSeWebService)
  private
    FCNPJ: String;
    FInscMun: String;
    FDataInicial: TDateTime;
    FDataFinal: TDateTime;
    FNumeroNFSe: String;
    FPagina: Integer;
    FSenha: String;
    FFraseSecreta: String;
    FCNPJTomador: String;
    FIMTomador: String;
    FNomeInter: String;
    FCNPJInter: String;
    FIMInter: String;
    FSerie: String;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property CNPJ: String               read FCNPJ               write FCNPJ;
    property InscMun: String read FInscMun write FInscMun;
    property DataInicial: TDateTime     read FDataInicial        write FDataInicial;
    property DataFinal: TDateTime       read FDataFinal          write FDataFinal;
    property NumeroNFSe: String         read FNumeroNFSe         write FNumeroNFSe;
    property Pagina: Integer            read FPagina             write FPagina;
    property Senha: String              read FSenha              write FSenha;
    property FraseSecreta: String       read FFraseSecreta       write FFraseSecreta;
    property CNPJTomador: String        read FCNPJTomador        write FCNPJTomador;
    property IMTomador: String          read FIMTomador          write FIMTomador;
    property NomeInter: String          read FNomeInter          write FNomeInter;
    property CNPJInter: String          read FCNPJInter          write FCNPJInter;
    property IMInter: String            read FIMInter            write FIMInter;
    property Serie: String              read FSerie              write FSerie;
  end;

{ TNFSeCancelarNFSe }

  TNFSeCancelarNFSe = Class(TNFSeWebService)
  private
    FCodigoCancelamento: String;
    FMotivoCancelamento: String;
    FDataHora: TDateTime;
    FCNPJ: String;
    FInscMun: String;
    FNumeroNFSe: String;
    FCodigoMunicipio: String;

    FRetCancNFSe: TRetCancNFSe;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure SalvarResposta; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property CodigoCancelamento: String read FCodigoCancelamento write FCodigoCancelamento;
    property MotivoCancelamento: String read FMotivoCancelamento write FMotivoCancelamento;
    property DataHora: TDateTime read FDataHora write FDataHora;
    property NumeroNFSe: String read FNumeroNFSe write FNumeroNFSe;
    property CNPJ: String read FCNPJ write FCNPJ;
    property InscMun: String read FInscMun write FInscMun;
    property CodigoMunicipio: String read FCodigoMunicipio write FCodigoMunicipio;

    property RetCancNFSe: TRetCancNFSe read FRetCancNFSe write FRetCancNFSe;
  end;

{ TNFSeSubstituirNFSe }

 TNFSeSubstituirNFSe = Class(TNFSeWebService)
  private
    FCodigoCancelamento: String;
    FMotivoCancelamento: String;
    FDataHora: TDateTime;
    FNumeroNFSe: String;
    FCNPJ: String;
    FInscMun: String;
    FCodigoMunicipio: String;

    FNumeroRps: Integer;
    FSituacao: String;

    FNFSeRetorno: TretSubsNFSe;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property CodigoCancelamento: String read FCodigoCancelamento write FCodigoCancelamento;
    property MotivoCancelamento: String read FMotivoCancelamento write FMotivoCancelamento;
    property DataHora: TDateTime        read FDataHora           write FDataHora;
    property NumeroNFSe: String         read FNumeroNFSe         write FNumeroNFSe;
    property CNPJ: String               read FCNPJ               write FCNPJ;
    property InscMun: String            read FInscMun            write FInscMun;
    property CodigoMunicipio: String    read FCodigoMunicipio    write FCodigoMunicipio;

    property NumeroRps: Integer         read FNumeroRps;
    property Situacao: String           read FSituacao;

    property NFSeRetorno: TretSubsNFSe  read FNFSeRetorno        write FNFSeRetorno;
  end;

{ TNFSeLinkNFSe }
  (*
  TNFSeLinkNFSe = Class(TNFSeWebService)
  private
    FNumeroNFSe: Integer;
    FCodVerif: String;
    FLink: String;
    FIM: String;

  protected
    procedure DefinirURL; override;
    procedure DefinirServicoEAction; override;
    procedure DefinirDadosMsg; override;
    function TratarResposta: Boolean; override;
    procedure FinalizarServico; override;
    function GerarMsgLog: String; override;
    function GerarPrefixoArquivo: String; override;
  public
    constructor Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
      reintroduce; overload;
    destructor Destroy; override;

    property NumeroNFSe: Integer read FNumeroNFSe;
    property CodVerif: String read FCodVerif;
    property Link: String read FLink;
    property IM: String read FIM;
  end;
  *)
  { TNFSeEnvioWebService }

  TNFSeEnvioWebService = class(TNFSeWebService)
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
    function Executar: Boolean; override;

    property XMLEnvio: String read FXMLEnvio write FXMLEnvio;
    property URLEnvio: String read FPURLEnvio write FPURLEnvio;
    property SoapActionEnvio: String read FSoapActionEnvio write FSoapActionEnvio;
  end;

  { TWebServices }

  TWebServices = class
  private
    FACBrNFSe: TACBrDFe;
    FGerarLoteRPS: TNFSeGerarLoteRPS;
    FEnviarLoteRPS: TNFSeEnviarLoteRPS;
    FEnviarSincrono: TNFSeEnviarSincrono;
    FGerarNFSe: TNFSeGerarNFSe;
    FConsSitLoteRPS: TNFSeConsultarSituacaoLoteRPS;
    FConsLote: TNFSeConsultarLoteRPS;
    FConsNFSeRps: TNFSeConsultarNFSeRps;
    FConsNFSe: TNFSeConsultarNFSe;
    FCancNFSe: TNFSeCancelarNFSe;
    FSubNFSe: TNFSeSubstituirNFSe;
//    FLinkNFSe: TNFSeLinkNFSe;
    FEnvioWebService: TNFSeEnvioWebService;

  public
    constructor Create(AOwner: TACBrDFe); overload;
    destructor Destroy; override;

    function GeraLote(ALote: Integer): Boolean; overload;
    function GeraLote(ALote: String): Boolean; overload;

    function Envia(ALote: Integer): Boolean; overload;
    function Envia(ALote: String): Boolean; overload;

    function EnviaSincrono(ALote:Integer): Boolean; overload;
    function EnviaSincrono(ALote:String): Boolean; overload;

    function Gera(ARps: Integer): Boolean;

    function ConsultaSituacao(ACNPJ, AInscMun, AProtocolo: String;
                              const ANumLote: String = ''): Boolean;
    function ConsultaLoteRps(ANumLote, AProtocolo: String;
                             const CarregaProps: boolean = true): Boolean; overload;
    function ConsultaLoteRps(ANumLote, AProtocolo,
                             ACNPJ, AInscMun: String;
                             const ASenha: String = '';
                             const AFraseSecreta: String = '';
                             const ARazaoSocial: String = ''): Boolean; overload;
    function ConsultaNFSeporRps(ANumero, ASerie, ATipo, ACNPJ, AInscMun: String;
                                const ASenha: String = '';
                                const AFraseSecreta: String = '';
                                const ARazaoSocial: String = ''): Boolean;
    function ConsultaNFSe(ACNPJ,
                          AInscMun: String;
                          ADataInicial,
                          ADataFinal: TDateTime;
                          NumeroNFSe: String = '';
                          APagina: Integer = 1;
                          const ASenha: String = '';
                          const AFraseSecreta: String = '';
                          ACNPJTomador: String = '';
                          AIMTomador: String = '';
                          ANomeInter: String = '';
                          ACNPJInter: String = '';
                          AIMInter: String = '';
                          ASerie: String = ''): Boolean;

    function CancelaNFSe(ACodigoCancelamento: String): Boolean; overload;
    function CancelaNFSe(ACodigoCancelamento, ANumeroNFSe, ACNPJ, AInscMun,
                         ACodigoMunicipio, AMotivoCancelamento: String): Boolean; overload;

    function SubstituiNFSe(ACodigoCancelamento, ANumeroNFSe: String): Boolean;

//    function LinkNFSeGerada(ANumeroNFSe: Integer; ACodVerificacao, AInscricaoM: String): String;

    property ACBrNFSe: TACBrDFe read FACBrNFSe write FACBrNFSe;
    property GerarLoteRPS: TNFSeGerarLoteRPS read FGerarLoteRPS write FGerarLoteRPS;
    property EnviarLoteRPS: TNFSeEnviarLoteRPS read FEnviarLoteRPS write FEnviarLoteRPS;
    property EnviarSincrono: TNFSeEnviarSincrono read FEnviarSincrono write FEnviarSincrono;
    property GerarNFSe: TNFSeGerarNFSe read FGerarNFSe write FGerarNFSe;
    property ConsSitLoteRPS: TNFSeConsultarSituacaoLoteRPS read FConsSitLoteRPS write FConsSitLoteRPS;
    property ConsLote: TNFSeConsultarLoteRPS read FConsLote write FConsLote;
    property ConsNFSeRps: TNFSeConsultarNFSeRps read FConsNFSeRps write FConsNFSeRps;
    property ConsNFSe: TNFSeConsultarNFSe read FConsNFSe write FConsNFSe;
    property CancNFSe: TNFSeCancelarNFSe read FCancNFSe write FCancNFSe;
    property SubNFSe: TNFSeSubstituirNFSe read FSubNFSe write FSubNFSe;
//    property LinkNFSe: TNFSeLinkNFSe read FLinkNFSe write FLinkNFSe;
    property EnvioWebService: TNFSeEnvioWebService read FEnvioWebService write FEnvioWebService;
  end;

implementation

uses
  StrUtils, Math,
  ACBrUtil, ACBrNFSe, pnfsNFSeG,
  pcnGerador, pcnLeitor;

{ TNFSeWebService }

constructor TNFSeWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPConfiguracoesNFSe := TConfiguracoesNFSe(FPConfiguracoes);
  FPLayout := LayNFSeRecepcaoLote;
  FPStatus := stNFSeIdle;
end;

procedure TNFSeWebService.DefinirURL;
var
  Versao: Double;
begin
  { sobrescrever apenas se necess�rio.
    Voc� tamb�m pode mudar apenas o valor de "FLayoutServico" na classe
    filha e chamar: Inherited;     }

  Versao := 0;
  FPVersaoServico := '';
  FPURL := '';

  TACBrNFSe(FPDFeOwner).LerServicoDeParams(FPLayout, Versao, FPURL);
  FPVersaoServico := FloatToString(Versao, '.', '0.00');
end;

procedure TNFSeWebService.DefinirEnvelopeSoap;
var
  Texto, DadosMsg, CabMsg, NameSpace: String;
begin
  {$IFDEF FPC}
   Texto := '<' + ENCODING_UTF8 + '>';    // Envelope j� est� sendo montado em UTF8
  {$ELSE}
   Texto := '';  // Isso for�ar� a convers�o para UTF8, antes do envio
  {$ENDIF}

  Texto := FDadosEnvelope;
  // %SenhaMsg%  : Representa a Mensagem que contem o usu�rio e senha
  // %NameSpace% : Representa o NameSpace de Homologa��o/Produ��o
  // %CabMsg%    : Representa a Mensagem de Cabe�alho
  // %DadosMsg%  : Representa a Mensagem de Dados

  DadosMsg := StringReplace(FPDadosMsg, '<' + ENCODING_UTF8 + '>', '', [rfReplaceAll]);
  if FPConfiguracoesNFSe.Geral.ConfigXML.DadosStr then
    DadosMsg := StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]);

  if (FProvedor = proGinfes) and (FPLayout = LayNfseCancelaNfse) then
  begin
    DadosMsg := '<' + ENCODING_UTF8 + '>' + FPDadosMsg;
    DadosMsg := StringReplace(StringReplace(DadosMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]);
  end;

  if (FProvedor = proPronim) and (FPLayout = LayNfseRecepcaoLote) then begin
    DadosMsg := '&lt;' + ENCODING_UTF8 + '&gt;' + DadosMsg;
    DadosMsg := StringReplace(DadosMsg, ' xmlns="http://www.abrasf.org.br/ABRASF/arquivos/nfse.xsd"', '', [rfReplaceAll]);
  end;

  CabMsg := FPCabMsg;
  if FPConfiguracoesNFSe.Geral.ConfigXML.CabecalhoStr then
    CabMsg := StringReplace(StringReplace(CabMsg, '<', '&lt;', [rfReplaceAll]), '>', '&gt;', [rfReplaceAll]);

  if FPConfiguracoesNFSe.WebServices.Ambiente = taProducao then
    NameSpace := FPConfiguracoesNFSe.Geral.ConfigNameSpace.Producao
  else
    NameSpace := FPConfiguracoesNFSe.Geral.ConfigNameSpace.Homologacao;

  Texto := StringReplace(Texto, '%SenhaMsg%', FDadosSenha, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%NameSpace%', NameSpace, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%CabMsg%', CabMsg, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%DadosMsg%', DadosMsg, [rfReplaceAll]);

  FPEnvelopeSoap := Texto;
end;

procedure TNFSeWebService.InicializarServico;
begin
  { Sobrescrever apenas se necess�rio }
  inherited InicializarServico;

  FProvedor := FPConfiguracoesNFSe.Geral.Provedor;

  if FPConfiguracoesNFSe.Geral.ConfigGeral.VersaoSoap = '1.2' then
    FPMimeType := 'application/soap+xml'
  else
    FPMimeType := 'text/xml';

  TACBrNFSe(FPDFeOwner).SetStatus(FPStatus);
end;

function TNFSeWebService.GerarVersaoDadosSoap: String;
begin
  { Sobrescrever apenas se necess�rio }

  if EstaVazio(FPVersaoServico) then
    FPVersaoServico := TACBrNFSe(FPDFeOwner).LerVersaoDeParams(FPLayout);

  Result := '<versaoDados>' + FPVersaoServico + '</versaoDados>';
end;

function TNFSeWebService.GerarCabecalhoSoap: String;
begin
  Result := FPCabMsg;
end;

procedure TNFSeWebService.InicializarDadosMsg;
var
  Texto: String;
  Ok: Boolean;
begin
  FvNotas    := '';
  FURI       := '';
  FURISig    := '';
  FURIRef    := '';

  FNameSpace := FPConfiguracoesNFSe.Geral.ConfigXML.NameSpace;
  FVersaoXML := FPConfiguracoesNFSe.Geral.ConfigXML.VersaoXML;
  FVersaoNFSe := StrToVersaoNFSe(Ok, FVersaoXML);
  FDefTipos  := FPConfiguracoesNFSe.Geral.ConfigSchemas.DefTipos;

  if (FProvedor = proGinfes) and (FPLayout = LayNfseCancelaNfse) then
    FDefTipos  := 'tipos_v02.xsd';

  FCabecalho := FPConfiguracoesNFSe.Geral.ConfigSchemas.Cabecalho;
  FPrefixo2  := FPConfiguracoesNFSe.Geral.ConfigGeral.Prefixo2;
  FPrefixo3  := FPConfiguracoesNFSe.Geral.ConfigGeral.Prefixo3;
  FPrefixo4  := FPConfiguracoesNFSe.Geral.ConfigGeral.Prefixo4;
  FPCabMsg   := FPConfiguracoesNFSe.Geral.ConfigEnvelope.CabecalhoMsg;

  if RightStr(FNameSpace, 1) = '/' then
    FSeparador := ''
  else
    FSeparador := '/';

  if FCabecalho <> '' then
  begin
    if FPrefixo2 <> '' then
      FNameSpaceCab := ' xmlns:' + StringReplace(FPrefixo2, ':', '', []) +
                       '="' + FNameSpace + FSeparador + FCabecalho +'">'
    else
      FNameSpaceCab := ' xmlns="' + FNameSpace + FSeparador + FCabecalho +'">';
  end
  else
    FNameSpaceCab := '>';

  if FxsdServico <> '' then
  begin
    case FProvedor of
      proIssDSF: FNameSpaceDad := 'xmlns:' + StringReplace(FPrefixo3, ':', '', []) + '="' + FNameSpace + '" ';
      proInfisc: FNameSpaceDad := 'xmlns:' + StringReplace(FPrefixo3, ':', '', []) + '="' + FNameSpace + '" ';
      else begin
        if (FSeparador = '') then
        begin
          if FPrefixo3 <> '' then
            FNameSpaceDad := 'xmlns:' + StringReplace(FPrefixo3, ':', '', []) + '="' + FNameSpace + FSeparador + FxsdServico + '"'
          else
            FNameSpaceDad := 'xmlns="' + FNameSpace + FSeparador + FxsdServico + '"';

          FPDFeOwner.SSL.NameSpaceURI := FNameSpace + FSeparador + FxsdServico;
        end
        else begin
          if FPrefixo3 <> '' then
            FNameSpaceDad := 'xmlns:' + StringReplace(FPrefixo3, ':', '', []) + '="' + FNameSpace + '"'
          else
            FNameSpaceDad := 'xmlns="' + FNameSpace + '"';

          FPDFeOwner.SSL.NameSpaceURI := FNameSpace;
        end;
      end;
    end;
  end
  else
    FNameSpaceDad := '';

  if (DefTipos = '') and (NameSpaceDad <> '') then
    FNameSpaceDad := FNameSpaceDad + '>';

  if FDefTipos <> '' then
  begin
    if FPrefixo4 <> '' then
      FNameSpaceDad := FNameSpaceDad + ' xmlns:' +
                       StringReplace(FPrefixo4, ':', '', []) + '="' + FNameSpace + FSeparador + FDefTipos + '">'
    else
      FNameSpaceDad := FNameSpaceDad + ' xmlns="' + FNameSpace + FSeparador + FDefTipos + '">';
  end;

  if FNameSpaceDad = '' then
    FNameSpaceDad := '>'
  else
    FNameSpaceDad := ' ' + FNameSpaceDad;

  Texto := FPConfiguracoesNFSe.Geral.ConfigGeral.DadosSenha;
  // %Usuario% : Representa o nome do usu�rio ou CNPJ
  // %Senha%   : Representa a senha do usu�rio
  Texto := StringReplace(Texto, '%Usuario%', FPConfiguracoesNFSe.Geral.UserWeb, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%Senha%', FPConfiguracoesNFSe.Geral.SenhaWeb, [rfReplaceAll]);

  FDadosSenha := Texto;
end;

procedure TNFSeWebService.FinalizarServico;
begin
  { Sobrescrever apenas se necess�rio }

  TACBrNFSe(FPDFeOwner).SetStatus(stNFSeIdle);
end;

function TNFSeWebService.ExtrairRetorno(TAGResposta: String): String;
begin
  // A fun��o ExtrairRetorno possui um par�metro que seria o nome do grupo que
  // contem o retorno desejado, no momento a fun��o n�o faz uso dela.
  // Ser� avaliado a real necessidade desse par�metro.
  
  Result := SeparaDados(FPRetornoWS, 'return');

  if Result = '' then
    Result := SeparaDados(FPRetornoWS, 'soap:Body');

  if Result = '' then
    Result := SeparaDados(FPRetornoWS, 'env:Body');

  // Caso n�o consiga extrai o retorno, retornar a resposta completa.
  if Result = '' then
    Result := FPRetornoWS;

(*
  Result := SeparaDados(FPRetornoWS, TAGResposta);
  Result := Result + '</' + TAGResposta + '>';
*)
end;

function TNFSeWebService.ExtrairNotasRetorno: Boolean;
var
  FRetListaNFSe, FRetNFSe, PathArq, NomeArq, xCNPJ: String;
  i, j, k, p, ii: Integer;
  xData: TDateTime;
begin
  FRetornoNFSe := TRetornoNFSe.Create;

  FRetornoNFSe.Leitor.Arquivo := FPRetWS;
  FRetornoNFSe.Provedor       := FProvedor;
  FRetornoNFSe.TabServicosExt := FPConfiguracoesNFSe.Arquivos.TabServicosExt;
  FRetornoNFSe.LerXml;

  FPrefixo3 := FPConfiguracoesNFSe.Geral.ConfigGeral.Prefixo3;
  FPrefixo4 := FPConfiguracoesNFSe.Geral.ConfigGeral.Prefixo4;

  case FProvedor of
    proBetha: FPrefixo3 := '';
    proDBSeller: FPrefixo3 := 'ii:';
    proSisPMJP: FPrefixo3 := 'nfse:';
    proFiorilli: begin
                   FPrefixo3 := 'ns2:';
                   FPrefixo4 := 'ns2:';
                 end;
    proSpeedGov: begin
                   FPrefixo3 := '';
                   FPrefixo4 := '';
                 end;
  end;

  // FSituacao: 1 = N�o Recebido
  //            2 = N�o Processado
  //            3 = Processado com Erro
  //            4 = Processado com Sucesso

  FRetListaNFSe := SeparaDados(FPRetWS, FPrefixo3 + 'ListaNfse');
  if FRetListaNFSe = '' then
    FRetListaNFSe := FPRetWS;

  if FProvedor = proSisPMJP then
    FPrefixo3 := '';

  // Alterado por Nilton Olher - 11/02/2015
//  if FProvedor = proGovDigital then
//    FRetListaNFSe := StringReplace(FRetListaNFSe,'ns2:','',[rfReplaceAll]);


  i := 0;
  while FRetListaNFSe <> '' do
  begin
    if FProvedor = proBetha then
      j := Pos('</' + Prefixo3 + 'ComplNfse>', FRetListaNFSe)
    else
      j := Pos('</' + Prefixo3 + 'CompNfse>', FRetListaNFSe);

    p := Length(trim(Prefixo3));
    if j > 0 then
    begin
//      FRetNFSe := Copy(FRetListaNFSe, 1, j - 1);
//      k :=  Pos('<' + Prefixo4 + 'Nfse', FRetNFSe);
//      FRetNFSe := Copy(FRetNFSe, k, length(FRetNFSe));

//      FRetNFSe := FProvedorClass.GeraRetornoNFSe(Prefixo3, FRetNFSe, FNomeCidade);

//      PathSalvar := FPConfiguracoesNFSe.Arquivos.GetPathNFSe(0);
//      FPConfiguracoesNFSe.Geral.Save(NFSeRetorno.ListaNFSe.CompNFSe.Items[i].NFSe.Numero + '-nfse.xml',
//                                NotaUtil.RetirarPrefixos(FRetNFSe), PathSalvar);
//      if FNotasFiscais.Count>0
//       then FNotasFiscais.Items[i].NomeArq := PathWithDelim(PathSalvar) + NFSeRetorno.ListaNFSe.CompNFSe.Items[i].NFSe.Numero + '-nfse.xml';

//      FRetListaNFSe := Copy(FRetListaNFSe, j + 11 + p, length(FRetListaNFSe));

      for ii := 0 to FRetornoNFSe.ListaNFSe.CompNFSe.Count -1 do
      begin

        if (FNotasFiscais.Count -1) < ii then 
          FNotasFiscais.Add;

        if FNotasFiscais.Items[ii].NFSe.IdentificacaoRps.Numero = FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.IdentificacaoRps.Numero then
        begin
          FNotasFiscais.Items[ii].Confirmada             := True;
          FNotasFiscais.Items[ii].NFSe.CodigoVerificacao := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.CodigoVerificacao;
          FNotasFiscais.Items[ii].NFSe.Numero            := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.Numero;
          FNotasFiscais.Items[ii].NFSe.Competencia       := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.Competencia;
          FNotasFiscais.Items[ii].NFSe.NFSeSubstituida   := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.NFSeSubstituida;
          FNotasFiscais.Items[ii].NFSe.OutrasInformacoes := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.OutrasInformacoes;
          FNotasFiscais.Items[ii].NFSe.DataEmissao       := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.DataEmissao;

          FNotasFiscais.Items[ii].NFSe.Servico.xItemListaServico := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.Servico.xItemListaServico;

          FNotasFiscais.Items[ii].NFSe.PrestadorServico.RazaoSocial  := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.RazaoSocial;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.NomeFantasia := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.NomeFantasia;

          FNotasFiscais.Items[ii].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ               := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;

          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.Endereco        := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.Endereco;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.Numero          := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.Numero;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.Complemento     := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.Complemento;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.Bairro          := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.Bairro;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.CodigoMunicipio := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.CodigoMunicipio;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.UF              := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.UF;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.CEP             := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.CEP;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Endereco.xMunicipio      := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.xMunicipio;

          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Contato.Telefone := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Contato.Telefone;
          FNotasFiscais.Items[ii].NFSe.PrestadorServico.Contato.Email    := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Contato.Email;

          FNotasFiscais.Items[ii].NFSe.Tomador.Endereco.xMunicipio := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.Tomador.Endereco.xMunicipio;

          FRetNFSe := Copy(FRetListaNFSe, 1, j - 1);
          k :=  Pos('<' + Prefixo4 + 'Nfse', FRetNFSe);
          FRetNFSe := Copy(FRetNFSe, k, length(FRetNFSe));

          FRetNFSe := GerarRetornoNFSe(FRetNFSe);

          if FPConfiguracoesNFSe.Arquivos.Salvar then
          begin
            if FPConfiguracoesNFSe.Arquivos.EmissaoPathNFSe then
              xData := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.DataEmissao
            else
              xData := Date;

            xCNPJ := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ;

            if FPConfiguracoesNFSe.Arquivos.NomeLongoNFSe then
              NomeArq := GerarNomeNFSe(UFparaCodigo(FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.PrestadorServico.Endereco.UF),
                                       FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.DataEmissao,
                                       xCNPJ,
                                       StrToIntDef(FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.Numero, 0)) + '-nfse.xml'
            else
              NomeArq := FRetornoNFSe.ListaNFSe.CompNFSe.Items[i].NFSe.Numero + '-nfse.xml';

            PathArq := PathWithDelim(FPConfiguracoesNFSe.Arquivos.GetPathNFSe(xData, xCNPJ));

            FPDFeOwner.Gravar(NomeArq, FRetNFSe, PathArq);

            if FNotasFiscais.Count > 0 then
              FNotasFiscais.Items[ii].NomeArq := PathArq + NomeArq;
          end;

          FRetListaNFSe := Copy(FRetListaNFSe, j + 11 + p, length(FRetListaNFSe));

          FNotasFiscais.Items[ii].XMLNFSe := FRetNFSe;

          break;
        end;
      end;

      inc(i);
    end
    else
      FRetListaNFSe:='';
  end;

  if FRetornoNFSe.ListaNFSe.CompNFSe.Count > 0 then
  begin
    FDataRecebimento := FRetornoNFSe.ListaNFSe.CompNFSe[0].NFSe.dhRecebimento;
    if FDataRecebimento = 0 then
      FDataRecebimento := FRetornoNFSe.ListaNFSe.CompNFSe[0].NFSe.DataEmissao;
//    FProtocolo       := FRetornoNFSe.ListaNFSe.CompNFSe[0].NFSe.Protocolo;
  end
  else begin
    FDataRecebimento := 0;
//    FProtocolo       := '';
  end;

  // Lista de Mensagem de Retorno
  FPMsg := '';
  FaMsg:='';
  if FRetornoNFSe.ListaNFSe.MsgRetorno.Count > 0 then
  begin
    for i := 0 to FRetornoNFSe.ListaNFSe.MsgRetorno.Count - 1 do
    begin
      if (FRetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Codigo <> 'L000') and
         (FRetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Codigo <> 'A0000') then
      begin
        FPMsg := FPMsg + FRetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Mensagem + IfThen(FPMsg = '', '', ' / ');

        FaMsg := FaMsg + 'C�digo Erro : ' + FRetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Codigo + LineBreak +
                         'Mensagem... : ' + FRetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Mensagem + LineBreak+
                         'Corre��o... : ' + FRetornoNFSe.ListaNFSe.MsgRetorno.Items[i].Correcao + LineBreak+
                         'Provedor... : ' + FPConfiguracoesNFSe.Geral.xProvedor + LineBreak;
      end;
    end;
  end
  else
    FaMsg := //'Numero do Lote : ' + FRetornoNFSe.ListaNFSe.NumeroLote + LineBreak +
             'Recebimento... : ' + IfThen(FDataRecebimento = 0, '', DateTimeToStr(FDataRecebimento)) + LineBreak +
             'Protocolo..... : ' + FProtocolo + LineBreak +
             'Provedor...... : ' + FPConfiguracoesNFSe.Geral.xProvedor + LineBreak;

  Result := (FDataRecebimento <> 0);
end;

function TNFSeWebService.GerarRetornoNFSe(ARetNFSe: String): String;
var
  Texto: String;
begin
  Texto := FPConfiguracoesNFSe.Geral.ConfigGeral.RetornoNFSe;
  // %DadosNFSe% : Representa a NFSe
  Texto := StringReplace(Texto, '%DadosNFSe%', ARetNFSe, [rfReplaceAll]);

  Result := Texto;
end;

{ TNFSeGerarLoteRPS }

constructor TNFSeGerarLoteRPS.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeRecepcao;
  FPLayout := LayNFSeRecepcaoLote;
  FPArqEnv := 'lot-rps';
  FPArqResp := ''; // O lote � apenas gerado n�o h� retorno de envio.
end;

destructor TNFSeGerarLoteRPS.Destroy;
begin
  inherited Destroy;
end;

procedure TNFSeGerarLoteRPS.EnviarDados;
begin
  // O Gerar Lote RPS n�o consome o Web Service
end;

procedure TNFSeGerarLoteRPS.DefinirURL;
begin
  FPLayout := LayNFSeRecepcaoLote;
  inherited DefinirURL;
end;

procedure TNFSeGerarLoteRPS.DefinirServicoEAction;
begin
  FPServico := 'GerarLoteRPS';
  FPSoapAction := '*'; 
end;

procedure TNFSeGerarLoteRPS.DefinirDadosMsg;
var
  I: Integer;
begin
  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoEnviar;

  InicializarDadosMsg;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.RPS then
  begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FVersaoNFSe of
        // RPS vers�o 2.00
        ve200: FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                  RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                                    '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                                '</Signature>'+
                               '</' + FPrefixo4 + 'Rps>';

        // RPS vers�o 1.00
        else FvNotas := FvNotas +
                        '<' + FPrefixo4 + 'Rps>' +
                         '<' + FPrefixo4 + 'InfRps' +
                           RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                         '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                        '</' + FPrefixo4 + 'Rps>';
      end;
      (*
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proISSDigital, proISSe, proSystemPro,
        pro4R, proFiorilli, proProdata, proVitoria, proPVH, proAgili, proCoplan,
        proVirtual, proFreire, proLink3, proGovDigital, proMitra,
        proGoiania: FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                  RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                                    '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                                '</Signature>'+
                               '</' + FPrefixo4 + 'Rps>';

        proDigifred: FvNotas := FvNotas +
                                '<' + FPrefixo4 + 'Rps ' +
                                   RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                                     '<' + FPrefixo4 + 'Rps', '</Signature>') +
                                 '</Signature>'+
                                '</' + Prefixo4 + 'Rps>';

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                                   '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</Signature>') +
                               '</Signature>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas +
                        '<' + FPrefixo4 + 'Rps>' +
                         '<' + FPrefixo4 + 'InfRps' +
                           RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                         '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                        '</' + FPrefixo4 + 'Rps>';
      end;
      *)
    end;
  end
  else begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proGoiania, proISSDigital, proISSe,
        proSystemPro, pro4R, proFiorilli, proProdata, proVitoria, proPVH, proAgili,
        proCoplan, proVirtual, proFreire, proLink3, proMitra,
        proGovDigital: FvNotas := FvNotas +
                                  '<' + FPrefixo4 + 'Rps>' +
                                   '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                     RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>') +
                                   '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>'+
                                  '</' + FPrefixo4 + 'Rps>';

        proIssDSF,
        proInfisc: FvNotas :=  FvNotas + TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal;

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal,
                                 '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>') +
                               '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas + '<' + FPrefixo4 + 'Rps>' +
                                 '<' + FPrefixo4 + 'InfRps' +
                                   RetornarConteudoEntre(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                                '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end;

  FTagI := '<' + FPrefixo3 + 'EnviarLoteRpsEnvio' + FNameSpaceDad;
  FTagF := '</' + FPrefixo3 + 'EnviarLoteRpsEnvio>';

  FPDadosMsg := TNFSeG.Gera_DadosMsgEnviarLote(FPrefixo3, FPrefixo4,
                                               FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador,
                                               FNameSpace,
                                               FPConfiguracoesNFSe.Geral.ConfigXML.VersaoDados,
                                               FVersaoXML,
                                               TNFSeGerarLoteRps(Self).NumeroLote,
                                               OnlyNumber(TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[0].NFSe.Prestador.CNPJ),
                                               TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal,
                                               IntToStr(TNFSeGerarLoteRps(Self).FNotasFiscais.Count),
                                               FvNotas,
                                               FTagI, FTagF, FProvedor);

  if FPDadosMsg <> '' then
  begin
    FPDadosMsg := TNFSeGerarLoteRPS(Self).FNotasFiscais.AssinarLote(FPDadosMsg,
                                  FPrefixo3 + 'EnviarLoteRpsEnvio',
                                  FPrefixo3 + 'LoteRps',
                                  FPConfiguracoesNFSe.Geral.ConfigAssinar.Lote);

    if FPConfiguracoesNFSe.Geral.ConfigSchemas.Validar then
      TNFSeGerarLoteRPS(Self).FNotasFiscais.ValidarLote(FPDadosMsg,
                         FPConfiguracoes.Arquivos.PathSchemas +
                         FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoEnviar);
  end
  else
    GerarException(ACBrStr('A funcionalidade [Gerar Lote] n�o foi disponibilizada pelo provedor: ' +
     FPConfiguracoesNFSe.Geral.xProvedor));

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.Recepcionar;

  // Lote tem mais de 500kb ? //
  if Length(FPDadosMsg) > (500 * 1024) then
    GerarException(ACBrStr('Tamanho do XML de Dados superior a 500 Kbytes. Tamanho atual: ' +
      IntToStr(trunc(Length(FPDadosMsg) / 1024)) + ' Kbytes'));
end;

function TNFSeGerarLoteRPS.TratarResposta: Boolean;
begin
  TNFSeGerarLoteRPS(Self).FNotasFiscais.Items[0].NomeArq :=
    FPConfiguracoes.Arquivos.PathSalvar +
    GerarPrefixoArquivo + '-' + FPArqEnv + '.xml';
  Result := True;
end;

procedure TNFSeGerarLoteRPS.FinalizarServico;
begin
  inherited FinalizarServico;
end;

function TNFSeGerarLoteRPS.GerarMsgLog: String;
begin
  Result := '';
end;

function TNFSeGerarLoteRPS.GerarPrefixoArquivo: String;
begin
  Result := NumeroLote;
end;

{ TNFSeEnviarLoteRPS }

constructor TNFSeEnviarLoteRPS.Create(AOwner: TACBrDFe; ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeRecepcao;
  FPLayout := LayNFSeRecepcaoLote;
  FPArqEnv := 'env-lot';
  FPArqResp := 'rec';

  FRetornoNFSe := nil;
end;

destructor TNFSeEnviarLoteRPS.Destroy;
begin
  if Assigned(FRetornoNFSe) then
    FRetornoNFSe.Free;

  inherited Destroy;
end;

function TNFSeEnviarLoteRPS.GetLote: String;
begin
  Result := Trim(FNumeroLote);
end;

function TNFSeEnviarLoteRPS.GetProtocolo: String;
begin
  Result := Trim(FProtocolo);
end;

procedure TNFSeEnviarLoteRPS.DefinirURL;
begin
  FPLayout := LayNFSeRecepcaoLote;
  inherited DefinirURL;
end;

procedure TNFSeEnviarLoteRPS.DefinirServicoEAction;
begin
  FPServico := 'EnviarLoteRPS';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.Recepcionar;
end;

procedure TNFSeEnviarLoteRPS.DefinirDadosMsg;
var
  I: Integer;
begin
  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoEnviar;

  InicializarDadosMsg;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.RPS then
  begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        pro4R, proAgili, profintelISS, proFiorilli, proGoiania, proISSDigital,
        proISSe, proSystemPro, proCoplan, proProdata, proVitoria, proPVH,
        proSaatri, proSisPMJP, proFreire, proLink3, proGovDigital, proMitra,
        proVirtual: FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                  RetornarConteudoEntre(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                                    '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                                '</Signature>'+
                               '</' + FPrefixo4 + 'Rps>';

        proDigifred: FvNotas := FvNotas +
                                '<' + FPrefixo4 + 'Rps ' +
                                   RetornarConteudoEntre(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                                     '<' + FPrefixo4 + 'Rps', '</Signature>') +
                                 '</Signature>'+
                                '</' + Prefixo4 + 'Rps>';

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                                   '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</Signature>') +
                               '</Signature>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas +
                        '<' + FPrefixo4 + 'Rps>' +
                         '<' + FPrefixo4 + 'InfRps' +
                           RetornarConteudoEntre(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLAssinado,
                         '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                        '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end
  else begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proCoplan, proGoiania, proISSDigital,
        proISSe, proSystemPro, pro4R, proFiorilli, proProdata, proVitoria, proPVH,
        proAgili, proVirtual, proFreire, proLink3,
        proGovDigital: FvNotas := FvNotas +
                                  '<' + FPrefixo4 + 'Rps>' +
                                   '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                     RetornarConteudoEntre(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>') +
                                   '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>'+
                                  '</' + FPrefixo4 + 'Rps>';

        proIssDSF,
        proInfisc,
        proEquiplano,
        proEL: FvNotas :=  FvNotas + TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal;

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal,
                                 '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>') +
                               '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>'+
                              '</' + FPrefixo4 + 'Rps>';

        proNFSeBrasil: begin
                         FvNotas := StringReplace(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal, '</Rps>', '', [rfReplaceAll]) + '</Rps>';
                         FvNotas := StringReplace(FvNotas, '<Rps>', '', [rfReplaceAll]);
                         FvNotas := '<Rps>' + StringReplace(FvNotas, '<InfRps>', '', [rfReplaceAll]);
                       end;

        else FvNotas := FvNotas + '<' + FPrefixo4 + 'Rps>' +
                                 '<' + FPrefixo4 + 'InfRps' +
                                   RetornarConteudoEntre(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                                '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end;

  FTagI := '<' + FPrefixo3 + 'EnviarLoteRpsEnvio' + FNameSpaceDad;
  FTagF := '</' + FPrefixo3 + 'EnviarLoteRpsEnvio>';

  FPDadosMsg := TNFSeG.Gera_DadosMsgEnviarLote(FPrefixo3, FPrefixo4,
                                               FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador,
                                               FNameSpace,
                                               FPConfiguracoesNFSe.Geral.ConfigXML.VersaoDados,
                                               FVersaoXML,
                                               TNFSeEnviarLoteRps(Self).NumeroLote,
                                               OnlyNumber(TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[0].NFSe.Prestador.CNPJ),
                                               TNFSeEnviarLoteRPS(Self).FNotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal,
                                               IntToStr(TNFSeEnviarLoteRps(Self).FNotasFiscais.Count),
                                               FvNotas,
                                               FTagI, FTagF, FProvedor);

  if FPDadosMsg <> '' then
  begin
    FPDadosMsg := TNFSeEnviarLoteRPS(Self).FNotasFiscais.AssinarLote(FPDadosMsg,
                                  FPrefixo3 + 'EnviarLoteRpsEnvio',
                                  FPrefixo3 + 'LoteRps',
                                  FPConfiguracoesNFSe.Geral.ConfigAssinar.Lote);

    if FPConfiguracoesNFSe.Geral.ConfigSchemas.Validar then
      TNFSeEnviarLoteRPS(Self).FNotasFiscais.ValidarLote(FPDadosMsg,
                         FPConfiguracoes.Arquivos.PathSchemas +
                         FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoEnviar);
  end
  else
    GerarException(ACBrStr('A funcionalidade [Enviar Lote] n�o foi disponibilizada pelo provedor: ' +
      FPConfiguracoesNFSe.Geral.xProvedor));

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.Recepcionar;

  // Lote tem mais de 500kb ? //
  if Length(FPDadosMsg) > (500 * 1024) then
    GerarException(ACBrStr('Tamanho do XML de Dados superior a 500 Kbytes. Tamanho atual: ' +
      IntToStr(trunc(Length(FPDadosMsg) / 1024)) + ' Kbytes'));
end;

function TNFSeEnviarLoteRPS.TratarResposta: Boolean;
var
  i: Integer;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'EnviarLoteRpsResposta');

  FRetEnvLote := TRetEnvLote.Create;
  try
    FRetEnvLote.Leitor.Arquivo := FPRetWS;
    FRetEnvLote.LerXml;

    FDataRecebimento := RetEnvLote.InfRec.DataRecebimento;
    FProtocolo       := RetEnvLote.InfRec.Protocolo;
//    FNumeroLote      := RetEnvLote.InfRec.NumeroLote;

    // Lista de Mensagem de Retorno
    FPMsg := '';
    FaMsg:='';
    if RetEnvLote.InfRec.MsgRetorno.Count > 0 then
    begin
      for i := 0 to RetEnvLote.InfRec.MsgRetorno.Count - 1 do
      begin
        FPMsg := FPMsg + RetEnvLote.infRec.MsgRetorno.Items[i].Mensagem + IfThen(FPMsg = '', '', ' / ');

        FaMsg := FaMsg + 'C�digo Erro : ' + RetEnvLote.InfRec.MsgRetorno.Items[i].Codigo + LineBreak +
                         'Mensagem... : ' + RetEnvLote.infRec.MsgRetorno.Items[i].Mensagem + LineBreak +
                         'Corre��o... : ' + RetEnvLote.InfRec.MsgRetorno.Items[i].Correcao + LineBreak +
                         'Provedor... : ' + FPConfiguracoesNFSe.Geral.xProvedor + LineBreak;
      end;
    end
    else begin
      for i := 0 to FNotasFiscais.Count -1 do
      begin
        FNotasFiscais.Items[i].NFSe.Protocolo     := FProtocolo;
        FNotasFiscais.Items[i].NFSe.dhRecebimento := FDataRecebimento;
      end;
      FaMsg := 'Numero do Lote : ' + RetEnvLote.InfRec.NumeroLote + LineBreak +
               'Recebimento... : ' + IfThen(FDataRecebimento = 0, '', DateTimeToStr(FDataRecebimento)) + LineBreak +
               'Protocolo..... : ' + FProtocolo + LineBreak +
               'Provedor...... : ' + FPConfiguracoesNFSe.Geral.xProvedor + LineBreak;
    end;

    Result := (RetEnvLote.InfRec.Protocolo <> '');
  finally
    RetEnvLote.Free;
  end;
end;

procedure TNFSeEnviarLoteRPS.FinalizarServico;
begin
  inherited FinalizarServico;

  if Assigned(FRetornoNFSe) then
    FreeAndNil(FRetornoNFSe);
end;

function TNFSeEnviarLoteRPS.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeEnviarLoteRPS.GerarPrefixoArquivo: String;
begin
  Result := NumeroLote;
end;

{ TNFSeEnviarSincrono }

constructor TNFSeEnviarSincrono.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeRecepcao;
  FPLayout := LayNFSeRecepcaoLoteSincrono;
  FPArqEnv := 'env-lotS';
  FPArqResp := 'lista-nfse';

  FRetornoNFSe := nil;
end;

destructor TNFSeEnviarSincrono.Destroy;
begin
  if Assigned(FRetornoNFSe) then
    FRetornoNFSe.Free;

  inherited Destroy;
end;

procedure TNFSeEnviarSincrono.DefinirURL;
begin
  FPLayout := LayNFSeRecepcaoLoteSincrono;
  inherited DefinirURL;
end;

procedure TNFSeEnviarSincrono.DefinirServicoEAction;
begin
  FPServico :=  'NFSeEnviarSincrono';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.RecSincrono; 
end;

procedure TNFSeEnviarSincrono.DefinirDadosMsg;
var
  i: Integer;
begin
  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoEnviarSincrono;

  InicializarDadosMsg;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.RPS then
  begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proISSDigital, proISSe, proSystemPro,
        pro4R, proFiorilli, proProdata, proVitoria, proPVH, proAgili, proCoplan,
        proVirtual, proFreire, proLink3, proGovDigital, proMitra,
        proGoiania: FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                  RetornarConteudoEntre(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLAssinado,
                                    '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                                '</Signature>'+
                               '</' + FPrefixo4 + 'Rps>';

        proDigifred: FvNotas := FvNotas +
                                '<' + FPrefixo4 + 'Rps ' +
                                   RetornarConteudoEntre(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLAssinado,
                                     '<' + FPrefixo4 + 'Rps', '</Signature>') +
                                 '</Signature>'+
                                '</' + Prefixo4 + 'Rps>';

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLAssinado,
                                   '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</Signature>') +
                               '</Signature>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas +
                        '<' + FPrefixo4 + 'Rps>' +
                         '<' + FPrefixo4 + 'InfRps' +
                           RetornarConteudoEntre(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLAssinado,
                         '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                        '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end
  else begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proGoiania, proISSDigital, proISSe,
        proSystemPro, pro4R, proFiorilli, proProdata, proVitoria, proPVH, proAgili,
        proCoplan, proVirtual, proFreire, proLink3, proMitra,
        proGovDigital: FvNotas := FvNotas +
                                  '<' + FPrefixo4 + 'Rps>' +
                                   '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                     RetornarConteudoEntre(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>') +
                                   '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>'+
                                  '</' + FPrefixo4 + 'Rps>';

        proIssDSF,
        proInfisc: FvNotas :=  FvNotas + TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLOriginal;

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLOriginal,
                                 '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>') +
                               '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas + '<' + FPrefixo4 + 'Rps>' +
                                 '<' + FPrefixo4 + 'InfRps' +
                                   RetornarConteudoEntre(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                                '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end;

  FTagI := '<' + FPrefixo3 + 'EnviarLoteRpsSincronoEnvio' + FNameSpaceDad;
  FTagF := '</' + FPrefixo3 + 'EnviarLoteRpsSincronoEnvio>';

  FPDadosMsg := TNFSeG.Gera_DadosMsgEnviarSincrono(FPrefixo3, FPrefixo4,
                                                   FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador,
                                                   FNameSpace,
                                                   FPConfiguracoesNFSe.Geral.ConfigXML.VersaoDados,
                                                   FVersaoXML,
                                                   TNFSeEnviarSincrono(Self).NumeroLote,
                                                   OnlyNumber(TNFSeEnviarSincrono(Self).FNotasFiscais.Items[0].NFSe.Prestador.CNPJ),
                                                   TNFSeEnviarSincrono(Self).FNotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal,
                                                   IntToStr(TNFSeEnviarSincrono(Self).FNotasFiscais.Count),
                                                   FvNotas,
                                                   FTagI, FTagF,
                                                   FProvedor);

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.RecSincrono;

  if FPDadosMsg <> '' then
  begin
    FPDadosMsg := TNFSeEnviarSincrono(Self).FNotasFiscais.AssinarLote(FPDadosMsg,
                                  FPrefixo3 + 'EnviarLoteRpsSincronoEnvio',
                                  FPrefixo3 + 'LoteRps',
                                  FPConfiguracoesNFSe.Geral.ConfigAssinar.Lote);

    if FPConfiguracoesNFSe.Geral.ConfigSchemas.Validar then
      TNFSeEnviarSincrono(Self).FNotasFiscais.ValidarLote(FPDadosMsg,
                 FPConfiguracoes.Arquivos.PathSchemas +
                 FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoEnviarSincrono);
   end
   else
     GerarException(ACBrStr('A funcionalidade [Enviar Sincrono] n�o foi disponibilizada pelo provedor: ' +
      FPConfiguracoesNFSe.Geral.xProvedor));
end;

function TNFSeEnviarSincrono.TratarResposta: Boolean;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'EnviarLoteRpsSincronoResposta');
  Result := ExtrairNotasRetorno;
end;

procedure TNFSeEnviarSincrono.FinalizarServico;
begin
  inherited FinalizarServico;

  if Assigned(FRetornoNFSe) then
    FreeAndNil(FRetornoNFSe);
end;

function TNFSeEnviarSincrono.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeEnviarSincrono.GerarPrefixoArquivo: String;
begin
  Result := NumeroLote;
end;

{ TNFSeGerarNFSe }

constructor TNFSeGerarNFSe.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeRecepcao;
  FPLayout := LayNFSeGerar;
  FPArqEnv := 'ger-nfse';
  FPArqResp := 'lista-nfse';

  FRetornoNFSe := nil;
end;

destructor TNFSeGerarNFSe.Destroy;
begin
  if Assigned(FRetornoNFSe) then
    FRetornoNFSe.Free;

  inherited Destroy;
end;

procedure TNFSeGerarNFSe.DefinirURL;
begin
  FPLayout := LayNFSeGerar;
  inherited DefinirURL;
end;

procedure TNFSeGerarNFSe.DefinirServicoEAction;
begin
  FPServico :=  'NFSeGerarNFSe';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.Gerar;
end;

procedure TNFSeGerarNFSe.DefinirDadosMsg;
var
  i: Integer;
begin
  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoGerar;

  InicializarDadosMsg;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.RPS or FPConfiguracoesNFSe.Geral.ConfigAssinar.Gerar then
  begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proISSDigital, proISSe, pro4R,
        proFiorilli, proProdata, proVitoria, proPVH, proAgili, proCoplan,
        proVirtual, proLink3, proGovDigital, proMitra,
        proGoiania: FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                  RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                    '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                                '</Signature>'+
                               '</' + FPrefixo4 + 'Rps>';

        proFreire: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico Id ="'+ TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].NFSe.InfID.ID +'"' +
                                 RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                   '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                               '</Signature>'+
                              '</' + FPrefixo4 + 'Rps>';

        proDigifred: FvNotas := FvNotas +
                                '<' + FPrefixo4 + 'Rps ' +
                                   RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                     '<' + FPrefixo4 + 'Rps', '</Signature>') +
                                 '</Signature>'+
                                '</' + Prefixo4 + 'Rps>';

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                   '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</Signature>') +
                               '</Signature>'+
                              '</' + FPrefixo4 + 'Rps>';

        proSystemPro: FvNotas := FvNotas + TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLAssinado;

        else FvNotas := FvNotas +
                        '<' + FPrefixo4 + 'Rps>' +
                         '<' + FPrefixo4 + 'InfRps' +
                           RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                         '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                        '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end
  else begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proGoiania, proISSDigital, proISSe,
        proSystemPro, pro4R, proFiorilli, proProdata, proVitoria, proPVH,
        proAgili, proCoplan, proLink3, proGovDigital,
        proVirtual: FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                 '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                   RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                   '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>') +
                                 '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>'+
                                '</' + FPrefixo4 + 'Rps>';

        proFreire : FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico Id="' + TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].NFSe.InfID.ID + '" '+
                                  RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                    '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>') +
                                '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>'+
                               '</' + FPrefixo4 + 'Rps>';

        proEgoverneISS: FvNotas := FvNotas +
                                   '<' + FPrefixo4 + 'NotaFiscal>' +
                                     RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'NotaFiscal>', '</' + FPrefixo4 + 'NotaFiscal>') +
                                   '</' + FPrefixo4 + 'NotaFiscal>';

        proIssDSF,
        proInfisc: FvNotas :=  FvNotas + TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLOriginal;

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                 '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>') +
                               '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas + '<' + FPrefixo4 + 'Rps>' +
                                 '<' + FPrefixo4 + 'InfRps' +
                                   RetornarConteudoEntre(TNFSeGerarNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                                '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end;

  FTagI := '<' + FPrefixo3 + 'GerarNfseEnvio' + FNameSpaceDad;
  FTagF := '</' + FPrefixo3 + 'GerarNfseEnvio>';

  FPDadosMsg := TNFSeG.Gera_DadosMsgGerarNFSe(FPrefixo3, FPrefixo4,
                                              FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador,
                                              FNameSpace,
                                              FPConfiguracoesNFSe.Geral.ConfigXML.VersaoDados,
                                              FVersaoXML,
                                              IntToStr(FNumeroRps),
                                              OnlyNumber(TNFSeGerarNFSe(Self).FNotasFiscais.Items[0].NFSe.Prestador.CNPJ),
                                              TNFSeGerarNFSe(Self).FNotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal,
                                              IntToStr(TNFSeGerarNFSe(Self).FNotasFiscais.Count),
                                              FvNotas,
                                              FTagI, FTagF,
                                              FProvedor);

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.Gerar;

  if FPDadosMsg <> '' then
  begin
    FPDadosMsg := TNFSeGerarNFSe(Self).FNotasFiscais.AssinarLote(FPDadosMsg,
                                  FPrefixo3 + 'GerarNfseEnvio',
                                  FPrefixo3 + 'Rps',
                                  FPConfiguracoesNFSe.Geral.ConfigAssinar.Gerar);

    if FPConfiguracoesNFSe.Geral.ConfigSchemas.Validar then
      TNFSeGerarNFSe(Self).FNotasFiscais.ValidarLote(FPDadosMsg,
                          FPConfiguracoes.Arquivos.PathSchemas +
                          FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoGerar);
   end
   else
     GerarException(ACBrStr('A funcionalidade [Gerar NFSe] n�o foi disponibilizada pelo provedor: ' +
      FPConfiguracoesNFSe.Geral.xProvedor));
end;

function TNFSeGerarNFSe.TratarResposta: Boolean;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'GerarNfseResposta');
  Result := ExtrairNotasRetorno;
end;

procedure TNFSeGerarNFSe.FinalizarServico;
begin
  inherited FinalizarServico;

  if Assigned(FRetornoNFSe) then
    FreeAndNil(FRetornoNFSe);
end;

function TNFSeGerarNFSe.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeGerarNFSe.GerarPrefixoArquivo: String;
begin
  Result := inttoStr(NumeroRPS);
end;

{ TNFSeConsultarSituacaoLoteRPS }

constructor TNFSeConsultarSituacaoLoteRPS.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeConsulta;
  FPLayout := LayNFSeConsultaSitLoteRps;
  FPArqEnv := 'con-sit';
  FPArqResp := 'sit';

  FRetornoNFSe := nil;
end;

destructor TNFSeConsultarSituacaoLoteRPS.Destroy;
begin
  if Assigned(FRetSitLote) then
    FRetSitLote.Free;

  inherited Destroy;
end;

procedure TNFSeConsultarSituacaoLoteRPS.DefinirURL;
begin
  FPLayout := LayNfseConsultaSitLoteRps;
  inherited DefinirURL;
end;

procedure TNFSeConsultarSituacaoLoteRPS.DefinirServicoEAction;
begin
  FPServico :=  'NFSeConsSitLoteRPS';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.ConsSit;
end;

procedure TNFSeConsultarSituacaoLoteRPS.DefinirDadosMsg;
var
  ACNPJ: String;
begin
  ACNPJ := OnlyNumber(TNFSeConsultarSituacaoLoteRPS(Self).CNPJ);

  if not ValidarCNPJ(ACNPJ) then
    GerarException( 'CNPJ ' + ACNPJ + ' inv�lido.' );

  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoConSit;

  InicializarDadosMsg;

  FTagI := '<' + FPrefixo3 + 'ConsultarSituacaoLoteRpsEnvio' + FNameSpaceDad;
  FTagF := '</' + FPrefixo3 + 'ConsultarSituacaoLoteRpsEnvio>';

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.ConsSit then
  begin
    case FProvedor of
      proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgConsSitLoteEquiplano(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                                 ACNPJ,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).InscMun,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).Protocolo,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).NumeroLote,
                                                                 '', '');

      proInfisc: FPDadosMsg := TNFSeG.Gera_DadosMsgConsSitLoteInfisc(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                                 ACNPJ,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).InscMun,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).Protocolo,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).NumeroLote,
                                                                 '', '');

    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsSitLote(FPrefixo3, FPrefixo4,
                                                       FNameSpace,
                                                       FVersaoXML,
                                                       TNFSeConsultarSituacaoLoteRPS(Self).Protocolo,
                                                       ACNPJ,
                                                       TNFSeConsultarSituacaoLoteRPS(Self).InscMun,
                                                       '', '',
                                                       FProvedor);
    end;

    if FPDadosMsg <> '' then
    begin
      FPDadosMsg := FTagI + FPDadosMsg + FTagF;
      // O procedimento recebe como parametro o XML a ser assinado e retorna o
      // mesmo assinado da propriedade FPDadosMsg
      AssinarXML(FPDadosMsg, FPrefixo3 + 'ConsultarSituacaoLoteRpsEnvio', '',
                 'Falha ao Assinar - Consultar Situa��o do Lote: ');
    end;

  end
  else begin
    case FProvedor of
      proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgConsSitLoteEquiplano(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                                 ACNPJ,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).InscMun,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).Protocolo,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).NumeroLote,
                                                                 FTagI, FTagF);

      proInfisc: FPDadosMsg := TNFSeG.Gera_DadosMsgConsSitLoteInfisc(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                                 ACNPJ,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).InscMun,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).Protocolo,
                                                                 TNFSeConsultarSituacaoLoteRPS(Self).NumeroLote,
                                                                 FTagI, FTagF);

    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsSitLote(FPrefixo3, FPrefixo4,
                                                       FNameSpace,
                                                       FVersaoXML,
                                                       TNFSeConsultarSituacaoLoteRPS(Self).Protocolo,
                                                       ACNPJ,
                                                       TNFSeConsultarSituacaoLoteRPS(Self).InscMun,
                                                       FTagI, FTagF,
                                                       FProvedor);
    end;
  end;

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.ConsSit;

  if FPDadosMsg = '' then
    GerarException(ACBrStr('A funcionalidade [Consultar Situa��o do Lote] n�o foi disponibilizada pelo provedor: ' +
     FPConfiguracoesNFSe.Geral.xProvedor));
end;

procedure TNFSeConsultarSituacaoLoteRPS.FinalizarServico;
begin
  inherited FinalizarServico;

//  if Assigned(FRetSitLote) then
//    FreeAndNil(FRetSitLote);
end;

function TNFSeConsultarSituacaoLoteRPS.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeConsultarSituacaoLoteRPS.GerarPrefixoArquivo: String;
begin
  Result := Protocolo;
end;

function TNFSeConsultarSituacaoLoteRPS.Executar: Boolean;
var
  IntervaloTentativas, Tentativas: integer;
begin
  Result := False;

  TACBrNFSe(FPDFeOwner).SetStatus(stNFSeConsulta);
  try
    Sleep(FPConfiguracoesNFSe.WebServices.AguardarConsultaRet);

    Tentativas := 0;
    IntervaloTentativas := max(FPConfiguracoesNFSe.WebServices.IntervaloTentativas, 1000);

    while (inherited Executar) and
      (Tentativas < FPConfiguracoesNFSe.WebServices.Tentativas) do
    begin
      Inc(Tentativas);
      sleep(IntervaloTentativas);
    end;
  finally
    TACBrNFSe(FPDFeOwner).SetStatus(stNFSeIdle);
  end;

  if (FSituacao = '3') or (FSituacao = '4') then  // Lote processado ?
    Result := TratarRespostaFinal;
end;

function TNFSeConsultarSituacaoLoteRPS.TratarResposta: Boolean;
begin
  FRetSitLote.Free;
  FRetSitLote := TretSitLote.Create;

  FPRetWS := ExtrairRetorno(FPrefixo3 + 'ConsultarSituacaoLoteRpsResposta');

  FRetSitLote.Leitor.Arquivo := FPRetWS;

  case FProvedor of
    proEquiplano: RetSitLote.LerXML_provedorEquiplano;
    proInfisc: RetSitLote.LerXML_provedorInfisc;
    proEL: RetSitLote.LerXML_provedorEL;
    proFissLex: RetSitLote.LerXml_provedorFissLex;
  else
    RetSitLote.LerXml;
  end;

  FSituacao := RetSitLote.InfSit.Situacao;
  // FSituacao: 1 = N�o Recebido
  //            2 = N�o Processado
  //            3 = Processado com Erro
  //            4 = Processado com Sucesso

  if (FProvedor in [proEquiplano, proEL]) then
    Result := (FSituacao = '1')  // Aguardando processamento
  else
    Result := (FSituacao = '2'); // N�o Processado
end;

function TNFSeConsultarSituacaoLoteRPS.TratarRespostaFinal: Boolean;
var
  xSituacao: String;
  i: Integer;
  Ok: Boolean;
begin
  // Lista de Mensagem de Retorno
  FPMsg := '';
  FaMsg:='';
  if RetSitLote.InfSit.MsgRetorno.Count > 0 then
  begin
    for i := 0 to RetSitLote.InfSit.MsgRetorno.Count - 1 do
    begin
      FPMsg := FPMsg + RetSitLote.infSit.MsgRetorno.Items[i].Mensagem + IfThen(FPMsg = '', '', ' / ');

      FaMsg := FaMsg + 'C�digo Erro : ' + RetSitLote.infSit.MsgRetorno.Items[i].Codigo + LineBreak +
                       'Mensagem... : ' + RetSitLote.infSit.MsgRetorno.Items[i].Mensagem + LineBreak+
                       'Corre��o... : ' + RetSitLote.infSit.MsgRetorno.Items[i].Correcao + LineBreak+
                       'Provedor... : ' + FPConfiguracoesNFSe.Geral.xProvedor + LineBreak;
    end;
  end
  else begin
    for i:=0 to FNotasFiscais.Count -1 do
      FNotasFiscais.Items[i].NFSe.Situacao := FSituacao;

    case FProvedor of
      proEquiplano: begin
                      case FSituacao[1] of
                        '1' : xSituacao := 'Aguardando processamento';
                        '2' : xSituacao := 'N�o Processado, lote com erro';
                        '3' : xSituacao := 'Processado com sucesso';
                        '4' : xSituacao := 'Processado com avisos';
                      end;
                    end;

      proEL: begin
               case FSituacao[1] of
                 '1' : xSituacao := 'Aguardando processamento';
                 '2' : xSituacao := 'N�o Processado, lote com erro';
                 '3' : xSituacao := 'Processado com avisos';
                 '4' : xSituacao := 'Processado com sucesso';
               end;
             end;

//      proInfisc:

    else begin
           case StrToSituacaoLoteRPS(Ok, FSituacao) of
            slrNaoRecibo        : xSituacao := 'N�o Recebido.';
            slrNaoProcessado    : xSituacao := 'N�o Processado.';
            slrProcessadoErro   : xSituacao := 'Processado com Erro.';
            slrProcessadoSucesso: xSituacao := 'Processado com Sucesso.';
           end;
         end;
    end;

    FaMsg := 'Numero do Lote : ' + RetSitLote.InfSit.NumeroLote + LineBreak +
             'Situa��o...... : ' + FSituacao + '-' + xSituacao + LineBreak;
  end;

  Result := (FPMsg ='');
end;

{ TNFSeConsultarLoteRPS }

constructor TNFSeConsultarLoteRPS.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeConsulta;
  FPLayout := LayNfseConsultaLote;
  FPArqEnv := 'con-lot';
  FPArqResp := 'lista-nfse';

  FRetornoNFSe := nil;
end;

destructor TNFSeConsultarLoteRPS.Destroy;
begin
  if Assigned(FRetornoNFSe) then
    FRetornoNFSe.Free;

  inherited Destroy;
end;

procedure TNFSeConsultarLoteRPS.DefinirURL;
begin
  FPLayout := LayNfseConsultaLote;
  inherited DefinirURL;
end;

procedure TNFSeConsultarLoteRPS.DefinirServicoEAction;
begin
  FPServico := 'NFSeConsLote';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.ConsLote;
end;

procedure TNFSeConsultarLoteRPS.DefinirDadosMsg;
var
  URISig, URIRef: String;
begin
  if (FProvedor in [proEL, proGinfes]) and
     (OnlyNumber(TNFSeConsultarLoteRPS(Self).FCNPJ) = '') then
    GerarException(ACBrStr('Para o provedor ' + FPConfiguracoesNFSe.Geral.xProvedor +
             ' h� necessidade de informar o CNPJ do Prestador de Servi�o'));

  if (FProvedor in [proGinfes]) and
     (OnlyNumber(TNFSeConsultarLoteRPS(Self).FInscMun) = '') then
    GerarException(ACBrStr('Para o provedor ' + FPConfiguracoesNFSe.Geral.xProvedor +
             ' h� necessidade de informar a Insc. Mun. do Prestador de Servi�o'));

  if (FProvedor = proTecnos) and (Trim(TNFSeConsultarLoteRPS(Self).FRazaoSocial) = '') then
    GerarException(ACBrStr('Para o provedor Tecnos h� necessidade de informar a Raz�o Social do Prestador de Servi�o'));

  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoConLot;

  InicializarDadosMsg;

  FTagI := '<' + FPrefixo3 + 'ConsultarLoteRpsEnvio' + FNameSpaceDad;
  FTagF := '</' + FPrefixo3 + 'ConsultarLoteRpsEnvio>';

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.ConsLote then
  begin
    case FProvedor of
      proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgConsLoteEquiplano(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                            OnlyNumber(TNFSeConsultarLoteRPS(Self).FCNPJ),
                                                            TNFSeConsultarLoteRPS(Self).InscMun,
                                                            TNFSeConsultarLoteRPS(Self).Protocolo,
                                                            TNFSeConsultarLoteRPS(Self).NumeroLote,
                                                            '', '');

    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsLote(FPrefixo3, FPrefixo4,
                                                   FNameSpace,
                                                   FVersaoXML,
                                                   TNFSeConsultarLoteRPS(Self).Protocolo,
                                                   TNFSeConsultarLoteRPS(Self).FCNPJ,
                                                   TNFSeConsultarLoteRPS(Self).FInscMun,
                                                   TNFSeConsultarLoteRPS(Self).FSenha,
                                                   TNFSeConsultarLoteRPS(Self).FFraseSecreta,
                                                   '', '', FProvedor,
                                                   TNFSeConsultarLoteRPS(Self).FRazaoSocial);
    end;
    if FPDadosMsg <> '' then
    begin
      FPDadosMsg := FTagI + FPDadosMsg + FTagF;
      // O procedimento recebe como parametro o XML a ser assinado e retorna o
      // mesmo assinado da propriedade FPDadosMsg
      AssinarXML(FPDadosMsg, FPrefixo3 + 'ConsultarLoteRpsEnvio', '',
                 'Falha ao Assinar - Consultar Lote de RPS: ');
    end;
  end
  else begin
    case FProvedor of
      proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgConsLoteDSF(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      CodCidadeToCodSiafi(FPConfiguracoesNFSe.Geral.CodigoMunicipio),
                                                      TNFSeConsultarLoteRPS(Self).CNPJ,
                                                      TNFSeConsultarLoteRPS(Self).Protocolo,
                                                      FTagI, FTagF);

      proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgConsLoteEquiplano(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                            OnlyNumber(TNFSeConsultarLoteRPS(Self).FCNPJ),
                                                            TNFSeConsultarLoteRPS(Self).InscMun,
                                                            TNFSeConsultarLoteRPS(Self).Protocolo,
                                                            TNFSeConsultarLoteRPS(Self).NumeroLote,
                                                            FTagI, FTagF);

      proEL: FPDadosMsg := TNFSeG.Gera_DadosMsgConsLoteEL(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                       OnlyNumber(TNFSeConsultarLoteRPS(Self).FCNPJ),
                                                       TNFSeConsultarLoteRPS(Self).InscMun,
                                                       TNFSeConsultarLoteRPS(Self).Protocolo,
                                                       TNFSeConsultarLoteRPS(Self).NumeroLote,
                                                       FTagI, FTagF);

    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsLote(FPrefixo3, FPrefixo4,
                                                   FNameSpace,
                                                   FVersaoXML,
                                                   TNFSeConsultarLoteRPS(Self).Protocolo,
                                                   TNFSeConsultarLoteRPS(Self).FCNPJ,
                                                   TNFSeConsultarLoteRPS(Self).FInscMun,
                                                   TNFSeConsultarLoteRPS(Self).FSenha,
                                                   TNFSeConsultarLoteRPS(Self).FFraseSecreta,
                                                   FTagI, FTagF, FProvedor,
                                                   TNFSeConsultarLoteRPS(Self).FRazaoSocial);
    end;
  end;

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.ConsLote;

  if FPDadosMsg = '' then
    GerarException(ACBrStr('A funcionalidade [Consultar Lote] n�o foi disponibilizada pelo provedor: ' +
     FPConfiguracoesNFSe.Geral.xProvedor));
end;

function TNFSeConsultarLoteRPS.TratarResposta: Boolean;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'ConsultarLoteRpsResposta');
  Result := ExtrairNotasRetorno;
end;

procedure TNFSeConsultarLoteRPS.FinalizarServico;
begin
  inherited FinalizarServico;

  if Assigned(FRetornoNFSe) then
    FreeAndNil(FRetornoNFSe);
end;

function TNFSeConsultarLoteRPS.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeConsultarLoteRPS.GerarPrefixoArquivo: String;
begin
  Result := Protocolo;
end;

{ TNFSeConsultarNfseRPS }

constructor TNFSeConsultarNfseRPS.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeConsulta;
  FPLayout := LayNfseConsultaNfseRps;
  FPArqEnv := 'con-nfse-rps';
  FPArqResp := 'comp-nfse';

  FRetornoNFSe := nil;
end;

destructor TNFSeConsultarNfseRPS.Destroy;
begin
  if Assigned(FRetornoNFSe) then
    FRetornoNFSe.Free;

  inherited Destroy;
end;

procedure TNFSeConsultarNfseRPS.DefinirURL;
begin
  FPLayout := LayNfseConsultaNfseRps;
  inherited DefinirURL;
end;

procedure TNFSeConsultarNfseRPS.DefinirServicoEAction;
begin
  FPServico := 'NFSeConsNfseRPS';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.ConsNfseRps;
end;

procedure TNFSeConsultarNfseRPS.DefinirDadosMsg;
var
  i: Integer;
  ACNPJ: String;
  Gerador: TGerador;
begin
  ACNPJ := OnlyNumber(TNFSeConsultarNfseRPS(Self).CNPJ);

  if not ValidarCNPJ(ACNPJ) and (Length(ACNPJ) = 14) then
    GerarException( 'CNPJ ' + ACNPJ + ' inv�lido.' );

  if not ValidarCPF(ACNPJ) and (Length(ACNPJ) = 11) then
    GerarException( 'CPF ' + ACNPJ + ' inv�lido.' );

  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoConRps;

  InicializarDadosMsg;

  FTagI := '<' + FPrefixo3 + 'ConsultarNfseRpsEnvio' + FNameSpaceDad;
  FTagF := '</' + FPrefixo3 + 'ConsultarNfseRpsEnvio>';

  if FProvedor in [proIssDSF] then
  begin
    Gerador := TGerador.Create;
    try
      Gerador.ArquivoFormatoXML := '';

      if TNFSeConsultarNfseRPS(Self).FNotasFiscais.Count > 0 then
      begin
        if TNFSeConsultarNfseRPS(Self).FNotasFiscais.Items[0].NFSe.Numero = '' then
        begin
          Gerador.wGrupoNFSe('RPSConsulta');
          for i := 0 to TNFSeConsultarNfseRPS(Self).FNotasFiscais.Count-1 do
          begin
            with TNFSeConsultarNfseRPS(Self).FNotasFiscais.Items[I] do
              if NFSe.IdentificacaoRps.Numero <> '' then
              begin
                Gerador.wGrupoNFSe('RPS Id="rps:' + NFSe.Numero + '"');
                Gerador.wCampoNFSe(tcStr, '', 'InscricaoMunicipalPrestador', 01, 11,  1, NFSe.Prestador.InscricaoMunicipal, '');
                Gerador.wCampoNFSe(tcStr, '#1', 'NumeroRPS', 01, 12, 1, OnlyNumber(NFSe.IdentificacaoRps.Numero), '');
                Gerador.wCampoNFSe(tcStr, '', 'SeriePrestacao', 01, 2,  1, NFSe.IdentificacaoRps.Serie, '');
                Gerador.wGrupoNFSe('/RPS');
             end;
          end;
          Gerador.wGrupoNFSe('/RPSConsulta');
        end
        else begin
          Gerador.wGrupoNFSe('NotaConsulta');
          for i := 0 to TNFSeConsultarNfseRPS(Self).FNotasFiscais.Count-1 do
          begin
            with TNFSeConsultarNfseRPS(Self).FNotasFiscais.Items[I] do
              if NFSe.Numero <> '' then
              begin
                Gerador.wGrupoNFSe('Nota Id="nota:' + NFSe.Numero + '"');
                Gerador.wCampoNFSe(tcStr, '', 'InscricaoMunicipalPrestador', 01, 11,  1, TNFSeConsultarNfseRPS(Self).InscMun, ''); //NFSe.Prestador.InscricaoMunicipal
                Gerador.wCampoNFSe(tcStr, '#1', 'NumeroNota', 01, 12, 1, OnlyNumber(NFSe.Numero), '');
                Gerador.wCampoNFSe(tcStr, '', 'CodigoVerificacao', 01, 255,  1, NFSe.CodigoVerificacao, '');
                Gerador.wGrupoNFSe('/Nota');
             end;
          end;
          Gerador.wGrupoNFSe('/NotaConsulta');
        end;
      end;

      FvNotas := Gerador.ArquivoFormatoXML;
    finally
      Gerador.Free;
    end;
  end;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.ConsNFSeRps then
  begin
    case FProvedor of
    proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeRPSDSF(FPrefixo3, FPrefixo4,
                                                         FNameSpace,
                                                         FVersaoXML,
                                                         CodCidadeToCodSiafi(FPConfiguracoesNFSe.Geral.CodigoMunicipio),
                                                         ACNPJ,
                                                         LowerCase(booltostr(TNFSeConsultarNfseRPS(Self).FNotasFiscais.Transacao, True)),
                                                         TNFSeConsultarNfseRPS(Self).FNotasFiscais.NumeroLote,
                                                         FvNotas,
                                                         '', '');
    proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeRPSEquiplano(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                               TNFSeConsultarNfseRPS(Self).Numero,
                                                               ACNPJ,
                                                               TNFSeConsultarNfseRPS(Self).InscMun,
                                                               '', '');
    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeRPS(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      TNFSeConsultarNfseRPS(Self).Numero,
                                                      TNFSeConsultarNfseRPS(Self).Serie,
                                                      TNFSeConsultarNfseRPS(Self).Tipo,
                                                      ACNPJ,
                                                      TNFSeConsultarNfseRPS(Self).InscMun,
                                                      TNFSeConsultarNfseRPS(Self).Senha,
                                                      TNFSeConsultarNfseRPS(Self).FraseSecreta,
                                                      '', '', FProvedor,
                                                      TNFSeConsultarNfseRPS(Self).RazaoSocial);
    end;
    if FPDadosMsg <> '' then
    begin
      FPDadosMsg := FTagI + FPDadosMsg + FTagF;
      // O procedimento recebe como parametro o XML a ser assinado e retorna o
      // mesmo assinado da propriedade FPDadosMsg
      AssinarXML(FPDadosMsg, FPrefixo3 + 'ConsultarNfseRpsEnvio', '',
                 'Falha ao Assinar - Consultar Lote de RPS: ');
    end;
  end
  else begin
    case FProvedor of
    proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeRPSDSF(FPrefixo3, FPrefixo4,
                                                         FNameSpace,
                                                         FVersaoXML,
                                                         CodCidadeToCodSiafi( strtointDef(TNFSeConsultarNfseRPS(Self).FNotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio, 0)),
                                                         ACNPJ,
                                                         LowerCase(booltostr(TNFSeConsultarNfseRPS(Self).FNotasFiscais.Transacao, True)),
                                                         TNFSeConsultarNfseRPS(Self).FNotasFiscais.NumeroLote,
                                                         FvNotas,
                                                         FTagI, FTagF);
    proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeRPSEquiplano(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                               TNFSeConsultarNfseRPS(Self).Numero,
                                                               ACNPJ,
                                                               TNFSeConsultarNfseRPS(Self).InscMun,
                                                               FTagI, FTagF);
    proEL: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeRPSEL(FPConfiguracoesNFSe.Geral.CodigoMunicipio,
                                                          TNFSeConsultarNfseRPS(Self).Numero,
                                                          ACNPJ,
                                                          TNFSeConsultarNfseRPS(Self).InscMun,
                                                          FTagI, FTagF);
    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeRPS(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      TNFSeConsultarNfseRPS(Self).Numero,
                                                      TNFSeConsultarNfseRPS(Self).Serie,
                                                      TNFSeConsultarNfseRPS(Self).Tipo,
                                                      ACNPJ,
                                                      TNFSeConsultarNfseRPS(Self).InscMun,
                                                      TNFSeConsultarNfseRPS(Self).Senha,
                                                      TNFSeConsultarNfseRPS(Self).FraseSecreta,
                                                      FTagI, FTagF, FProvedor,
                                                      TNFSeConsultarNfseRPS(Self).RazaoSocial);
    end;
  end;

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.ConsNFSeRps;

  if FPDadosMsg = '' then
    GerarException(ACBrStr('A funcionalidade [Consultar NFSe por RPS] n�o foi disponibilizada pelo provedor: ' +
     FPConfiguracoesNFSe.Geral.xProvedor));
end;

function TNFSeConsultarNfseRPS.TratarResposta: Boolean;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'ConsultarNfseRpsResposta');
  Result := ExtrairNotasRetorno;
end;

procedure TNFSeConsultarNfseRPS.FinalizarServico;
begin
  inherited FinalizarServico;

  if Assigned(FRetornoNFSe) then
    FreeAndNil(FRetornoNFSe);
end;

function TNFSeConsultarNfseRPS.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeConsultarNfseRPS.GerarPrefixoArquivo: String;
begin
  Result := Numero + Serie;
end;

{ TNFSeConsultarNfse }

constructor TNFSeConsultarNfse.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeConsulta;
  FPLayout := LayNfseConsultaNfse;
  FPArqEnv := 'con-nfse';
  FPArqResp := 'lista-nfse';

  FRetornoNFSe := nil;
end;

destructor TNFSeConsultarNfse.Destroy;
begin
  if Assigned(FRetornoNFSe) then
    FRetornoNFSe.Free;

  inherited Destroy;
end;

procedure TNFSeConsultarNfse.DefinirURL;
begin
  FPLayout := LayNfseConsultaNfse;
  inherited DefinirURL;
end;

procedure TNFSeConsultarNfse.DefinirServicoEAction;
begin
  FPServico := 'NFSeConsNfse';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.ConsNfse;
end;

procedure TNFSeConsultarNfse.DefinirDadosMsg;
var
  ACNPJ: String;
begin
  ACNPJ := OnlyNumber(TNFSeConsultarNfse(Self).CNPJ);
  if not ValidarCNPJ(ACNPJ) then
    GerarException( 'CNPJ ' + ACNPJ + ' inv�lido.' );

  if TNFSeConsultarNfse(Self).InscMun = '' then
    GerarException(ACBrStr('Inscri��o Municipal n�o informada'));

  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoConNfse;

  InicializarDadosMsg;

  if (FProvedor = proDigifred) then begin
    FTagI := '<' + FPrefixo3 + 'ConsultarNfseServicoPrestadoEnvio' + FNameSpaceDad;
    FTagF := '</' + FPrefixo3 + 'ConsultarNfseServicoPrestadoEnvio>';
  end else begin
    FTagI := '<' + FPrefixo3 + 'ConsultarNfseEnvio' + FNameSpaceDad;
    FTagF := '</' + FPrefixo3 + 'ConsultarNfseEnvio>';
  end;

 if FPConfiguracoesNFSe.Geral.ConfigAssinar.ConsNFSe
  then begin
   case FProvedor of
    proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeDSF(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      CodCidadeToCodSiafi(strtointDef(TNFSeConsultarNfse(Self).FNotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio, 0)),
                                                      ACNPJ,
                                                      TNFSeConsultarNfse(Self).InscMun,
                                                      TNFSeConsultarNfse(Self).FNumeroNFSe,
                                                      TNFSeConsultarNfse(Self).DataInicial,
                                                      TNFSeConsultarNfse(Self).DataFinal,
                                                      '', '');
    proInfisc: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeInfisc(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      CodCidadeToCodSiafi(strtointDef(IntToStr(FPConfiguracoesNFSe.Geral.CodigoMunicipio), 0)),
                                                      ACNPJ,
                                                      TNFSeConsultarNfse(Self).InscMun,
                                                      TNFSeConsultarNfse(Self).FNumeroNFSe,
                                                      TNFSeConsultarNfse(Self).FSerie,
                                                      TNFSeConsultarNfse(Self).DataInicial,
                                                      TNFSeConsultarNfse(Self).DataFinal,
                                                      '', '');
    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSe(FPrefixo3, FPrefixo4,
                                                   FNameSpace,
                                                   FVersaoXML,
                                                   ACNPJ,
                                                   TNFSeConsultarNfse(Self).InscMun,
                                                   TNFSeConsultarNfse(Self).DataInicial,
                                                   TNFSeConsultarNfse(Self).DataFinal,
                                                   '', '',
                                                   TNFSeConsultarNfse(Self).FNumeroNFSe,
                                                   TNFSeConsultarNfse(Self).Senha,
                                                   TNFSeConsultarNfse(Self).FraseSecreta,
                                                   FProvedor,
                                                   TNFSeConsultarNfse(Self).FPagina,
                                                   TNFSeConsultarNfse(Self).FCNPJTomador,
                                                   TNFSeConsultarNfse(Self).FIMTomador,
                                                   TNFSeConsultarNfse(Self).FNomeInter,
                                                   TNFSeConsultarNfse(Self).FCNPJInter,
                                                   TNFSeConsultarNfse(Self).FIMInter);
   end;
    if FPDadosMsg <> '' then
    begin
      FPDadosMsg := FTagI + FPDadosMsg + FTagF;
      // O procedimento recebe como parametro o XML a ser assinado e retorna o
      // mesmo assinado da propriedade FPDadosMsg
      AssinarXML(FPDadosMsg, FPrefixo3 + 'ConsultarNfseEnvio', '',
                 'Falha ao Assinar - Consultar NFSe: ');
    end;
  end
  else begin
   case FProvedor of
    proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeDSF(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      CodCidadeToCodSiafi(strtointDef(TNFSeConsultarNfse(Self).FNotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio, 0)),
                                                      ACNPJ,
                                                      TNFSeConsultarNfse(Self).InscMun,
                                                      TNFSeConsultarNfse(Self).FNumeroNFSe,
                                                      TNFSeConsultarNfse(Self).DataInicial,
                                                      TNFSeConsultarNfse(Self).DataFinal,
                                                      FTagI, FTagF);
    proInfisc: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeInfisc(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      CodCidadeToCodSiafi(strtointDef(TNFSeConsultarNfse(Self).FNotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio, 0)),
                                                      ACNPJ,
                                                      TNFSeConsultarNfse(Self).InscMun,
                                                      TNFSeConsultarNfse(Self).FNumeroNFSe,
                                                      TNFSeConsultarNfse(Self).FSerie,
                                                      TNFSeConsultarNfse(Self).DataInicial,
                                                      TNFSeConsultarNfse(Self).DataFinal,
                                                      FTagI, FTagF);
    proEL: FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSeEL(FPrefixo3, FPrefixo4,
                                                      FNameSpace,
                                                      FVersaoXML,
                                                      TNFSeConsultarNfse(Self).FNumeroNFSe,
                                                      ACNPJ,
                                                      TNFSeConsultarNfse(Self).InscMun,
                                                      OnlyNumber(TNFSeConsultarNfse(Self).FCNPJTomador),
                                                      OnlyNumber(TNFSeConsultarNfse(Self).FCNPJInter),
                                                      TNFSeConsultarNfse(Self).DataInicial,
                                                      TNFSeConsultarNfse(Self).DataFinal,
                                                      FTagI, FTagF);
    else FPDadosMsg := TNFSeG.Gera_DadosMsgConsNFSe(FPrefixo3, FPrefixo4,
                                                   FNameSpace,
                                                   FVersaoXML,
                                                   ACNPJ,
                                                   TNFSeConsultarNfse(Self).InscMun,
                                                   TNFSeConsultarNfse(Self).DataInicial,
                                                   TNFSeConsultarNfse(Self).DataFinal,
                                                   FTagI, FTagF,
                                                   TNFSeConsultarNfse(Self).FNumeroNFSe,
                                                   TNFSeConsultarNfse(Self).Senha,
                                                   TNFSeConsultarNfse(Self).FraseSecreta,
                                                   FProvedor,
                                                   TNFSeConsultarNfse(Self).FPagina,
                                                   TNFSeConsultarNfse(Self).FCNPJTomador,
                                                   TNFSeConsultarNfse(Self).FIMTomador,
                                                   TNFSeConsultarNfse(Self).FNomeInter,
                                                   TNFSeConsultarNfse(Self).FCNPJInter,
                                                   TNFSeConsultarNfse(Self).FIMInter);
   end;
  end;

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.ConsNFSe;

  if FPDadosMsg = '' then
    GerarException(ACBrStr('A funcionalidade [Consultar NFSe] n�o foi disponibilizada pelo provedor: ' +
     FPConfiguracoesNFSe.Geral.xProvedor));
end;

function TNFSeConsultarNfse.TratarResposta: Boolean;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'ConsultarNfseResposta');
  Result := ExtrairNotasRetorno;
end;

procedure TNFSeConsultarNfse.FinalizarServico;
begin
  inherited FinalizarServico;

  if Assigned(FRetornoNFSe) then
    FreeAndNil(FRetornoNFSe);
end;

function TNFSeConsultarNfse.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeConsultarNfse.GerarPrefixoArquivo: String;
begin
  Result := FormatDateTime('yyyymmdd', DataInicial) +
            FormatDateTime('yyyymmdd', DataFinal);
end;

{ TNFSeCancelarNfse }

constructor TNFSeCancelarNfse.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeCancelamento;
  FPLayout := LayNfseCancelaNfse;
  FPArqEnv := 'ped-can';
  FPArqResp := 'can';

  FRetornoNFSe := nil;
end;

destructor TNFSeCancelarNfse.Destroy;
begin
//  if Assigned(FRetCancNFSe) then
//    FRetCancNFSe.Free;

  inherited Destroy;
end;

procedure TNFSeCancelarNfse.DefinirURL;
begin
  FPLayout := LayNfseCancelaNfse;
  inherited DefinirURL;
end;

procedure TNFSeCancelarNfse.DefinirServicoEAction;
begin
  FPServico := 'NFSeCancNfse';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.Cancelar;
end;

procedure TNFSeCancelarNfse.DefinirDadosMsg;
var
  i: Integer;
  URISig, URIRef: String;
  Gerador: TGerador;
begin
  if TNFSeCancelarNfse(Self).FNotasFiscais.Count > 0 then
  begin
    FNumeroNFSe         := TNFSeCancelarNfse(Self).FNotasFiscais.Items[0].NFSe.Numero;
    FCNPJ               := TNFSeCancelarNfse(Self).FNotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ;
    FInscMun            := TNFSeCancelarNfse(Self).FNotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;
    FCodigoMunicipio    := TNFSeCancelarNfse(Self).FNotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio;
    if FCodigoMunicipio = '' then
      FCodigoMunicipio := TNFSeCancelarNfse(Self).FNotasFiscais.Items[0].NFSe.Servico.CodigoMunicipio;

    FMotivoCancelamento := TNFSeCancelarNfse(Self).FNotasFiscais.Items[0].NFSe.MotivoCancelamento;
  end;

  if (FPConfiguracoesNFSe.Geral.Provedor = proISSNet) and
     (FPConfiguracoesNFSe.WebServices.AmbienteCodigo = 2) then
    FCodigoMunicipio := '999';

  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoCancelar;

  InicializarDadosMsg;

  case FProvedor of
    proEquiplano,
    proPublica: FURI:= '';

    proDigifred: FURI := 'CANC' + TNFSeCancelarNfse(Self).FNumeroNFSe;

    proSaatri: FURI := 'Cancelamento_' + TNFSeCancelarNfse(Self).FCNPJ;

    proIssIntel,
    proISSNet: begin
                 FURI := '';
                 FURIRef := 'http://www.w3.org/TR/2000/REC-xhtml1-20000126/';
               end;

    proTecnos: FURI := '2' + TNFSeCancelarNfse(Self).FCNPJ +
                IntToStrZero(StrToInt(TNFSeCancelarNfse(Self).FNumeroNFSe), 16);

    proGovDigital: FURI := TNFSeCancelarNfse(Self).FNumeroNFSe;

  else FURI := 'pedidoCancelamento_' + TNFSeCancelarNfse(Self).FCNPJ +
              TNFSeCancelarNfse(Self).FInscMun + TNFSeCancelarNfse(Self).FNumeroNFSe;
  end;

  if FProvedor = proGinfes then
  begin
    FTagI := '<CancelarNfseEnvio' +
               ' xmlns="http://www.ginfes.com.br/servico_cancelar_nfse_envio"' +
               ' xmlns:' + stringReplace(FPrefixo4, ':', '', []) + '="http://www.ginfes.com.br/tipos">';

    FTagF := '</CancelarNfseEnvio>';
  end
  else begin
    FTagI := '<' + FPrefixo3 + 'CancelarNfseEnvio' + FNameSpaceDad +
              '<' + FPrefixo3 + 'Pedido>' +
               '<' + FPrefixo4 + 'InfPedidoCancelamento' +
                ifThen(FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador <> '', ' ' +
                       FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador + '="' + FURI + '"', '') + '>';

    FTagF :=  '</' + FPrefixo3 + 'Pedido>' +
             '</' + FPrefixo3 + 'CancelarNfseEnvio>';
  end;

  if FProvedor in [proIssDSF] then
  begin
    Gerador := TGerador.Create;
    try
      Gerador.ArquivoFormatoXML := '';

      for i := 0 to TNFSeCancelarNfse(Self).FNotasFiscais.Count-1 do
      begin
        with TNFSeCancelarNfse(Self).FNotasFiscais.Items[I] do
        begin
          Gerador.wGrupoNFSe('Nota Id="nota:' + NFSe.Numero + '"');
          Gerador.wCampoNFSe(tcStr, '', 'InscricaoMunicipalPrestador', 01, 11,  1, TNFSeCancelarNfse(Self).FInscMun, '');
          Gerador.wCampoNFSe(tcStr, '#1', 'NumeroNota', 01, 12, 1, OnlyNumber(NFSe.Numero), '');
          Gerador.wCampoNFSe(tcStr, '', 'CodigoVerificacao', 01, 255,  1, NFSe.CodigoVerificacao, '');
          Gerador.wCampoNFSe(tcStr, '', 'MotivoCancelamento', 01, 80, 1, NFSe.MotivoCancelamento, '');
          Gerador.wGrupoNFSe('/Nota');
        end;
      end;

      FvNotas := Gerador.ArquivoFormatoXML;
    finally
      Gerador.Free;
    end;
  end;

  if (FProvedor = proInfisc ) then
  begin
    Gerador := TGerador.Create;
    try
      Gerador.ArquivoFormatoXML := '';
      for i := 0 to TNFSeCancelarNfse(Self).FNotasFiscais.Count-1 do
      begin
        with TNFSeCancelarNfse(Self).FNotasFiscais.Items[I] do
        begin
          Gerador.wCampoNFSe(tcStr, '', 'chvAcessoNFS-e', 1, 39, 1, NFSe.ChaveNFSe, '');
          Gerador.wCampoNFSe(tcStr, '', 'motivo', 1, 39, 1, NFSe.MotivoCancelamento, '');
        end;
      end;

      FvNotas := Gerador.ArquivoFormatoXML;
    finally
      Gerador.Free;
    end;
  end;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.Cancelar then
  begin
    case FProvedor of
      proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeDSF(FPrefixo3, FPrefixo4,
                                                          FNameSpace,
                                                          FVersaoXML,
                                                          TNFSeCancelarNfse(Self).FCNPJ,
                                                          LowerCase(booltostr(TNFSeCancelarNfse(Self).FNotasFiscais.Transacao, True)),
                                                          CodCidadeToCodSiafi(strtoint64(TNFSeCancelarNfse(Self).FCodigoMunicipio)),
                                                          TNFSeCancelarNfse(Self).FNotasFiscais.NumeroLote,
                                                          FvNotas,
                                                          '', '');
      proInfisc: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeInfisc(FPrefixo3, FPrefixo4,
                                                          FNameSpace,
                                                          FVersaoXML,
                                                          TNFSeCancelarNfse(Self).FCNPJ,
                                                          LowerCase(booltostr(TNFSeCancelarNfse(Self).FNotasFiscais.Transacao, True)),
                                                          CodCidadeToCodSiafi(strtoint64(TNFSeCancelarNfse(Self).FCodigoMunicipio)),
                                                          TNFSeCancelarNfse(Self).FNotasFiscais.NumeroLote,
                                                          FvNotas,
                                                          '', '');
      proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeEquiplano(StrToInt(TNFSeCancelarNfse(Self).FCodigoMunicipio),
                                                                OnlyNumber(TNFSeCancelarNfse(Self).FCNPJ),
                                                                TNFSeCancelarNfse(Self).FInscMun,
                                                                TNFSeCancelarNfse(Self).FNumeroNFSe,
                                                                TNFSeCancelarNfse(Self).FMotivoCancelamento,
                                                                '', '');
    else FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSe(FPrefixo4,
                                                       FNameSpace,
                                                       TNFSeCancelarNfse(Self).FNumeroNFSe,
                                                       TNFSeCancelarNfse(Self).FCNPJ,
                                                       TNFSeCancelarNfse(Self).FInscMun,
                                                       TNFSeCancelarNfse(Self).FCodigoMunicipio,
                                                       TNFSeCancelarNfse(Self).FCodigoCancelamento,
                                                       '', '',
                                                       FProvedor,
                                                       TNFSeCancelarNfse(Self).FMotivoCancelamento);
    end;

    if FPDadosMsg <> '' then
    begin
      FPDadosMsg := FTagI + FPDadosMsg + FTagF;
      // O procedimento recebe como parametro o XML a ser assinado e retorna o
      // mesmo assinado da propriedade FPDadosMsg
      if FProvedor = proDigifred then
        AssinarXML(FPDadosMsg, FPrefixo3 + 'InfPedidoCancelamento', '',
                                         'Falha ao Assinar - Cancelar NFS-e: ')
      else if FProvedor = proGinfes then
        AssinarXML(FPDadosMsg, 'CancelarNfseEnvio', '',
                                         'Falha ao Assinar - Cancelar NFS-e: ')
      else
        AssinarXML(FPDadosMsg, FPrefixo3 + 'CancelarNfseEnvio', '',
                                         'Falha ao Assinar - Cancelar NFS-e: ');
    end;
  end
  else begin
    case FProvedor of
      proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeDSF(FPrefixo3, FPrefixo4,
                                                          FNameSpace,
                                                          FVersaoXML,
                                                          TNFSeCancelarNfse(Self).FCNPJ,
                                                          LowerCase(booltostr(TNFSeCancelarNfse(Self).FNotasFiscais.Transacao, True)),
                                                          CodCidadeToCodSiafi(strtoint64(TNFSeCancelarNfse(Self).FCodigoMunicipio)),
                                                          TNFSeCancelarNfse(Self).FNotasFiscais.NumeroLote,
                                                          FvNotas,
                                                          FTagI, FTagF);
      proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeEquiplano(StrToInt(TNFSeCancelarNfse(Self).FCodigoMunicipio),
                                                                OnlyNumber(TNFSeCancelarNfse(Self).FCNPJ),
                                                                TNFSeCancelarNfse(Self).FInscMun,
                                                                TNFSeCancelarNfse(Self).FNumeroNFSe,
                                                                TNFSeCancelarNfse(Self).FMotivoCancelamento,
                                                                FTagI, FTagF);
      proEL: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeEL(StrToInt(TNFSeCancelarNfse(Self).FCodigoMunicipio),
                                                           OnlyNumber(TNFSeCancelarNfse(Self).FCNPJ),
                                                           TNFSeCancelarNfse(Self).FInscMun,
                                                           TNFSeCancelarNfse(Self).FNumeroNFSe,
                                                           TNFSeCancelarNfse(Self).FMotivoCancelamento,
                                                           FTagI, FTagF);
      proFreire: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeFreire(FPrefixo4,
                                                             FNameSpace,
                                                             TNFSeCancelarNfse(Self).FNumeroNFSe,
                                                             TNFSeCancelarNfse(Self).FCNPJ,
                                                             TNFSeCancelarNfse(Self).FInscMun,
                                                             TNFSeCancelarNfse(Self).FCodigoMunicipio,
                                                             TNFSeCancelarNfse(Self).FCodigoCancelamento,
                                                             TNFSeCancelarNfse(Self).FMotivoCancelamento,
                                                             FTagI, FTagF);
    else FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSe(FPrefixo4,
                                                       FNameSpace,
                                                       TNFSeCancelarNfse(Self).FNumeroNFSe,
                                                       TNFSeCancelarNfse(Self).FCNPJ,
                                                       TNFSeCancelarNfse(Self).FInscMun,
                                                       TNFSeCancelarNfse(Self).FCodigoMunicipio,
                                                       TNFSeCancelarNfse(Self).FCodigoCancelamento,
                                                       FTagI, FTagF,
                                                       FProvedor,
                                                       TNFSeCancelarNfse(Self).FMotivoCancelamento);
    end;
  end;

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.Cancelar;

  if FPDadosMsg = '' then
    GerarException(ACBrStr('A funcionalidade [Cancelar NFSe] n�o foi disponibilizada pelo provedor: ' +
     FPConfiguracoesNFSe.Geral.xProvedor));
end;

function TNFSeCancelarNfse.TratarResposta: Boolean;
var
  i: Integer;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'CancelarNfseResposta');
  i := pos('?>', FPRetWS);
  if (i > 0) then FPRetWS := copy(FPRetWS, i+2, length(FPRetWS));

  if Assigned(FRetCancNFSe) then
    FRetCancNFSe.Free;

  FRetCancNFSe := TRetCancNfse.Create;
  try
    FRetCancNFSe.Leitor.Arquivo := FPRetWS;
    FRetCancNFSe.Provedor := FProvedor;

    case FProvedor of
      proEquiplano: FRetCancNFSe.LerXML_provedorEquiplano;
      proIssDSF: FRetCancNFSe.LerXml_provedorIssDsf;
      proInfisc: FRetCancNFSe.LerXml_provedorInfisc(FVersaoXML);
    else
      FRetCancNFSe.LerXml;
    end;

    FDataHora := RetCancNFSe.InfCanc.DataHora;

    // Lista de Mensagem de Retorno
    FPMsg := '';
    FaMsg:='';
    if RetCancNFSe.InfCanc.MsgRetorno.Count > 0 then
    begin
      for i := 0 to RetCancNFSe.InfCanc.MsgRetorno.Count - 1 do
      begin
        FPMsg := FPMsg + RetCancNFSe.infCanc.MsgRetorno.Items[i].Mensagem + IfThen(FPMsg = '', '', ' / ');

        FaMsg := FaMsg + 'C�digo Erro : ' + RetCancNFSe.InfCanc.MsgRetorno.Items[i].Codigo + LineBreak +
                         'Mensagem... : ' + RetCancNFSe.infCanc.MsgRetorno.Items[i].Mensagem + LineBreak +
                         'Corre��o... : ' + RetCancNFSe.InfCanc.MsgRetorno.Items[i].Correcao + LineBreak +
                         'Provedor... : ' + FPConfiguracoesNFSe.Geral.xProvedor + LineBreak;
      end;
    end
    else FaMsg := 'Numero da NFSe : ' + TNFSeCancelarNfse(Self).FNumeroNFSe + LineBreak +
                  'Data Hora..... : ' + ifThen(FDataHora = 0, '', DateTimeToStr(FDataHora)) + LineBreak;

    Result := (RetCancNFSe.InfCanc.Sucesso <> '');
  finally
//    FRetCancNFSe.Free;
  end;
end;

procedure TNFSeCancelarNFSe.SalvarResposta;
var
  aPath: String;
begin
  inherited SalvarResposta;

  if FPConfiguracoesNFSe.Arquivos.Salvar then
  begin
    aPath := PathWithDelim(FPConfiguracoesNFSe.Arquivos.GetPathNFSe(0, ''{xData, xCNPJ}));
    FPDFeOwner.Gravar(GerarPrefixoArquivo + '-' + ArqResp + '.xml', FPRetWS, aPath);
  end;
end;

procedure TNFSeCancelarNfse.FinalizarServico;
begin
  inherited FinalizarServico;

//  if Assigned(FRetCancNFSe) then
//    FreeAndNil(FRetCancNFSe);
end;

function TNFSeCancelarNfse.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeCancelarNfse.GerarPrefixoArquivo: String;
begin
  Result := NumeroNFSe;
end;

{ TNFSeSubstituirNFSe }

constructor TNFSeSubstituirNFSe.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeSubstituicao;
  FPLayout := LayNfseSubstituiNfse;
  FPArqEnv := 'ped-sub';
  FPArqResp := 'sub';

  FRetornoNFSe := nil;
end;

destructor TNFSeSubstituirNFSe.Destroy;
begin
  if Assigned(FRetornoNFSe) then
    FRetornoNFSe.Free;

  inherited Destroy;
end;

procedure TNFSeSubstituirNFSe.DefinirURL;
begin
  FPLayout := LayNfseSubstituiNfse;
  inherited DefinirURL;
end;

procedure TNFSeSubstituirNFSe.DefinirServicoEAction;
begin
  FPServico := 'NFSeSubNfse';
  FPSoapAction := FPConfiguracoesNFSe.Geral.ConfigSoapAction.Substituir;
end;

procedure TNFSeSubstituirNFSe.DefinirDadosMsg;
var
  i: Integer;
  URISig, URIRef: String;
  Gerador: TGerador;
begin
  FxsdServico := FPConfiguracoesNFSe.Geral.ConfigSchemas.ServicoSubstituir;

  InicializarDadosMsg;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.RPS then
  begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proISSDigital, proISSe, proSystemPro,
        pro4R, proFiorilli, proProdata, proVitoria, proPVH, proAgili, proCoplan,
        proVirtual, proFreire, proLink3, proGovDigital,
        proGoiania: FvNotas := FvNotas +
                               '<' + FPrefixo4 + 'Rps>' +
                                '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                  RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                    '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                                '</Signature>'+
                               '</' + FPrefixo4 + 'Rps>';

        proMitra: FvNotas := FvNotas +
                             '<' + FPrefixo4 + 'Rps>' +
                              '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                  '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</Signature>') +
                              '</Signature>'+
                             '</' + FPrefixo4 + 'Rps>';

        proDigifred: FvNotas := FvNotas +
                                '<' + FPrefixo4 + 'Rps ' +
                                   RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                     '<' + FPrefixo4 + 'Rps', '</Signature>') +
                                 '</Signature>'+
                                '</' + Prefixo4 + 'Rps>';

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                                   '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</Signature>') +
                               '</Signature>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas +
                        '<' + FPrefixo4 + 'Rps>' +
                         '<' + FPrefixo4 + 'InfRps' +
                           RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLAssinado,
                         '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                        '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end
  else begin
    for I := 0 to FNotasFiscais.Count - 1 do
    begin
      case FProvedor of

        profintelISS, proSaatri, proSisPMJP, proGoiania, proISSDigital, proISSe,
        proSystemPro, pro4R, proFiorilli, proProdata, proVitoria, proPVH,
        proAgili, proCoplan, proVirtual, proFreire, proLink3, proActcon,
        proGovDigital: FvNotas := FvNotas +
                                  '<' + FPrefixo4 + 'Rps>' +
                                   '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico' +
                                     RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>') +
                                   '</' + FPrefixo4 + 'InfDeclaracaoPrestacaoServico>'+
                                  '</' + FPrefixo4 + 'Rps>';

        proIssDSF,
        proInfisc: FvNotas :=  FvNotas + TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLOriginal;

        proTecnos: FvNotas := FvNotas +
                              '<' + FPrefixo4 + 'Rps>' +
                               '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico' +
                                 RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                 '<' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico', '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>') +
                               '</' + FPrefixo4 + 'tcDeclaracaoPrestacaoServico>'+
                              '</' + FPrefixo4 + 'Rps>';

        else FvNotas := FvNotas + '<' + FPrefixo4 + 'Rps>' +
                                 '<' + FPrefixo4 + 'InfRps' +
                                   RetornarConteudoEntre(TNFSeSubstituirNFSe(Self).FNotasFiscais.Items[I].XMLOriginal,
                                     '<' + FPrefixo4 + 'InfRps', '</Rps>') +
                                '</' + FPrefixo4 + 'Rps>';
      end;
    end;
  end;

  case FProvedor of
    proEquiplano,
    proPublica: FURISig:= '';

    proDigifred:  FURISig := 'CANC' + TNFSeSubstituirNfse(Self).FNumeroNFSe;

    proSaatri: FURISig := 'Cancelamento_' + TNFSeSubstituirNfse(Self).FCNPJ;

    proIssIntel,
    proISSNet: begin
                 FURISig := '';
                 FURIRef := 'http://www.w3.org/TR/2000/REC-xhtml1-20000126/';
               end;

    proTecnos: FURISig := '2' + TNFSeSubstituirNfse(Self).FCNPJ +
              IntToStrZero(StrToInt(TNFSeSubstituirNfse(Self).FNumeroNFSe), 16);

  else  FURISig := 'pedidoCancelamento_' + TNFSeSubstituirNfse(Self).FCNPJ +
                    TNFSeSubstituirNfse(Self).FInscMun + TNFSeSubstituirNfse(Self).FNumeroNFSe;
  end;

//  if FProvedor <> proISSNet then
//  begin
//    FURISig := '';
//    FURIRef := '';
//  end;

  FTagI := '<' + FPrefixo3 + 'SubstituirNfseEnvio' + FNameSpaceDad +
            '<' + FPrefixo3 + 'SubstituicaoNfse>' +
             '<' + FPrefixo3 + 'Pedido>' +
              '<' + FPrefixo4 + 'InfPedidoCancelamento' +
                ifThen(FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador <> '', ' ' +
                       FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador + '="' + FURI + '"', '') + '>';

  FTagF :=  '</' + FPrefixo3 + 'SubstituicaoNfse>' +
           '</' + FPrefixo3 + 'SubstituirNfseEnvio>';

  if FProvedor in [proIssDSF] then
  begin
    Gerador := TGerador.Create;
    try
      Gerador.ArquivoFormatoXML := '';

      for i := 0 to TNFSeSubstituirNfse(Self).FNotasFiscais.Count-1 do
      begin
        with TNFSeSubstituirNfse(Self).FNotasFiscais.Items[I] do
        begin
          Gerador.wGrupoNFSe('Nota Id="nota:' + NFSe.Numero + '"');
          Gerador.wCampoNFSe(tcStr, '', 'InscricaoMunicipalPrestador', 01, 11,  1, TNFSeSubstituirNfse(Self).FInscMun, '');
          Gerador.wCampoNFSe(tcStr, '#1', 'NumeroNota', 01, 12, 1, OnlyNumber(NFSe.Numero), '');
          Gerador.wCampoNFSe(tcStr, '', 'CodigoVerificacao', 01, 255,  1, NFSe.CodigoVerificacao, '');
          Gerador.wCampoNFSe(tcStr, '', 'MotivoCancelamento', 01, 80, 1, NFSe.MotivoCancelamento, '');
          Gerador.wGrupoNFSe('/Nota');
        end;
      end;

      FvNotas := Gerador.ArquivoFormatoXML;
    finally
      Gerador.Free;
    end;
  end;

  if FPConfiguracoesNFSe.Geral.ConfigAssinar.Substituir then
  begin
    case FProvedor of
     proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeDSF(FPrefixo3, FPrefixo4,
                                                           FNameSpace,
                                                           FVersaoXML,
                                                           TNFSeSubstituirNfse(Self).FCNPJ,
                                                           LowerCase(booltostr(TNFSeSubstituirNfse(Self).FNotasFiscais.Transacao, True)),
                                                           CodCidadeToCodSiafi(strtoint64(TNFSeSubstituirNfse(Self).FCodigoMunicipio)),
                                                           TNFSeSubstituirNfse(Self).FNotasFiscais.NumeroLote,
                                                           FvNotas,
                                                           '', '');
     proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeEquiplano(StrToInt(TNFSeSubstituirNfse(Self).FCodigoMunicipio),
                                                                OnlyNumber(TNFSeSubstituirNfse(Self).FCNPJ),
                                                                TNFSeSubstituirNfse(Self).FInscMun,
                                                                TNFSeSubstituirNfse(Self).FNumeroNFSe,
                                                                TNFSeSubstituirNfse(Self).FMotivoCancelamento,
                                                                '', '');
    else FPDadosMsg := TNFSeG.Gera_DadosMsgSubstituirNFSe(FPrefixo3, FPrefixo4,
                                                         FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador,
                                                         FNameSpace,
                                                         TNFSeSubstituirNfse(Self).FNumeroNFSe,
                                                         TNFSeSubstituirNfse(Self).FCNPJ,
                                                         TNFSeSubstituirNfse(Self).FInscMun,
                                                         TNFSeSubstituirNfse(Self).FCodigoMunicipio,
                                                         TNFSeSubstituirNfse(Self).FCodigoCancelamento,
                                                         TNFSeSubstituirNfse(Self).FMotivoCancelamento,
                                                         FPConfiguracoesNFSe.Geral.ConfigXML.VersaoDados,
                                                         FVersaoXML,
                                                         IntToStr(TNFSeSubstituirNfse(Self).NumeroRps),
                                                         IntToStr(TNFSeSubstituirNfse(Self).FNotasFiscais.Count),
                                                         FvNotas,
                                                         '', '',
                                                         FProvedor);
    end;

    if FPDadosMsg <> '' then
    begin
      FPDadosMsg := FTagI + FPDadosMsg + FTagF;
      // O procedimento recebe como parametro o XML a ser assinado e retorna o
      // mesmo assinado da propriedade FPDadosMsg
      AssinarXML(FPDadosMsg, FPrefixo3 + 'Pedido', 'infPedidoCancelamento',
                 'Falha ao Assinar - Cancelar NFS-e: ');
    end;
  end
  else begin
   case FProvedor of
    proIssDSF: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeDSF(FPrefixo3, FPrefixo4,
                                                          FNameSpace,
                                                          FVersaoXML,
                                                          TNFSeSubstituirNfse(Self).FCNPJ,
                                                          LowerCase(booltostr(TNFSeSubstituirNfse(Self).FNotasFiscais.Transacao, True)),
                                                          CodCidadeToCodSiafi(strtoint64(TNFSeSubstituirNfse(Self).FCodigoMunicipio)),
                                                          TNFSeSubstituirNfse(Self).FNotasFiscais.NumeroLote,
                                                          FvNotas,
                                                          FTagI, FTagF);
    proEquiplano: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeEquiplano(StrToInt(TNFSeSubstituirNfse(Self).FCodigoMunicipio),
                                                                OnlyNumber(TNFSeSubstituirNfse(Self).FCNPJ),
                                                                TNFSeSubstituirNfse(Self).FInscMun,
                                                                TNFSeSubstituirNfse(Self).FNumeroNFSe,
                                                                TNFSeSubstituirNfse(Self).FMotivoCancelamento,
                                                                FTagI, FTagF);
    proFreire: FPDadosMsg := TNFSeG.Gera_DadosMsgCancelarNFSeFreire(FPrefixo4,
                                                             FNameSpace,
                                                             TNFSeSubstituirNfse(Self).FNumeroNFSe,
                                                             TNFSeSubstituirNfse(Self).FCNPJ,
                                                             TNFSeSubstituirNfse(Self).FInscMun,
                                                             TNFSeSubstituirNfse(Self).FCodigoMunicipio,
                                                             TNFSeSubstituirNfse(Self).FCodigoCancelamento,
                                                             TNFSeSubstituirNfse(Self).FMotivoCancelamento,
                                                             FTagI, FTagF);
    else FPDadosMsg := TNFSeG.Gera_DadosMsgSubstituirNFSe(FPrefixo3, FPrefixo4,
                                                         FPConfiguracoesNFSe.Geral.ConfigGeral.Identificador,
                                                         FNameSpace,
                                                         TNFSeSubstituirNfse(Self).FNumeroNFSe,
                                                         TNFSeSubstituirNfse(Self).FCNPJ,
                                                         TNFSeSubstituirNfse(Self).FInscMun,
                                                         TNFSeSubstituirNfse(Self).FCodigoMunicipio,
                                                         TNFSeSubstituirNfse(Self).FCodigoCancelamento,
                                                         TNFSeSubstituirNfse(Self).FMotivoCancelamento,
                                                         FPConfiguracoesNFSe.Geral.ConfigXML.VersaoDados,
                                                         FVersaoXML,
                                                         IntToStr(TNFSeSubstituirNfse(Self).NumeroRps),
                                                         IntToStr(TNFSeSubstituirNfse(Self).FNotasFiscais.Count),
                                                         FvNotas,
                                                         FTagI, FTagF,
                                                         FProvedor);
   end;
  end;

  FDadosEnvelope := FPConfiguracoesNFSe.Geral.ConfigEnvelope.Substituir;

  if FPDadosMsg = '' then
    GerarException(ACBrStr('A funcionalidade [Substituir NFSe] n�o foi disponibilizada pelo provedor: ' +
     FPConfiguracoesNFSe.Geral.xProvedor));
end;

function TNFSeSubstituirNFSe.TratarResposta: Boolean;
var
  i: Integer;
begin
  FPRetWS := ExtrairRetorno(FPrefixo3 + 'SubstituirNfseResposta');

  FNFSeRetorno := TRetSubsNfse.Create;
  try
    FNFSeRetorno.Leitor.Arquivo := FPRetWS;

    case FProvedor of
      proEquiplano: FNFSeRetorno.LerXML_provedorEquiplano;
      proIssDSF: FNFSeRetorno.LerXml_provedorIssDsf;
//      proInfisc: FNFSeRetorno.LerXml_provedorInfisc(FVersaoXML);
    else
      FNFSeRetorno.LerXml;
    end;

//      FDataHora := FNFSeRetorno.InfCanc.DataHora;

    // Lista de Mensagem de Retorno
    FPMsg := '';
    FaMsg:='';
    if FNFSeRetorno.MsgRetorno.Count > 0 then
    begin
      for i := 0 to FNFSeRetorno.MsgRetorno.Count - 1 do
      begin
        FPMsg := FPMsg + FNFSeRetorno.MsgRetorno.Items[i].Mensagem + IfThen(FPMsg = '', '', ' / ');

        FaMsg := FaMsg + 'C�digo Erro : ' + FNFSeRetorno.MsgRetorno.Items[i].Codigo + LineBreak +
                         'Mensagem... : ' + FNFSeRetorno.MsgRetorno.Items[i].Mensagem + LineBreak +
                         'Corre��o... : ' + FNFSeRetorno.MsgRetorno.Items[i].Correcao + LineBreak +
                         'Provedor... : ' + FPConfiguracoesNFSe.Geral.xProvedor + LineBreak;
      end;
    end;
//    else FaMsg := 'Numero da NFSe : ' + FNFSeRetorno.Pedido.IdentificacaoNfse.Numero + LineBreak +
//                  'Data Hora..... : ' + ifThen(FDataHora = 0, '', DateTimeToStr(FDataHora)) + LineBreak;

    Result := (FPMsg <> '');
  finally
    FNFSeRetorno.Free;
  end;
end;

procedure TNFSeSubstituirNFSe.FinalizarServico;
begin
  inherited FinalizarServico;

  if Assigned(FRetornoNFSe) then
    FreeAndNil(FRetornoNFSe);
end;

function TNFSeSubstituirNFSe.GerarMsgLog: String;
begin
  Result := ACBrStr(FaMsg)
end;

function TNFSeSubstituirNFSe.GerarPrefixoArquivo: String;
begin
  Result := NumeroNFSe;
end;

{ TNFSeLinkNFSe }
(*
constructor TNFSeLinkNFSe.Create(AOwner: TACBrDFe;
  ANotasFiscais: TNotasFiscais);
begin
  inherited Create(AOwner);

  FNotasFiscais := ANotasFiscais;

  FPStatus := stNFSeRecepcao;
  FPLayout := LayNfseRecepcaoLote;
  FPArqEnv := '';
  FPArqResp := '';
end;

destructor TNFSeLinkNFSe.Destroy;
begin
  inherited Destroy;
end;

procedure TNFSeLinkNFSe.DefinirURL;
begin
  FPLayout := LayNfseRecepcaoLote;
  inherited DefinirURL;
end;

procedure TNFSeLinkNFSe.DefinirServicoEAction;
begin
  FPServico := 'NFSeLinkNfse';
  FPSoapAction := 'NFSeLinkNfse';
end;

procedure TNFSeLinkNFSe.DefinirDadosMsg;
var
  Texto, xNumeroNFSe, xNomeMunic: String;
begin
 if FPConfiguracoesNFSe.WebServices.Ambiente = taProducao then
 begin
   Texto := FPConfiguracoesNFSe.Geral.ConfigGeral.ProLinkNFSe;
   xNomeMunic := FPConfiguracoesNFSe.Geral.xNomeURL_P;
 end
 else begin
   Texto := FPConfiguracoesNFSe.Geral.ConfigGeral.HomLinkNFSe;
   xNomeMunic := FPConfiguracoesNFSe.Geral.xNomeURL_H;
 end;
  // %CodVerif%      : Representa o C�digo de Verifica��o da NFS-e
  // %NumeroNFSe%    : Representa o Numero da NFS-e
  // %NomeMunicipio% : Representa o Nome do Municipio
  // %InscMunic%     : Representa a Inscri��o Municipal do Emitente

  xNumeroNFSe := IntToStr(FNumeroNFSe);

  Texto := StringReplace(Texto, '%CodVerif%', FCodVerif, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%NumeroNFSe%', xNumeroNFSe, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%NomeMunicipio%', xNomeMunic, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%InscMunic%', FIM, [rfReplaceAll]);

  FLink := Texto;
end;

function TNFSeLinkNFSe.TratarResposta: Boolean;
begin
  Result := True; 
end;

procedure TNFSeLinkNFSe.FinalizarServico;
begin
  inherited FinalizarServico;
end;

function TNFSeLinkNFSe.GerarMsgLog: String;
begin
  Result := '';
end;

function TNFSeLinkNFSe.GerarPrefixoArquivo: String;
begin
  Result := '';
end;
*)
{ TNFSeEnvioWebService }

constructor TNFSeEnvioWebService.Create(AOwner: TACBrDFe);
begin
  inherited Create(AOwner);

  FPStatus := stNFSeEnvioWebService;
  FVersao := '';
end;

destructor TNFSeEnvioWebService.Destroy;
begin
  inherited Destroy;
end;

function TNFSeEnvioWebService.Executar: Boolean;
begin
  Result := inherited Executar;
end;

procedure TNFSeEnvioWebService.DefinirURL;
begin
  FPURL := FPURLEnvio;
end;

procedure TNFSeEnvioWebService.DefinirServicoEAction;
begin
  FPServico := FPSoapAction;
end;

procedure TNFSeEnvioWebService.DefinirDadosMsg;
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

function TNFSeEnvioWebService.TratarResposta: Boolean;
begin
  FPRetWS := SeparaDados(FPRetornoWS, 'soap:Body');
  Result := True;
end;

function TNFSeEnvioWebService.GerarMsgErro(E: Exception): String;
begin
  Result := ACBrStr('WebService: '+FPServico + LineBreak +
                    '- Inativo ou Inoperante tente novamente.');
end;

function TNFSeEnvioWebService.GerarVersaoDadosSoap: String;
begin
  Result := '<versaoDados>' + FVersao + '</versaoDados>';
end;

{ TWebServices }

constructor TWebServices.Create(AOwner: TACBrDFe);
begin
  FACBrNFSe := TACBrNFSe(AOwner);

  FGerarLoteRPS   := TNFSeGerarLoteRPS.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FEnviarLoteRPS  := TNFSeEnviarLoteRPS.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FEnviarSincrono := TNFSeEnviarSincrono.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FGerarNfse      := TNFSeGerarNfse.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FConsSitLoteRPS := TNFSeConsultarSituacaoLoteRPS.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FConsLote       := TNFSeConsultarLoteRPS.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FConsNfseRps    := TNFSeConsultarNfseRps.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FConsNfse       := TNFSeConsultarNfse.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FCancNfse       := TNFSeCancelarNfse.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  FSubNfse        := TNFSeSubstituirNfse.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
//  FLinkNfse       := TNFSeLinkNfse.Create(FACBrNFSe, TACBrNFSe(FACBrNFSe).NotasFiscais);
  
  FEnvioWebService := TNFSeEnvioWebService.Create(FACBrNFSe);
end;

destructor TWebServices.Destroy;
begin
  FGerarLoteRPS.Free;
  FEnviarLoteRPS.Free;
  FEnviarSincrono.Free;
  FGerarNfse.Free;
  FConsSitLoteRPS.Free;
  FConsLote.Free;
  FConsNfseRps.Free;
  FConsNfse.Free;
  FCancNfse.Free;
  FSubNfse.Free;
//  FLinkNfse.Free;
  FEnvioWebService.Free;

  inherited Destroy;
end;

function TWebServices.GeraLote(ALote: Integer): Boolean;
begin
  Result := GeraLote(IntToStr(ALote));
end;

function TWebServices.GeraLote(ALote: String): Boolean;
begin
  FGerarLoteRPS.FNumeroLote := ALote;

  Result := GerarLoteRPS.Executar;

  if not (Result) then
    GerarLoteRPS.GerarException( GerarLoteRPS.Msg );
end;

function TWebServices.Envia(ALote: Integer): Boolean;
begin
  Result := Envia(IntToStr(ALote));
end;

function TWebServices.Envia(ALote: String): Boolean;
begin
  FEnviarLoteRPS.FNumeroLote := ALote;

  Result := FEnviarLoteRPS.Executar;

  if not (Result) then
    FEnviarLoteRPS.GerarException( FEnviarLoteRPS.Msg );

  FConsSitLoteRPS.FCNPJ       := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.CNPJ;
  FConsSitLoteRPS.FInscMun    := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal;
  FConsSitLoteRPS.FProtocolo  := FEnviarLoteRPS.Protocolo;
  FConsSitLoteRPS.FNumeroLote := FEnviarLoteRPS.NumeroLote;

  if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proISSDigital] then
  begin
    FConsSitLoteRPS.FSenha        := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.Senha;
    FConsSitLoteRPS.FFraseSecreta := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.FraseSecreta;
  end;

  FConsLote.FCNPJ      := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.CNPJ;
  FConsLote.FInscMun   := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal;
  FConsLote.FProtocolo := FEnviarLoteRPS.Protocolo;

  if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proISSDigital, proTecnos] then
  begin
    FConsLote.FSenha        := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.Senha;
    FConsLote.FFraseSecreta := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.FraseSecreta;
  end;

  if (TACBrNFSe(FACBrNFSe).Configuracoes.Geral.ConsultaLoteAposEnvio) and (Result) then
  begin
    if not (TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proDigifred, proProdata,
           proVitoria, proPVH, profintelISS, proSaatri, proSisPMJP, proCoplan,
           proISSDigital, proISSDSF, proFiorilli, proFreire, proTecnos, proDBSeller]) then
     begin
       Result := FConsSitLoteRPS.Executar;

       if not (Result) then
         FConsSitLoteRPS.GerarException( FConsSitLoteRPS.Msg );
     end;

     if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor = proInfisc then
       Result := True
     else
       Result := FConsLote.Executar;

     if not (Result) then
       FConsLote.GerarException( FConsLote.Msg );
  end;
end;

function TWebServices.EnviaSincrono(ALote: Integer): Boolean;
begin
  Result := EnviaSincrono(IntToStr(ALote));
end;

function TWebServices.EnviaSincrono(ALote: String): Boolean;
begin
  FEnviarSincrono.FNumeroLote := ALote;

  Result := FEnviarSincrono.Executar;

  if not (Result) then
    FEnviarSincrono.GerarException( FEnviarSincrono.Msg );
end;

function TWebServices.Gera(ARps: Integer): Boolean;
begin
 FGerarNfse.FNumeroRps := ARps;

 Result := FGerarNfse.Executar;

 if not (Result) then
   FGerarNfse.GerarException( FGerarNfse.Msg );
end;

function TWebServices.ConsultaSituacao(ACNPJ, AInscMun, AProtocolo: String;
  const ANumLote: String): Boolean;
begin
  FConsSitLoteRPS.FCNPJ       := ACNPJ;
  FConsSitLoteRPS.FInscMun    := AInscMun;
  FConsSitLoteRPS.FProtocolo  := AProtocolo;
  FConsSitLoteRPS.FNumeroLote := ANumLote;

  Result := FConsSitLoteRPS.Executar;

  if not (Result) then
   FConsSitLoteRPS.GerarException( FConsSitLoteRPS.Msg );
end;

function TWebServices.ConsultaLoteRps(ANumLote, AProtocolo: String;
  const CarregaProps: boolean): Boolean;
begin
(*
  if CarregaProps then
  begin
     FConsLote.FCNPJ := '';
     FConsLote.FIM   := '';
  end;

  FConsLote.FNumeroLote := ANumLote;
  FConsLote.FProtocolo := AProtocolo;

  Result := FConsLote.Executar;

  if not (Result) then
    FConsLote.GerarException( FConsLote.Msg );
*)
end;

function TWebServices.ConsultaLoteRps(ANumLote, AProtocolo, ACNPJ, AInscMun: String;
  const ASenha, AFraseSecreta, ARazaoSocial: String): Boolean;
begin
  FConsLote.FNumeroLote   := ANumLote;
  FConsLote.FProtocolo    := AProtocolo;
  FConsLote.FCNPJ         := ACNPJ;
  FConsLote.FInscMun      := AInscMun;
  FConsLote.FSenha        := ASenha;
  FConsLote.FFraseSecreta := AFraseSecreta;
  FConsLote.FRazaoSocial  := ARazaoSocial;

  Result := FConsLote.Executar;

  if not (Result) then
    FConsLote.GerarException( FConsLote.Msg );

//  Result := ConsultaLoteRPS(ANumLote, AProtocolo, False);
end;

function TWebServices.ConsultaNFSeporRps(ANumero, ASerie, ATipo, ACNPJ, AInscMun: String;
  const ASenha, AFraseSecreta, ARazaoSocial: String): Boolean;
begin
  FConsNfseRps.FNumero       := ANumero;
  FConsNfseRps.FSerie        := ASerie;
  FConsNfseRps.FTipo         := ATipo;
  FConsNfseRps.FCNPJ         := ACNPJ;
  FConsNfseRps.FInscMun      := AInscMun;
  FConsNfseRps.FSenha        := ASenha;
  FConsNfseRps.FFraseSecreta := AFraseSecreta;
  FConsNfseRps.FRazaoSocial  := ARazaoSocial;

  Result := FConsNfseRps.Executar;

  if not (Result) then
    FConsNfseRps.GerarException( FConsNfseRps.Msg );
end;

function TWebServices.ConsultaNFSe(ACNPJ, AInscMun: String;
  ADataInicial, ADataFinal: TDateTime; NumeroNFSe: String;
  APagina: Integer; const ASenha, AFraseSecreta: String; ACNPJTomador,
  AIMTomador, ANomeInter, ACNPJInter, AIMInter, ASerie: String): Boolean;
begin
  FConsNfse.FCNPJ         := ACNPJ;
  FConsNfse.FInscMun      := AInscMun;
  FConsNfse.FDataInicial  := ADataInicial;
  FConsNfse.FDataFinal    := ADataFinal;
  FConsNfse.FNumeroNFSe   := NumeroNFSe;
  FConsNfse.FPagina       := APagina;
  FConsNfse.FSenha        := ASenha;
  FConsNfse.FFraseSecreta := AFraseSecreta;
  FConsNfse.FCNPJTomador  := ACNPJTomador;
  FConsNfse.FIMTomador    := AIMTomador;
  FConsNfse.FNomeInter    := ANomeInter;
  FConsNfse.FCNPJInter    := ACNPJInter;
  FConsNfse.FIMInter      := AIMInter;
  FConsNfse.FSerie        := ASerie;

  Result := FConsNfse.Executar;

  if not (Result) then
    FConsNfse.GerarException( FConsNfse.Msg );
end;

function TWebServices.CancelaNFSe(ACodigoCancelamento: String): Boolean;
begin
(*
  if CarregaProps then
  begin
    FCancNfse.FNumeroNFSe      := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Numero;
    FCancNfse.FCNPJ            := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ;
    FCancNfse.FInscMun         := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;
    FCancNfse.FCodigoMunicipio := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio;
//    FCancNfse.FNumeroNFSe := '';
//    FCancNfse.FCNPJ := '';
//    FCancNfse.FIM := '';
//    FCancNfse.FCodigoMunicipio := '';
  end;

  if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor = proEL then
  begin
    FCancNfse.FNumeroNFSe      := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Numero;
    FCancNfse.FCNPJ            := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ;
    FCancNfse.FInscMun         := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;
    FCancNfse.FCodigoMunicipio := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio;
  end;
*)
  FCancNfse.FCodigoCancelamento := ACodigoCancelamento;

  Result := FCancNfse.Executar;

  if not (Result) then
    FCancNfse.GerarException( FCancNfse.Msg );

  if not (TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proISSNet, proEL]) then
  begin
    if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proSystemPro] then
    begin
      FConsNfse.FNumeroNFSe := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Numero;
      FConsNfse.FCNPJ       := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ;
      FConsNfse.FInscMun    := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;

      Result := FConsNfse.Executar;
    end
    else begin
      FConsNfseRps.FNumero := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero;
      FConsNfseRps.FSerie  := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.IdentificacaoRps.Serie;
      FConsNfseRps.FTipo   := TipoRPSToStr(TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.IdentificacaoRps.Tipo);
      FConsNfseRps.FCNPJ   := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.CNPJ;

      if FConsNfseRps.CNPJ = '' then
        FConsNfseRps.FCNPJ := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ;

      FConsNfseRps.FInscMun := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal;

      if FConsNfseRps.InscMun = '' then
        FConsNfseRps.FInscMun := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;

      FConsNfseRps.RazaoSocial := '';

      if not (TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proDigifred]) then
        FConsNfseRps.FRazaoSocial := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.RazaoSocial;

      Result := FConsNfseRps.Executar;
    end;

    if not(Result) then
      FConsNfseRps.GerarException( FConsNfseRps.Msg );
  end;
end;

function TWebServices.CancelaNFSe(ACodigoCancelamento, ANumeroNFSe, ACNPJ,
  AInscMun, ACodigoMunicipio, AMotivoCancelamento: String): Boolean;
begin
  FCancNfse.FNumeroNFSe         := ANumeroNFSe;
  FCancNfse.FCNPJ               := ACNPJ;
  FCancNfse.FInscMun            := AInscMun;
  FCancNfse.FCodigoMunicipio    := ACodigoMunicipio;
  FCancNfse.FMotivoCancelamento := AMotivoCancelamento;
  (*
  if (FCancNfse.FNumeroNFSe = '') then
    FCancNfse.FNumeroNFSe := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Numero;

  if (FCancNfse.FCNPJ = '') then
  begin
    if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proDigifred, pro4R] then
     FCancNfse.FCNPJ := OnlyNumber(TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.CNPJ)
    else
     FCancNfse.FCNPJ := OnlyNumber(TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ);
  end;

  if (FCancNfse.FInscMun = '') then
  begin
   if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proDigifred, pro4R] then
     FCancNfse.FInscMun := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal
   else
     FCancNfse.FInscMun := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;
  end;

  if (FCancNfse.MotivoCancelamento = '') then
    FCancNfse.MotivoCancelamento:= TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.MotivoCancelamento;

  if (FCancNfse.FCodigoMunicipio = '') then
  begin
   if (TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor = proISSNet) and
      (TACBrNFSe(FACBrNFSe).Configuracoes.WebServices.AmbienteCodigo = 2) then
    FCancNfse.FCodigoMunicipio := '999'
   else
   begin
     if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor = proFiorilli then
       FCancNfse.FCodigoMunicipio := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Servico.CodigoMunicipio
     else
       FCancNfse.FCodigoMunicipio := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio;
   end;
  end;
  *)
  Result := CancelaNFSe(ACodigoCancelamento);
end;

function TWebServices.SubstituiNFSe(ACodigoCancelamento, ANumeroNFSe: String): Boolean;
begin
  FSubNfse.FNumeroNFSe         := ANumeroNFSe;
  FSubNfse.FCodigoCancelamento := ACodigoCancelamento;
  FSubNfse.FMotivoCancelamento := '';

  if TACBrNFSe(FACBrNFSe).NotasFiscais.Count <=0 then
    FConsNfseRps.GerarException( 'ERRO: Nenhum RPS adicionado ao Lote' )
  else begin
    FSubNfse.FCNPJ            := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.CNPJ;
    FSubNfse.FInscMun         := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal;
    FSubNfse.FCodigoMunicipio := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Servico.CodigoMunicipio;
    FSubNfse.FNumeroRps       := StrToInt(TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.IdentificacaoRps.Numero);

    if (FSubNfse.FCNPJ = '') then
    begin
      if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proDigifred, pro4R] then
       FSubNfse.FCNPJ := OnlyNumber(TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.CNPJ)
      else
       FSubNfse.FCNPJ := OnlyNumber(TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.CNPJ);
    end;

    if (FSubNfse.FInscMun = '') then
    begin
     if TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor in [proDigifred, pro4R] then
       FSubNfse.FInscMun := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.Prestador.InscricaoMunicipal
     else
       FSubNfse.FInscMun := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.IdentificacaoPrestador.InscricaoMunicipal;
    end;

    if (FSubNfse.MotivoCancelamento = '') then
      FSubNfse.MotivoCancelamento := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.MotivoCancelamento;

    if (FSubNfse.FCodigoMunicipio = '') then
    begin
     if (TACBrNFSe(FACBrNFSe).Configuracoes.Geral.Provedor = proISSNet) and
        (TACBrNFSe(FACBrNFSe).Configuracoes.WebServices.AmbienteCodigo = 2) then
      FSubNfse.FCodigoMunicipio := '999'
     else
      FSubNfse.FCodigoMunicipio := TACBrNFSe(FACBrNFSe).NotasFiscais.Items[0].NFSe.PrestadorServico.Endereco.CodigoMunicipio;
    end;

    Result := FSubNfse.Executar;

    if not (Result) then
      FSubNfse.GerarException( FSubNfse.Msg );
  end;
end;
(*
function TWebServices.LinkNFSeGerada(ANumeroNFSe: Integer; ACodVerificacao,
  AInscricaoM: String): String;
begin
  FLinkNfse.FNumeroNFSe := ANumeroNFSe;
  FLinkNFSe.FCodVerif   := ACodVerificacao;
  FLinkNfse.FIM         := AInscricaoM;

  Result := '';

  if not (FLinkNfse.Executar) then
    FLinkNfse.GerarException( FLinkNfse.Msg );

  Result := FLinkNFSe.FLink;
end;
*)
end.

