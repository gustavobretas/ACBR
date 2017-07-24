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

unit ACBrNFSe;

interface

uses
  Classes, SysUtils,
  ACBrDFe, ACBrDFeException, ACBrDFeConfiguracoes,
  ACBrNFSeDANFSEClass,
  ACBrNFSeConfiguracoes,
  ACBrNFSeNotasFiscais,
  ACBrNFSeWebServices,
  pnfsNFSe, pcnConversao, pnfsConversao,
  ACBrUtil;

const
  ACBRNFSE_VERSAO = '2.0.0a';
  ACBRNFSE_NAMESPACE = 'NameSpace.varia.conforme.provedor';

type
  EACBrNFSeException = class(EACBrDFeException);

  { TACBrNFSe }
	{$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF RTL230_UP}	
  TACBrNFSe = class(TACBrDFe)
  private
    FDANFSE: TACBrNFSeDANFSEClass;
    FNotasFiscais: TNotasFiscais;
    FStatus: TStatusACBrNFSe;
    FWebServices: TWebServices;

    function GetNumID(ANFSe : TNFSe): String;
    function GetConfiguracoes: TConfiguracoesNFSe;
    procedure SetConfiguracoes(AValue: TConfiguracoesNFSe);
    procedure SetDANFSE(const Value: TACBrNFSeDANFSEClass);
  protected
    function CreateConfiguracoes: TConfiguracoes; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    function GetAbout: String; override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure EnviarEmail(sPara, sAssunto: String;
      sMensagem: TStrings = nil; sCC: TStrings = nil; Anexos: TStrings = nil;
      StreamNFSe: TStream = nil; NomeArq: String = ''; sReplyTo: TStrings = nil); override;

    function GerarLote(ALote: Integer): Boolean; overload;
    function GerarLote(ALote: String): Boolean; overload;

    function Enviar(ALote: integer; Imprimir: Boolean = True): Boolean; overload;
    function Enviar(ALote: String; Imprimir: Boolean = True): Boolean; overload;

    function TesteEnviar(ALote: Integer): Boolean; overload;
    function TesteEnviar(ALote: String): Boolean; overload;

    function EnviarSincrono(ALote: Integer; Imprimir: Boolean = True): Boolean; overload;
    function EnviarSincrono(ALote: String; Imprimir: Boolean = True): Boolean; overload;

    function Gerar(ARps: Integer; ALote: Integer = 1; Imprimir: Boolean = True): Boolean;

    function ConsultarSituacao(AProtocolo: String;
                               const ANumLote: String = ''): Boolean;
    function ConsultarLoteRps(ANumLote, AProtocolo: string): Boolean;
    function ConsultarNFSeporRps(ANumero, ASerie, ATipo: String): Boolean;
    function ConsultarNFSe(ADataInicial, ADataFinal: TDateTime;
      ANumeroNFSe: String = ''; APagina: Integer = 1;
      ACNPJTomador: String = ''; AIMTomador: String = '';
      ANomeInter: String = ''; ACNPJInter: String = ''; AIMInter: String = '';
      ASerie: String = ''): Boolean;

    function CancelarNFSe(ACodigoCancelamento: String;
                          ANumeroNFSe: String = '';
                          AMotivoCancelamento: String = ''): Boolean;

    function SubstituirNFSe(ACodigoCancelamento, ANumeroNFSe: String;
                            AMotivoCancelamento: String = ''): Boolean;

    function LinkNFSe(ANumeroNFSe: Integer; ACodVerificacao: String; AChaveAcesso: String = ''): String;

    function GetNomeModeloDFe: String; override;
    function GetNameSpaceURI: String; override;

    function cStatConfirmada(AValue: integer): Boolean;
    function cStatProcessado(AValue: integer): Boolean;

    function NomeServicoToNomeSchema(const NomeServico: String): String; override;
    procedure LerServicoDeParams(LayOutServico: TLayOutNFSe; var Versao: Double;
      var URL: String); reintroduce; overload;
    function LerVersaoDeParams(LayOutServico: TLayOutNFSe): String; reintroduce; overload;

    function IdentificaSchema(const AXML: String): TSchemaNFSe;
    function GerarNomeArqSchema(const ALayOut: TLayOutNFSe;
      VersaoServico: Double): String;

    property WebServices: TWebServices read FWebServices write FWebServices;
    property NotasFiscais: TNotasFiscais read FNotasFiscais write FNotasFiscais;
    property Status: TStatusACBrNFSe read FStatus;

    procedure SetStatus(const stNewStatus: TStatusACBrNFSe);

    property NumID[ANFSe : TNFSe] :  string read GetNumID;
  published
    property Configuracoes: TConfiguracoesNFSe
      read GetConfiguracoes write SetConfiguracoes;
    property DANFSE: TACBrNFSeDANFSEClass read FDANFSE write SetDANFSE;
  end;

