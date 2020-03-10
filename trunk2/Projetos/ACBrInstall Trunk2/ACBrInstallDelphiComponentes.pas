{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009   Daniel Simoes de Almeida             }
{                                         Isaque Pinheiro                      }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
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

unit ACBrInstallDelphiComponentes;

interface

uses
  SysUtils, Windows, Messages, Classes, Forms, System.Generics.Collections,
  JclIDEUtils, JclCompilerUtils, ACBrPacotes, UACBrPlataformaInstalacaoAlvo;

const
  sVersaoInstalador = '1.5.0.1';
type
  TDestino = (tdSystem, tdDelphi, tdNone);
  TNivelLog = (nlNenhumLog, nlMinimo, nlMedio, nlMaximo);

  TOnIniciaNovaInstalacao = reference to procedure (const MaximoPassosProgresso: Integer;
        const NomeCaminhoArquivoLog: string; const Cabecalho: string);
  TOnInformarSituacao = reference to procedure (const Mensagem: string);
  TOnProgresso  = TProc;

  TACBrCompilerOpcoes = record
    DeveInstalarCapicom: Boolean;
    DeveInstalarOpenSSL: Boolean;
    DeveInstalarXMLSec: Boolean;
    UsarCargaTardiaDLL: Boolean;
    RemoverStringCastWarnings: Boolean;
  end;

  TACBrInstallOpcoes = record
    LimparArquivosACBrAntigos: Boolean;
    DeixarSomentePastasLib: Boolean;
    UsarCpp: Boolean;
    UsarUsarArquivoConfig: Boolean;
    sDestinoDLLs: TDestino;
    DiretorioRaizACBr: string;
    DeveCopiarOutrasDLLs: Boolean;
  end;

  TACBrInstallComponentes = class(TObject)
  private
    FApp: TApplication;
    FOnIniciaNovaInstalacao: TOnIniciaNovaInstalacao;
    FOnProgresso: TOnProgresso;
    FOnInformaSituacao: TOnInformarSituacao;

    UmaPlataformaDestino: TPlataformaDestino;

    FPacoteAtual: TFileName;

    ArquivoLog: string;
    FNivelLog: TNivelLog;

    FCountErros: Integer;
    JaCopiouDLLs: Boolean;
    FJaFezLimpezaArquivoACBrAntigos: Boolean;

    procedure FindDirs(APlatform:TJclBDSPlatform; ADirRoot: String; bAdicionar: Boolean = True);
    procedure CopiarArquivoDLLTo(ADestino : TDestino; const ANomeArquivo: String; const APathBin: string);

    procedure InstalarCapicom(ADestino : TDestino; const APathBin: string);
    procedure InstalarDiversos(ADestino: TDestino; const APathBin: string);
    procedure InstalarLibXml2(ADestino: TDestino; const APathBin: string);
    procedure InstalarOpenSSL(ADestino: TDestino; const APathBin: string);
    procedure InstalarXMLSec(ADestino: TDestino; const APathBin: string);

    procedure FazLog(const Texto: string; const ANivelLog: TNivelLog = nlMedio; const ReiniciaArquivo: Boolean = False);
    procedure InformaSituacao(const Mensagem: string);
    procedure InformaProgresso;

    function RetornaPath(const ADestino: TDestino; const APathBin: string): string;
    procedure RemoverPacotesAntigos;
    procedure RemoverDiretoriosACBrDoPath;
    procedure RemoverArquivosAntigosDoDisco;

    procedure AdicionaLibraryPathNaDelphiVersaoEspecifica(const AProcurarRemover: string);
    procedure AddLibrarySearchPath;
    procedure DeixarSomenteLib;

    procedure CopiarOutrosArquivosParaPastaLibrary;
    procedure BeforeExecute(Sender: TJclBorlandCommandLineTool);
    procedure CompilaPacotePorNomeArquivo(const NomePacote: string);
    procedure OutputCallLine(const Text: string);
    procedure CompilarEInstalarPacotes(ListaPacotes: TPacotes);
    procedure CompilarPacotes(const PastaACBr: string; listaPacotes: TPacotes);
    procedure InstalarPacotes(const PastaACBr: string; listaPacotes: TPacotes);
    function PathArquivoLog(const NomeVersao: string): String;

    procedure DesligarDefines;
    procedure FazInstalacaoInicial(ListaPacotes: TPacotes; PlataformaDestino: TPlataformaDestino);
    procedure InstalarOutrosRequisitos;
    procedure FazInstalacaoDLLs(const APathBin: string);
    procedure ConfiguraMetodosCompiladores;
    function FazBroadcastDeAlteracaoDeConfiguracao(cs: PWideChar) : Integer;

  public
    OpcoesInstall: TACBrInstallOpcoes;
    OpcoesCompilacao: TACBrCompilerOpcoes;

    constructor Create(app: TApplication);
    destructor Destroy; override;


    function Instalar(ListaPacotes: TPacotes; ListaVersoesInstalacao:TList<Integer>;
      ListaPlataformasInstalacao: TListaPlataformasAlvos): Boolean;

    property OnIniciaNovaInstalacao: TOnIniciaNovaInstalacao read FOnIniciaNovaInstalacao write FOnIniciaNovaInstalacao;
    property OnProgresso: TOnProgresso read FOnProgresso write FonProgresso;
    property OnInformaSituacao: TOnInformarSituacao read FOnInformaSituacao write FOnInformaSituacao;
  end;

implementation

uses
  ShellApi, Types, IOUtils,
  ACBrUtil, ACBrInstallUtils;


