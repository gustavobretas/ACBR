{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esse arquivo usa a classe  SynaSer   Copyright (c)2001-2003, Lukas Gebauer   }
{  Project : Ararat Synapse     (Found at URL: http://www.ararat.cz/synapse/)  }
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
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 14/11/2017: Primeira Versao
|*    Filipe de Almeida Sortica
******************************************************************************}

unit ACBrFeriadoWSCalendario;

interface

uses
  Classes, ACBrFeriadoWSClass;

type
  TACBrFeriadoWSCalendario = class(TACBrFeriadoWSClass)
  protected
    procedure ProcessarResposta;
  public
    constructor Create(AOwner: TComponent); override;

    procedure Buscar(const AAno: Integer; const AUF: String = '';
      const ACidade: String = ''); override;
  end;

implementation

uses
  SysUtils, ACBrFeriado, ACBrUtil;

{ TACBrFeriadoWSCalendario }

procedure TACBrFeriadoWSCalendario.Buscar(const AAno: Integer; const AUF,
  ACidade: String);
var
  sURL: String;
  sNomeCidade: String;
begin
  TestarToken;

  sURL := fpURL + 'api/api_feriados.php?';
  sURL := sURL + 'token='+ TACBrFeriado(fOwner).Token;
  sURL := sURL + '&ano='+ IntToStr(AAno);

  if ((ACidade <> EmptyStr) and (ACidade = OnlyNumber(ACidade))) then
    sURL := sURL + '&ibge='+ ACidade
  else
  begin
    if (AUF <> EmptyStr) then
      sURL := sURL + '&estado='+ AUF;

    if (ACidade <> EmptyStr) then
    begin
      sNomeCidade := TiraAcentos(UpperCase(Trim(ACidade)));
      sNomeCidade := StringReplace(sNomeCidade, ' ', '_', [rfReplaceAll]);
      sURL := sURL + '&cidade='+ sNomeCidade;
    end;
  end;

  TACBrFeriado(fOwner).HTTPGet(sURL);

  ProcessarResposta;
end;

constructor TACBrFeriadoWSCalendario.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fpURL := 'http://www.calendario.com.br/';
end;

procedure TACBrFeriadoWSCalendario.ProcessarResposta;
var
  Buffer: String;
  XML: TStringList;
  i: Integer;
  sEvento: String;
  Evento: TACBrFeriadoEvento;
  Data: TDateTime;
  Ano: Word;
  Mes: Word;
  Dia: Word;
  Tipo: Integer;
begin
  Buffer := TACBrFeriado(fOwner).RespHTTP.Text;
  if (Buffer = EmptyStr) then
    Exit;

  Buffer := StringReplace(Buffer, sLineBreak, '', [rfReplaceAll]);
  Buffer := StringReplace(Buffer, '</location>', '</location>' + sLineBreak, [rfReplaceAll]);
  Buffer := StringReplace(Buffer, '</event>', '</event>' + sLineBreak, [rfReplaceAll]);

  XML := TStringList.Create;
  try
    XML.Text := Buffer;

    for i := 0 to XML.Count - 1 do
    begin
      sEvento := XML.Strings[i];

      if (LerTagXML(sEvento, 'event') <> '') then
      begin
        Evento := TACBrFeriado(fOwner).Eventos.New;

        Data := StrToDateDef(LerTagXML(sEvento, 'date'), 0);
        DecodeDate(Data, Ano, Mes, Dia);
        Evento.Data      := Data;
        Evento.Ano       := Ano;
        Evento.Mes       := Mes;
        Evento.Dia       := Dia;

        Evento.Nome      := LerTagXML(sEvento, 'name');
        Evento.Descricao := LerTagXML(sEvento, 'description');
        Evento.Link      := LerTagXML(sEvento, 'link');

        Tipo := StrToIntDef(LerTagXML(sEvento, 'type_code'), 0);
        case Tipo of
          1: Evento.Tipo := ftNacional;
          2: Evento.Tipo := ftEstadual;
          3: Evento.Tipo := ftMunicipal;
          4: Evento.Tipo := ftFacultativo;
          9: Evento.Tipo := ftDiaConvencional;
        else
          Evento.Tipo := ftNenhum;
        end;
      end;
    end;
  finally
    XML.Free;
  end;

  BuscaEfetuada;
end;

end.
