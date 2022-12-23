{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2022 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
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

(*

  Documenta��o


*)

{$I ACBr.inc}

unit ACBrPIXPSPGerenciaNet;

interface

uses
  Classes, SysUtils,
  ACBrPIXCD, ACBrOpenSSLUtils,
  ACBrPIXSchemasProblema, ACBrBase;

const
  cGerenciaNetURLSandbox      = 'https://api-pix-h.gerencianet.com.br';
  cGerenciaNetURLProducao     = 'https://api-pix.gerencianet.com.br';
  cGerenciaNetPathAuthToken   = '/oauth/token';
  cGerenciaNetPathAPIPix      = '/v2';
  cGerenciaNetURLAuthTeste    = cGerenciaNetURLSandbox+cGerenciaNetPathAuthToken;
  cGerenciaNetURLAuthProducao = cGerenciaNetURLProducao+cGerenciaNetPathAuthToken;

type

  { TACBrPSPGerenciaNet }

  {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(piacbrAllPlatforms)]
  {$ENDIF RTL230_UP}
  TACBrPSPGerenciaNet = class(TACBrPSPCertificate)
  private
    fArquivoCertificado: String;
    fArquivoChavePrivada: String;
  protected
    procedure ConfigurarHeaders(const aMethod, aURL: String); override;
    function ObterURLAmbiente(const aAmbiente: TACBrPixCDAmbiente): String; override;
  public
    procedure Autenticar; override;

  published
    property ClientID;
    property ClientSecret;

  end;

implementation

uses
  synacode, synautil, DateUtils, ACBrJSON,
  ACBrUtil.Base, ACBrUtil.Strings, ACBrPIXUtil;

{ TACBrPSPGerenciaNet }

procedure TACBrPSPGerenciaNet.ConfigurarHeaders(const aMethod, aURL: String);
begin
  inherited ConfigurarHeaders(aMethod, aURL);
  if NaoEstaVazio(fpToken) then
    Http.Headers.Insert(0, ChttpHeaderAuthorization + ChttpAuthorizationBearer+' '+fpToken);
end;

function TACBrPSPGerenciaNet.ObterURLAmbiente(const aAmbiente: TACBrPixCDAmbiente): String;
begin
  if (aAmbiente = ambProducao) then
    Result := cGerenciaNetURLProducao + cGerenciaNetPathAPIPix
  else
    Result := cGerenciaNetURLSandbox + cGerenciaNetPathAPIPix;
end;

procedure TACBrPSPGerenciaNet.Autenticar;
var
  wURL, BasicAutentication: String;
  wRespostaHttp: AnsiString;
  wResultCode, sec: Integer;
  js: TACBrJSONObject;
begin
  LimparHTTP;

  if (ACBrPixCD.Ambiente = ambProducao) then
    wURL := cGerenciaNetURLAuthProducao
  else
    wURL := cGerenciaNetURLAuthTeste;

  js := TACBrJSONObject.Create;
  try
    js.AddPair('grant_type', 'client_credentials');
    Http.Protocol := '1.1';
    Http.MimeType := CContentTypeApplicationJSon;
    WriteStrToStream(Http.Document, js.ToJSON);
  finally
    js.Free;
  end;

  Http.UserName := ClientID;
  Http.Password := ClientSecret;
  TransmitirHttp(ChttpMethodPOST, wURL, wResultCode, wRespostaHttp);

  if (wResultCode = HTTP_OK) then
  begin
    js := TACBrJSONObject.Parse(wRespostaHttp);
    try
      fpToken := js.AsString['access_token'];
      sec := js.AsInteger['expires_in'];
    finally
      js.Free;
    end;

    if (Trim(fpToken) = EmptyStr) then
      DispararExcecao(EACBrPixHttpException.Create(ACBrStr(sErroAutenticacao)));

    fpValidadeToken := IncSecond(Now, sec);
    fpAutenticado := True;
  end
  else
    DispararExcecao(EACBrPixHttpException.CreateFmt(sErroHttp, [Http.ResultCode, ChttpMethodPOST, wURL]));
end;

end.