{ TACBrInstallComponentes }
constructor TACBrInstallComponentes.Create(app: TApplication);
begin
  inherited Create;
  //Valores padr�es das op��es
  OpcoesInstall.LimparArquivosACBrAntigos := False;
  OpcoesInstall.DeixarSomentePastasLib    := True;
  OpcoesInstall.UsarCpp                   := False;
  OpcoesInstall.UsarUsarArquivoConfig     := True;
  OpcoesInstall.sDestinoDLLs              := tdNone;
  OpcoesInstall.DiretorioRaizACBr         := 'C:\ACBr\';
  OpcoesInstall.DeveCopiarOutrasDLLs      := True;

  OpcoesCompilacao.DeveInstalarCapicom       := False;
  OpcoesCompilacao.DeveInstalarOpenSSL       := True;
  OpcoesCompilacao.DeveInstalarXMLSec        := False;
  OpcoesCompilacao.UsarCargaTardiaDLL        := False;
  OpcoesCompilacao.RemoverStringCastWarnings := False;

  ArquivoLog := '';
  FNivelLog  := nlMedio;
  FJaFezLimpezaArquivoACBrAntigos := False;

  FApp := app;
//  UmaPlataformaDestino := TPlataformaDestino.Create;
//  oACBr := TJclBorRADToolInstallations.Create;
//  tcpt  := TCompileTargetList.Create;

end;

destructor TACBrInstallComponentes.Destroy;
begin
//  tcpt.Free;
//  oACBr.Free;
//  UmaPlataformaDestino.Free;
  inherited;
end;

procedure TACBrInstallComponentes.ConfiguraMetodosCompiladores;
begin
  // -- Evento disparado antes de iniciar a execu��o do processo.
  UmaPlataformaDestino.InstalacaoAtual.DCC32.OnBeforeExecute := BeforeExecute;
  if clDcc64 in UmaPlataformaDestino.InstalacaoAtual.CommandLineTools then
    (UmaPlataformaDestino.InstalacaoAtual as TJclBDSInstallation).DCC64.OnBeforeExecute := BeforeExecute;
  if clDccOSX32 in UmaPlataformaDestino.InstalacaoAtual.CommandLineTools then
    (UmaPlataformaDestino.InstalacaoAtual as TJclBDSInstallation).DCCOSX32.OnBeforeExecute := BeforeExecute;

  // -- Evento para saidas de mensagens.
  UmaPlataformaDestino.InstalacaoAtual.OutputCallback := OutputCallLine;
end;

procedure TACBrInstallComponentes.OutputCallLine(const Text: string);
begin
  // Evento disparado a cada a��o do compilador...

  // remover a warnings de convers�o de string (delphi 2010 em diante)
  // as diretivas -W e -H n�o removem estas mensagens
  if (pos('Warning: W1057', Text) <= 0) and ((pos('Warning: W1058', Text) <= 0)) then
  begin
    FazLog(Text);
  end;
end;

procedure TACBrInstallComponentes.BeforeExecute(Sender: TJclBorlandCommandLineTool);
const
  VersoesComNamespaces: array[0..10] of string = ('d16', 'd17','d18','d19','d20','d21','d22','d23','d24','d25',
                                                  'd26');
  NamespacesBase = 'System;Xml;Data;Datasnap;Web;Soap;';
  NamespacesWindows = 'Data.Win;Datasnap.Win;Web.Win;Soap.Win;Xml.Win;Winapi;System.Win;';
  NamespacesOSX = 'Macapi;Posix;System.Mac;';
  NamespacesAndroid = '';
  NamespacesiOS = '';
  NamespacesVCL = 'Vcl;Vcl.Imaging;Vcl.Touch;Vcl.Samples;Vcl.Shell;';
  NamespacesFMX = 'FMX;FMX.ASE;FMX.Bind;FMX.Canvas;FMX.DAE;FMX.DateTimeControls;FMX.EmbeddedControls;FMX.Filter;FMX.ListView;FMX.MediaLibrary;';
var
  LArquivoCfg: TFilename;
  NamespacesTemp: string;

begin
  with UmaPlataformaDestino do
  begin
    // Evento para setar os par�metros do compilador antes de compilar

    // limpar os par�metros do compilador
    Sender.Options.Clear;

    // n�o utilizar o dcc32.cfg
    if (InstalacaoAtual.SupportsNoConfig) and
       // -- Arquivo cfg agora opcional no caso de paths muito extensos
       (not OpcoesInstall.UsarUsarArquivoConfig) then
      Sender.Options.Add('--no-config');

    // -B = Build all units
    Sender.Options.Add('-B');
    // O+ = Optimization
    Sender.Options.Add('-$O-');
    // W- = Generate stack frames
    Sender.Options.Add('-$W+');
    // Y+ = Symbol reference info
    Sender.Options.Add('-$Y-');
    // -M = Make modified units
    Sender.Options.Add('-M');
    // -Q = Quiet compile
    Sender.Options.Add('-Q');
    // n�o mostrar warnings
    Sender.Options.Add('-H-');
    // n�o mostrar hints
    Sender.Options.Add('-W-');
    // -D<syms> = Define conditionals
    Sender.Options.Add('-DRELEASE');
    // -U<paths> = Unit directories
    Sender.AddPathOption('U', InstalacaoAtual.LibFolderName[tPlatformAtual]);
    Sender.AddPathOption('U', InstalacaoAtual.LibrarySearchPath[tPlatformAtual]);
    Sender.AddPathOption('U', sDirLibrary);
    // -I<paths> = Include directories
    Sender.AddPathOption('I', InstalacaoAtual.LibrarySearchPath[tPlatformAtual]);
    // -R<paths> = Resource directories
    Sender.AddPathOption('R', InstalacaoAtual.LibrarySearchPath[tPlatformAtual]);
    // -N0<path> = unit .dcu output directory
    Sender.AddPathOption('N0', sDirLibrary);
    Sender.AddPathOption('LE', sDirLibrary);
    Sender.AddPathOption('LN', sDirLibrary);

    // ************ C++ Builder *************** //
    if OpcoesInstall.UsarCpp then
    begin
       // -JL compila c++ builder
       Sender.AddPathOption('JL', sDirLibrary);
       // -NO compila .dpi output directory c++ builder
       Sender.AddPathOption('NO', sDirLibrary);
       // -NB compila .lib output directory c++ builder
       Sender.AddPathOption('NB', sDirLibrary);
       // -NH compila .hpp output directory c++ builder
       Sender.AddPathOption('NH', sDirLibrary);
    end;

    //Montar namespaces:
    if MatchText(InstalacaoAtual.VersionNumberStr, VersoesComNamespaces) then
    begin
  //    Namespaces := '';

      NamespacesTemp := NamespacesBase;

      if tPlatformAtual in [bpWin32, bpWin64] then
      begin
        NamespacesTemp := NamespacesTemp + NamespacesWindows;

        if tPlatformAtual = bpWin32 then
        begin
          NamespacesTemp := NamespacesTemp + 'Bde;';
        end;
      end;

      if tPlatformAtual in [bpWin32, bpWin64] {and notFMX} then
      begin
        NamespacesTemp := NamespacesTemp + NamespacesVCL;
      end;

      if not (tPlatformAtual in [bpWin32, bpWin64]) {or FMX} then
      begin
        NamespacesTemp := NamespacesTemp + NamespacesFMX;
      end;

      if tPlatformAtual = bpOSX32 then
      begin
        NamespacesTemp := NamespacesTemp + NamespacesOSX;
      end;

      Sender.Options.Add('-NS'+NamespacesTemp);

    end;

    if (OpcoesInstall.UsarUsarArquivoConfig) then
    begin
      LArquivoCfg := ChangeFileExt(FPacoteAtual, '.cfg');
      Sender.Options.SaveToFile(LArquivoCfg);
      Sender.Options.Clear;
    end;
  end;//<---End With Tempor�rio
