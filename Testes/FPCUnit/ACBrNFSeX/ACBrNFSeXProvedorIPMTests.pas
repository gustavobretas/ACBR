﻿unit ACBrNFSeXProvedorIPMTests;

{$I ACBr.inc}

interface

uses
  Classes, SysUtils, ACBrTests.Util,
  ACBrNFSeX;

type

  { ACBrNFSeXProvedorIPMTest }

  ACBrNFSeXProvedorIPMTest = class(TTestCase)
  private
    FACBrNFSeX1: TACBrNFSeX;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure AoCriarComponente_ContadorDeNotas_DeveSerZero;
    procedure Proverdor_Eh_IPM;
    procedure LoadFromFile_PassandoXMLValidoNaoAssinado_CampoXml_EhIdenticoAoArquivo;
    procedure LoadFromFile_PassandoXMLValidoNaoAssinado_CamposCarregadosCorretamente;

  end;

implementation

uses
  ACBrConsts,
  ACBrUtil.Strings, ACBrUtil.DateTime, ACBrUtil.Math,
  ACBrNFSeXConversao;

const
  SArquivoIPM01  = '..\..\..\..\Recursos\NFSe\Provedores\IPM\IPM_01-nfse.xml';
  UmMunicipioIPM = 4216602; // Usado o XML da NFS-e de Sao Jose - SC para o teste

{ ACBrNFSeXProvedorIPMTest }

procedure ACBrNFSeXProvedorIPMTest.SetUp;
begin
  inherited SetUp;
  FACBrNFSeX1 := TACBrNFSeX.Create(nil);
  FACBrNFSeX1.Configuracoes.Geral.CodigoMunicipio := UmMunicipioIPM;
end;

procedure ACBrNFSeXProvedorIPMTest.TearDown;
begin
  FACBrNFSeX1.Free;
  inherited TearDown;
end;

procedure ACBrNFSeXProvedorIPMTest.AoCriarComponente_ContadorDeNotas_DeveSerZero;
begin
  CheckEquals(0, FACBrNFSeX1.NotasFiscais.Count, 'Contador de NFSe Não é zero');
end;

procedure ACBrNFSeXProvedorIPMTest.Proverdor_Eh_IPM;
begin
  CheckTrue((FACBrNFSeX1.Configuracoes.Geral.Provedor = proIPM), 'Provedor não é IPM');
end;

procedure ACBrNFSeXProvedorIPMTest.LoadFromFile_PassandoXMLValidoNaoAssinado_CampoXml_EhIdenticoAoArquivo;
var
  lStrList: TStringList;
  sxml: string;
begin
  lStrList := TStringList.Create;;
  try
    //lStrList.TrailingLineBreak := False; //Não funciona no Delphi 7
    lStrList.LoadFromFile(SArquivoIPM01);
    sxml := lStrList.Text;
  finally
    lStrList.Free;
  end;

  //remove o linebreak que fica no final da string por ter vindo do "TStringList.Text"
  if Length(sxml) >= Length(sLineBreak) then
  begin
    sxml := Copy(sxml, 0, Length(sxml) - Length(sLineBreak));
  end;

  FACBrNFSeX1.NotasFiscais.LoadFromFile(SArquivoIPM01, False);
  CheckEquals(sxml, FACBrNFSeX1.NotasFiscais[0].XmlNfse, 'Campo XmlNfse não corresponde ao conteúdo do arquivo');
end;

