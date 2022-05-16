{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
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

{$I ACBr.inc}

unit ACBrCHQUrano;

interface
uses
  Classes,
  ACBrCHQClass
  {$IFDEF NEXTGEN}
   ,ACBrBase
  {$ENDIF}
  {$IFNDEF COMPILER6_UP}
   ,Windows
  {$ENDIF};

type TACBrCHQUrano = class( TACBrCHQClass )
  private

  protected
    function GetChequePronto: Boolean; Override ;

  public
    constructor Create(AOwner: TComponent);

    procedure Ativar ; override ;

    procedure ImprimirCheque ; Override ;
    procedure ImprimirLinha( const AString : AnsiString ) ; Override ;
end ;

implementation
Uses ACBrUtil.Strings,
     ACBrUtil.Base,
     SysUtils
    {$IFDEF COMPILER6_UP}, DateUtils {$ENDIF} ;

{ TACBrCHQUrano }

constructor TACBrCHQUrano.Create(AOwner: TComponent);
begin
  inherited Create( AOwner );

  fpDevice.SetDefaultValues ;
  fpModeloStr := 'Urano' ;
end;

procedure TACBrCHQUrano.Ativar;
begin
  if fpDevice.Porta = ''  then
     raise Exception.Create(ACBrStr('Impressora de Cheques '+fpModeloStr+' requer'+#10+
                            'Porta Serial (COMn) ou Paralela (LPTn)'));

  inherited Ativar ; { Abre porta serial }
end;

procedure TACBrCHQUrano.ImprimirCheque;
Var ValStr, DataStr : String ;
begin
  if not fpDevice.EmLinha( 3 ) then  { Impressora est� em-linha ? }
    raise Exception.Create(ACBrStr('A impressora de Cheques '+fpModeloStr+
                           ' n�o est� pronta.')) ;

  {  Usando Protocolo Generico 2 (Muito mais simples) }
  { Ligando asteriscos no final da impressao }
  EnviarStr( #27 + 'p1$' ) ;
  { Cidade }
  EnviarStr( #27 + 'c' + PadRight(fpCidade,20) + '$' ) ;
  { Favorecido }
  EnviarStr( #27 + 'f' + PadRight(fpFavorecido,40) + '$' ) ;
  { Data }
  DataStr := FormatDateTime('ddmmyy',fpData) ;
  EnviarStr( #27 + 'd' + DataStr + '$' ) ;
  { Banco }
  EnviarStr( #27 + 'b' + fpBanco + '$' ) ;
  { Valor }
  ValStr := IntToStrZero( Round( fpValor * 100), 14) ;
  EnviarStr( #27 + 'v' + ValStr + '$' ) ;
end;

procedure TACBrCHQUrano.ImprimirLinha(const AString: AnsiString);
begin
  EnviarStr( #27 + 'g' + CodificarPaginaDeCodigo(TrimRight(AString)) + #10 + '$' ) ;
end;

function TACBrCHQUrano.GetChequePronto: Boolean;
Var nBit : Byte ;
begin
  Result := true ;

  if not fpDevice.IsSerialPort then
     exit ;

  fpDevice.EnviaString( #170 + #06 + #128 ) ;   // Pede Status
  nBit := fpDevice.LeByte( 200 ) ;

  Result := (nBit <> 2) ;
end;

end.

