{$I ACBr.inc}

unit pcnCIOT;

interface

uses
  SysUtils, Classes, Contnrs,
{$IFNDEF VER130}
  Variants,
{$ENDIF}
  pcnConversao, pcnConversaoCIOT, ACBrUtil;

type

  TIntegradora = class(TObject)
  private
    FToken: string;
    FIntegrador: string;
    FSenha: string;
    FUsuario: string;

    FIntegradora: TCIOTIntegradora;
    FOperacao: TpOperacao;
  public

  published
    property Token: string read FToken write FToken;
    property Integrador: string read FIntegrador write FIntegrador;
    property Senha: string read FSenha write FSenha;
    property Usuario: string read FUsuario write FUsuario;

    property Integradora: TCIOTIntegradora read FIntegradora write FIntegradora;
    property Operacao: TpOperacao read FOperacao write FOperacao;
  end;

  TTelefone = class(TObject)
  private
    FDDD: integer;
    FNumero: integer;
  public

  published
    property DDD: integer read FDDD write FDDD;
    property Numero: integer read FNumero write FNumero;
  end;

  TTelefones = class(TObject)
  private
    FCelular: TTelefone;
    FFixo: TTelefone;
    FFax: TTelefone;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Celular: TTelefone read FCelular write FCelular;
    property Fixo: TTelefone read FFixo write FFixo;
    property Fax: TTelefone read FFax write FFax;
  end;

  TEndereco = class(TObject)
  private
    FRua: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCodigoMunicipio: Integer;
    FxMunicipio: String;
    FCEP: string;

    procedure SetCEP(const Value: string);
  public

  published
    property Rua: String read FRua    write FRua;
    property Numero: String read FNumero     write FNumero;
    property Complemento: String read FComplemento    write FComplemento;
    property Bairro: String read FBairro write FBairro;
    property CodigoMunicipio: Integer read FCodigoMunicipio    write FCodigoMunicipio;
    property xMunicipio: String read FxMunicipio    write FxMunicipio;
    property CEP: string read FCEP     write SetCEP;
  end;

  TContratante = class(TObject)
  private
    FNomeOuRazaoSocial: string;
    FCpfOuCnpj: string;
    FEndereco: TEndereco;
    FEMail: string;
    FTelefones: TTelefones;
    FResponsavelPeloPagamento: Boolean;
    FRNTRC: string;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property NomeOuRazaoSocial: string read FNomeOuRazaoSocial write FNomeOuRazaoSocial;
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property EMail: string read FEMail write FEMail;
    property Telefones: TTelefones read FTelefones write FTelefones;
    property ResponsavelPeloPagamento: Boolean read FResponsavelPeloPagamento write FResponsavelPeloPagamento;
    property RNTRC: string read FRNTRC write FRNTRC;
  end;

  TOptMotorista = class(TObject)
  private
    FCpfOuCnpj: string;
    FCNH: string;
    FCelular: TTelefone;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property CNH: string read FCNH write FCNH;
    property Celular: TTelefone read FCelular write FCelular;
  end;

  TDestinatario = class(TObject)
  private
    FNomeOuRazaoSocial: string;
    FCpfOuCnpj: string;
    FEndereco: TEndereco;
    FEMail: string;
    FTelefones: TTelefones;
    FResponsavelPeloPagamento: Boolean;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property NomeOuRazaoSocial: string read FNomeOuRazaoSocial write FNomeOuRazaoSocial;
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property EMail: string read FEMail write FEMail;
    property Telefones: TTelefones read FTelefones write FTelefones;
    property ResponsavelPeloPagamento: Boolean read FResponsavelPeloPagamento write FResponsavelPeloPagamento;
  end;

  TContratado = class(TObject)
  private
    FCpfOuCnpj: string;
    FRNTRC: string;

    procedure SetCpfOuCnpj(const Value: string);
  public

  published
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property RNTRC: string read FRNTRC write FRNTRC;
  end;

  TConsignatario = class(TObject)
  private
    FNomeOuRazaoSocial: string;
    FCpfOuCnpj: string;
    FEndereco: TEndereco;
    FEMail: string;
    FTelefones: TTelefones;
    FResponsavelPeloPagamento: Boolean;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property NomeOuRazaoSocial: string read FNomeOuRazaoSocial write FNomeOuRazaoSocial;
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property EMail: string read FEMail write FEMail;
    property Telefones: TTelefones read FTelefones write FTelefones;
    property ResponsavelPeloPagamento: Boolean read FResponsavelPeloPagamento write FResponsavelPeloPagamento;
  end;

  TInformacoesBancarias = class(TObject)
  private
    FInstituicaoBancaria: string;
    FAgencia: string;
    FConta: string;
    FTipoConta: tpTipoConta;
  public

  published
    property InstituicaoBancaria: string read FInstituicaoBancaria write FInstituicaoBancaria;
    property Agencia: string read FAgencia write FAgencia;
    property Conta: string read FConta write FConta;
    property TipoConta: tpTipoConta read FTipoConta write FTipoConta;
  end;

  TPagamentoCollectionItem = class(TObject)
  private
    FIdPagamentoCliente: string;
    FDataDeLiberacao: TDateTime;
    FValor: Double;
    FTipoPagamento: TpTipoPagamento;
    FCategoria: TpTipoCategoriaPagamento;
    FDocumento: string;
    FInformacoesBancarias: TInformacoesBancarias;
    FInformacaoAdicional: string;
    FCnpjFilialAbastecimento: string;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property IdPagamentoCliente: string read FIdPagamentoCliente write FIdPagamentoCliente;
    property DataDeLiberacao: TDateTime read FDataDeLiberacao write FDataDeLiberacao;
    property Valor: Double read FValor write FValor;
    property TipoPagamento: TpTipoPagamento read FTipoPagamento write FTipoPagamento;
    property Categoria: TpTipoCategoriaPagamento read FCategoria write FCategoria;
    property Documento: string read FDocumento write FDocumento;
    property InformacoesBancarias: TInformacoesBancarias read FInformacoesBancarias write FInformacoesBancarias;
    property InformacaoAdicional: string read FInformacaoAdicional write FInformacaoAdicional;
    property CnpjFilialAbastecimento: string read FCnpjFilialAbastecimento write FCnpjFilialAbastecimento;
  end;

  TPagamentoCollection = class(TObjectList)
  private
    function GetItem(Index: Integer): TPagamentoCollectionItem;
    procedure SetItem(Index: Integer; Value: TPagamentoCollectionItem);
  public
    function Add: TPagamentoCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TPagamentoCollectionItem;
    property Items[Index: Integer]: TPagamentoCollectionItem read GetItem write SetItem; default;
  end;

  TVeiculoCollectionItem = class(TObject)
  private
    FPlaca: String;

    procedure SetPlaca(const Value: String);
  public
  published
    property Placa: String read FPlaca write SetPlaca;
  end;

  TVeiculoCollection = class(TObjectList)
  private
    function GetItem(Index: Integer): TVeiculoCollectionItem;
    procedure SetItem(Index: Integer; Value: TVeiculoCollectionItem);
  public
    function Add: TVeiculoCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TVeiculoCollectionItem;
    property Items[Index: Integer]: TVeiculoCollectionItem read GetItem write SetItem; default;
  end;

  TImpostos = class(TObject)
  private
    FIRRF: Double;
    FSestSenat: Double;
    FINSS: Double;
    FISSQN: Double;
    FOutrosImpostos: Double;
    FDescricaoOutrosImpostos: string;
  public

  published
    property IRRF: Double read FIRRF write FIRRF;
    property SestSenat: Double read FSestSenat write FSestSenat;
    property INSS: Double read FINSS write FINSS;
    property ISSQN: Double read FISSQN write FISSQN;
    property OutrosImpostos: Double read FOutrosImpostos write FOutrosImpostos;
    property DescricaoOutrosImpostos: string read FDescricaoOutrosImpostos write FDescricaoOutrosImpostos;
  end;

  TValoresOT = class(TObject)
  private
    FTotalOperacao: Double;
    FTotalViagem: Double;
    FTotalDeAdiantamento: Double;
    FTotalDeQuitacao: Double;
    FCombustivel: Double;
    FPedagio: Double;
    FOutrosCreditos: Double;
    FJustificativaOutrosCreditos: string;
    FSeguro: Double;
    FOutrosDebitos: Double;
    FJustificativaOutrosDebitos: string;
  public

  published
    property TotalOperacao: Double read FTotalOperacao write FTotalOperacao;
    property TotalViagem: Double read FTotalViagem write FTotalViagem;
    property TotalDeAdiantamento: Double read FTotalDeAdiantamento write FTotalDeAdiantamento;
    property TotalDeQuitacao: Double read FTotalDeQuitacao write FTotalDeQuitacao;
    property Combustivel: Double read FCombustivel write FCombustivel;
    property Pedagio: Double read FPedagio write FPedagio;
    property OutrosCreditos: Double read FOutrosCreditos write FOutrosCreditos;
    property JustificativaOutrosCreditos: string read FJustificativaOutrosCreditos write FJustificativaOutrosCreditos;
    property Seguro: Double read FSeguro write FSeguro;
    property OutrosDebitos: Double read FOutrosDebitos write FOutrosDebitos;
    property JustificativaOutrosDebitos: string read FJustificativaOutrosDebitos write FJustificativaOutrosDebitos;
  end;

  TToleranciaDePerdaDeMercadoria = class(TObject)
  private
    FTipo: TpTipoProporcao;
    FValor: Double;
  public

  published
    property Tipo: TpTipoProporcao read FTipo write FTipo;
    property Valor: Double read FValor write FValor;
  end;

  TDiferencaFreteMargem = class(TObject)
  private
    FTipo: TpTipoProporcao;
    FValor: Double;
  public

  published
    property Tipo: TpTipoProporcao read FTipo write FTipo;
    property Valor: Double read FValor write FValor;
  end;

   TDiferencaDeFrete = class(TObject)
  private
    FTipo: TpDiferencaFreteTipo;
    FBase: TpDiferencaFreteBaseCalculo;
    FTolerancia: TDiferencaFreteMargem;
    FMargemGanho: TDiferencaFreteMargem;
    FMargemPerda: TDiferencaFreteMargem;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Tipo: TpDiferencaFreteTipo read FTipo write FTipo;
    property Base: TpDiferencaFreteBaseCalculo read FBase write FBase;
    property Tolerancia: TDiferencaFreteMargem read FTolerancia write FTolerancia;
    property MargemGanho: TDiferencaFreteMargem read FMargemGanho write FMargemGanho;
    property MargemPerda: TDiferencaFreteMargem read FMargemPerda write FMargemPerda;
  end;

 TNotaFiscalCollectionItem = class(TObject)
  private
    FNumero: string;
    FSerie: string;
    FData: TDateTime;
    FValorTotal: Double;
    FValorDaMercadoriaPorUnidade: Double;
    FCodigoNCMNaturezaCarga: integer;
    FDescricaoDaMercadoria: string;
    FUnidadeDeMedidaDaMercadoria: TpUnidadeDeMedidaDaMercadoria;
    FTipoDeCalculo: TpViagemTipoDeCalculo;
    FValorDoFretePorUnidadeDeMercadoria: Double;
    FQuantidadeDaMercadoriaNoEmbarque: double;
    FQuantidadeDaMercadoriaNoDesembarque: double;
    FToleranciaDePerdaDeMercadoria: TToleranciaDePerdaDeMercadoria;
    FDiferencaDeFrete: TDiferencaDeFrete;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Numero: string read FNumero write FNumero;
    property Serie: string read FSerie write FSerie;
    property Data: TDateTime read FData write FData;
    property ValorTotal: Double read FValorTotal write FValorTotal;
    property ValorDaMercadoriaPorUnidade: Double read FValorDaMercadoriaPorUnidade write FValorDaMercadoriaPorUnidade;
    property CodigoNCMNaturezaCarga: integer read FCodigoNCMNaturezaCarga write FCodigoNCMNaturezaCarga;
    property DescricaoDaMercadoria: string read FDescricaoDaMercadoria write FDescricaoDaMercadoria;
    property UnidadeDeMedidaDaMercadoria: TpUnidadeDeMedidaDaMercadoria read FUnidadeDeMedidaDaMercadoria write FUnidadeDeMedidaDaMercadoria;
    property TipoDeCalculo: TpViagemTipoDeCalculo read FTipoDeCalculo write FTipoDeCalculo;
    property ValorDoFretePorUnidadeDeMercadoria: Double read FValorDoFretePorUnidadeDeMercadoria write FValorDoFretePorUnidadeDeMercadoria;
    property QuantidadeDaMercadoriaNoEmbarque: double read FQuantidadeDaMercadoriaNoEmbarque write FQuantidadeDaMercadoriaNoEmbarque;
    property QuantidadeDaMercadoriaNoDesembarque: double read FQuantidadeDaMercadoriaNoDesembarque write FQuantidadeDaMercadoriaNoDesembarque;
    property ToleranciaDePerdaDeMercadoria: TToleranciaDePerdaDeMercadoria read FToleranciaDePerdaDeMercadoria write FToleranciaDePerdaDeMercadoria;
    property DiferencaDeFrete: TDiferencaDeFrete read FDiferencaDeFrete write FDiferencaDeFrete;
  end;

  TNotaFiscalCollection = class(TObjectList)
  private
    function GetItem(Index: Integer): TNotaFiscalCollectionItem;
    procedure SetItem(Index: Integer; Value: TNotaFiscalCollectionItem);
  public
    function Add: TNotaFiscalCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TNotaFiscalCollectionItem;
    property Items[Index: Integer]: TNotaFiscalCollectionItem read GetItem write SetItem; default;
  end;

  TViagemCollectionItem = class(TObject)
  private
    FDocumentoViagem: string;
    FCodigoMunicipioOrigem: integer;
    FCodigoMunicipioDestino: integer;
    FCepOrigem: string;
    FCepDestino: string;
    FDistanciaPercorrida: Integer;
    FValores: TValoresOT;
    FTipoPagamento: TpTipoPagamento;
    FInformacoesBancarias: TInformacoesBancarias;
    FNotasFiscais: TNotaFiscalCollection;

    procedure SetNotasFiscais(const Value: TNotaFiscalCollection);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property DocumentoViagem: string read FDocumentoViagem write FDocumentoViagem;
    property CodigoMunicipioOrigem: integer read FCodigoMunicipioOrigem write FCodigoMunicipioOrigem;
    property CodigoMunicipioDestino: integer read FCodigoMunicipioDestino write FCodigoMunicipioDestino;
    property CepOrigem: string read FCepOrigem write FCepOrigem;
    property CepDestino: string read FCepDestino write FCepDestino;
    property DistanciaPercorrida: Integer read FDistanciaPercorrida write FDistanciaPercorrida;
    property Valores: TValoresOT read FValores write FValores;
    property TipoPagamento: TpTipoPagamento read FTipoPagamento write FTipoPagamento;
    property InformacoesBancarias: TInformacoesBancarias read FInformacoesBancarias write FInformacoesBancarias;
    property NotasFiscais: TNotaFiscalCollection read FNotasFiscais write SetNotasFiscais;
  end;

  TViagemCollection = class(TObjectList)
  private
    function GetItem(Index: Integer): TViagemCollectionItem;
    procedure SetItem(Index: Integer; Value: TViagemCollectionItem);
  public
    function Add: TViagemCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TViagemCollectionItem;
    property Items[Index: Integer]: TViagemCollectionItem read GetItem write SetItem; default;
  end;

  TSubcontratante = class(TObject)
  private
    FNomeOuRazaoSocial: string;
    FCpfOuCnpj: string;
    FEndereco: TEndereco;
    FEMail: string;
    FTelefones: TTelefones;
    FResponsavelPeloPagamento: Boolean;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property NomeOuRazaoSocial: string read FNomeOuRazaoSocial write FNomeOuRazaoSocial;
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property EMail: string read FEMail write FEMail;
    property Telefones: TTelefones read FTelefones write FTelefones;
    property ResponsavelPeloPagamento: Boolean read FResponsavelPeloPagamento write FResponsavelPeloPagamento;
  end;

  TTomadorServico = class(TObject)
  private
    FNomeOuRazaoSocial: string;
    FCpfOuCnpj: string;
    FEndereco: TEndereco;
    FEMail: string;
    FTelefones: TTelefones;
    FResponsavelPeloPagamento: Boolean;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property NomeOuRazaoSocial: string read FNomeOuRazaoSocial write FNomeOuRazaoSocial;
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property EMail: string read FEMail write FEMail;
    property Telefones: TTelefones read FTelefones write FTelefones;
    property ResponsavelPeloPagamento: Boolean read FResponsavelPeloPagamento write FResponsavelPeloPagamento;
  end;

  TRemetente = class(TObject)
  private
    FNomeOuRazaoSocial: string;
    FCpfOuCnpj: string;
    FEndereco: TEndereco;
    FEMail: string;
    FTelefones: TTelefones;
    FResponsavelPeloPagamento: Boolean;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property NomeOuRazaoSocial: string read FNomeOuRazaoSocial write FNomeOuRazaoSocial;
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property EMail: string read FEMail write FEMail;
    property Telefones: TTelefones read FTelefones write FTelefones;
    property ResponsavelPeloPagamento: Boolean read FResponsavelPeloPagamento write FResponsavelPeloPagamento;
  end;

  TProprietarioCarga = class(TObject)
  private
    FNomeOuRazaoSocial: string;
    FCpfOuCnpj: string;
    FEndereco: TEndereco;
    FEMail: string;
    FTelefones: TTelefones;
    FResponsavelPeloPagamento: Boolean;

    procedure SetCpfOuCnpj(const Value: string);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property NomeOuRazaoSocial: string read FNomeOuRazaoSocial write FNomeOuRazaoSocial;
    property CpfOuCnpj: string read FCpfOuCnpj write SetCpfOuCnpj;
    property Endereco: TEndereco read FEndereco write FEndereco;
    property EMail: string read FEMail write FEMail;
    property Telefones: TTelefones read FTelefones write FTelefones;
    property ResponsavelPeloPagamento: Boolean read FResponsavelPeloPagamento write FResponsavelPeloPagamento;
  end;

  TCancelamento = class(TObject)
  private
    FMotivo: string;
    FProtocolo: string;
    FData: TDateTime;
    FIdPagamentoCliente: string;
  public

  published
    property Motivo: string read FMotivo write FMotivo;
    property Data: TDateTime read FData write FData;
    property Protocolo: string read FProtocolo write FProtocolo;
    property IdPagamentoCliente: string read FIdPagamentoCliente write FIdPagamentoCliente;
  end;

  TAdicionarOperacao = class(TObject)
  private
    FTipoViagem: TpTipoViagem;
    FTipoPagamento: TpTipoPagamento;
    FBloquearNaoEquiparado: Boolean;
    FMatrizCNPJ: string;
    FFilialCNPJ: string;
    FIdOperacaoCliente: string;
    FDataInicioViagem: TDateTime;
    FDataFimViagem: TDateTime;
    FCodigoNCMNaturezaCarga: integer;
    FPesoCarga: double;
    FTipoEmbalagem: tpTipoEmbalagem;
    FViagens: TViagemCollection;
    FImpostos: TImpostos;
    FPagamentos: TPagamentoCollection;
    FContratado: TContratado;
    FMotorista: TOptMotorista;
    FDestinatario: TDestinatario;
    FContratante: TContratante;
    FSubcontratante: TSubcontratante;
    FConsignatario: TConsignatario;
    FTomadorServico: TTomadorServico;
    FRemetente: TRemetente;
    FProprietarioCarga: TProprietarioCarga;
    FVeiculos: TVeiculoCollection;
    FCodigoIdentificacaoOperacaoPrincipal: string;
    FObservacoesAoTransportador: string;
    FObservacoesAoCredenciado: string;
    FEntregaDocumentacao: TpEntregaDocumentacao;
    FQuantidadeSaques: Integer;
    FQuantidadeTransferencias: Integer;
    FValorSaques: Double;
    FValorTransferencias: Double;
    FCodigoTipoCarga: Integer;
    FAltoDesempenho: Boolean;
    FDestinacaoComercial: Boolean;
    FFreteRetorno: Boolean;
    FCepRetorno: String;
    FDistanciaRetorno: Integer;

    FIntegrador: string;

    procedure SetFilialCNPJ(const Value: string);
    procedure SetMatrizCNPJ(const Value: string);
    procedure SetViagens(const Value: TViagemCollection);
    procedure SetPagamentos(const Value: TPagamentoCollection);
    procedure SetVeiculos(const Value: TVeiculoCollection);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property TipoViagem: TpTipoViagem read FTipoViagem write FTipoViagem;
    property TipoPagamento: TpTipoPagamento read FTipoPagamento write FTipoPagamento;
    property BloquearNaoEquiparado: Boolean read FBloquearNaoEquiparado write FBloquearNaoEquiparado;
    property MatrizCNPJ: string read FMatrizCNPJ write SetMatrizCNPJ;
    property FilialCNPJ: string read FFilialCNPJ write SetFilialCNPJ;
    property IdOperacaoCliente: string read FIdOperacaoCliente write FIdOperacaoCliente;
    property DataInicioViagem: TDateTime read FDataInicioViagem write FDataInicioViagem;
    property DataFimViagem: TDateTime read FDataFimViagem write FDataFimViagem;
    property CodigoNCMNaturezaCarga: integer read FCodigoNCMNaturezaCarga write FCodigoNCMNaturezaCarga;
    property PesoCarga: double read FPesoCarga write FPesoCarga;
    property TipoEmbalagem: tpTipoEmbalagem read FTipoEmbalagem write FTipoEmbalagem;
    property Viagens: TViagemCollection read FViagens write SetViagens;
    property Impostos: TImpostos read FImpostos write FImpostos;
    property Pagamentos: TPagamentoCollection read FPagamentos write SetPagamentos;
    property Contratado: TContratado read FContratado write FContratado;
    property Motorista: TOptMotorista read FMotorista write FMotorista;
    property Destinatario: TDestinatario read FDestinatario write FDestinatario;
    property Contratante: TContratante read FContratante write FContratante;
    property Subcontratante: TSubcontratante read FSubcontratante write FSubcontratante;
    property Consignatario: TConsignatario read FConsignatario write FConsignatario;
    property TomadorServico: TTomadorServico read FTomadorServico write FTomadorServico;
    property Remetente: TRemetente read FRemetente write FRemetente;
    property ProprietarioCarga: TProprietarioCarga read FProprietarioCarga write FProprietarioCarga;
    property Veiculos: TVeiculoCollection read FVeiculos write SetVeiculos;
    property CodigoIdentificacaoOperacaoPrincipal: string read FCodigoIdentificacaoOperacaoPrincipal write FCodigoIdentificacaoOperacaoPrincipal;
    property ObservacoesAoTransportador: string read FObservacoesAoTransportador write FObservacoesAoTransportador;
    property ObservacoesAoCredenciado: string read FObservacoesAoCredenciado write FObservacoesAoCredenciado;
    property EntregaDocumentacao: TpEntregaDocumentacao read FEntregaDocumentacao write FEntregaDocumentacao;
    property QuantidadeSaques: Integer read FQuantidadeSaques write FQuantidadeSaques;
    property QuantidadeTransferencias: Integer read FQuantidadeTransferencias write FQuantidadeTransferencias;
    property ValorSaques: Double read FValorSaques write FValorSaques;
    property ValorTransferencias: Double read FValorTransferencias write FValorTransferencias;
    property CodigoTipoCarga: Integer read FCodigoTipoCarga write FCodigoTipoCarga;
    property AltoDesempenho: Boolean read FAltoDesempenho write FAltoDesempenho;
    property DestinacaoComercial: Boolean read FDestinacaoComercial write FDestinacaoComercial;
    property FreteRetorno: Boolean read FFreteRetorno write FFreteRetorno;
    property CepRetorno: String read FCepRetorno write FCepRetorno;
    property DistanciaRetorno: Integer read FDistanciaRetorno write FDistanciaRetorno;

    property Integrador: string read FIntegrador write FIntegrador;
  end;

  TObterOperacaoTransportePDF = class(TObject)
  private
    FCodigoIdentificacaoOperacao: string;
    FDocumentoViagem: string;
  public

  published
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property DocumentoViagem: string read FDocumentoViagem write FDocumentoViagem;
  end;

  TRetificarOperacao = class(TObject)
  private
    FCodigoIdentificacaoOperacao: string;
    FDataInicioViagem: TDateTime;
    FDataFimViagem: TDateTime;
    FCodigoNCMNaturezaCarga: integer;
    FPesoCarga: double;
    FCodigoMunicipioOrigem: integer;
    FCodigoMunicipioDestino: integer;
    FVeiculos: TVeiculoCollection;
    FQuantidadeSaques: Integer;
    FQuantidadeTransferencias: Integer;
    FValorSaques: Double;
    FValorTransferencias: Double;
    FCodigoTipoCarga: Integer;
    FCepOrigem: string;
    FCepDestino: string;
    FDistanciaPercorrida: Integer;

    procedure SetVeiculos(const Value: TVeiculoCollection);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property DataInicioViagem: TDateTime read FDataInicioViagem write FDataInicioViagem;
    property DataFimViagem: TDateTime read FDataFimViagem write FDataFimViagem;
    property CodigoNCMNaturezaCarga: integer read FCodigoNCMNaturezaCarga write FCodigoNCMNaturezaCarga;
    property PesoCarga: double read FPesoCarga write FPesoCarga;
    property CodigoMunicipioOrigem: integer read FCodigoMunicipioOrigem write FCodigoMunicipioOrigem;
    property CodigoMunicipioDestino: integer read FCodigoMunicipioDestino write FCodigoMunicipioDestino;
    property Veiculos: TVeiculoCollection read FVeiculos write SetVeiculos;
    property QuantidadeSaques: Integer read FQuantidadeSaques write FQuantidadeSaques;
    property QuantidadeTransferencias: Integer read FQuantidadeTransferencias write FQuantidadeTransferencias;
    property ValorSaques: Double read FValorSaques write FValorSaques;
    property ValorTransferencias: Double read FValorTransferencias write FValorTransferencias;
    property CodigoTipoCarga: Integer read FCodigoTipoCarga write FCodigoTipoCarga;
    property CepOrigem: string read FCepOrigem write FCepOrigem;
    property CepDestino: string read FCepDestino write FCepDestino;
    property DistanciaPercorrida: Integer read FDistanciaPercorrida write FDistanciaPercorrida;
  end;

  TCancelarOperacao = class(TObject)
  private
    FCodigoIdentificacaoOperacao: string;
    FMotivo: string;
  public
  published
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property Motivo: string read FMotivo write FMotivo;
  end;

  TAdicionarViagem = class(TObject)
  private
    FCodigoIdentificacaoOperacao: string;
    FViagens: TViagemCollection;
    FPagamentos: TPagamentoCollection;
    FNaoAdicionarParcialmente: Boolean;

    procedure SetViagens(const Value: TViagemCollection);
    procedure SetPagamentos(const Value: TPagamentoCollection);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property Viagens: TViagemCollection read FViagens write SetViagens;
    property Pagamentos: TPagamentoCollection read FPagamentos write SetPagamentos;
    property NaoAdicionarParcialmente: Boolean read FNaoAdicionarParcialmente write FNaoAdicionarParcialmente;
  end;

  TAdicionarPagamento = class(TObject)
  private
    FCodigoIdentificacaoOperacao: string;
    FPagamentos: TPagamentoCollection;

    procedure SetPagamentos(const Value: TPagamentoCollection);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property Pagamentos: TPagamentoCollection read FPagamentos write SetPagamentos;
  end;

  TCancelarPagamento = class(TObject)
  private
    FCodigoIdentificacaoOperacao: string;
    FIdPagamentoCliente: string;
    FMotivo: string;
  public

  published
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property IdPagamentoCliente: string read FIdPagamentoCliente write FIdPagamentoCliente;
    property Motivo: string read FMotivo write FMotivo;
  end;

  TEncerrarOperacao = class(TObject)
  private
    FCodigoIdentificacaoOperacao: string;
    FPesoCarga: double;
    FViagens: TViagemCollection;
    FPagamentos: TPagamentoCollection;
    FImpostos: TImpostos;
    FQuantidadeSaques: Integer;
    FQuantidadeTransferencias: Integer;
    FValorSaques: Double;
    FValorTransferencias: Double;

    procedure SetViagens(const Value: TViagemCollection);
    procedure SetPagamentos(const Value: TPagamentoCollection);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property PesoCarga: double read FPesoCarga write FPesoCarga;
    property Viagens: TViagemCollection read FViagens write SetViagens;
    property Pagamentos: TPagamentoCollection read FPagamentos write SetPagamentos;
    property Impostos: TImpostos read FImpostos write FImpostos;
    property QuantidadeSaques: Integer read FQuantidadeSaques write FQuantidadeSaques;
    property QuantidadeTransferencias: Integer read FQuantidadeTransferencias write FQuantidadeTransferencias;
    property ValorSaques: Double read FValorSaques write FValorSaques;
    property ValorTransferencias: Double read FValorTransferencias write FValorTransferencias;
  end;

  TCIOT = class(TObject)
  private
    FIntegradora: TIntegradora;
    FAdicionarOperacao: TAdicionarOperacao;
    FObterOperacaoTransportePDF: TObterOperacaoTransportePDF;
    FRetificarOperacao: TRetificarOperacao;
    FCancelarOperacao: TCancelarOperacao;
    FAdicionarViagem: TAdicionarViagem;
    FAdicionarPagamento: TAdicionarPagamento;
    FCancelarPagamento: TCancelarPagamento;
    FEncerrarOperacao: TEncerrarOperacao;
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Integradora: TIntegradora read FIntegradora write FIntegradora;
    property AdicionarOperacao: TAdicionarOperacao read FAdicionarOperacao write FAdicionarOperacao;
    property ObterOperacaoTransportePDF: TObterOperacaoTransportePDF read FObterOperacaoTransportePDF write FObterOperacaoTransportePDF;
    property RetificarOperacao: TRetificarOperacao read FRetificarOperacao write FRetificarOperacao;
    property CancelarOperacao: TCancelarOperacao read FCancelarOperacao write FCancelarOperacao;
    property AdicionarViagem: TAdicionarViagem read FAdicionarViagem write FAdicionarViagem;
    property AdicionarPagamento: TAdicionarPagamento read FAdicionarPagamento write FAdicionarPagamento;
    property CancelarPagamento: TCancelarPagamento read FCancelarPagamento write FCancelarPagamento;
    property EncerrarOperacao: TEncerrarOperacao read FEncerrarOperacao write FEncerrarOperacao;
  end;

