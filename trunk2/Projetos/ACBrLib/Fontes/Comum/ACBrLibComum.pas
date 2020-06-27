{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Rafael Teno Dias                                }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatuí - SP - 18270-170         }
{******************************************************************************}

{$I ACBr.inc}

unit ACBrLibComum;

interface

uses
  Classes, SysUtils, fileinfo, ACBrLibConfig;

type

  { EACBrLibException }
  EACBrLibException = class(Exception)
  private
    FErro: Integer;
  public
    constructor Create(const err: Integer; const msg: String); reintroduce;

    property Erro: Integer read FErro;
  end;

  { TLibRetorno }
  TLibRetorno = record
    Codigo: Integer;
    Mensagem: String;
  end;

  { TACBrLib }
  TACBrLib = class
  private
    FLogNome: String;
    FLogData: TDate;
    FNome: String;
    FDescricao: String;
    FVersao: String;

    function GetNome: String;
    function GetDescricao: String;
    function GetVersao: String;

  protected
    fpConfig: TLibConfig;
    fpLibRetorno: TLibRetorno;
    fpFileVerInfo: TFileVersionInfo;  // Informações da Aplicação e Versão, definida em Opções do Projeto

    procedure Inicializar; virtual;
    procedure CriarConfiguracao(ArqConfig: String = ''; ChaveCrypt: AnsiString = ''); virtual;
    procedure Executar; virtual;
    procedure Finalizar; virtual;

    function CalcularNomeArqLog: String; virtual;
  public
    constructor Create(ArqConfig: String = ''; ChaveCrypt: AnsiString = ''); virtual;
    destructor Destroy; override;

    property Config: TLibConfig read fpConfig;
    property Retorno: TLibRetorno read fpLibRetorno;

    property Nome: String read GetNome;
    property Versao: String read GetVersao;
    property Descricao: String read GetDescricao;

    procedure GravarLog(AMsg: String; NivelLog: TNivelLog; Traduzir: Boolean = False);
    procedure MoverStringParaPChar(const AString: String; sDest: PChar; var esTamanho: longint);

    function SetRetorno(const ACodigo: Integer; const AMensagem: String = ''): Integer;
    function ConverterAnsiParaUTF8(AData: AnsiString): AnsiString;

    function ObterNome(const sNome: PChar; var esTamanho: longint): longint;
    function ObterVersao(const sVersao: PChar; var esTamanho: longint): longint;
    function UltimoRetorno(const sMensagem: PChar; var esTamanho: longint): longint;


    function ImportarConfig(const eArqConfig: PChar): longint;
    function ConfigLer(const eArqConfig: PChar): longint;

    function ConfigGravar(const eArqConfig: PChar): longint;
    function ConfigLerValor(const eSessao, eChave: PChar; sValor: PChar; var esTamanho: longint): longint;
    function ConfigGravarValor(const eSessao, eChave, eValor: PChar): longint;

  end;

  { TLibHandle }
  TLibHandle = record
    Lib: TACBrLib;
  end;


  TACBrLibClass = class of TACBrLib;
  PLibHandle = ^TLibHandle;

{%region Declaração da funções externas}

{%region Constructor/Destructor}
function LIB_Inicializar(var libHandle: PLibHandle; pLibClass: TACBrLibClass; const eArqConfig, eChaveCrypt: PChar): longint;
function LIB_Finalizar(libHandle: PLibHandle): longint;
function LIB_Inicalizada(const libHandle: PLibHandle): Boolean;
{%endregion}

{%region Versao/Retorno}
function LIB_Nome(const libHandle: PLibHandle; const sNome: PChar; var esTamanho: longint): longint;
function LIB_Versao(const libHandle: PLibHandle; const sVersao: PChar; var esTamanho: longint): longint;
function LIB_UltimoRetorno(const libHandle: PLibHandle; const sMensagem: PChar; var esTamanho: longint): longint;
{%endregion}

