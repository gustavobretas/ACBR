{******************************************************************************}
{ Projeto: Componente ACBrGNRE                                                 }
{  Biblioteca multiplataforma de componentes Delphi/Lazarus para emiss�o da    }
{  Guia Nacional de Recolhimento de Tributos Estaduais                         }
{  http://www.gnre.pe.gov.br/                                                  }
{                                                                              }
{ Direitos Autorais Reservados (c) 2013 Claudemir Vitor Pereira                }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
{                                       Juliomar Marchetti                     }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
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

{******************************************************************************
|* Historico
|*
|* 09/12/2013 - Claudemir Vitor Pereira
|*  - Doa��o do componente para o Projeto ACBr
******************************************************************************}
{$I ACBr.inc}

unit ACBrGNREGuias;

interface

uses
  Classes, SysUtils, Dialogs, StrUtils,
  ACBrDFeUtil, pcnConversao, pcnAuxiliar, pcnLeitor,
  ACBrGNREConfiguracoes,
  pgnreGNRE, pgnreGNRER, pgnreGNREW;

type

  { Guia }

  Guia = class(TCollectionItem)
  private
    FGNRE: TGNRE;
    FGNREW: TGNREW;
    FGNRER: TGNRER;

    FXMLAssinado: String;
    FXMLOriginal: String;
    FAlertas: String;
    FErroValidacao: String;
    FErroValidacaoCompleto: String;
    FErroRegrasdeNegocios: String;
    FNomeArq: String;

    function GetConfirmada: Boolean;
    function GetProcessada: Boolean;


    function GetMsg: String;
    function GetNumID: String;
    function GetXMLAssinado: String;
    procedure SetXML(AValue: String);
    procedure SetXMLOriginal(AValue: String);
    function ValidarConcatChave: Boolean;
    function CalcularNomeArquivo: String;
    function CalcularPathArquivo: String;
    function CalcularNomeArquivoCompleto(NomeArquivo: String = '';
      PathArquivo: String = ''): String;
  public
    constructor Create(Collection2: TCollection); override;
    destructor Destroy; override;
    procedure Imprimir;
    procedure ImprimirPDF;

    procedure Assinar;
    procedure Validar;
    function VerificarAssinatura: Boolean;
    function ValidarRegrasdeNegocios: Boolean;

    function LerXML(AXML: AnsiString): Boolean;

    function GerarXML: String;
    function GravarXML(NomeArquivo: String = ''; PathArquivo: String = ''): Boolean;

    function GravarStream(AStream: TStream): Boolean;

    procedure EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings = nil;
      EnviaPDF: Boolean = True; sCC: TStrings = nil; Anexos: TStrings = nil);

    property NomeArq: String read FNomeArq write FNomeArq;

    property GNRE: TGNRE read FGNRE;

    // Atribuir a "XML", faz o componente transferir os dados lido para as propriedades internas e "XMLAssinado"
    property XML: String         read FXMLOriginal   write SetXML;
    // Atribuir a "XMLOriginal", reflete em XMLAssinado, se existir a tag de assinatura
    property XMLOriginal: String read FXMLOriginal   write SetXMLOriginal;
    property XMLAssinado: String read GetXMLAssinado write FXMLAssinado;
    property Confirmada: Boolean read GetConfirmada;
    property Processada: Boolean read GetProcessada;
    property Msg: String read GetMsg;
    property NumID: String read GetNumID;

    property Alertas: String read FAlertas;
    property ErroValidacao: String read FErroValidacao;
    property ErroValidacaoCompleto: String read FErroValidacaoCompleto;
    property ErroRegrasdeNegocios: String read FErroRegrasdeNegocios;
  end;

  { TGuias }

  TGuias = class(TOwnedCollection)
  private
    FACBrGNRE: TComponent;
    FConfiguracoes: TConfiguracoesGNRE;

    function GetItem(Index: integer): Guia;
    procedure SetItem(Index: integer; const Value: Guia);

    procedure VerificarGNREGuias;
  public
    constructor Create(AOwner: TPersistent; ItemClass: TCollectionItemClass);

    procedure GerarGNRE;
    procedure Assinar;
    procedure Validar;
    function VerificarAssinatura(out Erros: String): Boolean;
    function ValidarRegrasdeNegocios(out Erros: String): Boolean;
    procedure Imprimir;
    procedure ImprimirPDF;
    function Add: Guia;
    function Insert(Index: integer): Guia;

    property Items[Index: integer]: Guia read GetItem write SetItem; default;

    function GetNamePath: String; override;
    // Incluido o Parametro AGerarGNRE que determina se ap�s carregar os dados da GNRE
    // para o componente, ser� gerado ou n�o novamente o XML da GNRE.
    function LoadFromFile(CaminhoArquivo: String; AGerarGNRE: Boolean = True): Boolean;
    function LoadFromStream(AStream: TStringStream; AGerarGNRE: Boolean = True): Boolean;
    function LoadFromString(AXMLString: String; AGerarGNRE: Boolean = True): Boolean;
    function GravarXML(PathNomeArquivo: String = ''): Boolean;

    property ACBrGNRE: TComponent read FACBrGNRE;
  end;

