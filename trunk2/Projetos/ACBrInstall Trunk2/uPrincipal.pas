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

{******************************************************************************
|* Historico
|*
|* 29/03/2012: Isaque Pinheiro / R�gys Borges da Silveira
|*  - Cria��o e distribui��o da Primeira Versao
*******************************************************************************}
unit uPrincipal;

interface

uses
  Windows, Messages, FileCtrl, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Buttons, pngimage,
  IOUtils, UITypes, JclIDEUtils, JclCompilerUtils,
  Types, JvComponentBase, JvCreateProcess, JvExControls, JvAnimatedImage,
  JvGIFCtrl, JvWizard, JvWizardRouteMapNodes, CheckLst,
  uFrameLista, ACBrUtil, ACBrPacotes;

type

  TfrmPrincipal = class(TForm)
    wizPrincipal: TJvWizard;
    wizMapa: TJvWizardRouteMapNodes;
    wizPgConfiguracao: TJvWizardInteriorPage;
    wizPgInstalacao: TJvWizardInteriorPage;
    wizPgFinalizar: TJvWizardInteriorPage;
    wizPgInicio: TJvWizardWelcomePage;
    Label2: TLabel;
    edtDirDestino: TEdit;
    Label6: TLabel;
    imgLogomarca: TImage;
    lstMsgInstalacao: TListBox;
    pnlTopo: TPanel;
    Label9: TLabel;
    btnSelecDirInstall: TSpeedButton;
    imgGifPropagandaACBrSAC: TJvGIFAnimator;
    Label3: TLabel;
    pgbInstalacao: TProgressBar;
    lblUrlACBrSac1: TLabel;
    lblUrlForum1: TLabel;
    lblUrlACBr1: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label7: TLabel;
    btnInstalarACBr: TSpeedButton;
    btnVisualizarLogCompilacao: TSpeedButton;
    pnlInfoCompilador: TPanel;
    wizPgPacotes: TJvWizardInteriorPage;
    rdgDLL: TRadioGroup;
    ckbCopiarTodasDll: TCheckBox;
    ckbBCB: TCheckBox;
    lbInfo: TListBox;
    Label8: TLabel;
    chkDeixarSomenteLIB: TCheckBox;
    ckbRemoverArquivosAntigos: TCheckBox;
    JvCreateProcess1: TJvCreateProcess;
    Label22: TLabel;
    ckbRemoveOpenSSL: TCheckBox;
    ckbRemoveCapicom: TCheckBox;
    ckbCargaDllTardia: TCheckBox;
    ckbRemoverCastWarnings: TCheckBox;
    ckbUsarArquivoConfig: TCheckBox;
    framePacotes1: TframePacotes;
    ckbRemoveXMLSec: TCheckBox;
    wizPgSelectIDEs: TJvWizardInteriorPage;
    clbDelphiVersion: TCheckListBox;

    procedure imgPropaganda1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure wizPgInicioNextButtonClick(Sender: TObject; var Stop: Boolean);
    procedure URLClick(Sender: TObject);
    procedure btnSelecDirInstallClick(Sender: TObject);
    procedure wizPrincipalCancelButtonClick(Sender: TObject);
    procedure wizPrincipalFinishButtonClick(Sender: TObject);
    procedure wizPgConfiguracaoNextButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure btnInstalarACBrClick(Sender: TObject);
    procedure wizPgInstalacaoNextButtonClick(Sender: TObject;
      var Stop: Boolean);
    procedure btnVisualizarLogCompilacaoClick(Sender: TObject);
    procedure wizPgInstalacaoEnterPage(Sender: TObject;
      const FromPage: TJvWizardCustomPage);
    procedure clbDelphiVersionClick(Sender: TObject);
    procedure wizPgPacotesNextButtonClick(Sender: TObject; var Stop: Boolean);
    procedure wizPgSelectIDEsNextButtonClick(Sender: TObject; var Stop: Boolean);
  private
    FoACBr: TJclBorRADToolInstallations;
    FUltimoArquivoLog: string;

    procedure GravarConfiguracoesEmArquivoIni;
    procedure LerConfiguracoes;
    function PathArquivoIni: String;
    procedure ValidarSeExistemPacotesNasPastas(var Stop: Boolean; const PastaACBr: string; ListaPacotes:
        TPacotes);
    function ProcedeInstalacao: Boolean;
    procedure AbrirArquivoLogAtual;

    procedure IncrementaBarraProgresso;
    procedure Logar(const AString: String);
    procedure IniciaNovaInstalacao(const MaximoPassosProgresso: Integer; const NomeCaminhoArquivoLog: string;
          const Cabecalho: string);
  public

  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ShellApi, IniFiles, StrUtils, Math, Registry, ACBrInstallUtils, Generics.Collections,
  ACBrInstallDelphiComponentes;