// ************* Retorno

  TMensagemCollectionItem = class(TObject)
  private
    FMensagem: string;
  public

  published
    property Mensagem: string read FMensagem write FMensagem;
  end;

  TMensagemCollection = class(TObjectList)
  private
    function GetItem(Index: Integer): TMensagemCollectionItem;
    procedure SetItem(Index: Integer; Value: TMensagemCollectionItem);
  public
    function Add: TMensagemCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TMensagemCollectionItem;
    property Items[Index: Integer]: TMensagemCollectionItem read GetItem write SetItem; default;
  end;

  TRetEnvio = class(TObject)
  private
    FMensagem: String;
    FCodigo: String;

    FVersao: Integer;
    FSucesso: String;
    FProtocoloServico: String;

    FPDF: String;
    FCodigoIdentificacaoOperacao: string;
    FDataRetificacao: TDateTime;
    FData: TDateTime;
    FProtocolo: String;
    FQuantidadeViagens: Integer;
    FQuantidadePagamentos: Integer;
    FDocumentoViagem: TMensagemCollection;
    FDocumentoPagamento: TMensagemCollection;
    FIdPagamentoCliente: string;

    procedure SetDocumentoViagem(const Value: TMensagemCollection);
    procedure SetDocumentoPagamento(const Value: TMensagemCollection);
  public
    constructor Create;
    destructor Destroy; override;
  published
    property Mensagem: String read FMensagem write FMensagem;
    property Codigo: String read FCodigo write FCodigo;

    property Versao: Integer read FVersao write FVersao;
    property Sucesso: String read FSucesso write FSucesso;
    property ProtocoloServico: String read FProtocoloServico write FProtocoloServico;

    property PDF: String read FPDF write FPDF;
    property CodigoIdentificacaoOperacao: string read FCodigoIdentificacaoOperacao write FCodigoIdentificacaoOperacao;
    property DataRetificacao: TDateTime read FDataRetificacao write FDataRetificacao;
    property Data: TDateTime read FData write FData;
    property Protocolo: String read FProtocolo write FProtocolo;
    property QuantidadeViagens: Integer read FQuantidadeViagens write FQuantidadeViagens;
    property QuantidadePagamentos: Integer read FQuantidadePagamentos write FQuantidadePagamentos;
    property DocumentoViagem: TMensagemCollection read FDocumentoViagem write SetDocumentoViagem;
    property DocumentoPagamento: TMensagemCollection read FDocumentoPagamento write SetDocumentoPagamento;
    property IdPagamentoCliente: string read FIdPagamentoCliente write FIdPagamentoCliente;
  end;