end;

procedure TACBrInstallComponentes.DeixarSomenteLib;
begin
  // remover os path com o segundo parametro
  FindDirs(UmaPlataformaDestino.tPlatformAtual, OpcoesInstall.DiretorioRaizACBr + 'Fontes', False);
end;

procedure TACBrInstallComponentes.FazInstalacaoInicial(ListaPacotes: TPacotes; PlataformaDestino:
   TPlataformaDestino);
var
  Cabecalho: string;
  NomeVersao: string;
begin

  with UmaPlataformaDestino do
  begin
    NomeVersao := VersionNumberToNome(InstalacaoAtual.VersionNumberStr);

    ArquivoLog := PathArquivoLog(NomeVersao+ ' ' + sPlatform);
    Cabecalho := 'Versao Instalador: ' + sVersaoInstalador + sLineBreak +
                 'Vers�o do delphi: ' + NomeVersao + ' ' + sPlatform + sLineBreak +
                 'Dir. Instala��o : ' + OpcoesInstall.DiretorioRaizACBr + sLineBreak +
                 'Dir. Bibliotecas: ' + sDirLibrary;

    FazLog(Cabecalho + sLineBreak, nlMinimo, True);

    if Assigned(OnIniciaNovaInstalacao) then
      FOnIniciaNovaInstalacao((ListaPacotes.Count * 2) + 6, ArquivoLog, Cabecalho);

    FCountErros := 0;

    // limpar arquivos antigos somente ao iniciar o procedimento de instala��o
    if (OpcoesInstall.LimparArquivosACBrAntigos) and (not FJaFezLimpezaArquivoACBrAntigos)  then
    begin
      FJaFezLimpezaArquivoACBrAntigos := True;
      InformaSituacao('Removendo arquivos ACBr antigos dos discos...');
      RemoverArquivosAntigosDoDisco;
      InformaSituacao('...OK');
    end;
    //se a op��o n�o estiver marcada deve informar o progresso tamb�m...
    InformaProgresso;

    ConfiguraMetodosCompiladores;

    InformaSituacao('Removendo librarypaths da instala��o anterior do ACBr na IDE...');
    RemoverDiretoriosACBrDoPath;
    InformaSituacao('...OK');

    if tPlatformAtual = bpWin32 then
    begin
      InformaSituacao('Removendo pacotes 32bits da instala��o anterior do ACBr na IDE...');
      RemoverPacotesAntigos;
      InformaSituacao('...OK');
    end;
    InformaProgresso;

    // *************************************************************************
    // Cria diret�rio de biblioteca da vers�o do delphi selecionada,
    // s� ser� criado se n�o existir
    // *************************************************************************
    InformaSituacao('Criando diret�rios de bibliotecas para ' + sPlatform + '...');
    ForceDirectories(sDirLibrary);
    InformaSituacao('...OK');
    InformaProgresso;

    // *************************************************************************
    // Adiciona os paths dos fontes na vers�o do delphi selecionada
    // *************************************************************************
    InformaSituacao('Adicionando library paths para ' + sPlatform + '...');
    AddLibrarySearchPath;
    InformaSituacao('...OK');
    InformaProgresso;

    // -- adicionar ao environment variables do delphi
    if tPlatformAtual = bpWin32 then
begin
    InformaSituacao('Alterando a vari�vel de ambiente PATH do Delphi...');
    AdicionaLibraryPathNaDelphiVersaoEspecifica('acbr');
    InformaSituacao('...OK');
end;
    InformaProgresso;


    CompilarEInstalarPacotes(ListaPacotes);
  end; //<---- endwith
end;

// retornar o caminho completo para o arquivo de logs
function TACBrInstallComponentes.PathArquivoLog(const NomeVersao: string): String;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) +
            'log_' + StringReplace(NomeVersao, ' ', '_', [rfReplaceAll]) + '.txt';
end;

procedure TACBrInstallComponentes.FazLog(const Texto: string; const ANivelLog: TNivelLog = nlMedio; const
    ReiniciaArquivo: Boolean = False);
begin
  if ANivelLog > FNivelLog then
  begin
    Exit
  end;

  if ArquivoLog <> EmptyStr then
    WriteToTXT(ArquivoLog, Texto, not ReiniciaArquivo);
end;

function TACBrInstallComponentes.RetornaPath(const ADestino: TDestino; const APathBin: string): string;
begin
  case ADestino of
    tdSystem: Result := '"'+ PathSystem + '"';
    tdDelphi: Result := '"'+ APathBin + '"';
    tdNone:   Result := 'Tipo de destino "nenhum" n�o aceito!';
  else
    Result := 'Tipo de destino desconhecido!'
  end;
end;

