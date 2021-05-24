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

unit Sigep.GravarXml;

interface

uses
{$IFDEF FPC}
  LResources, Controls, Graphics, Dialogs,
{$ENDIF}
  SysUtils, Classes, StrUtils,
  ACBrXmlBase, ACBrXmlDocument,
  ACBrNFSeXParametros, ACBrNFSeXGravarXml_ABRASFv2, ACBrNFSeXConversao,
  ACBrNFSeXConsts;

type
  { TNFSeW_Sigep }

  TNFSeW_Sigep = class(TNFSeW_ABRASFv2)
  protected
    function GerarStatus: TACBrXmlNode; override;
    function GerarTipoRPS: TACBrXmlNode; override;

    procedure Configuracao; override;

  end;

implementation

//==============================================================================
// Essa unit tem por finalidade exclusiva gerar o XML do RPS do provedor:
//     Sigep
//==============================================================================

{ TNFSeW_Sigep }

procedure TNFSeW_Sigep.Configuracao;
begin
  // Executa a Configura��o Padr�o
  inherited Configuracao;

  // Altera a Configura��o Padr�o para gerar o XML do RPS
  FormatoEmissao := tcDatHor;
  FormatoCompetencia := tcDatHor;

  NrMinExigISS := 2;
  NrMaxExigISS := 2;

  NrOcorrTipoLogradouro := 0;
  NrOcorrLogradouro := 0;
  NrOcorrDDD := 0;
  NrOcorrTipoTelefone := 0;

  NrOcorrCompetencia := -1;
  NrOcorrEndereco := -1;
  NrOcorrSerieRPS := -1;
  NrOcorrValorISS := -1;
  NrOcorrIssRetido := -1;
  NrOcorrRespRetencao := -1;
  NrOcorrCodigoPaisServico := -1;
  NrOcorrCodigoPaisTomador := -1;
  NrOcorrMunIncid := -1;
  NrOcorrRegimeEspecialTributacao := -1;
  NrOcorrOptanteSimplesNacional := -1;
  NrOcorrIncentCultural := -1;
end;

function TNFSeW_Sigep.GerarStatus: TACBrXmlNode;
begin
  Result := AddNode(tcStr, '#9', 'Status', 2, 2, 1, 'CO', DSC_INDSTATUS);
end;

function TNFSeW_Sigep.GerarTipoRPS: TACBrXmlNode;
begin
  Result := AddNode(tcStr, '#3', 'Tipo', 2, 2, 1, 'R1', DSC_TIPORPS);
end;

end.