{%region Ler/Gravar Config }
function LIB_ImportarConfig(const libHandle: PLibHandle; const eArqConfig: PChar): longint;
function LIB_ConfigLer(const libHandle: PLibHandle; const eArqConfig: PChar): longint;
function LIB_ConfigGravar(const libHandle: PLibHandle; const eArqConfig: PChar): longint;
function LIB_ConfigLerValor(const libHandle: PLibHandle; const eSessao, eChave: PChar; sValor: PChar; var esTamanho: longint): longint;
function LIB_ConfigGravarValor(const libHandle: PLibHandle; const eSessao, eChave, eValor: PChar): longint;
{%endregion}

{%endregion}

{%region Funcoes auxiliares para Funcionamento da Lib}
procedure VerificarLibInicializada(const libHandle: PLibHandle);
procedure VerificarArquivoExiste(const NomeArquivo: String);
procedure LiberarLib(libHandle: PLibHandle);
{%endregion}

{%region Funcoes auxiliares Diversas }
// Le um arquivo em Disco e retorna o seu conteúdo //
function LerArquivoParaString(AArquivo: String): AnsiString;

function StringToB64Crypt(AString: String; AChave: AnsiString = ''): String;
function B64CryptToString(ABase64Str: String; AChave: AnsiString = ''): String;

function StringEhXML(AString: String): Boolean;
function StringEhArquivo(AString: String): Boolean;
{%endregion}

var
  pLib: PLibHandle;

implementation

uses
  strutils, strings,
  synacode, synautil,
  ACBrConsts, ACBrUtil,
  ACBrLibConsts, ACBrLibResposta;

{ EACBrLibException }

constructor EACBrLibException.Create(const err: Integer; const msg: String);
begin
  FErro := err;
  inherited Create(msg);
end;

{%endregion}

{ TACBrLib }

constructor TACBrLib.Create(ArqConfig: String; ChaveCrypt: AnsiString);
begin
  inherited Create;

  FLogData := -1;
  FLogNome := '';
  FNome := '';
  FVersao := '';
  FDescricao := '';

  fpFileVerInfo := TFileVersionInfo.Create(Nil);
  fpFileVerInfo.ReadFileInfo;

  CriarConfiguracao(ArqConfig, ChaveCrypt);
end;

destructor TACBrLib.Destroy;
begin
  GravarLog('LIB_Finalizar', logSimples);

  fpFileVerInfo.Free;
  Finalizar;
  inherited Destroy;
end;

function TACBrLib.GetVersao: String;
begin
  if (FVersao = '') then
    if Assigned(fpFileVerInfo) then
      FVersao := fpFileVerInfo.VersionStrings.Values['FileVersion'];

  Result := FVersao;
end;

function TACBrLib.GetNome: String;
begin
  if (FNome = '') then
    if Assigned(fpFileVerInfo) then
      FNome := fpFileVerInfo.VersionStrings.Values['InternalName'];

  Result := FNome;
end;

function TACBrLib.GetDescricao: String;
begin
  if (FDescricao = '') then
    if Assigned(fpFileVerInfo) then
      FDescricao := fpFileVerInfo.VersionStrings.Values['FileDescription'];

  Result := FDescricao;
end;

procedure TACBrLib.Inicializar;
begin
  FLogData := 0;
  FLogNome := '';

  Config.Ler;
end;

procedure TACBrLib.Finalizar;
begin
  GravarLog('Finalizar', logCompleto);
  FreeAndNil(fpConfig);
end;

procedure TACBrLib.CriarConfiguracao(ArqConfig: String; ChaveCrypt: AnsiString);
begin
  fpConfig := TLibConfig.Create(Self, ArqConfig, ChaveCrypt);
end;

procedure TACBrLib.Executar;
begin
  GravarLog('Executar', logCompleto);
end;

function TACBrLib.CalcularNomeArqLog: String;
var
  APath: String;
begin
  if (Date <> FLogData) then
  begin
    FLogData := Date;
    APath := PathWithDelim(fpConfig.Log.Path);
    if NaoEstaVazio(APath) then
    begin
      if (not DirectoryExists(APath)) then
        raise EACBrLibException.Create(ErrDiretorioNaoExiste, Format(SErrDiretorioInvalido, [APath]));
    end
    else
      APath := ApplicationPath;

    FLogNome := APath + Self.Nome + '-' + DtoS(FLogData) + '.log';
  end;

  Result := FLogNome;
end;

