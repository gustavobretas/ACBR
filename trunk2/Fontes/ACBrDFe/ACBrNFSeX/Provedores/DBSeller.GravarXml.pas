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

unit DBSeller.GravarXml;

interface

uses
  SysUtils, Classes, StrUtils,
  ACBrNFSeXGravarXml_ABRASFv1, ACBrNFSeXGravarXml_ABRASFv2;

type
  { TNFSeW_DBSeller }

  TNFSeW_DBSeller = class(TNFSeW_ABRASFv1)
  protected
    procedure Configuracao; override;

  end;

  { TNFSeW_DBSeller204 }

  TNFSeW_DBSeller204 = class(TNFSeW_ABRASFv2)
  protected
    procedure Configuracao; override;

  end;

implementation

//==============================================================================
// Essa unit tem por finalidade exclusiva gerar o XML do RPS do provedor:
//     DBSeller
//==============================================================================

{ TNFSeW_DBSeller }

procedure TNFSeW_DBSeller.Configuracao;
begin
  inherited Configuracao;

  NrOcorrRegimeEspecialTributacao := -1;
end;

{ TNFSeW_DBSeller204 }

procedure TNFSeW_DBSeller204.Configuracao;
begin
  inherited Configuracao;

  TagTomador := 'TomadorServico';

  NrOcorrCodigoPaisTomador := -1;
  NrOcorrCodigoPaisServico := -1;

  NrOcorrValorDeducoes := 1;
  NrOcorrValorISS := 1;
  NrOcorrAliquota := 1;
  NrOcorrDescIncond := 1;
  NrOcorrDescCond := 1;
  NrOcorrOutrasRet := 1;
  NrOcorrValTotTrib := 1;
  NrOcorrValorPis := 1;
  NrOcorrValorCofins := 1;
  NrOcorrValorInss := 1;
  NrOcorrValorIr := 1;
  NrOcorrValorCsll := 1;
end;

end.