procedure TACBrInstallComponentes.FazInstalacaoDLLs(const APathBin: string);
begin
  // *************************************************************************
  // instalar capicom
  // *************************************************************************
  try
    if OpcoesCompilacao.DeveInstalarCapicom then
    begin
      InstalarCapicom(OpcoesInstall.sDestinoDLLs, APathBin);
      InformaSituacao('CAPICOM instalado com sucesso em '+ RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin));
    end;
  except
    on E: Exception do
    begin
      Inc(FCountErros);
      InformaSituacao('Ocorreu erro ao instalar a CAPICOM em '+ RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin) + sLineBreak +
            'Erro: ' + E.Message);
    end;
  end;

  // *************************************************************************
  // instalar OpenSSL
  // *************************************************************************
  try
    if OpcoesCompilacao.DeveInstalarOpenSSL then
    begin
      InstalarOpenSSL(OpcoesInstall.sDestinoDLLs, APathBin);
      InformaSituacao('OPENSSL instalado com sucesso em '+ RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin));
    end;
  except
    on E: Exception do
    begin
      Inc(FCountErros);
      InformaSituacao('Ocorreu erro ao instalar a OPENSSL em '+ RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin) + sLineBreak +
            'Erro: ' + E.Message);
    end;
  end;

  // *************************************************************************
  //instalar todas as "OUTRAS" DLLs
  // *************************************************************************
  if OpcoesInstall.DeveCopiarOutrasDLLs then
  begin
    try
      InstalarLibXml2(OpcoesInstall.sDestinoDLLs, APathBin);
      InformaSituacao('LibXml2 instalado com sucesso em '+ RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin));

      InstalarDiversos(OpcoesInstall.sDestinoDLLs, APathBin);
      InformaSituacao('DLLs diversas instalado com sucesso em '+ RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin));

      if OpcoesCompilacao.DeveInstalarXMLSec then
      begin
        InstalarXMLSec(OpcoesInstall.sDestinoDLLs, APathBin);
        InformaSituacao('XMLSec instalado com sucesso em '+ RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin));
      end;
    except
      on E: Exception do
      begin
        Inc(FCountErros);
        InformaSituacao(
          'Ocorreu erro ao instalar Outras DLL�s em '+
          RetornaPath(OpcoesInstall.sDestinoDLLs, APathBin) + sLineBreak +
          'Erro: ' + E.Message);
      end;
    end;
  end;
end;

procedure TACBrInstallComponentes.InformaProgresso;
begin
  if Assigned(FOnProgresso) then
    FOnProgresso;
end;

procedure TACBrInstallComponentes.FindDirs(APlatform: TJclBDSPlatform; ADirRoot: String; bAdicionar: Boolean = True);

  function ExisteArquivoPasNoDir(const ADir: string): Boolean;
  var
    oDirList: TSearchRec;
  begin
    Result := False;
    if FindFirst(IncludeTrailingPathDelimiter(ADir) + '*.pas', faNormal, oDirList) = 0 then
    begin
      try
        Result := True;
      finally
        SysUtils.FindClose(oDirList)
      end;
    end;
  end;

  function EProibido(const ADir: String): Boolean;
  const
    LISTA_PROIBIDOS: ARRAY[0..14] OF STRING = (
      'quick', 'rave', 'laz', 'VerificarNecessidade', '__history', '__recovery', 'backup',
      'Logos', 'Colorido', 'PretoBranco', 'Imagens', 'bmp', 'logotipos', 'PerformanceTest', 'test'
    );
  var
    Str: String;
  begin
//    Result := False;
    for str in LISTA_PROIBIDOS do
    begin
      Result := Pos(AnsiUpperCase(str), AnsiUpperCase(ADir)) > 0;
      if Result then
        Break;
    end;
  end;

var
  oDirList: TSearchRec;
  Conseguiu: Boolean;
begin
  with UmaPlataformaDestino do
  begin
    ADirRoot := IncludeTrailingPathDelimiter(ADirRoot);

    if FindFirst(ADirRoot + '*.*', faDirectory, oDirList) = 0 then
    begin
      try
        repeat
          if ((oDirList.Attr and faDirectory) <> 0) and
              (oDirList.Name <> '.')                and
              (oDirList.Name <> '..') then
          begin
            if not bAdicionar then
            begin
              Conseguiu := InstalacaoAtual.RemoveFromLibrarySearchPath(ADirRoot + oDirList.Name, APlatform);
              FazLog('Conseguiu remover do Library Search Path: '+ ADirRoot + oDirList.Name + '....' +
                      BoolToStr(Conseguiu, True), nlMaximo);
              //-- Procura subpastas
              FindDirs(APlatform, ADirRoot + oDirList.Name, bAdicionar);
            end
            else
            begin
              if (not EProibido(oDirList.Name)) then
              begin
                if ExisteArquivoPasNoDir(ADirRoot + oDirList.Name) then
                begin
                  InstalacaoAtual.AddToLibrarySearchPath(ADirRoot + oDirList.Name, APlatform);
                  InstalacaoAtual.AddToLibraryBrowsingPath(ADirRoot + oDirList.Name, APlatform);
                end;
                //-- Procura subpastas
                FindDirs(APlatform, ADirRoot + oDirList.Name, bAdicionar);
              end;
            end;
          end;
        until FindNext(oDirList) <> 0;
      finally
        SysUtils.FindClose(oDirList)
      end;
    end;
  end; //---endwith
end;

procedure TACBrInstallComponentes.AddLibrarySearchPath;
var
  InstalacaoAtualCpp: TJclBDSInstallation;
begin
  // adicionar o paths ao library path do delphi
  with UmaPlataformaDestino do
  begin
    InstalacaoAtual.AddToLibraryBrowsingPath(sDirLibrary, tPlatformAtual);
    InstalacaoAtual.AddToLibrarySearchPath(sDirLibrary, tPlatformAtual);
    InstalacaoAtual.AddToDebugDCUPath(sDirLibrary, tPlatformAtual);

    FindDirs(tPlatformAtual, OpcoesInstall.DiretorioRaizACBr + 'Fontes');

    //-- ************ C++ Builder *************** //
    if OpcoesInstall.UsarCpp then
    begin
       if InstalacaoAtual is TJclBDSInstallation then
       begin
         InstalacaoAtualCpp := TJclBDSInstallation(InstalacaoAtual);
         InstalacaoAtualCpp.AddToCppSearchPath(sDirLibrary, tPlatformAtual);
         InstalacaoAtualCpp.AddToCppLibraryPath(sDirLibrary, tPlatformAtual);
         InstalacaoAtualCpp.AddToCppBrowsingPath(sDirLibrary, tPlatformAtual);
         InstalacaoAtualCpp.AddToCppIncludePath(sDirLibrary, tPlatformAtual);
       end;
    end;
  end;//---endwith