implementation

{ TCIOT }

constructor TCIOT.Create;
begin
  inherited Create;

  FIntegradora := TIntegradora.Create;
  FAdicionarOperacao := TAdicionarOperacao.Create;
  FObterOperacaoTransportePDF := TObterOperacaoTransportePDF.Create;
  FRetificarOperacao := TRetificarOperacao.Create;
  FCancelarOperacao := TCancelarOperacao.Create;
  FAdicionarViagem := TAdicionarViagem.Create;
  FAdicionarPagamento := TAdicionarPagamento.Create;
  FCancelarPagamento := TCancelarPagamento.Create;
  FEncerrarOperacao := TEncerrarOperacao.Create;
end;

destructor TCIOT.Destroy;
begin
  FIntegradora.Free;
  FAdicionarOperacao.Free;
  FObterOperacaoTransportePDF.Free;
  FRetificarOperacao.Free;
  FCancelarOperacao.Free;
  FAdicionarViagem.Free;
  FAdicionarPagamento.Free;
  FCancelarPagamento.Free;
  FEncerrarOperacao.Free;

  inherited Destroy;
end;

{ TAdicionarOperacao }

constructor TAdicionarOperacao.Create;
begin
  inherited Create;

  FViagens := TViagemCollection.Create;
  FImpostos := TImpostos.Create;
  FPagamentos := TPagamentoCollection.Create;
  FContratado := TContratado.Create;
  FMotorista := TOptMotorista.Create;
  FDestinatario := TDestinatario.Create;
  FContratante := TContratante.Create;
  FSubcontratante := TSubcontratante.Create;
  FConsignatario := TConsignatario.Create;
  FTomadorServico := TTomadorServico.Create;
  FRemetente := TRemetente.Create;
  FProprietarioCarga := TProprietarioCarga.Create;
  FVeiculos := TVeiculoCollection.Create;
