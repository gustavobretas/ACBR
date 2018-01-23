{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                             }

{ Direitos Autorais Reservados (c) 2017 Leivio Ramos de Fontenele              }
{                                                                              }

{ Colaboradores nesse arquivo:                                                 }

{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }


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
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Leivio Ramos de Fontenele  -  leivio@yahoo.com.br                            }
{******************************************************************************}
{******************************************************************************
|* Historico
|*
|* 24/10/2017: Renato Rubinho
|*  - Compatibilizado Fonte com Delphi 7
*******************************************************************************}

{$I ACBr.inc}
unit ACBrReinfReg;

interface

uses
  SysUtils, Classes, ACBrReinf, pcnConversao,
{$IFDEF FPC}
  LResources, LazarusPackageIntf, PropEdits, componenteditors
{$ELSE}
{$IFNDEF COMPILER6_UP}
  DsgnIntf
{$ELSE}
  DesignIntf,
  DesignEditors
{$ENDIF}
{$ENDIF};

procedure Register;

implementation

uses
  ACBrReg, ACBrDFeConfiguracoes, ACBrReinfConfiguracoes;

//{$IFNDEF FPC}
//{$R ACBrNFSe.dcr}
//{$ENDIF}

procedure Register;
begin

  RegisterComponents('ACBrReinf', [TACBrReinf]);

  RegisterPropertyEditor(TypeInfo(TCertificadosConf), TConfiguracoes, 'Certificados', TClassProperty);

  RegisterPropertyEditor(TypeInfo(TConfiguracoes), TACBrReinf, 'Configuracoes', TClassProperty);

  RegisterPropertyEditor(TypeInfo(TWebServicesConf), TConfiguracoes, 'WebServices', TClassProperty);

  RegisterPropertyEditor(TypeInfo(TConfiguracoesReinf), TConfiguracoes, 'Geral', TClassProperty);

  RegisterPropertyEditor(TypeInfo(String), TConfiguracoesReinf, 'PathSalvar', TACBrDirProperty);

  RegisterPropertyEditor(TypeInfo(TConfiguracoesReinf), TConfiguracoes, 'Arquivos', TClassProperty);
end;

{$IFDEF FPC}

initialization

//{$I ACBrNFSe.lrs}
{$ENDIF}

end.
