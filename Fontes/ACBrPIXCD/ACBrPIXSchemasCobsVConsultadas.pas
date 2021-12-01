{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2021 Daniel Simoes de Almeida               }
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

  Documenta��o:
  https://github.com/bacen/pix-api

*)

{$I ACBr.inc}

unit ACBrPIXSchemasCobsVConsultadas;

interface

uses
  Classes, SysUtils,
  {$IfDef USE_JSONDATAOBJECTS_UNIT}
   JsonDataObjects_ACBr,
  {$Else}
   Jsons,
  {$EndIf}
  ACBrPIXBase,
  ACBrPIXSchemasParametrosConsultaCob, ACBrPIXSchemasCobV;


type

  { TACBrPIXCobsVConsultadas }

  TACBrPIXCobsVConsultadas = class(TACBrPIXSchema)
  private
    fcobs: TACBrPIXCobVCompletaArray;
    fparametros: TACBrPIXParametrosConsultaCob;
  protected
    procedure DoWriteToJSon(AJSon: TJsonObject); override;
    procedure DoReadFromJSon(AJSon: TJsonObject); override;
  public
    constructor Create(const ObjectName: String); override;
    procedure Clear; override;
    function IsEmpty: Boolean; override;
    destructor Destroy; override;
    procedure Assign(Source: TACBrPIXCobsVConsultadas);

    property parametros: TACBrPIXParametrosConsultaCob read fparametros;
    property cobs: TACBrPIXCobVCompletaArray read fcobs;
  end;

implementation

{ TACBrPIXCobsVConsultadas }

constructor TACBrPIXCobsVConsultadas.Create(const ObjectName: String);
begin
  inherited Create(ObjectName);
  fcobs := TACBrPIXCobVCompletaArray.Create('cobs');
  fparametros := TACBrPIXParametrosConsultaCob.Create('parametros');
end;

destructor TACBrPIXCobsVConsultadas.Destroy;
begin
  fcobs.Free;
  fparametros.Free;
  inherited Destroy;
end;

procedure TACBrPIXCobsVConsultadas.Clear;
begin
  fcobs.Clear;
  fparametros.Clear;
end;

function TACBrPIXCobsVConsultadas.IsEmpty: Boolean;
begin
  Result := fcobs.IsEmpty and fparametros.IsEmpty;
end;

procedure TACBrPIXCobsVConsultadas.Assign(Source: TACBrPIXCobsVConsultadas);
begin
  fcobs.Assign(Source.cobs);
  fparametros.Assign(Source.parametros);
end;

procedure TACBrPIXCobsVConsultadas.DoWriteToJSon(AJSon: TJsonObject);
begin
  fparametros.WriteToJSon(AJSon);
  fcobs.WriteToJSon(AJSon);
end;

procedure TACBrPIXCobsVConsultadas.DoReadFromJSon(AJSon: TJsonObject);
begin
  fparametros.ReadFromJSon(AJSon);
  fcobs.ReadFromJSon(AJSon);
end;

end.