{$R *.dfm}

// retornar o caminho completo para o arquivo .ini de configura��es
function TfrmPrincipal.PathArquivoIni: String;
begin
  Result := ChangeFileExt(ParamStr(0), '.ini');
end;

procedure TfrmPrincipal.ValidarSeExistemPacotesNasPastas(var Stop: Boolean; const PastaACBr: string;
      ListaPacotes: TPacotes);
var
  I: Integer;
  NomePacote: string;
  sDirPackage: string;
begin
  // verificar se os pacotes existem antes de seguir para o pr�ximo passo
  for I := 0 to ListaPacotes.Count - 1 do
  begin
    if ListaPacotes[I].Checked then
    begin
      NomePacote := ListaPacotes[I].Caption;
      // Busca diret�rio do pacote
      sDirPackage := FindDirPackage(IncludeTrailingPathDelimiter(PastaACBr) + 'Pacotes\Delphi', NomePacote);
      if Trim(sDirPackage) = '' then
        raise Exception.Create('N�o foi poss�vel retornar o diret�rio do pacote : ' + NomePacote);
      if IsDelphiPackage(NomePacote) then
      begin
        if not FileExists(IncludeTrailingPathDelimiter(sDirPackage) + NomePacote) then
        begin
          Stop := True;
          Application.MessageBox(PWideChar(Format('Pacote "%s" n�o encontrado, efetue novamente o download do reposit�rio', [NomePacote])), 'Erro.', MB_ICONERROR + MB_OK);
          Break;
        end;
      end;
    end;
  end;
end;

// ler o arquivo .ini de configura��es e setar os campos com os valores lidos
procedure TfrmPrincipal.LerConfiguracoes;
var
  ArqIni: TIniFile;
  I: Integer;
begin
  ArqIni := TIniFile.Create(PathArquivoIni);
  try
    edtDirDestino.Text             := ArqIni.ReadString('CONFIG', 'DiretorioInstalacao', ExtractFilePath(ParamStr(0)));
    rdgDLL.ItemIndex               := ArqIni.ReadInteger('CONFIG','DestinoDLL', 0);
    ckbCopiarTodasDll.Checked      := True;
    ckbBCB.Checked                 := ArqIni.ReadBool('CONFIG','C++Builder', False);
    chkDeixarSomenteLIB.Checked    := ArqIni.ReadBool('CONFIG','DexarSomenteLib', False);
    ckbRemoveOpenSSL.Checked       := ArqIni.ReadBool('CONFIG','RemoveOpenSSL', False);
    ckbRemoveCapicom.Checked       := ArqIni.ReadBool('CONFIG','RemoveCapicom', False);
    ckbRemoveXMLSec.Checked        := True;
    ckbCargaDllTardia.Checked      := ArqIni.ReadBool('CONFIG','CargaDllTardia', False);
    ckbRemoverCastWarnings.Checked := ArqIni.ReadBool('CONFIG','RemoverCastWarnings', False);
    ckbUsarArquivoConfig.Checked   := True;

    for I := 0 to framePacotes1.Pacotes.Count - 1 do
      framePacotes1.Pacotes[I].Checked := ArqIni.ReadBool('PACOTES', framePacotes1.Pacotes[I].Caption, False);
  finally
    ArqIni.Free;
  end;
end;

// gravar as configura��es efetuadas pelo usu�rio
procedure TfrmPrincipal.GravarConfiguracoesEmArquivoIni;
var
  ArqIni: TIniFile;
  I: Integer;
