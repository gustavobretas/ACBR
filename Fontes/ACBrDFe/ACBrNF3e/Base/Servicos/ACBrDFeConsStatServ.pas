{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2022 Daniel Simoes de Almeida               }
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

unit ACBrDFeConsStatServ;

interface

uses
  SysUtils, Classes,
  ACBrXmlBase;

type

  TConsStatServ = class
  private
    FtpAmb: TACBrTipoAmbiente;
    FcUF: Integer;
    FVersao: String;
    FNameSpace: String;
    FtagGrupoMsg: String;
    FGerarcUF: Boolean;
  public
    constructor Create(const AVersao, ANameSpace, AtagGrupoMsg: String; AGerarcUF: Boolean);
    destructor Destroy; override;

    function GerarXML: String;
    function ObterNomeArquivo: string;

    property tpAmb: TACBrTipoAmbiente read FtpAmb write FtpAmb;
    property cUF: Integer             read FcUF   write FcUF;
  end;

implementation

uses
  pcnAuxiliar;

{ TConsStatServ }

constructor TConsStatServ.Create(const AVersao, ANameSpace, AtagGrupoMsg: String; AGerarcUF: Boolean);
begin
  inherited Create;

  FVersao := AVersao;
  FNameSpace := ANameSpace;
  FtagGrupoMsg := AtagGrupoMsg;
  FGerarcUF := AGerarcUF;
end;

destructor TConsStatServ.Destroy;
begin

  inherited;
end;

function TConsStatServ.ObterNomeArquivo: string;
var
  DataHora: TDateTime;
  Year, Month, Day, Hour, Min, Sec, Milli: Word;
  AAAAMMDDTHHMMSS: string;
begin
  Datahora:=now;
  DecodeTime(DataHora, Hour, Min, Sec, Milli);
  DecodeDate(DataHora, Year, Month, Day);
  AAAAMMDDTHHMMSS := IntToStrZero(Year, 4) + IntToStrZero(Month, 2) + IntToStrZero(Day, 2) +
    IntToStrZero(Hour, 2) + IntToStrZero(Min, 2) + IntToStrZero(Sec, 2);
  Result := AAAAMMDDTHHMMSS + '-ped-sta.xml';
end;

function TConsStatServ.GerarXML: String;
var
  xUF: string;
begin
  xUF := '';

  if FGerarcUF then
    xUF := '<cUF>' + IntToStr(cUF) + '</cUF>';

  Result := '<consStatServ' + FtagGrupoMsg + ' ' + FNameSpace + ' versao="' + Fversao + '">' +
              '<tpAmb>' + TipoAmbienteToStr(tpAmb) + '</tpAmb>' +
              xUF +
              '<xServ>STATUS</xServ>' +
            '</consStatServ' + FtagGrupoMsg + '>';
end;

end.

