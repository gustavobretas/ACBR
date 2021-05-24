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

unit AssessorPublico.Provider;

interface

uses
  SysUtils, Classes, Variants,
  ACBrDFeSSL,
  ACBrXmlBase, ACBrXmlDocument,
  ACBrNFSeXNotasFiscais,
  ACBrNFSeXClass, ACBrNFSeXConversao,
  ACBrNFSeXGravarXml, ACBrNFSeXLerXml,
  ACBrNFSeXProviderProprio,
  ACBrNFSeXWebserviceBase, ACBrNFSeXWebservicesResponse;

type
  TACBrNFSeXWebserviceAssessorPublico = class(TACBrNFSeXWebserviceSoap11)
  private
    function GetDadosUsuario: string;
  public
    function Recepcionar(ACabecalho, AMSG: String): string; override;
    function ConsultarLote(ACabecalho, AMSG: String): string; override;
    function ConsultarNFSe(ACabecalho, AMSG: String): string; override;
    function Cancelar(ACabecalho, AMSG: String): string; override;

    property DadosUsuario: string read GetDadosUsuario;
  end;

  TACBrNFSeProviderAssessorPublico = class (TACBrNFSeProviderProprio)
  protected
    procedure Configuracao; override;

    function CriarGeradorXml(const ANFSe: TNFSe): TNFSeWClass; override;
    function CriarLeitorXml(const ANFSe: TNFSe): TNFSeRClass; override;
    function CriarServiceClient(const AMetodo: TMetodo): TACBrNFSeXWebservice; override;

    //metodos para gera��o e tratamento dos dados do metodo emitir
    procedure PrepararEmitir(Response: TNFSeEmiteResponse); override;
    procedure TratarRetornoEmitir(Response: TNFSeEmiteResponse); override;

    //metodos para gera��o e tratamento dos dados do metodo ConsultaLoteRps
    procedure PrepararConsultaLoteRps(Response: TNFSeConsultaLoteRpsResponse); override;
    procedure TratarRetornoConsultaLoteRps(Response: TNFSeConsultaLoteRpsResponse); override;

    //metodos para gera��o e tratamento dos dados do metodo ConsultaNFSe
    procedure PrepararConsultaNFSe(Response: TNFSeConsultaNFSeResponse); override;
    procedure TratarRetornoConsultaNFSe(Response: TNFSeConsultaNFSeResponse); override;

    //metodos para gera��o e tratamento dos dados do metodo CancelaNFSe
    procedure PrepararCancelaNFSe(Response: TNFSeCancelaNFSeResponse); override;
    procedure TratarRetornoCancelaNFSe(Response: TNFSeCancelaNFSeResponse); override;

    procedure ProcessarMensagemErros(const RootNode: TACBrXmlNode;
                                     const Response: TNFSeWebserviceResponse;
                                     AListTag: string = '';
                                     AMessageTag: string = 'Erro'); override;

  end;

implementation

uses
  ACBrUtil,
  ACBrNFSeX, ACBrNFSeXConfiguracoes,
  AssessorPublico.GravarXml, AssessorPublico.LerXml;

{ TACBrNFSeProviderAssessorPublico }

procedure TACBrNFSeProviderAssessorPublico.Configuracao;
begin
  inherited Configuracao;

  with ConfigGeral do
  begin
    UseCertificateHTTP := False;
    ModoEnvio := meLoteAssincrono;
    {
    TagRaizNFSe := 'NOTA';
    TagRaizRps  := 'NOTA';
    }
  end;

  SetXmlNameSpace('');

  ConfigSchemas.Validar := False;
end;

function TACBrNFSeProviderAssessorPublico.CriarGeradorXml(
  const ANFSe: TNFSe): TNFSeWClass;
begin
  Result := TNFSeW_AssessorPublico.Create(Self);
  Result.NFSe := ANFSe;
end;

function TACBrNFSeProviderAssessorPublico.CriarLeitorXml(
  const ANFSe: TNFSe): TNFSeRClass;
begin
  Result := TNFSeR_AssessorPublico.Create(Self);
  Result.NFSe := ANFSe;
end;

function TACBrNFSeProviderAssessorPublico.CriarServiceClient(
  const AMetodo: TMetodo): TACBrNFSeXWebservice;