implementation

uses
  ACBrGNRE, ACBrUtil, pgnreConversao, synautil;

{ Guia }

constructor Guia.Create(Collection2: TCollection);
begin
  inherited Create(Collection2);
  FGNRE := TGNRE.Create;
  FGNREW := TGNREW.Create(FGNRE);
  FGNRER := TGNRER.Create(FGNRE);
  (*
  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    FGNRE.Ide.modelo := StrToInt(ModeloDFToStr(Configuracoes.Geral.ModeloDF));
    FGNRE.infGNRE.Versao := VersaoDFToDbl(Configuracoes.Geral.VersaoDF);

    FGNRE.Ide.tpNF := tnSaida;
    FGNRE.Ide.indPag := ipVista;
    FGNRE.Ide.verProc := 'ACBrGNRE';
    FGNRE.Ide.tpAmb := Configuracoes.WebServices.Ambiente;
    FGNRE.Ide.tpEmis := Configuracoes.Geral.FormaEmissao;

    if Assigned(FGNREGuia) then
      FGNRE.Ide.tpImp := FGNREGuia.TipoDANFE;

    FGNRE.Emit.EnderEmit.xPais := 'BRASIL';
    FGNRE.Emit.EnderEmit.cPais := 1058;
    FGNRE.Emit.EnderEmit.nro := 'SEM NUMERO';

    FGNRE.Dest.EnderDest.xPais := 'BRASIL';
    FGNRE.Dest.EnderDest.cPais := 1058;
  end;
  *)
end;

destructor Guia.Destroy;
begin
  FGNREW.Free;
  FGNRER.Free;
  FGNRE.Free;
  inherited Destroy;
end;

procedure Guia.Imprimir;
begin
  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    if not Assigned(GNREGuia) then
      raise EACBrGNREException.Create('Componente FGNREGuia n�o associado.')
    else
      GNREGuia.ImprimirGuia( nil {GuiasRetorno});
  end;
end;

procedure Guia.ImprimirPDF;
begin
  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    if not Assigned(GNREGuia) then
      raise EACBrGNREException.Create('Componente FGNREGuia n�o associado.')
    else
      GNREGuia.ImprimirGuiaPDF( nil {GuiasRetorno});
  end;
end;

procedure Guia.Assinar;
var
  XMLStr: String;
  XMLUTF8: AnsiString;
  Leitor: TLeitor;
  CNPJEmitente, CNPJCertificado: String;
