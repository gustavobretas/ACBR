{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Isaque Pinheiro                                 }
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

unit ACBrECDBloco_9;

interface

uses
  SysUtils, Classes, Contnrs, DateUtils, ACBrECDBlocos;

type
 /// Registro 9001 - ABERTURA DO BLOCO 9

 TRegistro9001 = class(TOpenBlocos)
 private
 public
 end;

 /// Registro 9900 - REGISTROS DO ARQUIVO

 TRegistro9900 = class
 private
   fREG_BLC: String;      /// Registro que ser� totalizado no pr�ximo campo.
   fQTD_REG_BLC: Integer; /// Total de registros do tipo informado no campo anterior.
   fIndice: Integer;       /// Index do registro na lista de totalizadores.
 public
   property REG_BLC: String read fREG_BLC write fREG_BLC;
   property QTD_REG_BLC: Integer read fQTD_REG_BLC write fQTD_REG_BLC;
//   property Indice: Integer read fIndice write fIndice;
 end;

  /// Registro 9900 - Lista

  TRegistro9900List = class(TObjectList)
  private
    function GetItem(Index: Integer): TRegistro9900; /// GetItem
    procedure SetItem(Index: Integer; const Value: TRegistro9900); /// SetItem
  public
    function New: TRegistro9900;
    function FindByREG_BLC(const pValue: String; out pReg: TRegistro9900): Boolean;
    procedure AddRegistro9900(const pREG_BLC: String; const pQTD_REG_BLC: Integer);

    property Items[Index: Integer]: TRegistro9900 read GetItem write SetItem;
  end;

 /// Registro 9990 - ENCERRAMENTO DO BLOCO 9

 TRegistro9990 = class
 private
   fQTD_LIN_9: Integer; /// Quantidade total de linhas do arquivo digital.
 public
   property QTD_LIN_9: Integer read fQTD_LIN_9 write fQTD_LIN_9;
 end;

 /// Registro 9999 - ENCERRAMENTO DO ARQUIVO DIGITAL

 TRegistro9999 = class
 private
   fQTD_LIN: Integer; /// Quantidade total de linhas do arquivo digital.
 public
   property QTD_LIN: Integer read fQTD_LIN write fQTD_LIN;
 end;

implementation

{ TRegistro9900List }

function TRegistro9900List.GetItem(Index: Integer): TRegistro9900;
begin
  Result := TRegistro9900(Inherited Items[Index]);
end;

function TRegistro9900List.New: TRegistro9900;
begin
  Result := TRegistro9900.Create;
  Result.fIndice := Add(Result);
end;

procedure TRegistro9900List.SetItem(Index: Integer; const Value: TRegistro9900);
begin
  Put(Index, Value);
end;

procedure TRegistro9900List.AddRegistro9900(const pREG_BLC: String;
  const pQTD_REG_BLC: Integer);
var
  Reg: TRegistro9900;
begin
  if (pQTD_REG_BLC > 0) then
  begin
    if not(FindByREG_BLC(pREG_BLC, Reg)) then
    begin
      Reg := New;
      Reg.REG_BLC := pREG_BLC;
    end;

    Reg.QTD_REG_BLC := Reg.QTD_REG_BLC + pQTD_REG_BLC;
  end;
end;

function TRegistro9900List.FindByREG_BLC(const pValue: String; out pReg: TRegistro9900): Boolean;
var
  i: Integer;
begin
  Result := False;

  for i := 0 to (Count - 1) do
    if (Items[i].REG_BLC = pValue) then
    begin
      pReg := Items[i];
      Result := True;
      Break;
    end;
end;

end.