end;

destructor TAdicionarOperacao.Destroy;
begin
  FViagens.Free;
  FImpostos.Free;
  FPagamentos.Free;
  FContratado.Free;
  FMotorista.Free;
  FDestinatario.Free;
  FContratante.Free;
  FSubcontratante.Free;
  FConsignatario.Free;
  FTomadorServico.Free;
  FRemetente.Free;
  FProprietarioCarga.Free;
  FVeiculos.Free;

  inherited Destroy;
end;

procedure TAdicionarOperacao.SetFilialCNPJ(const Value: string);
begin
  FFilialCNPJ := {SomenteNumeros(}Value{)};
end;

procedure TAdicionarOperacao.SetMatrizCNPJ(const Value: string);
begin
  FMatrizCNPJ := {SomenteNumeros(}Value{)};
end;

procedure TAdicionarOperacao.SetPagamentos(const Value: TPagamentoCollection);
begin
  FPagamentos := Value;
end;

procedure TAdicionarOperacao.SetVeiculos(const Value: TVeiculoCollection);
begin
  FVeiculos := Value;
end;

procedure TAdicionarOperacao.SetViagens(const Value: TViagemCollection);
begin
  FViagens := Value;
end;

{ TContratante }

constructor TContratante.Create;
begin
  inherited Create;

  FEndereco := TEndereco.Create;
  FTelefones := TTelefones.Create;
