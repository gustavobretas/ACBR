﻿{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2022 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Elton Barbosa                                   }
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

unit ACBrLibNCMsDataModule;

{$mode delphi}

interface

uses
  Classes, SysUtils, FileUtil, ACBrLibComum, ACBrLibDataModule, ACBrLibConfig, ACBrNCMs;

type

  { TLibNCMsDM }

  TLibNCMsDM = class(TLibDataModule)
    ACBrNCMs1: TACBrNCMs;
  private
  public
    procedure AplicarConfiguracoes; override;
  end;

implementation

uses
  ACBrLibNCMsConfig;

{$R *.lfm}

{ TLibNCMsDM }

procedure TLibNCMsDM.AplicarConfiguracoes;
var
  pLibConfig: TLibNCMsConfig;
begin
  pLibConfig := TLibNCMsConfig(Lib.Config);

  ACBrNCMs1.ProxyHost  := pLibConfig.NCMsConfig.ServidorProxy;
  ACBrNCMs1.ProxyPort  := pLibConfig.NCMsConfig.PortaProxy;
  ACBrNCMs1.ProxyUser  := pLibConfig.NCMsConfig.UsuarioProxy;
  ACBrNCMs1.ProxyPass  := pLibConfig.NCMsConfig.SenhaProxy;
  ACBrNCMs1.CacheDiasValidade := pLibConfig.NCMsConfig.DiasValidadeCache;
  ACBrNCMs1.CacheArquivo      := pLibConfig.NCMsConfig.ArquivoCache;
end;

end.