end;

procedure TACBrInstallComponentes.RemoverDiretoriosACBrDoPath();
var
  ListaPaths: TStringList;
  I: Integer;
begin
  with UmaPlataformaDestino do
  begin
    ListaPaths := TStringList.Create;
    try
      ListaPaths.StrictDelimiter := True;
      ListaPaths.Delimiter := ';';

      // remover do search path
      ListaPaths.Clear;
      ListaPaths.DelimitedText := InstalacaoAtual.RawLibrarySearchPath[tPlatformAtual];
      for I := ListaPaths.Count - 1 downto 0 do
      begin
        if Pos('ACBR', AnsiUpperCase(ListaPaths[I])) > 0 then
          ListaPaths.Delete(I);
      end;
      InstalacaoAtual.RawLibrarySearchPath[tPlatformAtual] := ListaPaths.DelimitedText;
      // remover do browse path
      ListaPaths.Clear;
      ListaPaths.DelimitedText := InstalacaoAtual.RawLibraryBrowsingPath[tPlatformAtual];
      for I := ListaPaths.Count - 1 downto 0 do
      begin
        if Pos('ACBR', AnsiUpperCase(ListaPaths[I])) > 0 then
          ListaPaths.Delete(I);
      end;
      InstalacaoAtual.RawLibraryBrowsingPath[tPlatformAtual] := ListaPaths.DelimitedText;
      // remover do Debug DCU path
      ListaPaths.Clear;
      ListaPaths.DelimitedText := InstalacaoAtual.RawDebugDCUPath[tPlatformAtual];
      for I := ListaPaths.Count - 1 downto 0 do
      begin
        if Pos('ACBR', AnsiUpperCase(ListaPaths[I])) > 0 then
          ListaPaths.Delete(I);
      end;
      InstalacaoAtual.RawDebugDCUPath[tPlatformAtual] := ListaPaths.DelimitedText;
    finally
      ListaPaths.Free;
    end;
  end;//---endwith
end;

procedure TACBrInstallComponentes.RemoverPacotesAntigos;
var
  I: Integer;
begin
  with UmaPlataformaDestino do
  begin
    // remover pacotes antigos
    for I := InstalacaoAtual.IdePackages.Count - 1 downto 0 do
    begin
      if Pos('ACBR', AnsiUpperCase(InstalacaoAtual.IdePackages.PackageFileNames[I])) > 0 then
        InstalacaoAtual.IdePackages.RemovePackage(InstalacaoAtual.IdePackages.PackageFileNames[I]);
    end;
  end;//---endwith
end;

procedure TACBrInstallComponentes.CopiarArquivoDLLTo(ADestino : TDestino; const ANomeArquivo: String;
     const APathBin: string);
var
  PathOrigem: String;
  PathDestino: String;
  DirSystem: String;
begin
  case ADestino of
    tdSystem: DirSystem := Trim(PathSystem);
    tdDelphi: DirSystem := APathBin;
  end;

  if DirSystem <> EmptyStr then
    DirSystem := IncludeTrailingPathDelimiter(DirSystem)
  else
    raise EFileNotFoundException.Create('Diret�rio de sistema n�o encontrado.');

  PathOrigem  := OpcoesInstall.DiretorioRaizACBr + 'DLLs\' + ANomeArquivo;
  PathDestino := DirSystem + ExtractFileName(ANomeArquivo);

  if not FileExists(PathOrigem) then
  begin
    InformaSituacao(Format('AVISO: Arquivo n�o encontrado na origem: "%s"', [PathOrigem]));
    Exit;
  end;

  if not (FileExists(PathDestino)) then
  begin
    if not CopyFile(PWideChar(PathOrigem), PWideChar(PathDestino), True) then
    begin
      raise EFilerError.CreateFmt(
        'Ocorreu o seguinte erro ao tentar copiar o arquivo "%s": %d - %s', [
        ANomeArquivo, GetLastError, SysErrorMessage(GetLastError)
      ]);
    end;
  end;
end;

procedure TACBrInstallComponentes.InformaSituacao(const Mensagem: string);
begin
  FazLog(Mensagem);

  if Assigned(OnInformaSituacao) then
    OnInformaSituacao(Mensagem);
end;

function TACBrInstallComponentes.Instalar(ListaPacotes: TPacotes; ListaVersoesInstalacao:TList<Integer>;
    ListaPlataformasInstalacao: TListaPlataformasAlvos): Boolean;
var
  I: Integer;
begin
  DesligarDefines;
  JaCopiouDLLs := False;
  FJaFezLimpezaArquivoACBrAntigos := False;

  for I := 0 to ListaVersoesInstalacao.Count -1 do
  begin
    UmaPlataformaDestino := ListaPlataformasInstalacao[ListaVersoesInstalacao[i]];
    UmaPlataformaDestino.sDirLibrary := OpcoesInstall.DiretorioRaizACBr + UmaPlataformaDestino.GetDirLibrary;

    FazInstalacaoInicial(ListaPacotes, UmaPlataformaDestino);

    if (FCountErros <> 0) then
      Break;

    InstalarOutrosRequisitos;
  end;

  Result := (FCountErros = 0);
end;

function TACBrInstallComponentes.FazBroadcastDeAlteracaoDeConfiguracao(cs: PWideChar) : Integer;
var
  wParam: Integer;
  lParam: Integer;
  lpdwResult: PDWORD_PTR;
begin
  // enviar um broadcast de atualiza��o para o windows
  wParam := 0;
  lParam := LongInt(cs);
  lpdwResult := nil;
  Result := SendMessageTimeout(HWND_BROADCAST, WM_SETTINGCHANGE, wParam, lParam, SMTO_NORMAL, 4000, lpdwResult);
