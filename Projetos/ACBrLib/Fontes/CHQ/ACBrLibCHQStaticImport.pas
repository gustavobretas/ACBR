﻿{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Rafael Teno Dias                                }
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

unit ACBrLibCHQStaticImport;

{$IfDef FPC}
{$mode objfpc}{$H+}
{$EndIf}

{.$Define STDCALL}

interface

uses
  Classes, SysUtils;

const
 {$IfDef MSWINDOWS}
  {$IfDef CPU64}
  CACBrCHQLIBName = 'ACBrCHQ64.dll';
  {$Else}
  CACBrCHQLIBName = 'ACBrCHQ32.dll';
  {$EndIf}
 {$Else}
  {$IfDef CPU64}
  CACBrCHQLIBName = 'ACBrCHQ64.so';
  {$Else}
  CACBrCHQLIBName = 'ACBrCHQ32.so';

  {$EndIf}
 {$EndIf}

{$I ACBrLibErros.inc}

{%region Constructor/Destructor}
function CHQ_Inicializar(const eArqConfig, eChaveCrypt: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;

function CHQ_Finalizar: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
{%endregion}

{%region Versao/Retorno}
function CHQ_Nome(const sNome: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;

function CHQ_Versao(const sVersao: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;

function CHQ_UltimoRetorno(const sMensagem: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
{%endregion}

{%region Ler/Gravar Config }
function CHQ_ConfigLer(const eArqConfig: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;

function CHQ_ConfigGravar(const eArqConfig: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;

function CHQ_ConfigLerValor(const eSessao, eChave: PChar; sValor: PChar; var esTamanho: longint): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;

function CHQ_ConfigGravarValor(const eSessao, eChave, eValor: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
{%endregion}

{%region Cheque}
function CHQ_Ativar: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_Desativar: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_ImprimirCheque: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_ImprimirLinha(const eLinha: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_ImprimirVerso(const eLinhas: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_TravarCheque: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_DestravarCheque: longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_SetBanco(const eBanco: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_SetValor(const Valor: Double): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_SetData(const Data: TDateTime): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_SetCidade(const eCidade: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_SetFavorecido(const eFavorecido: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_SetObservacao(const eObservacao: PChar): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
function CHQ_SetBomPara(const BomPara: TDateTime): longint;
  {$IfDef STDCALL} stdcall{$Else} cdecl{$EndIf}; external CACBrCHQLIBName;
{%endregion}

implementation

end.
