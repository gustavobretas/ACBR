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

unit ACBrNFSeXDANFSeRLClass;

interface

uses
  Dialogs, Forms, SysUtils, Classes,
  ACBrBase,
  ACBrNFSeXClass, ACBrNFSeXDANFSeClass;

type
  {$IFDEF RTL230_UP}
  [ComponentPlatformsAttribute(piacbrAllPlatforms)]
  {$ENDIF RTL230_UP}
  TACBrNFSeXDANFSeRL = class(TACBrNFSeXDANFSeClass)
  protected
    FDetalharServico: Boolean;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure ImprimirDANFSe(NFSe: TNFSe = nil); override;
    procedure ImprimirDANFSePDF(NFSe: TNFSe = nil); overload; override;
    procedure ImprimirDANFSePDF(AStream: TStream; NFSe: TNFSe = nil); overload; override;

  published
    property DetalharServico: Boolean read FDetalharServico write FDetalharServico default False;
  end;

implementation

uses
  ACBrUtil.FilesIO,
  ACBrNFSeX, ACBrNFSeXConversao, ACBrNFSeXDANFSeRL,
  ACBrNFSeXDANFSeRLRetrato, ACBrNFSeXDANFSeRLSimplISS;

constructor TACBrNFSeXDANFSeRL.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  FDetalharServico := False;
end;

destructor TACBrNFSeXDANFSeRL.Destroy;
begin
  inherited Destroy;
end;

procedure TACBrNFSeXDANFSeRL.ImprimirDANFSe(NFSe: TNFSe);
var
  i: Integer;
  Notas: array of TNFSe;
  fqrXDANFSeRLRetrato: TfrlXDANFSeRL;
begin
  case TACBrNFSeX(ACBrNFSe).Configuracoes.Geral.Provedor of
    proSimplISS:
      fqrXDANFSeRLRetrato := TfrlXDANFSeRLSimplISS.Create(Self);
  else
    fqrXDANFSeRLRetrato := TfrlXDANFSeRLRetrato.Create(Self);
  end;

  fqrXDANFSeRLRetrato.QuebradeLinha(TACBrNFSeX(ACBrNFSe).Provider.ConfigGeral.QuebradeLinha);

  if (NFSe = nil) then
  begin
    SetLength(Notas, TACBrNFSeX(ACBrNFSe).NotasFiscais.Count);

    for i := 0 to (TACBrNFSeX(ACBrNFSe).NotasFiscais.Count - 1) do
      Notas[i] := TACBrNFSeX(ACBrNFSe).NotasFiscais.Items[i].NFSe;
  end
  else
  begin
    SetLength(Notas, 1);
    Notas[0] := NFSe;
  end;

  fqrXDANFSeRLRetrato.Imprimir(Self, Notas);

  fqrXDANFSeRLRetrato.Free;
end;

procedure TACBrNFSeXDANFSeRL.ImprimirDANFSePDF(NFSe: TNFSe);
var
  i: integer;
  fqrXDANFSeRLRetrato: TfrlXDANFSeRL;
begin
  case TACBrNFSeX(ACBrNFSe).Configuracoes.Geral.Provedor of
    proSimplISS:
      fqrXDANFSeRLRetrato := TfrlXDANFSeRLSimplISS.Create(Self);
  else
    fqrXDANFSeRLRetrato := TfrlXDANFSeRLRetrato.Create(Self);
  end;

  fqrXDANFSeRLRetrato.QuebradeLinha(TACBrNFSeX(ACBrNFSe).Provider.ConfigGeral.QuebradeLinha);

  if NFSe = nil then
  begin
    for i := 0 to TACBrNFSeX(ACBrNFSe).NotasFiscais.Count - 1 do
    begin
      FPArquivoPDF := DefinirNomeArquivo(Self.PathPDF,
       TACBrNFSeX(ACBrNFSe).NumID[TACBrNFSeX(ACBrNFSe).NotasFiscais.Items[i].NFSe] + '-nfse.pdf',
       self.NomeDocumento);

      fqrXDANFSeRLRetrato.SalvarPDF(Self, TACBrNFSeX(ACBrNFSe).NotasFiscais.Items[i].NFSe, FPArquivoPDF);
    end;
  end
  else
  begin
    FPArquivoPDF := DefinirNomeArquivo(Self.PathPDF,
     TACBrNFSeX(ACBrNFSe).NumID[NFSe] + '-nfse.pdf', self.NomeDocumento);

    fqrXDANFSeRLRetrato.SalvarPDF(Self, NFSe, FPArquivoPDF);
  end;

  fqrXDANFSeRLRetrato.Free;
end;

procedure TACBrNFSeXDANFSeRL.ImprimirDANFSePDF(AStream: TStream; NFSe: TNFSe);
var
  i: integer;
  fqrXDANFSeRLRetrato: TfrlXDANFSeRL;
begin
  case TACBrNFSeX(ACBrNFSe).Configuracoes.Geral.Provedor of
    proSimplISS:
      fqrXDANFSeRLRetrato := TfrlXDANFSeRLSimplISS.Create(Self);
  else
    fqrXDANFSeRLRetrato := TfrlXDANFSeRLRetrato.Create(Self);
  end;

  fqrXDANFSeRLRetrato.QuebradeLinha(TACBrNFSeX(ACBrNFSe).Provider.ConfigGeral.QuebradeLinha);

  if NFSe = nil then
  begin
    for i := 0 to TACBrNFSeX(ACBrNFSe).NotasFiscais.Count - 1 do
      fqrXDANFSeRLRetrato.SalvarPDF(Self, TACBrNFSeX(ACBrNFSe).NotasFiscais.Items[i].NFSe, AStream);
  end
  else
  begin
    fqrXDANFSeRLRetrato.SalvarPDF(Self, NFSe, AStream);
  end;

  fqrXDANFSeRLRetrato.Free;
end;

end.