begin
  if FAOwner.Configuracoes.WebServices.AmbienteCodigo = 2 then
  begin
   with ConfigWebServices.Homologacao do
    begin
      case AMetodo of
        tmRecepcionar:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, Recepcionar);
        tmConsultarSituacao:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarSituacao);
        tmConsultarLote:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarLote);
        tmConsultarNFSePorRps:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeRps);
        tmConsultarNFSe:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSe);
        tmConsultarNFSeURL:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeURL);
        tmConsultarNFSePorFaixa:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSePorFaixa);
        tmConsultarNFSeServicoPrestado:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeServicoPrestado);
        tmConsultarNFSeServicoTomado:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeServicoTomado);
        tmCancelarNFSe:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, CancelarNFSe);
        tmGerar:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, GerarNFSe);
        tmRecepcionarSincrono:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, RecepcionarSincrono);
        tmSubstituirNFSe:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, SubstituirNFSe);
        tmAbrirSessao:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, AbrirSessao);
        tmFecharSessao:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, FecharSessao);
      else
        // tmTeste
        Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, TesteEnvio);
      end;
    end;
  end
  else
  begin
    with ConfigWebServices.Producao do
    begin
      case AMetodo of
        tmRecepcionar:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, Recepcionar);
        tmConsultarSituacao:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarSituacao);
        tmConsultarLote:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarLote);
        tmConsultarNFSePorRps:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeRps);
        tmConsultarNFSe:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSe);
        tmConsultarNFSeURL:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeURL);
        tmConsultarNFSePorFaixa:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSePorFaixa);
        tmConsultarNFSeServicoPrestado:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeServicoPrestado);
        tmConsultarNFSeServicoTomado:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, ConsultarNFSeServicoTomado);
        tmCancelarNFSe:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, CancelarNFSe);
        tmGerar:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, GerarNFSe);
        tmRecepcionarSincrono:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, RecepcionarSincrono);
        tmSubstituirNFSe:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, SubstituirNFSe);
        tmAbrirSessao:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, AbrirSessao);
        tmFecharSessao:
          Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, FecharSessao);
      else
        // tmTeste
        Result := TACBrNFSeXWebserviceAssessorPublico.Create(FAOwner, AMetodo, TesteEnvio);
      end;
    end;
  end;
end;

procedure TACBrNFSeProviderAssessorPublico.ProcessarMensagemErros(
  const RootNode: TACBrXmlNode; const Response: TNFSeWebserviceResponse;
  AListTag, AMessageTag: string);
var
  I: Integer;
  ANode: TACBrXmlNode;
  ANodeArray: TACBrXmlNodeArray;
  AErro: TNFSeEventoCollectionItem;
begin
  ANode := RootNode.Childrens.FindAnyNs(AListTag);

  if (ANode = nil) then
    ANode := RootNode;

  ANodeArray := ANode.Childrens.FindAllAnyNs(AMessageTag);

  if not Assigned(ANodeArray) then Exit;

  for I := Low(ANodeArray) to High(ANodeArray) do
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '';
    AErro.Descricao := ProcessarConteudoXml(ANodeArray[I].Childrens.FindAnyNs('ERRO'), tcStr);
    AErro.Correcao := '';
  end;
end;

procedure TACBrNFSeProviderAssessorPublico.PrepararEmitir(Response: TNFSeEmiteResponse);
var
  AErro: TNFSeEventoCollectionItem;
  Emitente: TEmitenteConfNFSe;
  Nota: NotaFiscal;
  IdAttr, ListaRps, xRps: string;
  I: Integer;
