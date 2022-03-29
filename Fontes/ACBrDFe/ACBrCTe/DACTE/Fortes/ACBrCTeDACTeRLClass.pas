{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Italo Jurisato Junior                           }
{                              Mark dos Santos Gon�alves                       }
{                              Juliomar Marchetti                              }
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

unit ACBrCTeDACTeRLClass;

interface

{$H+}

uses
  Forms, SysUtils, Classes, ACBrBase,
  pcnConversao, pcteCTe, ACBrCTeDACTEClass, RLTypes;

type

  { TACBrCTeDACTeRL }
  {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(piacbrAllPlatforms)]
  {$ENDIF RTL230_UP}
  TACBrCTeDACTeRL = class(TACBrCTeDACTeClass)
  protected
     FPrintDialog: Boolean;
  public
    constructor Create(AOwner: TComponent); override;
    procedure ImprimirDACTe(ACTe: TCTe = nil); override;
    procedure ImprimirDACTePDF(ACTe: TCTe = nil); override;
    procedure ImprimirEVENTO(ACTe: TCTe = nil); override;
    procedure ImprimirEVENTOPDF(ACTe: TCTe = nil); override;
    procedure ImprimirINUTILIZACAO(ACTe: TCTe = nil); override;
    procedure ImprimirINUTILIZACAOPDF(ACTe: TCTe = nil); override;
  published
    property PrintDialog: Boolean read FPrintDialog write FPrintDialog;
  end;

implementation

uses
  StrUtils, Dialogs,
  ACBrUtil.Strings,
  ACBrUtil.FilesIO,
  ACBrCTe, pcteEnvEventoCTe,
  ACBrCTeDAInutRL, ACBrCTeDAInutRLRetrato,
  ACBrCTeDACTeRL, ACBrCTeDACTeRLRetrato, ACBrCTeDACTeRLRetratoA5,
  ACBrCTeDAEventoRL, ACBrCTeDAEventoRLRetrato;

constructor TACBrCTeDACTeRL.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPrintDialog := True;
end;

procedure TACBrCTeDACTeRL.ImprimirDACTe(ACTe: TCTe = nil);
var
  i: integer;
  Conhecimentos: array of TCTe;
begin

  if ACTe = nil then
  begin
    SetLength(Conhecimentos, TACBrCTe(ACBrCTe).Conhecimentos.Count);

    for i := 0 to TACBrCTe(ACBrCTe).Conhecimentos.Count - 1 do
    begin
      Conhecimentos[i] := TACBrCTe(ACBrCTe).Conhecimentos.Items[i].CTe;
    end;
  end
  else
  begin
    SetLength(Conhecimentos, 1);
    Conhecimentos[0] := ACTe;
  end;

  case TamanhoPapel of
    tpA5: TfrmDACTeRLRetratoA5.Imprimir(Self, Conhecimentos);
    else TfrmDACTeRLRetrato.Imprimir(Self, Conhecimentos);
  end;
end;

procedure TACBrCTeDACTeRL.ImprimirDACTePDF(ACTe: TCTe = nil);
var
  i: integer;
begin

  FPArquivoPDF := '';
  if ACTe = nil then
  begin
    for i := 0 to TACBrCTe(ACBrCTe).Conhecimentos.Count - 1 do
    begin
      if trim(TACBrCTe(ACBrCTe).DACTE.NomeDocumento) <> '' then
      begin
        FPArquivoPDF := PathWithDelim(TACBrCTe(ACBrCTe).DACTE.PathPDF) + TACBrCTe(ACBrCTe).DACTE.NomeDocumento;
      end
      else
      begin
        FPArquivoPDF := PathWithDelim(TACBrCTe(ACBrCTe).DACTE.PathPDF) +
          OnlyNumber(TACBrCTe(ACBrCTe).Conhecimentos.Items[i].CTe.infCTe.ID) + '-cte.pdf';
      end;

      TACBrCTe(ACBrCTE).Conhecimentos.Items[i].NomeArqPDF := FPArquivoPDF;
//      if i < TACBrCTe(ACBrCTe).Conhecimentos.Count - 1 then
//        FPArquivoPDF := FPArquivoPDF + sLinebreak;

      case TamanhoPapel of
        tpA5: TfrmDACTeRLRetratoA5.SalvarPDF(Self, TACBrCTe(ACBrCTe).Conhecimentos.Items[i].CTe, FPArquivoPDF);
        else TfrmDACTeRLRetrato.SalvarPDF(Self, TACBrCTe(ACBrCTe).Conhecimentos.Items[i].CTe, FPArquivoPDF);
      end;
    end;
  end
  else
  begin
    FPArquivoPDF := PathWithDelim(TACBrCTe(ACBrCTe).DACTE.PathPDF) +
                    OnlyNumber(ACTe.infCTe.ID) + '-cte.pdf';

    case TamanhoPapel of
        tpA5: TfrmDACTeRLRetratoA5.SalvarPDF(Self, ACTe, FPArquivoPDF);
        else TfrmDACTeRLRetrato.SalvarPDF(Self, ACTe, FPArquivoPDF);
    end;
  end;
