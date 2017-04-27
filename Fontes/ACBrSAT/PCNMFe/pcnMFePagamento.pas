{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2017 Andr� Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{  Esse arquivo usa a classe  PCN (c) 2009 - Paulo Casagrande                  }
{  PCN - Projeto Cooperar NFe       (Found at URL:  www.projetocooperar.org)   }
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
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{$I ACBr.inc}

unit pcnMFePagamento
;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnIntegradorResposta;

type

  { TEnviarPagamento }
  TEnviarPagamento = class(TPersistent)
  private
    FIdentificador: Integer;
    FChaveAcessoValidador: String;
    FChaveRequisicao: String;
    FEstabelecimento: String;
    FSerialPOS: String;
    FCNPJ: String;
    FIcmsBase: Currency;
    FValorTotalVenda: Currency;
    FHabilitarMultiplosPagamentos: Boolean;
    FHabilitarControleAntiFraude: Boolean;
    FCodigoMoeda: String;
    FEmitirCupomNFCE: Boolean;
    FOrigemPagamento: String;

    function GetXMLString: AnsiString;
    procedure SetXMLString(AValue : AnsiString) ;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear ;

    property AsXMLString : AnsiString read GetXMLString write SetXMLString ;
  published
    property Identificador: Integer read FIdentificador write FIdentificador;
    property ChaveAcessoValidador: String read FChaveAcessoValidador write FChaveAcessoValidador;
    property ChaveRequisicao: String read FChaveRequisicao write FChaveRequisicao;
    property Estabelecimento: String read FEstabelecimento write FEstabelecimento;
    property SerialPOS: String read FSerialPOS write FSerialPOS;
    property CNPJ: String read FCNPJ write FCNPJ;
    property IcmsBase: Currency read FIcmsBase write FIcmsBase;
    property ValorTotalVenda: Currency read FValorTotalVenda write FValorTotalVenda;
    property HabilitarMultiplosPagamentos: Boolean read FHabilitarMultiplosPagamentos write FHabilitarMultiplosPagamentos;
    property HabilitarControleAntiFraude: Boolean read FHabilitarControleAntiFraude write FHabilitarControleAntiFraude;
    property CodigoMoeda: String read FCodigoMoeda write FCodigoMoeda;
    property EmitirCupomNFCE: Boolean read FEmitirCupomNFCE write FEmitirCupomNFCE;
    property OrigemPagamento: String read FOrigemPagamento write FOrigemPagamento;
  end;

  { TRespostaPagamento }
  TRespostaPagamento = class(TPersistent)
  private
    FIntegradorResposta : TIntegradorResposta;
    FIDPagamento: Integer;
    FMensagem: String;
    FStatusPagamento: String;

    procedure SetXMLString(AValue: AnsiString);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    property AsXMLString : AnsiString  write SetXMLString ;
  published
    property IntegradorResposta: TIntegradorResposta read FIntegradorResposta write FIntegradorResposta;
    property IDPagamento: Integer read FIDPagamento write FIDPagamento;
    property Mensagem: String read FMensagem write FMensagem;
    property StatusPagamento: String read FStatusPagamento write FStatusPagamento;
  end;

  { TVerificarStatusValidador }
  TVerificarStatusValidador = class(TPersistent)
  private
    FIdentificador: Integer;
    FChaveAcessoValidador: String;
    FIDFila: Integer;
    FCNPJ: String;

    function GetXMLString: AnsiString;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear ;

    property AsXMLString : AnsiString read GetXMLString ;
  published
    property Identificador: Integer read FIdentificador write FIdentificador;
    property ChaveAcessoValidador: String read FChaveAcessoValidador write FChaveAcessoValidador;
    property IDFila: Integer read FIDFila write FIDFila;
    property CNPJ: String read FCNPJ write FCNPJ;
  end;

  { TRespostaVerificarStatusValidador }
  TRespostaVerificarStatusValidador = class(TPersistent)
  private
    FIntegradorResposta : TIntegradorResposta;
    FCodigoAutorizacao : String;
    FBin : String;
    FDonoCartao : String;
    FDataExpiracao : String;
    FInstituicaoFinanceira : String;
    FParcelas : Integer;
    FUltimosQuatroDigitos : Integer;
    FCodigoPagamento : String;
    FValorPagamento : Currency;
    FIDFila : Integer;
    FTipo : String;

    procedure SetXMLString(AValue: AnsiString);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Clear;

    property AsXMLString : AnsiString  write SetXMLString ;
  published
    property IntegradorResposta: TIntegradorResposta read FIntegradorResposta write FIntegradorResposta;
    property CodigoAutorizacao: String read FCodigoAutorizacao write FCodigoAutorizacao;
    property Bin: String read FBin write FBin;
    property DonoCartao: String read FDonoCartao write FDonoCartao;
    property DataExpiracao: String read FDataExpiracao write FDataExpiracao;
    property InstituicaoFinanceira: String read FInstituicaoFinanceira write FInstituicaoFinanceira;
    property Parcelas: Integer read FParcelas write FParcelas;
    property UltimosQuatroDigitos: Integer read FUltimosQuatroDigitos write FUltimosQuatroDigitos;
    property CodigoPagamento: String read FCodigoPagamento write FCodigoPagamento;
    property ValorPagamento: Currency read FValorPagamento write FValorPagamento;
    property IDFila: Integer read FIDFila write FIDFila;
    property Tipo: String read FTipo write FTipo;
  end;

implementation

Uses pcnMFePagamentoW, pcnMFePagamentoR ;

{ TRespostaVerificarStatusValidador }

procedure TRespostaVerificarStatusValidador.SetXMLString(AValue: AnsiString);
var
 LocRespostaVerificarStatusValidadorR : TRespostaVerificarStatusValidadorR;
begin
  LocRespostaVerificarStatusValidadorR := TRespostaVerificarStatusValidadorR.Create(Self);
  try
    LocRespostaVerificarStatusValidadorR.Leitor.Arquivo := AValue;
    LocRespostaVerificarStatusValidadorR.LerXml;
  finally
    LocRespostaVerificarStatusValidadorR.Free
  end;
end;

constructor TRespostaVerificarStatusValidador.Create;
begin
  FIntegradorResposta := TIntegradorResposta.Create;
  Clear;
end;

destructor TRespostaVerificarStatusValidador.Destroy;
begin
  FIntegradorResposta.Free;
  inherited Destroy;
end;

procedure TRespostaVerificarStatusValidador.Clear;
begin
  FIntegradorResposta.Clear;
  FCodigoAutorizacao := '';
  FBin := '';
  FDonoCartao := '';
  FDataExpiracao := '';
  FInstituicaoFinanceira := '';
  FParcelas := 0;
  FUltimosQuatroDigitos := 0;
  FCodigoPagamento := '';
  FValorPagamento := 0;
  FIDFila := 0;
  FTipo := '';
end;

{ TVerificarStatusValidador }

function TVerificarStatusValidador.GetXMLString: AnsiString;
var
  LocVerificarStatusValidadorW : TVerificarStatusValidadorW ;
begin
  Result  := '';
  LocVerificarStatusValidadorW := TVerificarStatusValidadorW.Create(Self);
  try
    LocVerificarStatusValidadorW.Gerador.Opcoes.IdentarXML := False;

    LocVerificarStatusValidadorW.GerarXml();
    Result := LocVerificarStatusValidadorW.Gerador.ArquivoFormatoXML;
  finally
    LocVerificarStatusValidadorW.Free;
  end ;
end;

constructor TVerificarStatusValidador.Create;
begin
  Clear;
end;

destructor TVerificarStatusValidador.Destroy;
begin
  inherited Destroy;
end;

procedure TVerificarStatusValidador.Clear;
begin
  FIdentificador := 0;
  FChaveAcessoValidador := '';
  FIDFila := 0;
  FCNPJ := '';
end;

{ TRespostaPagamento }

procedure TRespostaPagamento.SetXMLString(AValue: AnsiString);
var
 LocRespostaPagamentoR : TRespostaPagamentoR;
begin
  LocRespostaPagamentoR := TRespostaPagamentoR.Create(Self);
  try
    LocRespostaPagamentoR.Leitor.Arquivo := AValue;
    LocRespostaPagamentoR.LerXml;
  finally
    LocRespostaPagamentoR.Free
  end;
end;

constructor TRespostaPagamento.Create;
begin
  FIntegradorResposta := TIntegradorResposta.Create;
  Clear;
end;

destructor TRespostaPagamento.Destroy;
begin
  FIntegradorResposta.Free;
  inherited Destroy;
end;

procedure TRespostaPagamento.Clear;
begin
  FIntegradorResposta.Clear;
  FIDPagamento := 0;
  FMensagem    := '';
  FStatusPagamento := '';
end;

{ TEnviarPagamento }
constructor TEnviarPagamento.Create;
begin
  Clear;
end;

destructor TEnviarPagamento.Destroy;
begin
  inherited Destroy;
end;

procedure TEnviarPagamento.Clear;
begin
  FIdentificador := 0;
  FChaveAcessoValidador := '';
  FChaveRequisicao := '';
  FEstabelecimento := '';
  FSerialPOS := '';
  FCNPJ := '';
  FIcmsBase := 0;
  FValorTotalVenda := 0;	
end;

function TEnviarPagamento.GetXMLString(): AnsiString;
var
  LocEnviarPagamentoW : TEnviarPagamentoW ;
begin
  Result  := '';
  LocEnviarPagamentoW := TEnviarPagamentoW.Create(Self);
  try
    LocEnviarPagamentoW.Gerador.Opcoes.IdentarXML := False;

    LocEnviarPagamentoW.GerarXml();
    Result := LocEnviarPagamentoW.Gerador.ArquivoFormatoXML;
  finally
    LocEnviarPagamentoW.Free;
  end ;
end;

procedure TEnviarPagamento.SetXMLString(AValue: AnsiString);
var
 LocEnviarPagamentoR : TEnviarPagamentoR;
begin
  LocEnviarPagamentoR := TEnviarPagamentoR.Create(Self);
  try
    LocEnviarPagamentoR.Leitor.Arquivo := AValue;
    LocEnviarPagamentoR.LerXml;
  finally
    LocEnviarPagamentoR.Free
  end;
end;

end.
 