procedure TACBrLib.GravarLog(AMsg: String; NivelLog: TNivelLog; Traduzir: Boolean);
var
  NomeArq: String;
begin
  if (FLogData < 0) or (Self.Nome = '') or
    (not Assigned(fpConfig)) or (NivelLog > fpConfig.Log.Nivel) then
    Exit;

  NomeArq := CalcularNomeArqLog;
  WriteLog(NomeArq, FormatDateTime('dd/mm/yy hh:nn:ss:zzz', now) + ' - ' + AMsg, Traduzir);
end;

procedure TACBrLib.MoverStringParaPChar(const AString: String; sDest: PChar; var esTamanho: longint);
var
  AStringLen: Integer;
begin
  AStringLen := Length(AString);

  if (esTamanho <= 0) then
    esTamanho := AStringLen
  else
  begin
    StrLCopy(sDest, PChar(AString), esTamanho);
    esTamanho := AStringLen;
  end;
end;

function TACBrLib.SetRetorno(const ACodigo: Integer; const AMensagem: String = ''): Integer;
begin
  Result := ACodigo;
  with Retorno do
  begin
    Codigo := ACodigo;
    Mensagem := AMensagem;
  end;
  GravarLog('   SetRetorno(' + IntToStr(Retorno.Codigo) + ', ' + Retorno.Mensagem + ')', logParanoico);
end;

function TACBrLib.ConverterAnsiParaUTF8(AData: AnsiString): AnsiString;
begin
  if (Config.CodResposta = codANSI) then
    Result := ACBrAnsiToUTF8(AData)
  else
    Result := AData;
end;

function TACBrLib.ObterNome(const sNome: PChar; var esTamanho: longint): longint;
begin
  try
    GravarLog('LIB_Nome', logNormal);
    MoverStringParaPChar(Nome, sNome, esTamanho);
    if Config.Log.Nivel >= logCompleto then
      GravarLog('   Nome:' + strpas(sNome) + ', len:' + IntToStr(esTamanho), logCompleto, True);
    Result := SetRetorno(ErrOK, Nome);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function TACBrLib.ObterVersao(const sVersao: PChar; var esTamanho: longint): longint;
begin
  try
    GravarLog('LIB_Versao', logNormal);
    MoverStringParaPChar(Versao, sVersao, esTamanho);
    if Config.Log.Nivel >= logCompleto then
      GravarLog('   Versao:' + strpas(sVersao) + ', len:' + IntToStr(esTamanho), logCompleto, True);
    Result := SetRetorno(ErrOK, Versao);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function TACBrLib.UltimoRetorno(const sMensagem: PChar; var esTamanho: longint): longint;
begin
  try
    GravarLog('LIB_UltimoRetorno', logNormal);
    MoverStringParaPChar(Retorno.Mensagem, sMensagem, esTamanho);
    Result := Retorno.Codigo;
    if (Config.Log.Nivel >= logCompleto) then
      GravarLog('   Codigo:' + IntToStr(Result) + ', Mensagem:' + strpas(sMensagem), logCompleto, True);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrExecutandoMetodo, E.Message);
  end;
end;

function TACBrLib.ImportarConfig(const eArqConfig: PChar): longint;
var
  ArqConfig: String;
begin
  try
    ArqConfig := strpas(eArqConfig);
    GravarLog('LIB_ImportarConfig(' + ArqConfig + ')', logNormal);

    if NaoEstaVazio(ArqConfig) then
      Config.Importar(ArqConfig);

    Config.Gravar;
    Result := SetRetorno(ErrOK);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrConfigLer, E.Message);
  end;
end;

function TACBrLib.ConfigLer(const eArqConfig: PChar): longint;
var
  ArqConfig: String;
begin
  try
    ArqConfig := strpas(eArqConfig);
    GravarLog('LIB_ConfigLer(' + ArqConfig + ')', logNormal);

    if NaoEstaVazio(ArqConfig) then
      Config.NomeArquivo := ArqConfig;

    Config.Ler;
    Result := SetRetorno(ErrOK);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrConfigLer, E.Message);
  end;
end;

function TACBrLib.ConfigGravar(const eArqConfig: PChar): longint;
var
  ArqConfig: String;