begin
  ArqIni := TIniFile.Create(PathArquivoIni);
  try
    ArqIni.WriteString('CONFIG', 'DiretorioInstalacao', edtDirDestino.Text);
    ArqIni.WriteInteger('CONFIG','DestinoDLL', rdgDLL.ItemIndex);
    ArqIni.WriteBool('CONFIG','C++Builder', ckbBCB.Checked);
    ArqIni.WriteBool('CONFIG','DexarSomenteLib', chkDeixarSomenteLIB.Checked);
    ArqIni.WriteBool('CONFIG','RemoveOpenSSL', ckbRemoveOpenSSL.Checked);
    ArqIni.WriteBool('CONFIG','RemoveCapicom', ckbRemoveCapicom.Checked);
    ArqIni.WriteBool('CONFIG','RemoveXmlSec', ckbRemoveXMLSec.Checked);
    ArqIni.WriteBool('CONFIG','CargaDllTardia', ckbCargaDllTardia.Checked);
    ArqIni.WriteBool('CONFIG','RemoverCastWarnings', ckbRemoverCastWarnings.Checked);

    for I := 0 to framePacotes1.Pacotes.Count - 1 do
      ArqIni.WriteBool('PACOTES', framePacotes1.Pacotes[I].Caption, framePacotes1.Pacotes[I].Checked);
  finally
    ArqIni.Free;
  end;
end;

procedure TfrmPrincipal.IniciaNovaInstalacao(const MaximoPassosProgresso: Integer; const
    NomeCaminhoArquivoLog: string; const Cabecalho: string);
begin
  // limpar o log
  lstMsgInstalacao.Clear;
  // setar barra de progresso
  pgbInstalacao.Position := 0;

  pgbInstalacao.Max := MaximoPassosProgresso;

  // mostrar ao usu�rio as informa��es de compila��o
  FUltimoArquivoLog := NomeCaminhoArquivoLog;
  lbInfo.Clear;
  lbInfo.Items.Text := Cabecalho;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  iFor: Integer;
begin
  FoACBr := TJclBorRADToolInstallations.Create;
  FUltimoArquivoLog := '';

  // popular o combobox de vers�es do delphi instaladas na m�quina
  for iFor := 0 to FoACBr.Count - 1 do
  begin
    clbDelphiVersion.Items.Add(VersionNumberToNome(FoACBr.Installations[iFor].VersionNumberStr));
    //Desabilitar vers�es n�o suportadas
    clbDelphiVersion.ItemEnabled[iFor] := (not MatchText(FoACBr.Installations[iFor].VersionNumberStr, ['d3','d4','d5','d6']));
  end;

  LerConfiguracoes;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FoACBr.Free;
end;

procedure TfrmPrincipal.Logar(const AString: String);
begin
  lstMsgInstalacao.Items.Add(AString);
  lstMsgInstalacao.ItemIndex := lstMsgInstalacao.Count - 1;
  Application.ProcessMessages;
end;

function TfrmPrincipal.ProcedeInstalacao: Boolean;
var
  ACBrInstaladorAux: TACBrInstallComponentes;
  ListaPacotes: TPacotes;
  ListaVersoesInstalacao: TList<Integer>;
  i: Integer;
