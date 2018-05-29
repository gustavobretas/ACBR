﻿{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2018 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo: Rafael Teno Dias                                }

{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }

{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }

{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }

{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{        Rua Cel.Aureliano de Camargo, 973 - Tatuí - SP - 18270-170            }

{******************************************************************************}

{$I ACBr.inc}

unit ACBrLibReinfConsts;

interface

uses
  Classes, SysUtils;

const
  CLibReinfNome = 'ACBrLibReinf';
  CLibReinfVersao = '0.0.1';

  CSessaoRespEnvio = 'retornoLoteEventos';
  CSessaoRespEnvioideTransmissor = 'ideTransmissor';
  CSessaoRespEnviostatus = 'status';
  CSessaoRespEnvioocorrencias = 'ocorrencias';

  CSessaoRespEnvioevento = 'evento';
  CSessaoRespEnvioevtTotal = 'evtTotal';
  CSessaoRespEnvioinfoTotal = 'infoTotal';

  CSessaoRespConsulta = 'evtTotalContrib';
  CSessaoRespConsultainfoTotalContrib = 'infoTotalContrib';

  CSessaoRetornoideEvento = 'ideEvento';
  CSessaoRetornoideContri = 'ideContri';
  CSessaoRetornoideStatus = 'ideStatus';
  CSessaoRetornoregOcorrs = 'regOcorrs';
  CSessaoRetornoinfoRecEv = 'infoRecEv';

  CSessaoRetornoRTom = 'RTom';
  CSessaoRetornoinfoCRTom = 'infoCRTom';
  CSessaoRetornoRPrest = 'RPrest';
  CSessaoRetornoRRecRepAD = 'RRecRepAD'; //n
  CSessaoRetornoRComl = 'RComl'; //n
  CSessaoRetornoRCPRB = 'RCPRB'; //n
  CSessaoRetornoRRecEspetDesp = 'RRecEspetDesp';

implementation

end.