begin
  try
    ArqConfig := strpas(eArqConfig);
    GravarLog('LIB_ConfigGravar(' + ArqConfig + ')', logNormal);

    if NaoEstaVazio(ArqConfig) then
      Config.NomeArquivo := ArqConfig;

    Config.Gravar;
    Result := SetRetorno(ErrOK);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrConfigGravar, E.Message);
  end;
end;

function TACBrLib.ConfigLerValor(const eSessao, eChave: PChar; sValor: PChar;
  var esTamanho: longint): longint;
var
  Sessao, Chave, Valor: Ansistring;
begin
  try
    Sessao := Ansistring(eSessao);
    Chave := Ansistring(eChave);
    GravarLog('LIB_ConfigLerValor(' + Sessao + ', ' + Chave + ')', logNormal);

    Valor := Config.LerValor(Sessao, Chave);

    MoverStringParaPChar(Valor, sValor, esTamanho);

    if (Config.Log.Nivel >= logCompleto) then
      GravarLog('   Valor:' + IfThen(Config.PrecisaCriptografar(Sessao, Chave),
                                StringOfChar('*', esTamanho), sValor) +
                                ', len:' + IntToStr(esTamanho), logCompleto, True);

    Result := SetRetorno(ErrOK, Valor);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrConfigLer, E.Message);
  end;
end;

function TACBrLib.ConfigGravarValor(const eSessao, eChave, eValor: PChar): longint;
var
  Sessao, Chave, Valor: Ansistring;
begin
  try
    Sessao := Ansistring(eSessao);
    Chave := Ansistring(eChave);
    Valor := Ansistring(eValor);

    GravarLog('LIB_ConfigGravarValor(' + Sessao + ', ' + Chave + ', ' +
                                          IfThen(Config.PrecisaCriptografar(Sessao, Chave),
                                          StringOfChar('*', Length(Valor)), Valor) + ')', logNormal);

    Config.GravarValor(Sessao, Chave, Valor);
    Result := SetRetorno(ErrOK);
  except
    on E: EACBrLibException do
      Result := SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := SetRetorno(ErrConfigGravar, E.Message);
  end;
end;

{%region Constructor/Destructor}

function LIB_Inicializar(var libHandle: PLibHandle; pLibClass: TACBrLibClass; const eArqConfig, eChaveCrypt: PChar): longint;
var
  ArqConfig, ChaveCrypt: String;
begin
  try
    ArqConfig := strpas(eArqConfig);
    ChaveCrypt := strpas(eChaveCrypt);

    New(libHandle);
    libHandle^.Lib := pLibClass.Create(eArqConfig, eChaveCrypt);
    libHandle^.Lib.Inicializar;
    libHandle^.Lib.GravarLog('LIB_Inicializar( ' + ArqConfig + ', ' + StringOfChar('*', Length(ChaveCrypt)) + ' )', logSimples);
    libHandle^.Lib.GravarLog('   ' + libHandle^.Lib.Nome + ' - ' + libHandle^.Lib.Versao, logSimples);

    with libHandle^.Lib.Retorno do
    begin
      Codigo := 0;
      Mensagem := '';
    end;

    Result := 0;
  except
    on E: EACBrLibException do
    begin
      Result := E.Erro;
      LiberarLib(libHandle);
    end;

    on E: Exception do
    begin
      Result := ErrLibNaoInicializada;
      LiberarLib(libHandle);
    end
  end;
end;

function LIB_Finalizar(libHandle: PLibHandle): longint;
begin
  try
    LiberarLib(libHandle);
    Result := 0;
  except
    on E: EACBrLibException do
      Result := libHandle^.Lib.SetRetorno(E.Erro, E.Message);

    on E: Exception do
      Result := libHandle^.Lib.SetRetorno(ErrLibNaoFinalizada, E.Message);
  end;
end;

function LIB_Inicalizada(const libHandle: PLibHandle): Boolean;
begin
  Result := (libHandle <> nil);
end;

{%endregion}

{%region Versao/Retorno}

function LIB_Nome(const libHandle: PLibHandle; const sNome: PChar; var esTamanho: longint): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.ObterNome(sNome, esTamanho);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

