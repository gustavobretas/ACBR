{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo:                                                 }

{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }

{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }

{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }

{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }

{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 20/04/2013:  Daniel Sim�es de Almeida
|*   Inicio do desenvolvimento
******************************************************************************}

{$I ACBr.inc}

unit ACBrEscDaruma;

interface

uses
  Classes, SysUtils, ACBrPosPrinter;


type

  { TACBrEscDaruma }

  TACBrEscDaruma = class(TACBrPosPrinterClass)
  private
  public
    constructor Create(AOwner: TACBrPosPrinter);

    function ComandoCodBarras(const ATag: String; ACodigo: AnsiString): AnsiString;
      override;
    function ComandoQrCode(ACodigo: AnsiString): AnsiString; override;
    function ComandoEspacoEntreLinhas(Espacos: Byte): AnsiString; override;
    function ComandoLogo: AnsiString; override;

    procedure LerStatus(var AStatus: TACBrPosPrinterStatus); override;
    function LerInfo: String; override;
  end;


implementation

Uses
  math,
  ACBrConsts, ACBrUtil;

{ TACBrEscDaruma }

constructor TACBrEscDaruma.Create(AOwner: TACBrPosPrinter);
begin
  inherited Create(AOwner);

  fpModeloStr := 'EscDaruma';

{(*}
  with Cmd  do
  begin
    Zera                    := ESC + '@';
    EspacoEntreLinhasPadrao := ESC + '2';
    EspacoEntreLinhas       := ESC + '3';
    FonteNormal             := ESC + '!' + #0;
    FonteA                  := DC4;
    FonteB                  := SI;
    LigaNegrito             := ESC + 'E';
    DesligaNegrito          := ESC + 'F';
    LigaExpandido           := ESC + 'W' + #1;
    DesligaExpandido        := ESC + 'W' + #0;
    LigaSublinhado          := ESC + '-' + #1;
    DesligaSublinhado       := ESC + '-' + #0;
    LigaItalico             := ESC + '4' + #1;
    DesligaItalico          := ESC + '4' + #0;
    LigaInvertido           := '';  // Existe ?
    DesligaInvertido        := '';  // Existe ?
    LigaCondensado          := SI;
    DesligaCondensado       := DC2;
    AlinhadoEsquerda        := ESC + 'j' + #0;
    AlinhadoCentro          := ESC + 'j' + #1;
    AlinhadoDireita         := ESC + 'j' + #2;
    CorteTotal              := ESC + 'm';
    CorteParcial            := ESC + 'm';
    AbreGaveta              := ESC + 'p';
    Beep                    := BELL;
  end;
  {*)}
end;

function TACBrEscDaruma.ComandoCodBarras(const ATag: String; ACodigo: AnsiString
  ): AnsiString;
var
  L, A, M : Integer ;
  CmdBarCode: Byte;
begin
  if ATag = cTagBarraEAN13 then
    CmdBarCode := 1
  else if ATag = cTagBarraEAN8 then
    CmdBarCode := 2
  else if ATag = cTagBarraStd then
    CmdBarCode := 3
  else if ATag = cTagBarraInter then
    CmdBarCode := 4
  else if (ATag = cTagBarraCode128)  or (ATag = cTagBarraCode128a) or
          (ATag = cTagBarraCode128b) or (ATag = cTagBarraCode128c) then
    CmdBarCode := 5
  else if ATag = cTagBarraCode39 then
    CmdBarCode := 6
  else if ATag = cTagBarraCode93 then
    CmdBarCode := 7
  else if ATag = cTagBarraUPCA then
    CmdBarCode := 8
  else if ATag = cTagBarraCodaBar then
    CmdBarCode := 9
  else if ATag = cTagBarraMSI then
    CmdBarCode := 10
  else if ATag = cTagBarraCode11 then
    CmdBarCode := 11
  else
  begin
    Result := ACodigo;
    Exit;
  end;

  with fpPosPrinter.ConfigBarras do
  begin
    L := IfThen( LarguraLinha = 0, 2, max(min(LarguraLinha,5),2) );
    A := IfThen( Altura = 0, 50, max(min(Altura,200),50) );
    M := IfThen( MostrarCodigo, 1, 0 );
  end ;

  Result := ESC + 'b' +
            AnsiChr( CmdBarCode ) +
            AnsiChr( L ) + // Largura
            AnsiChr( A ) + // Altura
            AnsiChr( M ) + // HRI (numero impresso abaixo do cod.barras)
            ACodigo +
            NUL;
end;

