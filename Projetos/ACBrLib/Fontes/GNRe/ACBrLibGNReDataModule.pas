unit ACBrLibGNReDataModule;

{$mode delphi}

interface

uses
  Classes, SysUtils, syncobjs,
  ACBrMail, ACBrGNRE2, ACBrGNReGuiaRLClass,
  ACBrLibComum, ACBrLibConfig, ACBrLibMailImport;

type

  { TLibGNReDM }

  TLibGNReDM = class(TDataModule)
    ACBrGNRE1: TACBrGNRE;
    ACBrGNREGuiaRL1: TACBrGNREGuiaRL;

    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    FLock: TCriticalSection;
    FACBrMail: TACBrMail;
    FLibMail: TACBrLibMail;
    fpLib: TACBrLib;

  public
    procedure CriarACBrMail;

    procedure AplicarConfiguracoes;
    procedure AplicarConfigMail;
    procedure ConfigurarImpressao(GerarPDF: Boolean; NomeImpressora: String = ''; MostrarPreview: String = '');
    procedure GravarLog(AMsg: String; NivelLog: TNivelLog; Traduzir: Boolean = False);
    procedure Travar;
    procedure Destravar;

    property Lib: TACBrLib read fpLib write fpLib;

  end;

implementation

uses
  ACBrUtil, FileUtil,
  ACBrLibGNReConfig, ACBrLibGNReBase;

{$R *.lfm}

{ TLibGNReDM }

procedure TLibGNReDM.DataModuleCreate(Sender: TObject);
begin
  FLock := TCriticalSection.Create;
  FACBrMail := Nil;
  FLibMail := Nil;
end;

procedure TLibGNReDM.DataModuleDestroy(Sender: TObject);
begin
  FLock.Destroy;

  if Assigned(FLibMail) then
    FreeAndNil(FLibMail)
  else if Assigned(FACBrMail) then
    FreeAndNil(FACBrMail);
end;

procedure TLibGNReDM.CriarACBrMail;
var
  NomeLib: String;
begin
  if Assigned(FLibMail) or Assigned(FACBrMail) then
    Exit;

  GravarLog('  CriarACBrMail', logCompleto);

  NomeLib := ApplicationPath + CACBrMailLIBName;
  if FileExists(NomeLib) then
  begin
    GravarLog('      Carregando MAIL de: ' + NomeLib, logCompleto);
    // Criando Classe para Leitura da Lib //
    FLibMail  := TACBrLibMail.Create(NomeLib, Lib.Config.NomeArquivo, Lib.Config.ChaveCrypt);
    FACBrMail := FLibMail.ACBrMail;
  end
  else
  begin
    GravarLog('     Criando MAIL Interno', logCompleto);
    FACBrMail := TACBrMail.Create(Nil);
  end;

  ACBrGNRe1.MAIL := FACBrMail;
end;

procedure TLibGNReDM.AplicarConfiguracoes;
var
  LibConfig: TLibGNReConfig;
begin
  ACBrGNRe1.SSL.DescarregarCertificado;
  LibConfig := TLibGNReConfig(TACBrLibGNRe(Lib).Config);
  ACBrGNRe1.Configuracoes.Assign(LibConfig.GNReConfig);

  AplicarConfigMail;
end;

procedure TLibGNReDM.AplicarConfigMail;
begin
  if Assigned(FLibMail) or (not Assigned(FACBrMail)) then
    Exit;

  with FACBrMail do
  begin
    Attempts := Lib.Config.Email.Tentativas;
    SetTLS := Lib.Config.Email.TLS;
    DefaultCharset := Lib.Config.Email.Codificacao;
    From := Lib.Config.Email.Conta;
    FromName := Lib.Config.Email.Nome;
    SetSSL := Lib.Config.Email.SSL;
    Host := Lib.Config.Email.Servidor;
    IDECharset := Lib.Config.Email.Codificacao;
    IsHTML := Lib.Config.Email.IsHTML;
    Password := Lib.Config.Email.Senha;
    Port := IntToStr(Lib.Config.Email.Porta);
    Priority := Lib.Config.Email.Priority;
    ReadingConfirmation := Lib.Config.Email.Confirmacao;
    DeliveryConfirmation := Lib.Config.Email.ConfirmacaoEntrega;
    TimeOut := Lib.Config.Email.TimeOut;
    Username := Lib.Config.Email.Usuario;
    UseThread := Lib.Config.Email.SegundoPlano;
  end;
end;

procedure TLibGNReDM.ConfigurarImpressao(GerarPDF: Boolean; NomeImpressora, MostrarPreview: String);
var
  LibConfig: TLibGNReConfig;
begin
  GravarLog('ConfigurarImpressao - Iniciado', logNormal);

  LibConfig := TLibGNReConfig(Lib.Config);
  ACBrGNRE1.GNREGuia := ACBrGNREGuiaRL1;

  with ACBrGNREGuiaRL1 do
  begin
    Impressora := LibConfig.GuiaConfig.Impressora;
    MargemInferior := LibConfig.GuiaConfig.MargemInferior;
    MargemSuperior := LibConfig.GuiaConfig.MargemSuperior;
    MargemEsquerda := LibConfig.GuiaConfig.MargemEsquerda;
    MargemDireita := LibConfig.GuiaConfig.MargemDireita;
    MostrarPreview := LibConfig.GuiaConfig.MostrarPreview;
    MostrarStatus := LibConfig.GuiaConfig.MostrarStatus;
    NumCopias := LibConfig.GuiaConfig.NumCopias;
    PathPDF := LibConfig.GuiaConfig.PathPDF;
    PrintDialog := LibConfig.GuiaConfig.PrintDialog;
    TamanhoPapel := LibConfig.GuiaConfig.TamanhoPapel;
    Sistema := Lib.Config.Sistema.Nome;
    Site := Lib.Config.Emissor.WebSite;
    Email := Lib.Config.Emissor.Email;
    Fax := Lib.Config.Emissor.Telefone;
    Usuario := LibConfig.GuiaConfig.Usuario;
  end;

  if GerarPDF then
  begin
    if (LibConfig.GuiaConfig.PathPDF <> '') then
      if not DirectoryExists(PathWithDelim(LibConfig.GuiaConfig.PathPDF))then
        ForceDirectories(PathWithDelim(LibConfig.GuiaConfig.PathPDF));
  end;

  if NaoEstaVazio(NomeImpressora) then
    ACBrGNREGuiaRL1.Impressora := NomeImpressora;

  if NaoEstaVazio(MostrarPreview) then
    ACBrGNREGuiaRL1.MostrarPreview := StrToBoolDef(MostrarPreview, False);

  GravarLog('ConfigurarImpressao - Feito', logNormal);
end;

procedure TLibGNReDM.GravarLog(AMsg: String; NivelLog: TNivelLog; Traduzir: Boolean);
begin
  if Assigned(Lib) then
    Lib.GravarLog(AMsg, NivelLog, Traduzir);
end;

procedure TLibGNReDM.Travar;
begin
  GravarLog('Travar', logParanoico);
  FLock.Acquire;
end;

procedure TLibGNReDM.Destravar;
begin
  GravarLog('Destravar', logParanoico);
  FLock.Release;
end;

end.