begin
  // Verificando se pode assinar esse XML (O XML tem o mesmo CNPJ do Certificado ??)
  CNPJEmitente    := OnlyNumber(GNRE.c03_idContribuinteEmitente);
  CNPJCertificado := OnlyNumber(TACBrGNRE(TGuias(Collection).ACBrGNRE).SSL.CertCNPJ);

  // verificar somente os 8 primeiros digitos, para evitar problemas quando
  // a filial estiver utilizando o certificado da matriz
  if (CNPJCertificado <> '') and (Copy(CNPJEmitente, 1, 8) <> Copy(CNPJCertificado, 1, 8)) then
    raise EACBrGNREException.Create('Erro ao Assinar. O XML informado possui CNPJ diferente do Certificado Digital' );

  // Gera novamente, para processar propriedades que podem ter sido modificadas
  XMLStr := GerarXML;

  // XML j� deve estar em UTF8, para poder ser assinado //
  XMLUTF8 := ConverteXMLtoUTF8(XMLStr);

  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    FXMLAssinado := SSL.Assinar(String(XMLUTF8), 'GNRE', 'infGNRE');
    FXMLOriginal := FXMLAssinado;

    Leitor := TLeitor.Create;
    try
      leitor.Grupo := FXMLAssinado;
      (*
      GNRE.signature.URI := Leitor.rAtributo('Reference URI=');
      GNRE.signature.DigestValue := Leitor.rCampo(tcStr, 'DigestValue');
      GNRE.signature.SignatureValue := Leitor.rCampo(tcStr, 'SignatureValue');
      GNRE.signature.X509Certificate := Leitor.rCampo(tcStr, 'X509Certificate');
      *)
    finally
      Leitor.Free;
    end;

    if Configuracoes.Arquivos.Salvar and
       (not Configuracoes.Arquivos.SalvarApenasGNREProcessadas) then
    begin
      if NaoEstaVazio(NomeArq) then
        Gravar(NomeArq, FXMLAssinado)
      else
        Gravar(CalcularNomeArquivoCompleto(), FXMLAssinado);
    end;
  end;
end;

procedure Guia.Validar;
var
  Erro, AXML: String;
  NotaEhValida: Boolean;
  ALayout: TLayOutGNRE;
  VerServ: Real;
begin
  AXML := XMLAssinado;

  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    VerServ := 1.00;

    ALayout := LayGNRERecepcao;

    // Extraindo apenas os dados da GNRE (sem GNREProc)
    AXML := '<GNRE xmlns' + RetornarConteudoEntre(AXML, '<GNRE xmlns', '</GNRE>') + '</GNRE>';

    NotaEhValida := SSL.Validar(AXML, GerarNomeArqSchema(ALayout, VerServ), Erro);

    if not NotaEhValida then
    begin
      FErroValidacao := ACBrStr('Falha na valida��o dos dados da nota: ') +
        IntToStr(GNRE.c02_receita) + sLineBreak + FAlertas ;
      FErroValidacaoCompleto := FErroValidacao + sLineBreak + Erro;

      raise EACBrGNREException.CreateDef(
        IfThen(Configuracoes.Geral.ExibirErroSchema, ErroValidacaoCompleto,
        ErroValidacao));
    end;
  end;
end;

function Guia.VerificarAssinatura: Boolean;
var
  Erro, AXML: String;
  AssEhValida: Boolean;
begin
  AXML := XMLAssinado;

  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    AssEhValida := SSL.VerificarAssinatura(AXML, Erro, 'infGNRE');

    if not AssEhValida then
    begin
      FErroValidacao := ACBrStr('Falha na valida��o da assinatura da nota: ') +
        IntToStr(GNRE.c02_receita) + sLineBreak + Erro;
    end;
  end;

  Result := AssEhValida;
end;

function Guia.ValidarRegrasdeNegocios: Boolean;
begin
  Result := True; // N�o Implementado
end;

function Guia.LerXML(AXML: AnsiString): Boolean;
begin
  Result := False;
  FGNRER.Leitor.Arquivo := AXML;
  FGNRER.LerXml;

  XMLOriginal := string(AXML);

  Result := True;
end;

function Guia.GravarXML(NomeArquivo, PathArquivo: String): Boolean;
begin
  if EstaVazio(FXMLOriginal) then
    GerarXML;

  FNomeArq := CalcularNomeArquivoCompleto(NomeArquivo, PathArquivo);

  Result := TACBrGNRE(TGuias(Collection).ACBrGNRE).Gravar(FNomeArq, FXMLOriginal);
end;