end;

procedure TACBrInstallComponentes.InstalarCapicom(ADestino : TDestino; const APathBin: string);
begin
// copia as dlls da pasta capcom para a pasta escolhida pelo usuario e registra a dll
  if ADestino <> tdNone then
  begin
    CopiarArquivoDLLTo(ADestino, 'Capicom\capicom.dll', APathBin);
    CopiarArquivoDLLTo(ADestino, 'Capicom\msxml5.dll',  APathBin);
    CopiarArquivoDLLTo(ADestino, 'Capicom\msxml5r.dll', APathBin);

    if ADestino = tdDelphi then
    begin
      RegistrarActiveXServer(APathBin + 'capicom.dll', True);
      RegistrarActiveXServer(APathBin + 'msxml5.dll', True);
    end
    else
    begin
      RegistrarActiveXServer('capicom.dll', True);
      RegistrarActiveXServer('msxml5.dll', True);
    end;
  end;
end;

//copia as dlls da pasta Diversoso para a pasta escolhida pelo usuario
procedure TACBrInstallComponentes.InstalarDiversos(ADestino: TDestino; const APathBin: string);
begin
  if ADestino <> tdNone then
  begin
    CopiarArquivoDLLTo(ADestino,'Diversos\x86\iconv.dll',    APathBin);
    CopiarArquivoDLLTo(ADestino,'Diversos\x86\inpout32.dll', APathBin);
    CopiarArquivoDLLTo(ADestino,'Diversos\x86\msvcr71.dll',  APathBin);
  end;
end;

procedure TACBrInstallComponentes.InstalarLibXml2(ADestino: TDestino; const APathBin: string);
begin
  if ADestino <> tdNone then
  begin
    CopiarArquivoDLLTo(ADestino,'LibXml2\x86\libexslt.dll', APathBin);
    CopiarArquivoDLLTo(ADestino,'LibXml2\x86\libiconv.dll', APathBin);
    CopiarArquivoDLLTo(ADestino,'LibXml2\x86\libxml2.dll',  APathBin);
    CopiarArquivoDLLTo(ADestino,'LibXml2\x86\libxslt.dll',  APathBin);
  end;
end;

procedure TACBrInstallComponentes.InstalarOpenSSL(ADestino: TDestino; const APathBin: string);
begin
// copia as dlls da pasta openssl, estas dlls s�o utilizadas para assinar
// arquivos e outras coisas mais
  if ADestino <> tdNone then
  begin
    CopiarArquivoDLLTo(ADestino,'OpenSSL\1.1.1.4\x86\libcrypto-1_1.dll', APathBin);
    CopiarArquivoDLLTo(ADestino,'OpenSSL\1.1.1.4\x86\libssl-1_1.dll', APathBin);
  end;
end;

procedure TACBrInstallComponentes.InstalarOutrosRequisitos;
begin
  with UmaPlataformaDestino do
  begin
    InformaSituacao(sLineBreak+'INSTALANDO OUTROS REQUISITOS...');
    // *************************************************************************
    // deixar somente a pasta lib se for configurado assim
    // *************************************************************************
    if OpcoesInstall.DeixarSomentePastasLib and (tPlatformAtual = bpWin32) then
    begin
      try
        DeixarSomenteLib;
        InformaSituacao('Limpeza library path com sucesso');
      except
        on E: Exception do
        begin
          InformaSituacao('Ocorreu erro ao limpar o path: ' + sLineBreak + E.Message);
        end;
      end;

      try
        CopiarOutrosArquivosParaPastaLibrary;
        InformaSituacao('C�pia dos arquivos necess�rio feita com sucesso para: '+ sDirLibrary);
      except
        on E: Exception do
        begin
          InformaSituacao(
            'Ocorreu erro ao copiar arquivos para: '+ sDirLibrary + sLineBreak +
            'Erro:'+ E.Message);
        end;
      end;
    end;


    if (FCountErros = 0) then
    begin
      // Copiar apenas dlls na plataforma da IDE Win32.
      if (tPlatformAtual = bpWin32) and
         ((OpcoesInstall.sDestinoDLLs = tdDelphi) or (not JaCopiouDLLs)) then
      begin
        FazInstalacaoDLLs(IncludeTrailingPathDelimiter(InstalacaoAtual.BinFolderName));
        JaCopiouDLLs := True;
      end;
    end;
  end;//---endwith
end;

procedure TACBrInstallComponentes.InstalarXMLSec(ADestino: TDestino; const APathBin: string);
begin
  //copia as dlls da pasta XMLSec para a pasta escolhida pelo usuario
  if ADestino <> tdNone then
  begin
    CopiarArquivoDLLTo(ADestino, 'XMLSec\iconv.dll', APathBin);
    CopiarArquivoDLLTo(ADestino, 'XMLSec\libxml2.dll', APathBin);
    CopiarArquivoDLLTo(ADestino, 'XMLSec\libxmlsec.dll', APathBin);
    CopiarArquivoDLLTo(ADestino, 'XMLSec\libxmlsec-openssl.dll', APathBin);
    CopiarArquivoDLLTo(ADestino, 'XMLSec\libxslt.dll', APathBin);
    CopiarArquivoDLLTo(ADestino, 'XMLSec\zlib1.dll', APathBin);
  end;
end;

procedure TACBrInstallComponentes.AdicionaLibraryPathNaDelphiVersaoEspecifica(const AProcurarRemover: string);
var
  PathsAtuais: string;
  ListaPaths: TStringList;
  I: Integer;
  Resultado: Integer;
const
  cs: PChar = 'Environment Variables';