implementation

uses
  strutils, dateutils;

{$IFDEF FPC}
 {$IFDEF CPU64}
  {$R ACBrNFSeServicos.res}  // Dificuldades de compilar Recurso em 64 bits
 {$ELSE}
  {$R ACBrNFSeServicos.rc}
 {$ENDIF}
{$ELSE}
 {$R ACBrNFSeServicos.res}
{$ENDIF}

{ TACBrNFSe }

constructor TACBrNFSe.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FNotasFiscais := TNotasFiscais.Create(Self, NotaFiscal);
  FWebServices := TWebServices.Create(Self);
end;

destructor TACBrNFSe.Destroy;
begin
  FNotasFiscais.Free;
  FWebServices.Free;

  inherited;
end;

procedure TACBrNFSe.EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings;
  sCC: TStrings; Anexos: TStrings; StreamNFSe: TStream; NomeArq: String;
  sReplyTo: TStrings);
begin
  SetStatus( stNFSeEmail );

  try
    inherited EnviarEmail(sPara, sAssunto, sMensagem, sCC, Anexos, StreamNFSe, NomeArq,
      sReplyTo);
  finally
    SetStatus( stNFSeIdle );
  end;
end;

procedure TACBrNFSe.Notification(AComponent: TComponent; Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and (FDANFSE <> nil) and
    (AComponent is TACBrNFSeDANFSEClass) then
    FDANFSE := nil;
end;

function TACBrNFSe.GetAbout: String;
begin
  Result := 'ACBrNFSe Ver: ' + ACBRNFSE_VERSAO;
end;

function TACBrNFSe.CreateConfiguracoes: TConfiguracoes;
begin
  Result := TConfiguracoesNFSe.Create(Self);
end;

procedure TACBrNFSe.SetDANFSE(const Value: TACBrNFSeDANFSEClass);
var
  OldValue: TACBrNFSeDANFSEClass;
begin
  if Value <> FDANFSE then
  begin
    if Assigned(FDANFSE) then
      FDANFSE.RemoveFreeNotification(Self);

    OldValue := FDANFSE; // Usa outra variavel para evitar Loop Infinito
    FDANFSE := Value;    // na remo��o da associa��o dos componentes

    if Assigned(OldValue) then
      if Assigned(OldValue.ACBrNFSe) then
        OldValue.ACBrNFSe := nil;

    if Value <> nil then
    begin
      Value.FreeNotification(self);
      Value.ACBrNFSe := self;
    end;
  end;
end;

function TACBrNFSe.GetNomeModeloDFe: String;
begin
  Result := 'NFSe';
end;

function TACBrNFSe.GetNameSpaceURI: String;
begin
  Result := ''; // ACBRNFSE_NAMESPACE; 
end;

function TACBrNFSe.cStatConfirmada(AValue: integer): Boolean;
begin
  case AValue of
    100, 150: Result := True;
    else
      Result := False;
  end;
end;

function TACBrNFSe.cStatProcessado(AValue: integer): Boolean;
begin
  case AValue of
    100, 110, 150, 301, 302: Result := True;
    else
      Result := False;
  end;
end;

function TACBrNFSe.IdentificaSchema(const AXML: String): TSchemaNFSe;
var
  I: integer;
begin

  Result := schNFSe;
  I := pos('<infNFSe', AXML);
  if I = 0 then
  begin
    I := pos('<infCanc', AXML);
    if I > 0 then
      Result := schCancNFSe
  end;
end;

function TACBrNFSe.GerarNomeArqSchema(const ALayOut: TLayOutNFSe;
  VersaoServico: Double): String;
var
  NomeServico, NomeSchema, ArqSchema: String;
  Versao: Double;
begin
  // Procura por Vers�o na pasta de Schemas //
  NomeServico := LayOutToServico(ALayOut);
  NomeSchema := NomeServicoToNomeSchema(NomeServico);
  ArqSchema := '';
  if NaoEstaVazio(NomeSchema) then
  begin
    Versao := VersaoServico;
    AchaArquivoSchema( NomeSchema, Versao, ArqSchema );
  end;

  Result := ArqSchema;
end;

function TACBrNFSe.GetNumID(ANFSe: TNFSe): String;
var
  NumDoc, xCNPJ: String;
begin
  if ANFSe = nil then
    raise EACBrNFSeException.Create('N�o foi informado o objeto TNFSe para gerar a chave!');

  if ANFSe.Numero = '' then
    NumDoc := ANFSe.IdentificacaoRps.Numero
  else
    NumDoc := ANFSe.Numero;

  if ANFSe.PrestadorServico.IdentificacaoPrestador.Cnpj = '' then
    xCNPJ := ANFSe.Prestador.Cnpj
  else
    xCNPJ := ANFSe.PrestadorServico.IdentificacaoPrestador.Cnpj;

  if Configuracoes.Arquivos.NomeLongoNFSe then
    Result := GerarNomeNFSe(Configuracoes.WebServices.UFCodigo,
                            ANFSe.DataEmissao,
                            OnlyNumber(xCNPJ),
                            StrToInt64Def(NumDoc, 0))
  else
    Result := NumDoc + ANFSe.IdentificacaoRps.Serie;
end;

function TACBrNFSe.GetConfiguracoes: TConfiguracoesNFSe;
begin
  Result := TConfiguracoesNFSe(FPConfiguracoes);
end;

procedure TACBrNFSe.SetConfiguracoes(AValue: TConfiguracoesNFSe);
begin
  FPConfiguracoes := AValue;
end;

function TACBrNFSe.LerVersaoDeParams(LayOutServico: TLayOutNFSe): String;
var
  Versao: Double;
begin
  Versao := LerVersaoDeParams(GetNomeModeloDFe, Configuracoes.WebServices.UF,
    Configuracoes.WebServices.Ambiente, LayOutToServico(LayOutServico),
    VersaoNFSeToDbl( ve100 {Configuracoes.Geral.VersaoDF}));

  Result := FloatToString(Versao, '.', '0.00');
end;

function TACBrNFSe.NomeServicoToNomeSchema(const NomeServico: String): String;
Var
  ok: Boolean;
  ALayout: TLayOutNFSe;
begin
  ALayout := ServicoToLayOut(ok, NomeServico);
  if ok then
    Result := SchemaNFSeToStr( LayOutToSchema( ALayout ) )
  else
    Result := '';
end;

procedure TACBrNFSe.LerServicoDeParams(LayOutServico: TLayOutNFSe;
  var Versao: Double; var URL: String);
begin
  if Configuracoes.WebServices.Ambiente = taHomologacao then
  begin
    case LayOutServico of
      LayNfseRecepcaoLote:         URL := Configuracoes.Geral.ConfigURL.HomRecepcaoLoteRPS;
      LayNfseConsultaSitLoteRps:   URL := Configuracoes.Geral.ConfigURL.HomConsultaSitLoteRPS;
      LayNfseConsultaLote:         URL := Configuracoes.Geral.ConfigURL.HomConsultaLoteRPS;
      LayNfseConsultaNfseRps:      URL := Configuracoes.Geral.ConfigURL.HomConsultaNFSeRPS;
      LayNfseConsultaNfse:         URL := Configuracoes.Geral.ConfigURL.HomConsultaNFSe;
      LayNfseCancelaNfse:          URL := Configuracoes.Geral.ConfigURL.HomCancelaNFSe;
      LayNfseGerar:                URL := Configuracoes.Geral.ConfigURL.HomGerarNFSe;
      LayNfseRecepcaoLoteSincrono: URL := Configuracoes.Geral.ConfigURL.HomRecepcaoSincrono;
      LayNfseSubstituiNfse:        URL := Configuracoes.Geral.ConfigURL.HomSubstituiNFSe;
      LayNfseAbrirSessao:          URL := Configuracoes.Geral.ConfigURL.HomAbrirSessao;
      LayNfseFecharSessao:         URL := Configuracoes.Geral.ConfigURL.HomFecharSessao;
    end;
  end
  else begin
    case LayOutServico of
      LayNfseRecepcaoLote:         URL := Configuracoes.Geral.ConfigURL.ProRecepcaoLoteRPS;
      LayNfseConsultaSitLoteRps:   URL := Configuracoes.Geral.ConfigURL.ProConsultaSitLoteRPS;
      LayNfseConsultaLote:         URL := Configuracoes.Geral.ConfigURL.ProConsultaLoteRPS;
      LayNfseConsultaNfseRps:      URL := Configuracoes.Geral.ConfigURL.ProConsultaNFSeRPS;
      LayNfseConsultaNfse:         URL := Configuracoes.Geral.ConfigURL.ProConsultaNFSe;
      LayNfseCancelaNfse:          URL := Configuracoes.Geral.ConfigURL.ProCancelaNFSe;
      LayNfseGerar:                URL := Configuracoes.Geral.ConfigURL.ProGerarNFSe;
      LayNfseRecepcaoLoteSincrono: URL := Configuracoes.Geral.ConfigURL.ProRecepcaoSincrono;
      LayNfseSubstituiNfse:        URL := Configuracoes.Geral.ConfigURL.ProSubstituiNFSe;
      LayNfseAbrirSessao:          URL := Configuracoes.Geral.ConfigURL.ProAbrirSessao;
      LayNfseFecharSessao:         URL := Configuracoes.Geral.ConfigURL.ProFecharSessao;
    end;
  end;
end;

procedure TACBrNFSe.SetStatus(const stNewStatus: TStatusACBrNFSe);
begin
  if stNewStatus <> FStatus then
  begin
    FStatus := stNewStatus;
    if Assigned(OnStatusChange) then
      OnStatusChange(Self);
  end;
end;

function TACBrNFSe.GerarLote(ALote: Integer): Boolean;
begin
  Result := GerarLote(IntToStr(ALote));
end;

function TACBrNFSe.GerarLote(ALote: String): Boolean;
begin
  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum RPS adicionado ao Lote'));

  if NotasFiscais.Count > 50 then
    GerarException(ACBrStr('ERRO: Conjunto de RPS transmitidos (m�ximo de 50 RPS)' +
      ' excedido. Quantidade atual: ' + IntToStr(NotasFiscais.Count)));

  NotasFiscais.Assinar(Configuracoes.Geral.ConfigAssinar.RPS);

  Result := WebServices.GeraLote(ALote);
end;

function TACBrNFSe.Enviar(ALote: integer; Imprimir: Boolean): Boolean;
begin
  Result := Enviar(IntToStr(ALote),Imprimir);
end;

function TACBrNFSe.Enviar(ALote: String; Imprimir: Boolean): Boolean;
var
  i: Integer;
begin
  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum RPS adicionado ao Lote'));

  if NotasFiscais.Count > 50 then
    GerarException(ACBrStr('ERRO: Conjunto de RPS transmitidos (m�ximo de 50 RPS)' +
      ' excedido. Quantidade atual: ' + IntToStr(NotasFiscais.Count)));

  NotasFiscais.Assinar(Configuracoes.Geral.ConfigAssinar.RPS);

  Result := WebServices.Envia(ALote);

  if DANFSE <> nil then
  begin
    for i:= 0 to NotasFiscais.Count-1 do
    begin
      if NotasFiscais.Items[i].Confirmada and Imprimir then
        NotasFiscais.Items[i].Imprimir;
    end;
    SetStatus( stNFSeIdle );
  end;
end;

function TACBrNFSe.EnviarSincrono(ALote: Integer;
  Imprimir: Boolean): Boolean;
begin
  Result := EnviarSincrono(IntToStr(ALote), Imprimir);
end;

function TACBrNFSe.EnviarSincrono(ALote: String;
  Imprimir: Boolean): Boolean;
var
  i: Integer;
begin
  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum RPS adicionado ao Lote'));

  if NotasFiscais.Count > 50 then
    GerarException(ACBrStr('ERRO: Conjunto de RPS transmitidos (m�ximo de 50 RPS)' +
      ' excedido. Quantidade atual: ' + IntToStr(NotasFiscais.Count)));

  NotasFiscais.Assinar(Configuracoes.Geral.ConfigAssinar.RPS);

  Result := WebServices.EnviaSincrono(ALote);

  if DANFSE <> nil then
  begin
    for i:= 0 to NotasFiscais.Count-1 do
    begin
      if NotasFiscais.Items[i].Confirmada and Imprimir then
        NotasFiscais.Items[i].Imprimir;
    end;
    SetStatus( stNFSeIdle );
  end;
end;

function TACBrNFSe.Gerar(ARps: Integer; ALote: Integer; Imprimir: Boolean): Boolean;
var
  i: Integer;
begin
  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum RPS adicionado ao componente'));

  if Configuracoes.Geral.Provedor in [proBHISS, proWebISS, proWebISSv2] then
  begin
    if NotasFiscais.Count > 3 then
      GerarException(ACBrStr('ERRO: Conjunto de RPS transmitidos (m�ximo de 3 RPS)' +
        ' excedido. Quantidade atual: ' + IntToStr(NotasFiscais.Count)));
  end
  else begin
    if NotasFiscais.Count > 1 then
      GerarException(ACBrStr('ERRO: Conjunto de RPS transmitidos (m�ximo de 1 RPS)' +
        ' excedido. Quantidade atual: ' + IntToStr(NotasFiscais.Count)));
  end;

  NotasFiscais.Assinar(Configuracoes.Geral.ConfigAssinar.RpsGerar);

  Result := WebServices.Gera(ARps, ALote);

  if DANFSE <> nil then
  begin
    for i:= 0 to NotasFiscais.Count-1 do
    begin
      if NotasFiscais.Items[i].Confirmada and Imprimir then
        NotasFiscais.Items[i].Imprimir;
    end;
    SetStatus( stNFSeIdle );
  end;
end;

function TACBrNFSe.ConsultarSituacao(AProtocolo: String; const ANumLote: String): Boolean;
begin
  try
    Result := WebServices.ConsultaSituacao(AProtocolo, ANumLote);
  except
    Result := False;
  end;
end;

function TACBrNFSe.ConsultarLoteRps(ANumLote, AProtocolo: string): Boolean;
begin
  Result := WebServices.ConsultaLoteRps(ANumLote, AProtocolo);
end;

function TACBrNFSe.ConsultarNFSeporRps(ANumero, ASerie, ATipo: String): Boolean;
begin
  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum RPS carregado ao componente'));

  Result := WebServices.ConsultaNFSeporRps(ANumero, ASerie, ATipo);
end;

function TACBrNFSe.ConsultarNFSe(ADataInicial, ADataFinal: TDateTime;
  ANumeroNFSe: String; APagina: Integer; ACNPJTomador, AIMTomador,
  ANomeInter, ACNPJInter, AIMInter, ASerie: String): Boolean;
begin
  Result := WebServices.ConsultaNFSe(ADataInicial, ADataFinal, ANumeroNFSe,
            APagina, ACNPJTomador, AIMTomador, ANomeInter, ACNPJInter, AIMInter,
            ASerie);
end;

function TACBrNFSe.CancelarNFSe(ACodigoCancelamento, ANumeroNFSe,
  AMotivoCancelamento: String): Boolean;
begin
  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhuma NFS-e carregada ao componente'));

  Result := WebServices.CancelaNFSe(ACodigoCancelamento, ANumeroNFSe,
                                    AMotivoCancelamento);
end;

function TACBrNFSe.SubstituirNFSe(ACodigoCancelamento,
  ANumeroNFSe: String; AMotivoCancelamento: String): Boolean;
begin
  if ACodigoCancelamento = '' then
    GerarException(ACBrStr('ERRO: C�digo de Cancelamento n�o informado'));

  if ANumeroNFSe = '' then
    GerarException(ACBrStr('ERRO: Numero da NFS-e n�o informada'));

  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum RPS adicionado ao Lote'));

  NotasFiscais.Assinar(Configuracoes.Geral.ConfigAssinar.Substituir);

  Result := WebServices.SubstituiNFSe(ACodigoCancelamento, ANumeroNFSe,
                                      AMotivoCancelamento);
end;

function TACBrNFSe.TesteEnviar(ALote: Integer): Boolean;
begin
  Result := TesteEnviar(IntToStr(ALote));
end;

function TACBrNFSe.TesteEnviar(ALote: String): Boolean;
begin
  if NotasFiscais.Count <= 0 then
    GerarException(ACBrStr('ERRO: Nenhum RPS adicionado ao Lote'));

  if NotasFiscais.Count > 50 then
    GerarException(ACBrStr('ERRO: Conjunto de RPS transmitidos (m�ximo de 50 RPS)' +
      ' excedido. Quantidade atual: ' + IntToStr(NotasFiscais.Count)));

  NotasFiscais.Assinar(Configuracoes.Geral.ConfigAssinar.RPS);

  Result := WebServices.TestaEnvio(ALote);
end;

function TACBrNFSe.LinkNFSe(ANumeroNFSe: Integer; ACodVerificacao: String; AChaveAcesso: String = ''): String;
var
  Texto, xNumeroNFSe, xNomeMunic: String;
begin
  if Configuracoes.WebServices.Ambiente = taProducao then
  begin
    Texto := Configuracoes.Geral.ConfigGeral.ProLinkNFSe;
    xNomeMunic := Configuracoes.Geral.xNomeURL_P;
  end
  else begin
    Texto := Configuracoes.Geral.ConfigGeral.HomLinkNFSe;
    xNomeMunic := Configuracoes.Geral.xNomeURL_H;
  end;
  // %CodVerif%      : Representa o C�digo de Verifica��o da NFS-e
  // %NumeroNFSe%    : Representa o Numero da NFS-e
  // %NomeMunicipio% : Representa o Nome do Municipio
  // %InscMunic%     : Representa a Inscri��o Municipal do Emitente

  xNumeroNFSe := IntToStr(ANumeroNFSe);

  Texto := StringReplace(Texto, '%CodVerif%', ACodVerificacao, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%NumeroNFSe%', xNumeroNFSe, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%NomeMunicipio%', xNomeMunic, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%InscMunic%', Configuracoes.Geral.Emitente.InscMun, [rfReplaceAll]);
  Texto := StringReplace(Texto, '%ChaveAcesso%', AChaveAcesso, [rfReplaceAll]);

  Result := Texto;
end;

end.