function Guia.GravarStream(AStream: TStream): Boolean;
begin
  Result := False;

  if EstaVazio(FXMLOriginal) then
    GerarXML;

  AStream.Size := 0;
  WriteStrToStream(AStream, AnsiString(FXMLOriginal));
  Result := True;
end;

procedure Guia.EnviarEmail(sPara, sAssunto: String; sMensagem: TStrings;
  EnviaPDF: Boolean; sCC, Anexos: TStrings);
var
  NomeArq : String;
  AnexosEmail:TStrings;
  StreamGNRE : TMemoryStream;
begin
  if not Assigned(TACBrGNRE(TGuias(Collection).ACBrGNRE).MAIL) then
    raise EACBrGNREException.Create('Componente ACBrMail n�o associado');

  AnexosEmail := TStringList.Create;
  StreamGNRE := TMemoryStream.Create;
  try
    AnexosEmail.Clear;
    if Assigned(Anexos) then
      AnexosEmail.Assign(Anexos);

    with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
    begin
      GravarStream(StreamGNRE);

      if (EnviaPDF) then
      begin
        if Assigned(GNREGuia) then
        begin
          GNREGuia.ImprimirGuiaPDF( nil {GuiasRetorno});
          NomeArq := PathWithDelim(GNREGuia.PathPDF) + NumID + '-gnre.pdf';
          AnexosEmail.Add(NomeArq);
        end;
      end;

      EnviarEmail( sPara, sAssunto, sMensagem, sCC, AnexosEmail, StreamGNRE,
                   NumID + '-gnre.xml');
    end;
  finally
    AnexosEmail.Free;
    StreamGNRE.Free;
  end;
end;

function Guia.GerarXML: String;
var
  IdAnterior : String;
begin
  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    IdAnterior := GNRE.c42_identificadorGuia;
    FGNREW.Gerador.Opcoes.FormatoAlerta := Configuracoes.Geral.FormatoAlerta;
    FGNREW.Gerador.Opcoes.RetirarAcentos := Configuracoes.Geral.RetirarAcentos;
  end;

//  FGNREW.Opcoes.GerarTXTSimultaneamente := False;

  FGNREW.GerarXml;
  //DEBUG
  //WriteToTXT('c:\temp\Guia.xml', FGNREW.Gerador.ArquivoFormatoXML, False, False);
  XMLOriginal := FGNREW.Gerador.ArquivoFormatoXML;

  // XML gerado pode ter nova Chave e ID, ent�o devemos calcular novamente
  // o nome do arquivo, mantendo o PATH do arquivo carregado
  if (NaoEstaVazio(FNomeArq) and (IdAnterior <> FGNRE.c42_identificadorGuia)) then
    FNomeArq := CalcularNomeArquivoCompleto('', ExtractFilePath(FNomeArq));

  FAlertas := ACBrStr( FGNREW.Gerador.ListaDeAlertas.Text );
  Result := FXMLOriginal;
end;

function Guia.CalcularNomeArquivo: String;
var
  xID: String;
  NomeXML: String;
begin
  xID := Self.NumID;

  if EstaVazio(xID) then
    raise EACBrGNREException.Create('ID Inv�lido. Imposs�vel Salvar XML');

  NomeXML := '-gnre.xml';

  Result := xID + NomeXML;
end;

function Guia.CalcularPathArquivo: String;
var
  Data: TDateTime;
begin
  with TACBrGNRE(TGuias(Collection).ACBrGNRE) do
  begin
    if Configuracoes.Arquivos.EmissaoPathGNRE then
      Data := FGNRE.c14_dataVencimento
    else
      Data := Now;

    Result := PathWithDelim(Configuracoes.Arquivos.GetPathGNRE(Data, FGNRE.c03_idContribuinteEmitente));
  end;
end;

function Guia.CalcularNomeArquivoCompleto(NomeArquivo,
  PathArquivo: String): String;
begin
  if EstaVazio(NomeArquivo) then
    NomeArquivo := CalcularNomeArquivo;

  if EstaVazio(PathArquivo) then
    PathArquivo := CalcularPathArquivo
  else
    PathArquivo := PathWithDelim(PathArquivo);

  Result := PathArquivo + NomeArquivo;
end;