end;

destructor TContratante.Destroy;
begin
  FEndereco.Free;
  FTelefones.Free;

  inherited Destroy;
end;

procedure TContratante.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {omenteNumeros(}Value{)};
end;

{ TTelefones }

constructor TTelefones.Create;
begin
  inherited Create;

  FCelular := TTelefone.Create;
  FFixo := TTelefone.Create;
  FFax := TTelefone.Create;
end;

destructor TTelefones.Destroy;
begin
  FCelular.Free;
  FFixo.Free;
  FFax.Free;

  inherited Destroy;
end;

{ TEndereco }

procedure TEndereco.SetCEP(const Value: string);
begin
  FCEP := {SomenteNumeros(}Value{)};
end;

{ TOptMotorista }

constructor TOptMotorista.Create;
begin
  inherited Create;

  FCelular := TTelefone.Create;
end;

destructor TOptMotorista.Destroy;
begin
  FCelular.Free;

  inherited Destroy;
end;

procedure TOptMotorista.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {omenteNumeros(}Value{)};
end;

{ TDestinatario }

constructor TDestinatario.Create;
begin
  inherited Create;

  FEndereco := TEndereco.Create;
  FTelefones := TTelefones.Create;
end;

destructor TDestinatario.Destroy;
begin
  FEndereco.Free;
  FTelefones.Free;

  inherited Destroy;