function LIB_Versao(const libHandle: PLibHandle;const sVersao: PChar; var esTamanho: longint): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.ObterVersao(sVersao, esTamanho);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

function LIB_UltimoRetorno(const libHandle: PLibHandle; const sMensagem: PChar; var esTamanho: longint): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.UltimoRetorno(sMensagem, esTamanho);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

{%endregion}

{%region Ler/Gravar Config }

function LIB_ImportarConfig(const libHandle: PLibHandle; const eArqConfig: PChar): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.ImportarConfig(eArqConfig);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

function LIB_ConfigLer(const libHandle: PLibHandle; const eArqConfig: PChar): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.ConfigLer(eArqConfig);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

function LIB_ConfigGravar(const libHandle: PLibHandle; const eArqConfig: PChar): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.ConfigGravar(eArqConfig);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

function LIB_ConfigLerValor(const libHandle: PLibHandle; const eSessao, eChave: PChar; sValor: PChar;
  var esTamanho: longint): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.ConfigLerValor(eSessao, eChave, sValor, esTamanho);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

function LIB_ConfigGravarValor(const libHandle: PLibHandle; const eSessao, eChave, eValor: PChar): longint;
begin
  try
    VerificarLibInicializada(libHandle);
    Result := libHandle^.Lib.ConfigGravarValor(eSessao, eChave, eValor);
  except
    on E: EACBrLibException do
      Result := E.Erro;

    on E: Exception do
      Result := ErrExecutandoMetodo;
  end;
end;

{%endregion}

{%region Funcoes auxiliares }

procedure VerificarLibInicializada(const libHandle: PLibHandle);
begin
  if not Assigned(libHandle) then
  begin
      raise EACBrLibException.Create(ErrLibNaoInicializada, SErrLibNaoInicializada);
  end;
end;

procedure VerificarArquivoExiste(const NomeArquivo: String);
begin
  if not FileExists(NomeArquivo) then
    raise EACBrLibException.Create(ErrArquivoNaoExiste, Format(SErrArquivoNaoExiste, [NomeArquivo]));
end;

procedure LiberarLib(libHandle: PLibHandle);
begin
  if Assigned(libHandle) then
  begin
    libHandle^.Lib.Destroy;
    libHandle^.Lib := nil;
    Dispose(libHandle);
  end;
end;

function LerArquivoParaString(AArquivo: String): AnsiString;
var
  FS: TFileStream;
begin
  VerificarArquivoExiste(AArquivo);
  FS := TFileStream.Create(AArquivo, fmOpenRead or fmShareExclusive);
  try
    FS.Position := 0;
    Result := ReadStrFromStream(FS, FS.Size);
  finally
    FS.Free;
  end;
end;

function StringToB64Crypt(AString: String; AChave: AnsiString = ''): String;
begin
  if (Length(AChave) = 0) then
    AChave := CLibChaveCrypt;

  Result := EncodeBase64(StrCrypt(AString, AChave));
end;

function B64CryptToString(ABase64Str: String; AChave: AnsiString = ''): String;
begin
  if (Length(AChave) = 0) then
    AChave := CLibChaveCrypt;

  Result := StrCrypt(DecodeBase64(ABase64Str), AChave);
end;

function StringEhXML(AString: String): Boolean;
var
  p1: Integer;
begin
  p1 := pos('<', AString);
  Result := (p1 > 0) and (PosEx('>', AString, p1 + 1) > 0);
end;

function StringEhINI(AString: String): Boolean;
var
  p1, p2, p3: Integer;
begin
  p1 := pos('[', AString);
  p2 := PosEx(']', AString, p1 + 1);
  p3 := PosEx(LF, AString, p2 + 1);
  Result := (p1 > 0) and (p2 > 0) and (p3 > 0) and (PosEx('=', AString, p2) > 0);
end;

function StringEhArquivo(AString: String): Boolean;
begin
  Result := (AString <> '') and
    (Length(AString) <= 255) and
    (pos(LF, AString) = 0) and
    (pos('<', AString) = 0) and
    (pos('=', AString) = 0);
end;

initialization
  pLib := nil;

finalization
  LiberarLib(pLib);

end.
