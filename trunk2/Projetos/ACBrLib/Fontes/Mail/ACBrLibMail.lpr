{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Italo Jurisato Junior                           }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatuí - SP - 18270-170         }
{******************************************************************************}

{$I ACBr.inc}

library ACBrLibMail;

uses
  Interfaces, sysutils, Classes,
  ACBrLibConfig, ACBrLibComum,
  {$IFDEF MT}ACBrLibMailMT{$ELSE}ACBrLibMailST{$ENDIF},
  ACBrLibMailConfig, ACBrLibMailDataModule;

{$R *.res}

{$IFDEF DEBUG}
var
   HeapTraceFile: String;
{$ENDIF}

exports
  // Importadas de ACBrLibComum
  MAIL_Inicializar,
  MAIL_Finalizar,
  MAIL_Inicializada,
  MAIL_Nome,
  MAIL_Versao,
  MAIL_UltimoRetorno,
  MAIL_ImportarConfig,
  MAIL_ConfigLer,
  MAIL_ConfigGravar,
  MAIL_ConfigLerValor,
  MAIL_ConfigGravarValor,

  // Diversos
  MAIL_SetSubject,
  MAIL_AddAddress,
  MAIL_AddReplyTo,
  MAIL_AddCC,
  MAIL_AddBCC,
  MAIL_ClearAttachment,
  MAIL_AddAttachment,
  MAIL_AddBody,
  MAIL_AddAltBody,
  MAIL_SaveToFile,

  // Envio
  MAIL_Clear,
  MAIL_Send;

begin
  {$IFDEF DEBUG}
   HeapTraceFile := ExtractFilePath(ParamStr(0))+ 'heaptrclog.trc';
   DeleteFile( HeapTraceFile );
   SetHeapTraceOutput( HeapTraceFile );
  {$ENDIF}

  MainThreadID := GetCurrentThreadId();
end.