function Guia.ValidarConcatChave: Boolean;
var
  wAno, wMes, wDia: word;
  chaveGNRE : String;
begin
  DecodeDate(GNRE.c14_dataVencimento, wAno, wMes, wDia);

  chaveGNRE := 'GNRE' + OnlyNumber(GNRE.c42_identificadorGuia);
  (*
  Result := not
    ((Copy(chaveGNRE, 4, 2) <> IntToStrZero(GNRE., 2)) or
    (Copy(chaveGNRE, 6, 2)  <> Copy(FormatFloat('0000', wAno), 3, 2)) or
    (Copy(chaveGNRE, 8, 2)  <> FormatFloat('00', wMes)) or
    (Copy(chaveGNRE, 10, 14)<> PadLeft(OnlyNumber(GNRE.Emit.CNPJCPF), 14, '0')) or
    (Copy(chaveGNRE, 24, 2) <> IntToStrZero(GNRE.Ide.modelo, 2)) or
    (Copy(chaveGNRE, 26, 3) <> IntToStrZero(GNRE.Ide.serie, 3)) or
    (Copy(chaveGNRE, 29, 9) <> IntToStrZero(GNRE.Ide.nNF, 9)) or
    (Copy(chaveGNRE, 38, 1) <> TpEmisToStr(GNRE.Ide.tpEmis)) or
    (Copy(chaveGNRE, 39, 8) <> IntToStrZero(GNRE.Ide.cNF, 8)));
  *)
  Result := True;
end;

function Guia.GetConfirmada: Boolean;
begin
  Result := True;

//  Result := TACBrGNRE(TGuias(Collection).ACBrGNRE).CstatConfirmada(
//    FGNRE.procGNRE.cStat);
end;

function Guia.GetProcessada: Boolean;
begin
  result := True;
//  Result := TACBrGNRE(TGuias(Collection).ACBrGNRE).CstatProcessado(
//    FGNRE.procGNRE.cStat);
end;

function Guia.GetMsg: String;
begin
  Result := '';
//  Result := FGNRE.procGNRE.xMotivo;
end;

function Guia.GetNumID: String;
begin
  Result := OnlyNumber(GNRE.c42_identificadorGuia);
end;

function Guia.GetXMLAssinado: String;
begin
  if EstaVazio(FXMLAssinado) then
    Assinar;

  Result := FXMLAssinado;
end;

procedure Guia.SetXML(AValue: String);
begin
  LerXML(AValue);
end;

procedure Guia.SetXMLOriginal(AValue: String);
begin
  FXMLOriginal := AValue;

  if XmlEstaAssinado(FXMLOriginal) then
    FXMLAssinado := FXMLOriginal
  else
    FXMLAssinado := '';
end;

{ TGuias }

constructor TGuias.Create(AOwner: TPersistent;
  ItemClass: TCollectionItemClass);
begin
  if not (AOwner is TACBrGNRE) then
    raise EACBrGNREException.Create('AOwner deve ser do tipo TACBrGNRE');

  inherited;

  FACBrGNRE := TACBrGNRE(AOwner);
  FConfiguracoes := TACBrGNRE(FACBrGNRE).Configuracoes;
end;

function TGuias.Add: Guia;
begin
  Result := Guia(inherited Add);
end;

procedure TGuias.Assinar;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Assinar;
end;

procedure TGuias.GerarGNRE;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].GerarXML;
end;

function TGuias.GetItem(Index: integer): Guia;
begin
  Result := Guia(inherited Items[Index]);
end;

function TGuias.GetNamePath: String;
begin
  Result := 'Guia';
end;

procedure TGuias.VerificarGNREGuias;
begin
  if not Assigned(TACBrGNRE(FACBrGNRE).GNREGuia) then
    raise EACBrGNREException.Create('Componente FGNREGuia n�o associado.');
end;

procedure TGuias.Imprimir;
begin
  VerificarGNREGuias;
  TACBrGNRE(FACBrGNRE).GNREGuia.ImprimirGuia(nil);
end;

procedure TGuias.ImprimirPDF;
begin
  VerificarGNREGuias;
  TACBrGNRE(FACBrGNRE).GNREGuia.ImprimirGuiaPDF(nil);