begin
  if TACBrNFSeX(FAOwner).NotasFiscais.Count <= 0 then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'ERRO: Nenhum RPS adicionado ao componente';
  end;

  if TACBrNFSeX(FAOwner).NotasFiscais.Count > Response.MaxRps then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'ERRO: Conjunto de RPS transmitidos (m�ximo de ' +
                       IntToStr(Response.MaxRps) + ' RPS)' +
                       ' excedido. Quantidade atual: ' +
                       IntToStr(TACBrNFSeX(FAOwner).NotasFiscais.Count);
  end;

  if Response.Erros.Count > 0 then Exit;

  ListaRps := '';

  if ConfigAssinar.IncluirURI then
    IdAttr := ConfigGeral.Identificador
  else
    IdAttr := 'ID';

  for I := 0 to TACBrNFSeX(FAOwner).NotasFiscais.Count -1 do
  begin
    Nota := TACBrNFSeX(FAOwner).NotasFiscais.Items[I];

    if EstaVazio(Nota.XMLAssinado) then
    begin
      Nota.GerarXML;
      if ConfigAssinar.Rps or ConfigAssinar.RpsGerarNFSe then
      begin
        Nota.XMLOriginal := FAOwner.SSL.Assinar(ConverteXMLtoUTF8(Nota.XMLOriginal), ConfigMsgDados.XmlRps.DocElemento,
                                                ConfigMsgDados.XmlRps.InfElemento, '', '', '', IdAttr);
      end;
    end;

    if FAOwner.Configuracoes.Arquivos.Salvar then
    begin
      if NaoEstaVazio(Nota.NomeArqRps) then
        TACBrNFSeX(FAOwner).Gravar(Nota.NomeArqRps, Nota.XMLOriginal)
      else
      begin
        Nota.NomeArqRps := Nota.CalcularNomeArquivoCompleto(Nota.NomeArqRps, '');
        TACBrNFSeX(FAOwner).Gravar(Nota.NomeArqRps, Nota.XMLOriginal);
      end;
    end;

    xRps := RemoverDeclaracaoXML(Nota.XMLOriginal);

    xRps := '<NOTA>' + SeparaDados(xRps, 'NOTA') + '</NOTA>';

    ListaRps := ListaRps + xRps;
  end;

  Emitente := TACBrNFSeX(FAOwner).Configuracoes.Geral.Emitente;

  Response.XmlEnvio := '<NFSE>' +
                         '<IDENTIFICACAO>' +
                           '<MESCOMP>' +
                              FormatDateTime('MM', Now) +
                           '</MESCOMP>' +
                           '<ANOCOMP>' +
                              FormatDateTime('yyyy', Now) +
                           '</ANOCOMP>' +
                           '<INSCRICAO>' +
                              Emitente.InscMun +
                           '</INSCRICAO>' +
                           '<VERSAO>1.00</VERSAO>' +
                         '</IDENTIFICACAO>' +
                         '<NOTAS>' +
                           ListaRps +
                         '</NOTAS>' +
                       '</NFSE>';
end;

procedure TACBrNFSeProviderAssessorPublico.TratarRetornoEmitir(Response: TNFSeEmiteResponse);
var
  Document: TACBrXmlDocument;
  AErro: TNFSeEventoCollectionItem;
  ANode: TACBrXmlNode;
begin
  Document := TACBrXmlDocument.Create;

  try
    try
      if Response.XmlRetorno = '' then
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := 'WebService retornou um XML vazio.';
        Exit
      end;

      Document.LoadFromXml(Response.XmlRetorno);

      ANode := Document.Root.Childrens.Find('NFSE');

      if ANode <> nil then
      begin
        ProcessarMensagemErros(ANode, Response, '', 'INCONSISTENCIA');

        Response.Sucesso := (Response.Erros.Count = 0);
      end;
      {
      ANode := Document.Root;

      if ANode <> nil then
      begin
        with Response.InfRetorno do
        begin
          DataRecebimento := ProcessarConteudoXml(ANode.Childrens.Find('DataRecebimento'), tcDatHor);
          Protocolo := ProcessarConteudoXml(ANode.Childrens.Find('Protocolo'), tcStr);
        end;
      end;
      }
    except
      on E:Exception do
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := E.Message;
      end;
    end;
  finally
    FreeAndNil(Document);
  end;
end;

procedure TACBrNFSeProviderAssessorPublico.PrepararConsultaLoteRps(
  Response: TNFSeConsultaLoteRpsResponse);
var
  AErro: TNFSeEventoCollectionItem;
  Emitente: TEmitenteConfNFSe;
begin
  if EstaVazio(Response.Lote) then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'Numero do Lote n�o informado.';
    Exit;
  end;

  Emitente := TACBrNFSeX(FAOwner).Configuracoes.Geral.Emitente;

  Response.XmlEnvio := '<NFSE>' +
                         '<IDENTIFICACAO>' +
                           '<INSCRICAO>' +
                              Emitente.InscMun +
                           '</INSCRICAO>' +
                           '<LOTE>' +
                              Response.Lote +
                           '</LOTE>' +
                         '</IDENTIFICACAO>' +
                       '</NFSE>';
end;

procedure TACBrNFSeProviderAssessorPublico.TratarRetornoConsultaLoteRps(
  Response: TNFSeConsultaLoteRpsResponse);
var
  Document: TACBrXmlDocument;
  AErro: TNFSeEventoCollectionItem;
  ANode: TACBrXmlNode;