end;

procedure TDestinatario.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {omenteNumeros(}Value{)};
end;

{ TContratado }

procedure TContratado.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {omenteNumeros(}Value{)};
end;

{ TConsignatario }

constructor TConsignatario.Create;
begin
  inherited Create;

  FEndereco := TEndereco.Create;
  FTelefones := TTelefones.Create;
end;

destructor TConsignatario.Destroy;
begin
  FEndereco.Free;
  FTelefones.Free;

  inherited Destroy;
end;

procedure TConsignatario.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {omenteNumeros(}Value{)};
end;

{ TPagamentoCollectionItem }

constructor TPagamentoCollectionItem.Create;
begin
  inherited Create;

  FInformacoesBancarias := TInformacoesBancarias.Create;
end;

destructor TPagamentoCollectionItem.Destroy;
begin
  FInformacoesBancarias.Free;

  inherited Destroy;
end;

{ TPagamentoCollection }

function TPagamentoCollection.Add: TPagamentoCollectionItem;
begin
  Result := Self.New;
end;

function TPagamentoCollection.GetItem(Index: Integer): TPagamentoCollectionItem;
begin
  Result := TPagamentoCollectionItem(inherited GetItem(Index));
end;

function TPagamentoCollection.New: TPagamentoCollectionItem;
begin
  Result := TPagamentoCollectionItem.Create;
  Self.Add(Result);