end;

procedure TACBrCTeDACTeRL.ImprimirEVENTO(ACTe: TCTe);
var
  i, j: integer;
  Impresso: boolean;
begin
  if TACBrCTe(ACBrCTe).Conhecimentos.Count > 0 then
  begin
    for i := 0 to (TACBrCTe(ACBrCTe).EventoCTe.Evento.Count - 1) do
    begin
      Impresso := False;
      for j := 0 to (TACBrCTe(ACBrCTe).Conhecimentos.Count - 1) do
      begin
        if OnlyNumber(TACBrCTe(ACBrCTe).Conhecimentos.Items[j].CTe.infCTe.Id) = TACBrCTe(ACBrCTe).EventoCTe.Evento.Items[i].InfEvento.chCTe then
        begin
          TfrmCTeDAEventoRLRetrato.Imprimir(Self, TACBrCTe(ACBrCTe).EventoCTe.Evento.Items[i],
            TACBrCTe(ACBrCTe).Conhecimentos.Items[j].CTe);
          Impresso := True;
          Break;
        end;
      end;

      if Impresso = False then
      begin
        TfrmCTeDAEventoRLRetrato.Imprimir(Self, TACBrCTe(ACBrCTe).EventoCTe.Evento.Items[i]);
      end;
    end;
  end
  else
  begin
    for i := 0 to (TACBrCTe(ACBrCTe).EventoCTe.Evento.Count - 1) do
    begin
      TfrmCTeDAEventoRLRetrato.Imprimir(Self, TACBrCTe(ACBrCTe).EventoCTe.Evento.Items[i], ACTe);
    end;
  end;
end;

procedure TACBrCTeDACTeRL.ImprimirEVENTOPDF(ACTe: TCTe);
var
  Impresso: Boolean;
  I, J: Integer;
  NumID, ArqPDF: String;

  function ImprimirEVENTOPDFTipo(EventoNFeItem: TInfEventoCollectionItem; ACTe: TCTe): String;
  begin
    Result := Self.PathPDF + OnlyNumber(EventoNFeItem.InfEvento.id) + '-procEventoCTe.pdf';

    // TipoDANFE ainda n�o est� sendo utilizado no momento
    TfrmCTeDAEventoRLRetrato.SalvarPDF(Self, EventoNFeItem, Result, ACTe);
  end;

begin
  FPArquivoPDF := '';

  with TACBrCTe(ACBrCTe) do
  begin
    if (ACTe = nil) and (Conhecimentos.Count > 0) then
    begin
      for i := 0 to (EventoCTe.Evento.Count - 1) do
      begin
        Impresso := False;
        ArqPDF := '';
        for j := 0 to (Conhecimentos.Count - 1) do
        begin
          NumID := OnlyNumber(Conhecimentos.Items[j].CTe.infCTe.ID);
          if (NumID = OnlyNumber(EventoCTe.Evento.Items[i].InfEvento.chCTe)) then
          begin
            ArqPDF := ImprimirEVENTOPDFTipo(EventoCTe.Evento.Items[i], Conhecimentos.Items[j].CTe);
            Impresso := True;
            Break;
          end;
        end;

        if (not Impresso) then
          ArqPDF := ImprimirEVENTOPDFTipo(EventoCTe.Evento.Items[i], nil);

        FPArquivoPDF := FPArquivoPDF + ArqPDF;
        if (i < (EventoCTe.Evento.Count - 1)) then
          FPArquivoPDF := FPArquivoPDF + sLinebreak;
      end;
    end
    else
    begin
      for i := 0 to (EventoCTe.Evento.Count - 1) do
      begin
        ArqPDF := ImprimirEVENTOPDFTipo(EventoCTe.Evento.Items[i], ACTe);
        FPArquivoPDF := FPArquivoPDF + ArqPDF;
        if (i < (EventoCTe.Evento.Count - 1)) then
          FPArquivoPDF := FPArquivoPDF + sLinebreak;
      end;
    end;
  end;
end;

procedure TACBrCTeDACTeRL.ImprimirINUTILIZACAO(ACTe: TCTe);
begin
  TfrmCTeDAInutRLRetrato.Imprimir(Self, TACBrCTe(ACBrCTe).InutCTe, ACTe);
end;

procedure TACBrCTeDACTeRL.ImprimirINUTILIZACAOPDF(ACTe: TCTe);
begin
  FPArquivoPDF := StringReplace(TACBrCTe(ACBrCTe).InutCTe.ID, 'ID', '', [rfIgnoreCase]);
  FPArquivoPDF := PathWithDelim(Self.PathPDF) + FPArquivoPDF + '-procInutCTe.pdf';
  TfrmCTeDAInutRLRetrato.SalvarPDF(Self, TACBrCTe(ACBrCTe).InutCTe, FPArquivoPDF, ACTe);
end;

end.
