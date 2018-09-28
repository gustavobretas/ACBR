unit ACBrLibNFeDataModule;

{$mode delphi}

interface

uses
  Classes, SysUtils, syncobjs, FileUtil, ACBrNFe, ACBrNFeDANFeRLClass, ACBrMail,
  ACBrPosPrinter, ACBrNFeDANFeESCPOS, ACBrDANFCeFortesFr, ACBrLibConfig;

type

  { TLibNFeDM }

  TLibNFeDM = class(TDataModule)
    ACBrMail1: TACBrMail;
    ACBrNFe1: TACBrNFe;
    ACBrNFeDANFCeFortes1: TACBrNFeDANFCeFortes;
    ACBrNFeDANFeESCPOS1: TACBrNFeDANFeESCPOS;
    ACBrNFeDANFeRL1: TACBrNFeDANFeRL;
    ACBrPosPrinter1: TACBrPosPrinter;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    FLock: TCriticalSection;

  public
    procedure AplicarConfiguracoes;
    procedure AplicarConfigMail;
    procedure GravarLog(AMsg: String; NivelLog: TNivelLog; Traduzir: Boolean = False);
    procedure Travar;
    procedure Destravar;
  end;

implementation

uses
  ACBrUtil,
  ACBrLibNFeConfig, ACBrLibComum, ACBrLibNFeClass;

{$R *.lfm}

{ TLibNFeDM }

procedure TLibNFeDM.DataModuleCreate(Sender: TObject);
begin
  FLock := TCriticalSection.Create;
end;

procedure TLibNFeDM.DataModuleDestroy(Sender: TObject);
begin
  FLock.Destroy;
end;

procedure TLibNFeDM.AplicarConfiguracoes;
var
  pLibConfig: TLibNFeConfig;
begin
  ACBrNFe1.SSL.DescarregarCertificado;
  pLibConfig := TLibNFeConfig(TACBrLibNFe(pLib).Config);
  ACBrNFe1.Configuracoes.Assign(pLibConfig.NFeConfig);

  if (TACBrLibNFe(pLib).LibMail = nil) then
    AplicarConfigMail;
  {
  with ACBrMail do
  begin
    FromName := pLibConfig.Email.Nome;
    From := pLibConfig.Email.Conta;
    Host := pLibConfig.Email.Servidor;
    Port := IntToStr(pLibConfig.Email.Porta);
    Username := pLibConfig.Email.Usuario;
    Password := pLibConfig.Email.Senha;
    SetSSL := pLibConfig.Email.SSL;
    SetTLS := pLibConfig.Email.TLS;
    ReadingConfirmation := pLibConfig.Email.Confirmacao;
    UseThread := pLibConfig.Email.SegundoPlano;
    DefaultCharset := pLibConfig.Email.Codificacao;
  end;
  }
end;

procedure TLibNFeDM.AplicarConfigMail;
begin
  with ACBrMail1 do
  begin
    Attempts := pLib.Config.Email.Tentativas;
    SetTLS := pLib.Config.Email.TLS;
    DefaultCharset := pLib.Config.Email.Codificacao;
    From := pLib.Config.Email.Conta;
    FromName := pLib.Config.Email.Nome;
    SetSSL := pLib.Config.Email.SSL;
    Host := pLib.Config.Email.Servidor;
    IDECharset := pLib.Config.Email.Codificacao;
    IsHTML := pLib.Config.Email.IsHTML;
    Password := pLib.Config.Email.Senha;
    Port := IntToStr(pLib.Config.Email.Porta);
    Priority := pLib.Config.Email.Priority;
    ReadingConfirmation := pLib.Config.Email.Confirmacao;
    DeliveryConfirmation := pLib.Config.Email.ConfirmacaoEntrega;
    TimeOut := pLib.Config.Email.TimeOut;
    Username := pLib.Config.Email.Usuario;
    UseThread := pLib.Config.Email.SegundoPlano;
  end;
end;

procedure TLibNFeDM.GravarLog(AMsg: String; NivelLog: TNivelLog; Traduzir: Boolean);
begin
  if Assigned(pLib) then
    pLib.GravarLog(AMsg, NivelLog, Traduzir);
end;

procedure TLibNFeDM.Travar;
begin
  GravarLog('Travar', logParanoico);
  FLock.Acquire;
end;

procedure TLibNFeDM.Destravar;
begin
  GravarLog('Destravar', logParanoico);
  FLock.Release;
end;

end.
