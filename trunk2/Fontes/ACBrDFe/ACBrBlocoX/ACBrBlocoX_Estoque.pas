﻿{******************************************************************************}
{ Projeto: Componente ACBrBlocoX                                               }
{ Biblioteca multiplataforma de componentes Delphi para Geração de arquivos    }
{ do Bloco X                                                                   }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
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
{******************************************************************************}

{$I ACBr.inc}

unit ACBrBlocoX_Estoque;

interface

uses
  ACBrBlocoX_Comum, Classes, SysUtils, StrUtils;

type
  TACBrBlocoX_Estoque = class(TACBrBlocoX_BaseFile)
  private
    FDataReferenciaFinal: TDateTime;
    FDataReferenciaInicial: TDateTime;
    FProdutos: TACBrBlocoX_Produtos;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    procedure GerarXML(const Assinar: Boolean = True); override;
    procedure SaveToFile(const AXmlFileName: string); override;

    property DataReferenciaInicial: TDateTime read FDataReferenciaInicial write FDataReferenciaInicial;
    property DataReferenciaFinal: TDateTime read FDataReferenciaFinal write FDataReferenciaFinal;
    property Produtos: TACBrBlocoX_Produtos read FProdutos write FProdutos;
  end;

implementation

uses
  ACBrBlocoX, ACBrUtil, pcnConversao, pcnGerador;

{ TACBrBlocoX_Estoque }

constructor TACBrBlocoX_Estoque.Create(AOwner: TComponent);
begin
  inherited;
  FProdutos := TACBrBlocoX_Produtos.Create(Self, TACBrBlocoX_Produto);
end;

destructor TACBrBlocoX_Estoque.Destroy;
begin
  FProdutos.Free;
  inherited;
end;

procedure TACBrBlocoX_Estoque.GerarXML(const Assinar: Boolean);
var
  I: Integer;
begin
  FXMLOriginal := '';
  FXMLAssinado := '';
  FGerador.ArquivoFormatoXML := '';

  FGerador.wGrupo(ENCODING_UTF8, '', False);
  FGerador.wGrupo('Estoque Versao="1.0"');
  FGerador.wGrupo('Mensagem');

  GerarDadosEstabelecimento;
  GerarDadosPafECF;

  FGerador.wGrupo('DadosEstoque');
  FGerador.wCampo(tcStr, '', 'DataReferenciaInicial', 0, 0, 1, FormatDateBr(DataReferenciaInicial));
  FGerador.wCampo(tcStr, '', 'DataReferenciaFinal', 0, 0, 1, FormatDateBr(DataReferenciaFinal));

  if Produtos.Count > 0 then
  begin
    FGerador.wGrupo('Produtos');
    for I := 0 to Produtos.Count - 1 do
    begin
      FGerador.wGrupo('Produto');
      FGerador.wCampo(tcStr, '', 'Descricao', 0, 0, 1, Produtos[I].Descricao);
      FGerador.wCampo(tcStr, '', 'Codigo', 0, 0, 1, Produtos[I].Codigo.Numero, '', True, 'Tipo="' + TipoCodigoToStr(Produtos[I].Codigo.Tipo) + '"');
      FGerador.wCampo(tcStr, '', 'Quantidade', 1, 20, 1, Produtos[I].Quantidade);
      FGerador.wCampo(tcStr, '', 'Unidade', 0, 0, 1, Produtos[I].Unidade);
      FGerador.wCampo(tcStr, '', 'ValorUnitario', 1, 20, 1, FloatToIntStr(Produtos[I].ValorUnitario, 2));
      FGerador.wCampo(tcStr, '', 'SituacaoTributaria', 1, 1, 1, SituacaoTributariaToStr(Produtos[I].SituacaoTributaria));
      FGerador.wCampo(tcStr, '', 'Aliquota', 4, 4, 1, FloatToIntStr(Produtos[I].Aliquota, 2));
      FGerador.wCampo(tcStr, '', 'IndicadorArredondamento', 1, 1, 1, IfThen(Produtos[I].IndicadorArredondamento, '1', '0'));
      FGerador.wCampo(tcStr, '', 'Ippt', 1, 1, 1, IpptToStr(Produtos[I].Ippt));
      FGerador.wCampo(tcStr, '', 'SituacaoEstoque', 1, 1, 1, IfThen(Produtos[I].Quantidade >= 0, 'P', 'N'));
      FGerador.wGrupo('/Produto');
    end;
    FGerador.wGrupo('/Produtos');
  end;

  FGerador.wGrupo('/DadosEstoque');
  FGerador.wGrupo('/Mensagem');
  FGerador.wGrupo('/Estoque');

  FXMLOriginal := ConverteXMLtoUTF8(FGerador.ArquivoFormatoXML);
  if Assinar then
    FXMLAssinado := TACBrBlocoX(FACBrBlocoX).SSL.Assinar(FXMLOriginal, 'Estoque', '/Estoque');
end;

procedure TACBrBlocoX_Estoque.SaveToFile(const AXmlFileName: string);
begin
  GerarXML;
  WriteToTXT(AXmlFileName, FXMLAssinado, False, True);
end;

end.