begin
  ListaPacotes := framePacotes1.Pacotes;

  ListaVersoesInstalacao := TList<Integer>.Create;

  for i := 0 to FoACBr.Count - 1 do
  begin
    // s� instala as vers�o marcadas para instalar.
    if (clbDelphiVersion.Checked[i]) then
    begin
      ListaVersoesInstalacao.Add(i)
    end;
  end;

  ACBrInstaladorAux := TACBrInstallComponentes.Create(Application);
  try
    ACBrInstaladorAux.OnIniciaNovaInstalacao := IniciaNovaInstalacao;
    ACBrInstaladorAux.OnProgresso            := IncrementaBarraProgresso;
    ACBrInstaladorAux.OnInformaSituacao      := Logar;

    ACBrInstaladorAux.Opcoes.LimparArquivosACBrAntigos := ckbRemoverArquivosAntigos.Checked;
    ACBrInstaladorAux.Opcoes.DeixarSomentePastasLib    := chkDeixarSomenteLIB.Checked;
    ACBrInstaladorAux.Opcoes.DeveInstalarCapicom       := not ckbRemoveCapicom.Checked;
    ACBrInstaladorAux.Opcoes.DeveInstalarOpenSSL       := not ckbRemoveOpenSSL.Checked;
    ACBrInstaladorAux.Opcoes.DeveCopiarOutrasDLLs      := ckbCopiarTodasDll.Checked;
    ACBrInstaladorAux.Opcoes.DeveInstalarXMLSec        := not ckbRemoveXMLSec.Checked;
    ACBrInstaladorAux.Opcoes.UsarCargaTardiaDLL        := ckbCargaDllTardia.Checked;
    ACBrInstaladorAux.Opcoes.RemoverStringCastWarnings := ckbRemoverCastWarnings.Checked;
    ACBrInstaladorAux.Opcoes.UsarCpp                   := ckbBCB.Checked;
    ACBrInstaladorAux.Opcoes.UsarUsarArquivoConfig     := ckbUsarArquivoConfig.Checked;
    case rdgdll.ItemIndex of
      0 : ACBrInstaladorAux.Opcoes.sDestinoDLLs := tdSystem;
      1 : ACBrInstaladorAux.Opcoes.sDestinoDLLs := tdDelphi;
      2 : ACBrInstaladorAux.Opcoes.sDestinoDLLs := tdNone;
    else
      ACBrInstaladorAux.Opcoes.sDestinoDLLs     := tdNone;
    end;
    ACBrInstaladorAux.Opcoes.DiretorioRaizACBr := IncludeTrailingPathDelimiter(edtDirDestino.Text);


    Result := ACBrInstaladorAux.Instalar(FoACBr, ListaPacotes, ListaVersoesInstalacao);
  finally
    ACBrInstaladorAux.Free;
  end;

  if Result then
  begin
    Application.MessageBox(PWideChar('Pacotes compilados e instalados com sucesso! ' + sLineBreak +
                                     'Clique em "Pr�ximo" para finalizar a instala��o.'),
                           'Instala��o', MB_ICONINFORMATION + MB_OK);
  end
  else
  begin
    if Application.MessageBox(PWideChar('Ocorreram erros durante o processo de instala��o, ' + sLineBreak +
                                        'para maiores informa��es verifique o arquivo de log gerado.' +
                                        sLineBreak + sLineBreak +
                                        'Deseja visualizar o arquivo de log gerado?'),
                              'Instala��o', MB_ICONQUESTION + MB_YESNO) = ID_YES then
    begin
      AbrirArquivoLogAtual;
    end;
  end;

end;

procedure TfrmPrincipal.AbrirArquivoLogAtual;
begin
  if FUltimoArquivoLog = '' then
  begin
    Exit;
  end;
  ShellExecute(Handle, 'open', PWideChar(FUltimoArquivoLog), '', '', 1);
end;

procedure TfrmPrincipal.IncrementaBarraProgresso;
begin
  pgbInstalacao.Position := pgbInstalacao.Position + 1;
  Application.ProcessMessages;
end;

// bot�o de compila��o e instala��o dos pacotes selecionados no treeview
procedure TfrmPrincipal.btnInstalarACBrClick(Sender: TObject);
var
  Instalou: Boolean;
begin
  Instalou := False;
  btnInstalarACBr.Enabled := False;
  btnVisualizarLogCompilacao.Enabled := False;
  wizPgInstalacao.EnableButton(bkBack, False);
  wizPgInstalacao.EnableButton(bkNext, False);
  wizPgInstalacao.EnableButton(TJvWizardButtonKind(bkCancel), False);
  try
    Instalou := ProcedeInstalacao;
  finally
    btnInstalarACBr.Enabled := True;
    btnVisualizarLogCompilacao.Enabled := True;
    wizPgInstalacao.EnableButton(bkBack, True);
    wizPgInstalacao.EnableButton(bkNext, Instalou);
    wizPgInstalacao.EnableButton(TJvWizardButtonKind(bkCancel), True);
  end;