procedure ACBrNFSeXProvedorIPMTest.LoadFromFile_PassandoXMLValidoNaoAssinado_CamposCarregadosCorretamente;
begin
  FACBrNFSeX1.NotasFiscais.LoadFromFile(SArquivoIPM01, False);

  CheckTrue(FACBrNFSeX1.NotasFiscais.Count > 0, '');

  CheckEquals('10', FACBrNFSeX1.NotasFiscais[0].NFSe.IdentificacaoRps.Numero, 'NFSe.IdentificacaoRps.Numero valor incorreto') ;
  CheckEquals('RPS', FACBrNFSeX1.NotasFiscais[0].NFSe.IdentificacaoRps.Serie, 'NFSe.IdentificacaoRps.Serie valor incorreto') ;
  CheckEquals(EncodeDataHora('11/10/2022 16:49:01', 'DD/MM/YYYY'), FACBrNFSeX1.NotasFiscais[0].NFSe.DataEmissaoRps, 'NFSe.DataEmissaoRps valor incorreto');

  CheckEquals('2', FACBrNFSeX1.NotasFiscais[0].NFSe.Numero, 'NFSe.Numero valor incorreto') ;
  CheckEquals('1', FACBrNFSeX1.NotasFiscais[0].NFSe.SeriePrestacao, 'NFSe.SeriePrestacao valor incorreto') ;
  CheckEquals(EncodeDataHora('11/10/2022 16:49:02', 'DD/MM/YYYY'), FACBrNFSeX1.NotasFiscais[0].NFSe.DataEmissao, 'NFSe.DataEmissao valor incorreto');
  CheckEquals('https://saojose.atende.net/autoatendimento/servicos/consulta-de-autenticidade-de-nota-fiscal-eletronica-nfse/detalhar/1/identificador/1111111111111111111111111111111111111111', FACBrNFSeX1.NotasFiscais[0].NFSe.Link, 'NFSe.Link valor incorreto') ;
  CheckEquals('1111111111111111111111111111111111111111', FACBrNFSeX1.NotasFiscais[0].NFSe.CodigoVerificacao, 'NFSe.CodigoVerificacao valor incorreto');
  CheckEquals(10.00, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.Valores.ValorServicos, 'NFSe.Servico.Valores.ValorServicos valor incorreto') ;
  CheckEquals(0, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.Valores.DescontoIncondicionado, 'NFSe.Servico.Valores.DescontoIncondicionado valor incorreto') ;
  CheckEquals(0, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.Valores.ValorIr, 'NFSe.Servico.Valores.ValorIr valor incorreto') ;
  CheckEquals(0, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.Valores.ValorInss, 'NFSe.Servico.Valores.ValorInss valor incorreto') ;
  CheckEquals(0, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.Valores.ValorCsll, 'NFSe.Servico.Valores.ValorCsll valor incorreto') ;
  CheckEquals(0, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.Valores.ValorPis, 'NFSe.Servico.Valores.ValorPis valor incorreto') ;
  CheckEquals(0, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.Valores.ValorCofins, 'NFSe.Servico.Valores.ValorCofins valor incorreto') ;
  CheckEquals('0', FACBrNFSeX1.NotasFiscais[0].NFSe.OutrasInformacoes, 'NFSe.OutrasInformacoes valor incorreto') ;

  CheckEquals('11111111111111', FACBrNFSeX1.NotasFiscais[0].NFSe.Prestador.IdentificacaoPrestador.CpfCnpj, 'NFSe.Prestador.IdentificacaoPrestador.CpfCnpj valor incorreto') ;
  CheckEquals(CodTOMToCodIBGE('8327'), FACBrNFSeX1.NotasFiscais[0].NFSe.Prestador.Endereco.CodigoMunicipio, 'NFSe.Prestador.Endereco.CodigoMunicipio valor incorreto') ;

  CheckEquals('11111111111', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.IdentificacaoTomador.CpfCnpj, 'NFSe.Tomador.IdentificacaoTomador.CpfCnpj valor incorreto') ;
  CheckEquals('0', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.IdentificacaoTomador.InscricaoEstadual, 'NFSe.Tomador.IdentificacaoTomador.InscricaoEstadual valor incorreto') ;
  CheckEquals('0', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.NomeFantasia, 'NFSe.Tomador.NomeFantasia valor incorreto') ;
  CheckEquals('RAZAO SOCIAL', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.RazaoSocial, 'NFSe.Tomador.RazaoSocial valor incorreto') ;
  CheckEquals('183', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Endereco.Numero, 'NFSe.Tomador.Endereco.Numero valor incorreto') ;
  CheckEquals('Sala ABCD', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Endereco.Complemento, 'NFSe.Tomador.Endereco.Complemento valor incorreto') ;
  CheckEquals('SC', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Endereco.UF, 'NFSe.Tomador.Endereco.UF valor incorreto') ;
  CheckEquals(CodTOMToCodIBGE('8105'), FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Endereco.CodigoMunicipio, 'NFSe.Tomador.Endereco.CodigoMunicipio valor incorreto') ;
  CheckEquals('LOGRADOURO TESTE', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Endereco.Endereco, 'NFSe.Tomador.Endereco.Endereco valor incorreto') ;
  CheckEquals('Centro', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Endereco.Bairro, 'NFSe.Tomador.Endereco.Bairro valor incorreto') ;
  CheckEquals('11111111', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Endereco.CEP, 'NFSe.Tomador.Endereco.CEP valor incorreto') ;
  CheckEquals('00', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Contato.Telefone, 'NFSe.Tomador.Contato.Telefone valor incorreto') ;
  CheckEquals('0', FACBrNFSeX1.NotasFiscais[0].NFSe.Tomador.Contato.Email, 'NFSe.Tomador.Contato.Email valor incorreto') ;

  CheckEquals(CodTOMToCodIBGE('8327'), FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].CodMunPrestacao, 'NFSe.Servico.ItemServico[0].CodMunPrestacao valor incorreto') ;
  CheckEquals('1402', FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].ItemListaServico, 'NFSe.Servico.ItemServico[0].ItemListaServico valor incorreto') ;
  CheckEquals('SERVICO DE ESTACIONAMENTO', FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].Descricao, 'NFSe.Servico.ItemServico[0].Descricao valor incorreto') ;
  CheckEquals(2.79, SimpleRoundToEX(FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].Aliquota), 'NFSe.Servico.ItemServico[0].Aliquota valor incorreto') ;
  CheckEquals(0, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].SituacaoTributaria, 'NFSe.Servico.ItemServico[0].SituacaoTributaria valor incorreto') ;
  CheckEquals(10.00, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].ValorTotal, 'NFSe.Servico.ItemServico[0].ValorTotal valor incorreto') ;
  CheckEquals(0.00, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].ValorDeducoes, 'NFSe.Servico.ItemServico[0].ValorDeducoes valor incorreto') ;
  CheckEquals(0.00, FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].ValorISSRetido, 'NFSe.Servico.ItemServico[0].ValorISSRetido valor incorreto') ;
  CheckEquals('1', FACBrNFSeX1.Provider.SimNaoToStr(FACBrNFSeX1.NotasFiscais[0].NFSe.Servico.ItemServico[0].TribMunPrestador), 'NFSe.Servico.ItemServico[0].TribMunPrestador valor incorreto') ;
end;

initialization

  _RegisterTest('ACBrNFSeXProvedorIPMTests', ACBrNFSeXProvedorIPMTest);

end.