end;

function TGuias.Insert(Index: integer): Guia;
begin
  Result := Guia(inherited Insert(Index));
end;

procedure TGuias.SetItem(Index: integer; const Value: Guia);
begin
  Items[Index].Assign(Value);
end;

procedure TGuias.Validar;
var
  i: integer;
begin
  for i := 0 to Self.Count - 1 do
    Self.Items[i].Validar;   // Dispara exception em caso de erro
end;

function TGuias.VerificarAssinatura(out Erros: String): Boolean;
var
  i: integer;
begin
  Result := True;
  Erros := '';

  for i := 0 to Self.Count - 1 do
  begin
    if not Self.Items[i].VerificarAssinatura then
    begin
      Result := False;
      Erros := Erros + Self.Items[i].ErroValidacao + sLineBreak;
    end;
  end;
end;

function TGuias.ValidarRegrasdeNegocios(out Erros: String): Boolean;
var
  i: integer;
begin
  Result := True;
  Erros := '';

  for i := 0 to Self.Count - 1 do
  begin
    if not Self.Items[i].ValidarRegrasdeNegocios then
    begin
      Result := False;
      Erros := Erros + Self.Items[i].ErroRegrasdeNegocios + sLineBreak;
    end;
  end;
end;

function TGuias.LoadFromFile(CaminhoArquivo: String; AGerarGNRE: Boolean): Boolean;
var
  XMLStr: String;
  XMLUTF8: AnsiString;
  i, l: integer;
  MS: TMemoryStream;
begin
  Result := False;

  MS := TMemoryStream.Create;
  try
    MS.LoadFromFile(CaminhoArquivo);
    XMLUTF8 := ReadStrFromStream(MS, MS.Size);
  finally
    MS.Free;
  end;

  l := Self.Count; // Indice da �ltima guia j� existente

  // Converte de UTF8 para a String nativa da IDE //
  XMLStr := DecodeToString(XMLUTF8, True);
  LoadFromString(XMLStr, AGerarGNRE);

  // Atribui Nome do arquivo a novas guias inseridas //
  for i := l to Self.Count - 1 do
    Self.Items[i].NomeArq := CaminhoArquivo;

  Result := True;
end;

function TGuias.LoadFromStream(AStream: TStringStream;
  AGerarGNRE: Boolean): Boolean;
var
  AXML: AnsiString;
begin
  Result := False;
  AStream.Position := 0;
  AXML := ReadStrFromStream(AStream, AStream.Size);

  Result := Self.LoadFromString(String(AXML), AGerarGNRE);
end;

function TGuias.LoadFromString(AXMLString: String;
  AGerarGNRE: Boolean): Boolean;
var
  AXML: AnsiString;
  P, N: integer;

  function PosGNRE: integer;
  begin
    Result := pos('</guias>', AXMLString);
  end;

begin
  N := PosGNRE;
  while N > 0 do
  begin
    P := pos('</GNREProc>', AXMLString);
    if P > 0 then
    begin
      AXML := copy(AXMLString, 1, P + 10);
      AXMLString := Trim(copy(AXMLString, P + 10, length(AXMLString)));
    end
    else
    begin
      AXML := copy(AXMLString, 1, N + 6);
      AXMLString := Trim(copy(AXMLString, N + 6, length(AXMLString)));
    end;

    with Self.Add do
    begin
      LerXML(AXML);

      if AGerarGNRE then // Recalcula o XML
        GerarXML;
    end;

    N := PosGNRE;
  end;

  Result := Self.Count > 0;
end;

function TGuias.GravarXML(PathNomeArquivo: String): Boolean;
var
  i: integer;
  NomeArq, PathArq : String;
begin
  Result := True;
  i := 0;
  while Result and (i < Self.Count) do
  begin
    PathArq := ExtractFilePath(PathNomeArquivo);
    NomeArq := ExtractFileName(PathNomeArquivo);
    Result := Self.Items[i].GravarXML(NomeArq, PathArq);
    Inc(i);
  end;
end;

end.