end;

// chama a caixa de dialogo para selecionar o diret�rio de instala��o
// seria bom que a caixa fosse aquele que possui o bot�o de criar pasta
procedure TfrmPrincipal.btnSelecDirInstallClick(Sender: TObject);
var
  Dir: String;
begin
  if SelectDirectory('Selecione o diret�rio de instala��o', '', Dir, [sdNewFolder, sdNewUI, sdValidateDir]) then
    edtDirDestino.Text := Dir;
end;

// quando trocar a vers�o verificar se libera ou n�o o combo
// da plataforma de compila��o
procedure TfrmPrincipal.clbDelphiVersionClick(Sender: TObject);
begin
  if clbDelphiVersion.ItemIndex < 0 then
  begin
    Exit
  end;

  if MatchText(FoACBr.Installations[clbDelphiVersion.ItemIndex].VersionNumberStr, ['d7','d9','d10','d11']) then
  begin
    Application.MessageBox(
      'Aten��o: Embora o ACBr continue suportando vers�es anteriores do Delphi, incentivamos que voc� atualize o quanto antes para vers�es mais recentes do Delphi ou considere migrar para o Lazarus.',
      'Erro.',
      MB_OK + MB_ICONWARNING
    );
  end;

  // C++ Builder a partir do D2006, vers�es anteriores tem IDE independentes.
  ckbBCB.Enabled := MatchText(FoACBr.Installations[clbDelphiVersion.ItemIndex].VersionNumberStr, ['d10','d11','d12','d14','d15','d16','d17','d18','d19','d20','d21','d22','d23','d24','d25','d26']);
  if not ckbBCB.Enabled then
     ckbBCB.Checked := False;
end;

// abrir o endere�o do ACBrSAC quando clicar na propaganda
procedure TfrmPrincipal.imgPropaganda1Click(Sender: TObject);
begin
  // ir para o endere�o do ACBrSAC
  ShellExecute(Handle, 'open', PWideChar(lblUrlACBrSac1.Caption), '', '', 1);
end;

// quando clicar em alguma das urls chamar o link mostrado no caption
procedure TfrmPrincipal.URLClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', PWideChar(TLabel(Sender).Caption), '', '', 1);
end;

procedure TfrmPrincipal.wizPgInicioNextButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  // Verificar se o delphi est� aberto
  {$IFNDEF DEBUG}
  if FoACBr.AnyInstanceRunning then
  begin
    Stop := True;
    Application.MessageBox(
      'Feche a IDE do delphi antes de continuar.',
      PWideChar(Application.Title),
      MB_ICONERROR + MB_OK
    );
  end;
  {$ENDIF}
end;

procedure TfrmPrincipal.wizPgInstalacaoEnterPage(Sender: TObject;
  const FromPage: TJvWizardCustomPage);
begin
//  // para 64 bit somente compilar
//  if tPlatform = bpWin32 then // Win32
//    btnInstalarACBr.Caption := 'Instalar'
//  else // win64
//    btnInstalarACBr.Caption := 'Compilar';
//
  lbInfo.Clear;
  lbInfo.Items.Add('Pressione o bot�o "'+ btnInstalarACBr.Caption +'" para prosseguir.');
  btnVisualizarLogCompilacao.Enabled := False;
end;

procedure TfrmPrincipal.wizPgInstalacaoNextButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  if (lstMsgInstalacao.Count <= 0) then
  begin
    Stop := True;
    Application.MessageBox(
      'Clique no bot�o instalar antes de continuar.',
      'Erro.',
      MB_OK + MB_ICONERROR
    );
  end;

//  N�o deve ser permitido clicar em Next caso tenha havido erros.
//  Assim o c�digo abaixo � desnecess�rio.
//  if (FCountErros > 0) then
//  begin
//    Stop := True;
//    Application.MessageBox(
//      'Ocorreram erros durante a compila��o e instala��o dos pacotes, verifique.',
//      'Erro.',
//      MB_OK + MB_ICONERROR
//    );
//  end;
end;

