{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Italo Jurisato Junior                           }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
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
{ Daniel Sim�es de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatu� - SP - 18270-170         }
{******************************************************************************}

{$I ACBr.inc}

unit ACBrCIOTConfiguracoes;

interface

uses
  Classes, SysUtils,
  ACBrDFeConfiguracoes, pcnConversao, pcnConversaoCIOT;

type

  { TGeralConfCIOT }

  TGeralConfCIOT = class(TGeralConf)
  private
    FIntegradora: TCIOTIntegradora;
    FVersaoDF: TVersaoCIOT;
    FUsuario: String;
    FSenha: String;
    FCNPJEmitente: String;
    FHashIntegrador: String;

    procedure SetVersaoDF(const Value: TVersaoCIOT);
  public
    constructor Create(AOwner: TConfiguracoes); override;
    procedure Assign(DeGeralConfCIOT: TGeralConfCIOT); reintroduce;

  published
    property Integradora: TCIOTIntegradora read FIntegradora write FIntegradora;
    property VersaoDF: TVersaoCIOT read FVersaoDF write SetVersaoDF default ve500;
    property Usuario: String read FUsuario write FUsuario;
    property Senha: String read FSenha write FSenha;
    property CNPJEmitente: String read FCNPJEmitente write FCNPJEmitente;
    property HashIntegrador: String read FHashIntegrador write FHashIntegrador;
  end;

  { TArquivosConfCIOT }

  TArquivosConfCIOT = class(TArquivosConf)
  private
    FEmissaoPathCIOT: boolean;
    FPathCIOT: String;
  public
    constructor Create(AOwner: TConfiguracoes); override;
    destructor Destroy; override;
    procedure Assign(DeArquivosConfCIOT: TArquivosConfCIOT); reintroduce;

    function GetPathCIOT(Data: TDateTime = 0; CNPJ: String = ''): String;
  published
    property EmissaoPathCIOT: boolean read FEmissaoPathCIOT
      write FEmissaoPathCIOT default False;
    property PathCIOT: String read FPathCIOT write FPathCIOT;
  end;

  { TConfiguracoesCIOT }

  TConfiguracoesCIOT = class(TConfiguracoes)
  private
    function GetArquivos: TArquivosConfCIOT;
    function GetGeral: TGeralConfCIOT;
  protected
    procedure CreateGeralConf; override;
    procedure CreateArquivosConf; override;

  public
    constructor Create(AOwner: TComponent); override;
    procedure Assign(DeConfiguracoesCIOT: TConfiguracoesCIOT); reintroduce;

  published
    property Geral: TGeralConfCIOT read GetGeral;
    property Arquivos: TArquivosConfCIOT read GetArquivos;
    property WebServices;
    property Certificados;
  end;

implementation

uses
  ACBrUtil, DateUtils;

{ TConfiguracoesCIOT }

constructor TConfiguracoesCIOT.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  WebServices.ResourceName := 'ACBrCIOTServicos';
end;

function TConfiguracoesCIOT.GetArquivos: TArquivosConfCIOT;
begin
  Result := TArquivosConfCIOT(FPArquivos);
end;

function TConfiguracoesCIOT.GetGeral: TGeralConfCIOT;
begin
  Result := TGeralConfCIOT(FPGeral);
end;

procedure TConfiguracoesCIOT.CreateGeralConf;
begin
  FPGeral := TGeralConfCIOT.Create(Self);
end;

procedure TConfiguracoesCIOT.CreateArquivosConf;
begin
  FPArquivos := TArquivosConfCIOT.Create(self);
end;

procedure TConfiguracoesCIOT.Assign(DeConfiguracoesCIOT: TConfiguracoesCIOT);
begin
  Geral.Assign(DeConfiguracoesCIOT.Geral);
  WebServices.Assign(DeConfiguracoesCIOT.WebServices);
  Certificados.Assign(DeConfiguracoesCIOT.Certificados);
  Arquivos.Assign(DeConfiguracoesCIOT.Arquivos);
end;

{ TGeralConfCIOT }

procedure TGeralConfCIOT.Assign(DeGeralConfCIOT: TGeralConfCIOT);
begin
  inherited Assign(DeGeralConfCIOT);

  FVersaoDF := DeGeralConfCIOT.VersaoDF;
end;

constructor TGeralConfCIOT.Create(AOwner: TConfiguracoes);
begin
  inherited Create(AOwner);

  FVersaoDF := ve500;
  FIntegradora := ieFrete;
  FUsuario := '';
  FSenha := '';
  FCNPJEmitente := '';
  FHashIntegrador := '';
end;

procedure TGeralConfCIOT.SetVersaoDF(const Value: TVersaoCIOT);
begin
  FVersaoDF := Value;
end;

{ TArquivosConfCIOT }

procedure TArquivosConfCIOT.Assign(DeArquivosConfCIOT: TArquivosConfCIOT);
begin
  inherited Assign(DeArquivosConfCIOT);

  FEmissaoPathCIOT := DeArquivosConfCIOT.EmissaoPathCIOT;
  FPathCIOT        := DeArquivosConfCIOT.PathCIOT;
end;

constructor TArquivosConfCIOT.Create(AOwner: TConfiguracoes);
begin
  inherited Create(AOwner);

  FEmissaoPathCIOT := False;
  FPathCIOT := '';
end;

destructor TArquivosConfCIOT.Destroy;
begin

  inherited;
end;

function TArquivosConfCIOT.GetPathCIOT(Data: TDateTime = 0; CNPJ: String = ''): String;
begin
  Result := GetPath(FPathCIOT, 'CIOT', CNPJ, '', Data);
end;

end.
