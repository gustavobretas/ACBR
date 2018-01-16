unit ACBrLibNFeDataModule;

{$mode delphi}

interface

uses
  Classes, SysUtils, syncobjs, FileUtil,
  ACBrNFe, ACBrMail, ACBrPosPrinter, ACBrNFeDANFeRLClass, ACBrDANFCeFortesFr,
  ACBrNFeDANFeESCPOS,
  ACBrLibConfig;

type

  { TLibNFeDM }

  TLibNFeDM = class(TDataModule)
    ACBrMail: TACBrMail;
    ACBrNFe: TACBrNFe;
    ACBrNFeDANFCeFortes: TACBrNFeDANFCeFortes;
    ACBrNFeDANFeESCPOS: TACBrNFeDANFeESCPOS;
    ACBrNFeDANFeRL: TACBrNFeDANFeRL;
    ACBrPosPrinter: TACBrPosPrinter;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);

  private
    FLock: TCriticalSection;
  public
    procedure AplicarConfiguracoes;
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

  ACBrNFe.SSL.DescarregarCertificado;
  pLibConfig := TLibNFeConfig(TACBrLibNFe(pLib).Config);
  ACBrNFe.Configuracoes.Assign(pLibConfig.NFeConfig);

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