procedure TfrmPrincipal.wizPgConfiguracaoNextButtonClick(Sender: TObject;
  var Stop: Boolean);
begin
  // verificar se foi informado o diret�rio
  if Trim(edtDirDestino.Text) = EmptyStr then
  begin
    Stop := True;
    edtDirDestino.SetFocus;
    Application.MessageBox(
      'Diret�rio de instala��o n�o foi informado.',
      'Erro.',
      MB_OK + MB_ICONERROR
    );
  end;

  if not ckbRemoveXMLSec.Checked then
  begin
    if MessageDlg('Usar XMLSec n�o � recomendado. Sugerimos que marque a op��o "'+
                  ckbRemoveXMLSec.Caption + '" antes de continuar.'+ sLineBreak +
                  'Deseja continuar assim mesmo?', mtConfirmation, mbYesNo, 0, mbNo) <> mrYes  then
    begin
      Stop := True;
    end;
  end;

//  //Exibir mensagem abaixo apenas se n�o for o Delphi 7..
//  if not ckbRemoverCastWarnings.Checked then
//  begin
//    if MessageDlg('Se n�o estiver resolvendo os Warnings com strings sugerimos marcar a op��o "'+
//                  ckbRemoverCastWarnings.Caption + '" antes de continuar.'+ sLineBreak +
//                  'Deseja continuar assim mesmo?', mtConfirmation, mbYesNo, 0, mbNo) <> mrYes  then
//    begin
//      Stop := True;
//    end;
//  end;
//
  if (ckbRemoverArquivosAntigos.Checked) and
     (MessageDlg('Voc� optou por limpar arquivos antigos do ACBr do seu computador. Essa a��o pode demorar v�rios minutos.' + sLineBreak +
                 'Deseja realmente continuar?', mtConfirmation, mbYesNo, 0, mbNo) <> mrYes) then
  begin
    Stop := True;
    ckbRemoverArquivosAntigos.Checked := False;
  end;

  if not ckbCopiarTodasDll.Checked then
  begin
    if MessageDlg('N�o foi marcado a op��o para copiar as DLLs. Voc� ter� que copiar manualmente. ' + sLineBreak +
                  'Deseja continuar assim mesmo?', mtConfirmation, mbYesNo, 0, mbNo) <> mrYes  then
    begin
      Stop := True;
    end;
  end;

  ValidarSeExistemPacotesNasPastas(Stop, IncludeTrailingPathDelimiter(edtDirDestino.Text), framePacotes1.Pacotes);
end;

procedure TfrmPrincipal.btnVisualizarLogCompilacaoClick(Sender: TObject);
begin
  AbrirArquivoLogAtual;
end;

procedure TfrmPrincipal.wizPgPacotesNextButtonClick(Sender: TObject; var Stop: Boolean);
begin
  // Gravar as configura��es em um .ini para utilizar depois
  GravarConfiguracoesEmArquivoIni;
end;

procedure TfrmPrincipal.wizPgSelectIDEsNextButtonClick(Sender: TObject; var Stop: Boolean);
var
  iFor: Integer;
  bChk: Boolean;
begin
  bChk := False;
  for iFor := 0 to clbDelphiVersion.Count -1 do
  begin
    if clbDelphiVersion.Checked[iFor] then
    begin
      bChk := True;
      Break;
    end;
  end;

  if not bChk then
  begin
    Stop := True;
    clbDelphiVersion.SetFocus;
    Application.MessageBox(
      'Para continuar escolha a vers�o do Delphi para a qual deseja instalar o ACBr.',
      'Erro.',
      MB_OK + MB_ICONERROR
    );
  end;

end;

procedure TfrmPrincipal.wizPrincipalCancelButtonClick(Sender: TObject);
begin
  if Application.MessageBox(
    'Deseja realmente cancelar a instala��o?',
    'Fechar',
    MB_ICONQUESTION + MB_YESNO
  ) = ID_YES then
  begin
    Self.Close;
  end;
end;

procedure TfrmPrincipal.wizPrincipalFinishButtonClick(Sender: TObject);
begin
  Self.Close;
end;

end.
