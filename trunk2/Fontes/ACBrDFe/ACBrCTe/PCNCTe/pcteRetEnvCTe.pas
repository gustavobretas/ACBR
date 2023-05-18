{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Italo Giurizzato Junior                         }
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

unit pcteRetEnvCTe;

interface

uses
  SysUtils, Classes, pcnAuxiliar, pcnConversao, pcnLeitor;

type

  TInfREC = class
  private
    FnRec: String;
    FdhRecbto: TDateTime;
    FtMed: Integer;
  public
    property nRec: String        read FnRec     write FnRec;
    property dhRecbto: TDateTime read FdhRecbto write FdhRecbto;
    property tMed: Integer       read FtMed     write FtMed;
  end;

  TretEnvCTe = class(TObject)
  private
    FLeitor: TLeitor;
    Fversao: String;
    FtpAmb: TpcnTipoAmbiente;
    FverAplic: String;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FinfRec: TInfREC;
  public
    constructor Create;
    destructor Destroy; override;
    function LerXml: boolean;
    property Leitor: TLeitor         read FLeitor   write FLeitor;
    property versao: String          read Fversao   write Fversao;
    property tpAmb: TpcnTipoAmbiente read FtpAmb    write FtpAmb;
    property verAplic: String        read FverAplic write FverAplic;
    property cStat: Integer          read FcStat    write FcStat;
    property xMotivo: String         read FxMotivo  write FxMotivo;
    property cUF: Integer            read FcUF      write FcUF;
    property infRec: TInfREC         read FinfRec   write FinfRec;
  end;

implementation

{ TretEnvCTe }

constructor TretEnvCTe.Create;
begin
  inherited Create;
  FLeitor := TLeitor.Create;
  FinfRec := TInfREC.Create
end;

destructor TretEnvCTe.Destroy;
begin
  FLeitor.Free;
  FinfRec.Free;
  inherited;
end;

function TretEnvCTe.LerXml: boolean;
var
  ok: boolean;
begin
  Result := False;
  try
    Leitor.Grupo := Leitor.Arquivo;

    if (leitor.rExtrai(1, 'retEnviCte') <> '') or
       (leitor.rExtrai(1, 'retEnviCTe') <> '') then
    begin
               Fversao   := Leitor.rAtributo('versao', 'retEnviCte');
      (*AR03 *)FtpAmb    := StrToTpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
      (*AR03a*)FcUF      := Leitor.rCampo(tcInt, 'cUF');
      (*AR04 *)FverAplic := Leitor.rCampo(tcStr, 'verAplic');
      (*AR05 *)FcStat    := Leitor.rCampo(tcInt, 'cStat');
      (*AR06 *)FxMotivo  := Leitor.rCampo(tcStr, 'xMotivo');

      //       Grupo infRec - Dados do Recibo do Lote (S� � gerado se o Lote for aceito)
      (*AR08 *)infRec.nRec      := Leitor.rCampo(tcStr, 'nRec');
      (*AR09 *)infRec.FdhRecbto := Leitor.rCampo(tcDatHor, 'dhRecbto');
      (*AR10 *)infRec.FtMed     := Leitor.rCampo(tcInt, 'tMed');

      Result := True;
    end;
  except
    Result := False;
  end;
end;

end.