begin
  with UmaPlataformaDestino do
  begin
    // tentar ler o path configurado na ide do delphi, se n�o existir ler
    // a atual para complementar e fazer o override
    PathsAtuais := Trim(InstalacaoAtual.EnvironmentVariables.Values['PATH']);
    if PathsAtuais = '' then
      PathsAtuais := GetEnvironmentVariable('PATH');
    // manipular as strings
    ListaPaths := TStringList.Create;
    try
      ListaPaths.Clear;
      ListaPaths.Delimiter := ';';
      ListaPaths.StrictDelimiter := True;
      ListaPaths.DelimitedText := PathsAtuais;
      // verificar se existe algo do ACBr e remover apenas se for Win32
      if (Trim(AProcurarRemover) <> '') and (tPlatformAtual = bpWin32) then
      begin
        for I := ListaPaths.Count - 1 downto 0 do
        begin
          if Pos(AnsiUpperCase(AProcurarRemover), AnsiUpperCase(ListaPaths[I])) > 0 then
            ListaPaths.Delete(I);
        end;
      end;
      // adicionar ao path a pasta da biblioteca
      ListaPaths.Add(sDirLibrary);
      InstalacaoAtual.ConfigData.WriteString(cs, 'PATH', ListaPaths.DelimitedText);

      //Isso � realmente necess�rio??
      Resultado := FazBroadcastDeAlteracaoDeConfiguracao(cs);
      if Resultado = 0 then
        raise Exception.create('Ocorreu um erro ao tentar configurar o path: ' + SysErrorMessage(GetLastError));
    finally
      ListaPaths.Free;
    end;
  end;//---endwith
end;

procedure TACBrInstallComponentes.CompilaPacotePorNomeArquivo(const NomePacote: string);
begin
  if UmaPlataformaDestino.InstalacaoAtual.RadToolKind = brBorlandDevStudio then
  begin
    (UmaPlataformaDestino.InstalacaoAtual as TJclBDSInstallation).CleanPackageCache(BinaryFileName(UmaPlataformaDestino.sDirLibrary, FPacoteAtual));
  end;
  if UmaPlataformaDestino.InstalacaoAtual.CompilePackage(FPacoteAtual, UmaPlataformaDestino.sDirLibrary, UmaPlataformaDestino.sDirLibrary) then
  begin
    InformaSituacao(Format('Pacote "%s" compilado com sucesso.', [NomePacote]))
  end
  else
  begin
    Inc(FCountErros);
    InformaSituacao(Format('Erro ao compilar o pacote "%s".', [NomePacote]));
    Exit;
  end;
end;

procedure TACBrInstallComponentes.CopiarOutrosArquivosParaPastaLibrary;
  procedure CopiarArquivosParaPastaLibrary(const Mascara : string);
  var
    ListArquivos: TStringDynArray;
    Arquivo : string;
    i: integer;
  begin
    with UmaPlataformaDestino do
    begin
      ListArquivos := TDirectory.GetFiles(OpcoesInstall.DiretorioRaizACBr + 'Fontes', Mascara, TSearchOption.soAllDirectories ) ;
      for i := Low(ListArquivos) to High(ListArquivos) do
      begin
        Arquivo := ExtractFileName(ListArquivos[i]);
        CopyFile(PWideChar(ListArquivos[i]), PWideChar(IncludeTrailingPathDelimiter(sDirLibrary) + Arquivo), False);
      end;
    end;//----endwith
  end;
begin
  CopiarArquivosParaPastaLibrary('*.dcr');
  CopiarArquivosParaPastaLibrary('*.res');
  CopiarArquivosParaPastaLibrary('*.dfm');
  CopiarArquivosParaPastaLibrary('*.ini');
  CopiarArquivosParaPastaLibrary('*.inc');
end;

procedure TACBrInstallComponentes.DesligarDefines;
var
  ArquivoACBrInc: TFileName;
begin
  ArquivoACBrInc := OpcoesInstall.DiretorioRaizACBr + 'Fontes\ACBrComum\ACBr.inc';
  DesligarDefineACBrInc(ArquivoACBrInc, 'DFE_SEM_OPENSSL', not OpcoesCompilacao.DeveInstalarOpenSSL);
  DesligarDefineACBrInc(ArquivoACBrInc, 'DFE_SEM_CAPICOM', not OpcoesCompilacao.DeveInstalarCapicom);
  DesligarDefineACBrInc(ArquivoACBrInc, 'USE_DELAYED', OpcoesCompilacao.UsarCargaTardiaDLL);
  DesligarDefineACBrInc(ArquivoACBrInc, 'REMOVE_CAST_WARN', OpcoesCompilacao.RemoverStringCastWarnings);
  DesligarDefineACBrInc(ArquivoACBrInc, 'DFE_SEM_XMLSEC', not OpcoesCompilacao.DeveInstalarXMLSec);

end;

procedure TACBrInstallComponentes.RemoverArquivosAntigosDoDisco;
const
  SMascaraArquivoQueSeraoRemovidos = 'ACBr*.bpl ACBr*.dcp ACBr*.dcu DCLACBr*.bpl  DCLACBr*.dcp DCLACBr*.dcu '+
    'SYNA*.bpl SYNA*.dcp SYNA*.dcu PCN*.bpl PCN*.dcp PCN*.dcu '+
    'pnfs*.dcu pcte*.bpl pcte*.dcp pcte*.dcu pmdfe*.bpl pmdfe*.dcp pmdfe*.dcu pgnre*.dcp '+
    'pgnre*.bpl pces*.bpl pgnre*.dcu pces*.dcp pces*.dcu pca*.dcp pca*.dcu';

var
  PathBat: String;
  DriverList: TStringList;
  ConteudoArquivo: String;
  I: Integer;