end;

procedure TPagamentoCollection.SetItem(Index: Integer;
  Value: TPagamentoCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TVeiculoCollectionItem }

procedure TVeiculoCollectionItem.SetPlaca(const Value: String);
begin
  FPlaca := RemoveStrings(Value, [' ', '-', '/', '\', '*', '_']);
end;

{ TVeiculoCollection }

function TVeiculoCollection.Add: TVeiculoCollectionItem;
begin
  Result := Self.New;
end;

function TVeiculoCollection.GetItem(Index: Integer): TVeiculoCollectionItem;
begin
  Result := TVeiculoCollectionItem(inherited GetItem(Index));
end;

function TVeiculoCollection.New: TVeiculoCollectionItem;
begin
  Result := TVeiculoCollectionItem.Create;
  Self.Add(Result);
end;

procedure TVeiculoCollection.SetItem(Index: Integer;
  Value: TVeiculoCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TViagemCollectionItem }

constructor TViagemCollectionItem.Create;
begin
  inherited Create;

  FTipoPagamento := TransferenciaBancaria;

  FValores := TValoresOT.Create;
  FNotasFiscais  := TNotaFiscalCollection.Create;
end;

destructor TViagemCollectionItem.Destroy;
begin
  FNotasFiscais.Free;
  FValores.Free;

  inherited Destroy;
end;

procedure TViagemCollectionItem.SetNotasFiscais(
  const Value: TNotaFiscalCollection);
begin
  FNotasFiscais := Value;
end;

{ TViagemCollection }

function TViagemCollection.Add: TViagemCollectionItem;
begin
  Result := Self.New;
end;

function TViagemCollection.GetItem(Index: Integer): TViagemCollectionItem;
begin
  Result := TViagemCollectionItem(inherited GetItem(Index));
end;

function TViagemCollection.New: TViagemCollectionItem;
begin
  Result := TViagemCollectionItem.Create;
  Self.Add(Result);
end;

procedure TViagemCollection.SetItem(Index: Integer;
  Value: TViagemCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TNotaFiscalCollectionItem }

constructor TNotaFiscalCollectionItem.Create;
begin
  inherited Create;

  FToleranciaDePerdaDeMercadoria := TToleranciaDePerdaDeMercadoria.Create;
  FDiferencaDeFrete := TDiferencaDeFrete.Create;
end;

destructor TNotaFiscalCollectionItem.Destroy;
begin
  FToleranciaDePerdaDeMercadoria.Free;
  FDiferencaDeFrete.Free;

  inherited Destroy;
end;

{ TNotaFiscalCollection }

function TNotaFiscalCollection.Add: TNotaFiscalCollectionItem;
begin
  Result := Self.New;
end;

function TNotaFiscalCollection.GetItem(
  Index: Integer): TNotaFiscalCollectionItem;
begin
  Result := TNotaFiscalCollectionItem(inherited GetItem(Index));
end;

function TNotaFiscalCollection.New: TNotaFiscalCollectionItem;
begin
  Result := TNotaFiscalCollectionItem.Create;
  Self.Add(Result);
end;

procedure TNotaFiscalCollection.SetItem(Index: Integer;
  Value: TNotaFiscalCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TDiferencaDeFrete }

constructor TDiferencaDeFrete.Create;
begin
  inherited Create;

  Tolerancia := TDiferencaFreteMargem.Create;
  MargemGanho := TDiferencaFreteMargem.Create;
  MargemPerda := TDiferencaFreteMargem.Create;
end;

destructor TDiferencaDeFrete.Destroy;
begin
  Tolerancia.Free;
  MargemGanho.Free;
  MargemPerda.Free;

  inherited Destroy;
end;

{ TSubcontratante }

constructor TSubcontratante.Create;
begin
  inherited Create;

  FEndereco := TEndereco.Create;
  FTelefones := TTelefones.Create;
end;

destructor TSubcontratante.Destroy;
begin
  FEndereco.Free;
  FTelefones.Free;

  inherited Destroy;
end;

procedure TSubcontratante.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {SomenteNumeros(}Value{)};
end;

{ TTomadorServico }

constructor TTomadorServico.Create;
begin
  inherited Create;

  FEndereco := TEndereco.Create;
  FTelefones := TTelefones.Create;
end;

destructor TTomadorServico.Destroy;
begin
  FEndereco.Free;
  FTelefones.Free;

  inherited Destroy;
end;

procedure TTomadorServico.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {SomenteNumeros(}Value{)};
end;

{ TRetificarOperacao }

constructor TRetificarOperacao.Create;
begin
  inherited Create;

  FVeiculos := TVeiculoCollection.Create;
end;

destructor TRetificarOperacao.Destroy;
begin
  FVeiculos.Free;

  inherited Destroy;
end;

procedure TRetificarOperacao.setVeiculos(
  const Value: TVeiculoCollection);
begin
  FVeiculos := Value;
end;

// ************* Retorno

{ TRemetente }

constructor TRemetente.Create;
begin
  inherited Create;

  FEndereco := TEndereco.Create;
  FTelefones := TTelefones.Create;
end;

destructor TRemetente.Destroy;
begin
  FEndereco.Free;
  FTelefones.Free;

  inherited Destroy;
end;

procedure TRemetente.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {omenteNumeros(}Value{)};
end;

{ TProprietarioCarga }

constructor TProprietarioCarga.Create;
begin
  inherited Create;

  FEndereco := TEndereco.Create;
  FTelefones := TTelefones.Create;
end;

destructor TProprietarioCarga.Destroy;
begin
  FEndereco.Free;
  FTelefones.Free;

  inherited Destroy;
end;

procedure TProprietarioCarga.SetCpfOuCnpj(const Value: string);
begin
  FCpfOuCnpj := {omenteNumeros(}Value{)};
end;

{ TEncerrarOperacao }

constructor TEncerrarOperacao.Create;
begin
  inherited Create;

  FViagens := TViagemCollection.Create;
  FPagamentos := TPagamentoCollection.Create;
  FImpostos := TImpostos.Create;
end;

destructor TEncerrarOperacao.Destroy;
begin
  FViagens.Free;
  FPagamentos.Free;
  FImpostos.Free;

  inherited Destroy;
end;

procedure TEncerrarOperacao.SetPagamentos(const Value: TPagamentoCollection);
begin
  FPagamentos := Value;
end;

procedure TEncerrarOperacao.SetViagens(const Value: TViagemCollection);
begin
  FViagens := Value;
end;

{ TAdicionarViagem }

constructor TAdicionarViagem.Create;
begin
  inherited Create;

  FViagens := TViagemCollection.Create;
  FPagamentos := TPagamentoCollection.Create;
end;

destructor TAdicionarViagem.Destroy;
begin
  FViagens.Free;
  FPagamentos.Free;

  inherited Destroy;
end;

procedure TAdicionarViagem.SetPagamentos(const Value: TPagamentoCollection);
begin
  FPagamentos := Value;
end;

procedure TAdicionarViagem.SetViagens(const Value: TViagemCollection);
begin
  FViagens := Value;
end;

{ TMensagemCollection }

function TMensagemCollection.Add: TMensagemCollectionItem;
begin
  Result := Self.New;
end;

function TMensagemCollection.GetItem(Index: Integer): TMensagemCollectionItem;
begin
  Result := TMensagemCollectionItem(inherited GetItem(Index));
end;

function TMensagemCollection.New: TMensagemCollectionItem;
begin
  Result := TMensagemCollectionItem.Create;
  Self.Add(Result);
end;

procedure TMensagemCollection.SetItem(Index: Integer;
  Value: TMensagemCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TRetEnvio }

constructor TRetEnvio.Create;
begin
  inherited Create;

  FDocumentoViagem := TMensagemCollection.Create;
  FDocumentoPagamento := TMensagemCollection.Create;
end;

destructor TRetEnvio.Destroy;
begin
  FDocumentoViagem.Free;
  FDocumentoPagamento.Free;

  inherited Destroy;
end;

procedure TRetEnvio.SetDocumentoPagamento(const Value: TMensagemCollection);
begin
  FDocumentoPagamento := Value;
end;

procedure TRetEnvio.SetDocumentoViagem(const Value: TMensagemCollection);
begin
  FDocumentoViagem := Value;
end;

{ TAdicionarPagamento }

constructor TAdicionarPagamento.Create;
begin
  inherited Create;

  FPagamentos := TPagamentoCollection.Create;
end;

destructor TAdicionarPagamento.Destroy;
begin
  FPagamentos.Free;

  inherited Destroy;
end;

procedure TAdicionarPagamento.SetPagamentos(const Value: TPagamentoCollection);
begin
  FPagamentos := Value;
end;

end.