begin
  Document := TACBrXmlDocument.Create;

  try
    try
      if Response.XmlRetorno = '' then
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := 'WebService retornou um XML vazio.';
        Exit
      end;

      Document.LoadFromXml(Response.XmlRetorno);

      ANode := Document.Root.Childrens.Find('NFSE');

      if ANode <> nil then
      begin
        ProcessarMensagemErros(ANode, Response, '', 'INCONSISTENCIA');

        Response.Sucesso := (Response.Erros.Count = 0);
      end;
    except
      on E:Exception do
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := E.Message;
      end;
    end;
  finally
    FreeAndNil(Document);
  end;
end;

procedure TACBrNFSeProviderAssessorPublico.PrepararConsultaNFSe(
  Response: TNFSeConsultaNFSeResponse);
var
  AErro: TNFSeEventoCollectionItem;
  Emitente: TEmitenteConfNFSe;
begin
  if EstaVazio(Response.InfConsultaNFSe.NumeroLote) then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'Numero do Lote n�o informado.';
    Exit;
  end;

  if EstaVazio(Response.InfConsultaNFSe.NumeroIniNFSe) then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'Numero da NFSe n�o informado.';
    Exit;
  end;

  Emitente := TACBrNFSeX(FAOwner).Configuracoes.Geral.Emitente;

  Response.Metodo := tmConsultarNFSe;

  Response.XmlEnvio := '<NFSE>' +
                         '<IDENTIFICACAO>' +
                           '<INSCRICAO>' +
                              Emitente.InscMun +
                           '</INSCRICAO>' +
                           '<LOTE>' +
                              Response.InfConsultaNFSe.NumeroLote +
                           '</LOTE>' +
                           '<SEQUENCIA>' +
                              Response.InfConsultaNFSe.NumeroIniNFSe +
                           '</SEQUENCIA>' +
                         '</IDENTIFICACAO>' +
                       '</NFSE>';
end;

procedure TACBrNFSeProviderAssessorPublico.TratarRetornoConsultaNFSe(
  Response: TNFSeConsultaNFSeResponse);
var
  Document: TACBrXmlDocument;
  AErro: TNFSeEventoCollectionItem;
  ANode: TACBrXmlNode;
begin
  Document := TACBrXmlDocument.Create;

  try
    try
      if Response.XmlRetorno = '' then
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := 'WebService retornou um XML vazio.';
        Exit
      end;

      Document.LoadFromXml(Response.XmlRetorno);

      ANode := Document.Root.Childrens.Find('NFSE');

      if ANode <> nil then
      begin
        ProcessarMensagemErros(ANode, Response, '', 'INCONSISTENCIA');

        Response.Sucesso := (Response.Erros.Count = 0);
      end;
    except
      on E:Exception do
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := E.Message;
      end;
    end;
  finally
    FreeAndNil(Document);
  end;
end;

procedure TACBrNFSeProviderAssessorPublico.PrepararCancelaNFSe(
  Response: TNFSeCancelaNFSeResponse);
var
  AErro: TNFSeEventoCollectionItem;
  Emitente: TEmitenteConfNFSe;
begin
  if EstaVazio(Response.InfCancelamento.NumeroNFSe) then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'Numero da NFSe n�o informada.';
    Exit;
  end;

  if EstaVazio(Response.InfCancelamento.NumeroLote) then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'Numero do Lote n�o informado.';
    Exit;
  end;

  if EstaVazio(Response.InfCancelamento.MotCancelamento) then
  begin
    AErro := Response.Erros.New;
    AErro.Codigo := '999';
    AErro.Descricao := 'Motivo do Cancelamento n�o informado.';
    Exit;
  end;

  Emitente := TACBrNFSeX(FAOwner).Configuracoes.Geral.Emitente;

  Response.XmlEnvio := '<NFSE>' +
                         '<IDENTIFICACAO>' +
                           '<INSCRICAO>' +
                              Emitente.InscMun +
                           '</INSCRICAO>' +
                           '<LOTE>' +
                              Response.InfCancelamento.NumeroLote +
                           '</LOTE>' +
                           '<SEQUENCIA>' +
                              Response.InfCancelamento.NumeroNFSe +
                           '</SEQUENCIA>' +
                           '<OBSERVACAO>' +
                              Response.InfCancelamento.MotCancelamento +
                           '</OBSERVACAO>' +
                         '</IDENTIFICACAO>' +
                       '</NFSE>';