begin
  PathBat := ExtractFilePath(ParamStr(0)) + 'apagarACBr.bat';

  // listar driver para montar o ConteudoArquivo
  DriverList := TStringList.Create;
  try
    GetDriveLetters(DriverList);
    ConteudoArquivo := '@echo off' + sLineBreak;
    for I := 0 to DriverList.Count -1 do
    begin
      ConteudoArquivo := ConteudoArquivo + StringReplace(DriverList[I], '\', '', []) + sLineBreak;
      ConteudoArquivo := ConteudoArquivo + 'cd\' + sLineBreak;
      ConteudoArquivo := ConteudoArquivo + 'del '+ SMascaraArquivoQueSeraoRemovidos +' /s' + sLineBreak;
      ConteudoArquivo := ConteudoArquivo + sLineBreak;
    end;

    WriteToTXT(PathBat, ConteudoArquivo, False);
  finally
    DriverList.Free;
  end;

  RunAsAdminAndWaitForCompletion(FApp.Handle, PathBat, FApp);
end;

procedure TACBrInstallComponentes.CompilarEInstalarPacotes(ListaPacotes: TPacotes);
begin
  with UmaPlataformaDestino do
  begin
    // *************************************************************************
    // compilar os pacotes primeiramente
    // *************************************************************************
    if tPlatformAtual <> bpWin32 then
    begin
      InformaSituacao(sLineBreak+'No momento n�o estamos compilando os pacotes da plataforma ' + sPlatform +'.');
      Exit;
    end;

    InformaSituacao(sLineBreak+'COMPILANDO OS PACOTES...');
    CompilarPacotes(OpcoesInstall.DiretorioRaizACBr, ListaPacotes);

    // *************************************************************************
    // instalar os pacotes somente se n�o ocorreu erro na compila��o e plataforma for Win32
    // *************************************************************************
    if FCountErros > 0 then
    begin
      InformaSituacao('Abortando... Ocorreram erros na compila��o dos pacotes.');
      Exit;
    end;

    if ( tPlatformAtual = bpWin32) then
    begin
      InformaSituacao(sLineBreak+'INSTALANDO OS PACOTES...');
      InstalarPacotes(OpcoesInstall.DiretorioRaizACBr, ListaPacotes);
    end
    else
    begin
      InformaSituacao('Para a plataforma de 64 bits os pacotes s�o somente compilados.');
    end;

  end;//---endwith
end;


procedure TACBrInstallComponentes.CompilarPacotes(const PastaACBr: string; listaPacotes: TPacotes);
var
  iDpk: Integer;
  NomePacote: string;
  sDirPackage: string;
begin
  with UmaPlataformaDestino do
  begin
    if (InstalacaoAtual is TJclBDSInstallation) and (InstalacaoAtual.IDEVersionNumber >= 9) then
    begin
      case tPlatformAtual of
        bpWin32:
        begin
          InstalacaoAtual.DCC := InstalacaoAtual.DCC32;
        end;
        bpWin64:
        begin
          InstalacaoAtual.DCC := (InstalacaoAtual as TJclBDSInstallation).DCC64;
        end;
        bpOSX32:
        begin
          InstalacaoAtual.DCC := (InstalacaoAtual as TJclBDSInstallation).DCCOSX32;
        end;
      else
        InstalacaoAtual.DCC := InstalacaoAtual.DCC32;
      end;
    end;

    for iDpk := 0 to listaPacotes.Count - 1 do
    begin
      if (not listaPacotes[iDpk].Checked) then
      begin
        InformaProgresso;
        Continue;
      end;

      NomePacote := listaPacotes[iDpk].Caption;
      if (IsDelphiPackage(NomePacote)) then
      begin
        FazLog('');
        // Busca diret�rio do pacote
        sDirPackage := FindDirPackage(IncludeTrailingPathDelimiter(PastaACBr) + 'Pacotes\Delphi', NomePacote);
        FPacoteAtual := sDirPackage + NomePacote;
        CompilaPacotePorNomeArquivo(NomePacote);
        if FCountErros> 0 then
        begin
          // Parar no primeiro erro para evitar de compilar outros pacotes que
          // dependem desse que ocasionou erro.
          Break;
        end;

        //Compilar tamb�m o pacote Design Time se a plataforma form Win32
        if (tPlatformAtual = bpWin32) and FileExists(sDirPackage + 'DCL'+ NomePacote) then
        begin
          FazLog('');
          FPacoteAtual := sDirPackage + 'DCL'+ NomePacote;
          CompilaPacotePorNomeArquivo('DCL'+ NomePacote);
          if FCountErros> 0 then
          begin
            // Parar no primeiro erro para evitar de compilar outros pacotes que
            // dependem desse que ocasionou erro.
            Break;
          end;
        end;
      end;
      InformaProgresso;
    end;
  end;//---endwith
end;

procedure TACBrInstallComponentes.InstalarPacotes(const PastaACBr: string; listaPacotes: TPacotes);
var
  iDpk: Integer;
  NomePacote: string;
  bRunOnly: Boolean;
  sDirPackage: string;
begin
  with UmaPlataformaDestino do
  begin
    for iDpk := 0 to listaPacotes.Count - 1 do
    begin
      NomePacote := listaPacotes[iDpk].Caption;
      if IsDelphiPackage(NomePacote) then
      begin
        // Busca diret�rio do pacote
        sDirPackage := FindDirPackage(IncludeTrailingPathDelimiter(PastaACBr) + 'Pacotes\Delphi', NomePacote);
        FPacoteAtual := sDirPackage + NomePacote;
        GetDPKFileInfo(FPacoteAtual, bRunOnly);

        if bRunOnly then
        begin
          //Encontrar o pacote DesignTime correspondente caso exista
          if FileExists(sDirPackage + 'DCL'+ NomePacote) then
          begin
            FPacoteAtual := sDirPackage + 'DCL'+ NomePacote;
            GetDPKFileInfo(FPacoteAtual, bRunOnly);
          end;
        end;

        // instalar somente os pacotes de designtime
        if not bRunOnly then
        begin
          // se o pacote estiver marcado instalar, sen�o desinstalar
          if listaPacotes[iDpk].Checked then
          begin
            if InstalacaoAtual.InstallPackage(FPacoteAtual, sDirLibrary, sDirLibrary) then
              InformaSituacao(Format('Pacote "%s" instalado com sucesso.', [NomePacote]))
            else
            begin
              Inc(FCountErros);
              InformaSituacao(Format('Ocorreu um erro ao instalar o pacote "%s".', [NomePacote]));
              Break;
            end;
          end
          else
          begin
            if InstalacaoAtual.UninstallPackage(FPacoteAtual, sDirLibrary, sDirLibrary) then
              InformaSituacao(Format('Pacote "%s" removido com sucesso...', [NomePacote]));
          end;
        end;
      end;
      InformaProgresso;
    end;
  end;//---endwith
end;




end.