function TACBrEscDaruma.ComandoQrCode(ACodigo: AnsiString): AnsiString;
var
  iQtdBytes, bMenos, bMais, L: Integer;
  E: AnsiChar;
begin
  iQtdBytes      := Length(ACodigo);
  bMenos         := iQtdBytes shr 8;
  bMais          := iQtdBytes AND 255 + 2;

  with fpPosPrinter.ConfigQRCode do
  begin
    L := IfThen( LarguraModulo = 0, 5, max(min(LarguraModulo,7),4) );

    case ErrorLevel of
      1: E := 'M';
      2: E := 'Q';
      3: E := 'H';
    else
      E := #0;
    end;

    Result := ESC + #129 +
              AnsiChr(bMais) + AnsiChr(bMenos) +
              AnsiChr(L) + E + ACodigo;
  end;
end;

function TACBrEscDaruma.ComandoEspacoEntreLinhas(Espacos: Byte): AnsiString;
begin
  if Espacos = 0 then
    Result := Cmd.EspacoEntreLinhasPadrao
  else
    Result := Cmd.EspacoEntreLinhas + AnsiChr(Espacos);
end;

function TACBrEscDaruma.ComandoLogo: AnsiString;
begin
  Result := SYN + BS + SYN + TAB;  //TODO: Testar
end;

procedure TACBrEscDaruma.LerStatus(var AStatus: TACBrPosPrinterStatus);
var
  B: Byte;
  OldAtivo: Boolean;
begin
  if not fpPosPrinter.Device.IsSerialPort then exit;

  OldAtivo := fpPosPrinter.Ativo;
  try
    try
      fpPosPrinter.Ativo := True;
      B := Ord(fpPosPrinter.TxRx( ENQ )[1]);
      if TestBit(B, 0) then
        AStatus := AStatus + [stImprimindo];
      if TestBit(B, 3) then
        AStatus := AStatus + [stErro];
      if not TestBit(B, 4) then
        AStatus := AStatus + [stOffLine];
      if TestBit(B, 5) then
        AStatus := AStatus + [stSemPapel];
      if TestBit(B, 7) then
        AStatus := AStatus + [stTampaAberta];

      B := Ord(fpPosPrinter.TxRx( GS + ENQ )[1]);
      if TestBit(B, 0) then
        AStatus := AStatus + [stPoucoPapel];
      if TestBit(B, 1) then
        AStatus := AStatus + [stSemPapel];
      if TestBit(B, 3) then
        AStatus := AStatus + [stOffLine];
      if not TestBit(B, 4) then
        AStatus := AStatus + [stTampaAberta];  // Sem papel sobre o sensor
      if TestBit(B, 6) then
        AStatus := AStatus + [stErro];  // Impressora em falha
      if TestBit(B, 7) then
        AStatus := AStatus + [stGavetaAberta];  // Impressora em falha
    except
      AStatus := AStatus + [stErro];
    end;
  finally
    fpPosPrinter.Ativo := OldAtivo ;
  end;
end;

function TACBrEscDaruma.LerInfo: String;
var
  Ret, B: AnsiString;
  Info: String;
  OldAtivo: Boolean;

  Procedure AddInfo( Titulo: String; AInfo: AnsiString);
  begin
    Info := Info + Titulo+'='+copy(AInfo, 2, Length(AInfo)) + sLineBreak;
  end;

begin
  if not fpPosPrinter.Device.IsSerialPort then exit;

  OldAtivo := fpPosPrinter.Ativo;
  try
    fpPosPrinter.Ativo := True;
    Info := '';

    AddInfo('Fabricante', ':Daruma');

    Ret := fpPosPrinter.TxRx( ESC + #199, 13, 500, True );
    AddInfo('Firmware', Ret);

    Ret := fpPosPrinter.TxRx( ESC + #195, 13, 500, True );
    AddInfo('Modelo', Ret);

    //Ret := fpPosPrinter.TxRx( ESC + #199, 13, 500, True );  // N�o encontrado
    //AddInfo('Serial', ':');

    Ret := fpPosPrinter.TxRx( ESC + #229, 13, 500, True );
    Info := Info + 'Guilhotina='+Copy(Ret,9,1) + sLineBreak ;
    B := Copy(Ret,12,1);
    Info := Info + 'Colunas='+IntToStr(ifthen(B='0',48,ifthen(B='1',52,34))) + sLineBreak ;
    B := Copy(Ret,40,1);
    Info := Info + 'CodPage='+B + sLineBreak ;

    Result := Info;
  finally
    fpPosPrinter.Ativo := OldAtivo;
  end;
end;

end.