end;

procedure TACBrNFSeProviderAssessorPublico.TratarRetornoCancelaNFSe(
  Response: TNFSeCancelaNFSeResponse);
var
  Document: TACBrXmlDocument;
  AErro: TNFSeEventoCollectionItem;
  ANode: TACBrXmlNode;
begin
  Document := TACBrXmlDocument.Create;

  try
    try
      if Response.XmlRetorno = '' then
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := 'WebService retornou um XML vazio.';
        Exit
      end;

      Document.LoadFromXml(Response.XmlRetorno);

      ANode := Document.Root.Childrens.Find('NFSE');

      if ANode <> nil then
      begin
        ProcessarMensagemErros(ANode, Response, '', 'INCONSISTENCIA');

        Response.Sucesso := (Response.Erros.Count = 0);
      end;
    except
      on E:Exception do
      begin
        AErro := Response.Erros.New;
        AErro.Codigo := '999';
        AErro.Descricao := E.Message;
      end;
    end;
  finally
    FreeAndNil(Document);
  end;
end;

{ TACBrNFSeXWebserviceAssessorPublico }

function TACBrNFSeXWebserviceAssessorPublico.GetDadosUsuario: string;
begin
  with TACBrNFSeX(FPDFeOwner).Configuracoes.Geral do
  begin
    Result := '<nfse:Usuario>' + Emitente.WSUser + '</nfse:Usuario>' +
              '<nfse:Senha>' + Emitente.WSSenha + '</nfse:Senha>';
  end;
end;

function TACBrNFSeXWebserviceAssessorPublico.Recepcionar(ACabecalho,
  AMSG: String): string;
var
  Request: string;
begin
  FPMsgOrig := AMSG;

  Request := '<nfse:Nfse.Execute>';
  Request := Request + '<nfse:Operacao>1</nfse:Operacao>';
  Request := Request + DadosUsuario;
  Request := Request + '<nfse:Webxml>' + XmlToStr(AMSG) + '</nfse:Webxml>';
  Request := Request + '</nfse:Nfse.Execute>';

  Result := Executar('nfseaction/ANFSE.Execute', Request,
                     ['Mensagem'],
                     ['xmlns:nfse="nfse"']);
end;

function TACBrNFSeXWebserviceAssessorPublico.ConsultarLote(ACabecalho,
  AMSG: String): string;
var
  Request: string;
begin
  FPMsgOrig := AMSG;

  Request := '<nfse:Nfse.Execute>';
  Request := Request + '<nfse:Operacao>3</nfse:Operacao>';
  Request := Request + DadosUsuario;
  Request := Request + '<nfse:Webxml>' + XmlToStr(AMSG) + '</nfse:Webxml>';
  Request := Request + '</nfse:Nfse.Execute>';

  Result := Executar('nfseaction/ANFSE.Execute', Request,
                     ['Mensagem'],
                     ['xmlns:nfse="nfse"']);
end;

function TACBrNFSeXWebserviceAssessorPublico.ConsultarNFSe(ACabecalho,
  AMSG: String): string;
var
  Request: string;
begin
  FPMsgOrig := AMSG;

  Request := '<nfse:Nfse.Execute>';
  Request := Request + '<nfse:Operacao>4</nfse:Operacao>';
  Request := Request + DadosUsuario;
  Request := Request + '<nfse:Webxml>' + XmlToStr(AMSG) + '</nfse:Webxml>';
  Request := Request + '</nfse:Nfse.Execute>';

  Result := Executar('nfseaction/ANFSE.Execute', Request,
                     ['Mensagem'],
                     ['xmlns:nfse="nfse"']);
end;

function TACBrNFSeXWebserviceAssessorPublico.Cancelar(ACabecalho, AMSG: String): string;
var
  Request: string;
begin
  FPMsgOrig := AMSG;

  Request := '<nfse:Nfse.Execute>';
  Request := Request + '<nfse:Operacao>2</nfse:Operacao>';
  Request := Request + DadosUsuario;
  Request := Request + '<nfse:Webxml>' + XmlToStr(AMSG) + '</nfse:Webxml>';
  Request := Request + '</nfse:Nfse.Execute>';

  Result := Executar('nfseaction/ANFSE.Execute', Request,
                     ['Mensagem'],
                     ['xmlns:nfse="nfse"']);
end;

end.
