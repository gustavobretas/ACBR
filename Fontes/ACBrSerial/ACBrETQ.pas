{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2007 Andrews Ricardo Bejatto                }
{                                       Anderson Rogerio Bejatto               }
{                                                                              }
{ Colaboradores nesse arquivo:          Daniel Simooes de Almeida              }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }
{                                                                              }
{ Esse arquivo usa a classe  SynaSer   Copyright (c)2001-2003, Lukas Gebauer   }
{  Project : Ararat Synapse     (Found at URL: http://www.ararat.cz/synapse/)  }
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

unit ACBrETQ;

interface

uses
  Classes, SysUtils,
  ACBrBase, ACBrDevice, ACBrETQClass;

type

TACBrETQModelo = (etqNenhum, etqPpla, etqPplb, etqZPLII, etqEpl2);

{ TACBrETQ }
  {$IFDEF RTL230_UP}
    [ComponentPlatformsAttribute(pidWin32 or pidWin64)]
  {$ENDIF RTL230_UP}

  { TACBrETQCmdList }

  TACBrETQCmdList = class(TStringList)
  public
    function Add(const S: string): Integer; override;
    procedure Insert(Index: Integer; const S: string); override;
  end;


  TACBrETQ = class(TACBrComponent)
  private
    fsMargemEsquerda: Integer;
    fsEtqFinalizada: Boolean;
    fsEtqInicializada: Boolean;
    fsOnGravarLog: TACBrGravarLog;
    fsModelo: TACBrETQModelo;
    fsListaCmd: TACBrETQCmdList;
    fsDevice: TACBrDevice;   { SubComponente ACBrDevice }
    fsETQ: TACBrETQClass;
    fsArqLOG: String;
    fsAtivo: Boolean;

    function GetLimparMemoria: Boolean;
    function GetModeloStr: String;
    function GetBackFeed: TACBrETQBackFeed;
    function GetOrigem: TACBrETQOrigem;
    function GetUnidade: TACBrETQUnidade;
    function GetTemperatura: Integer;
    function GetVelocidade: Integer;
    function GetPorta: String;
    function GetDPI : TACBrETQDPI;
    function GetAvanco: Integer;

    procedure SetUnidade(const AValue: TACBrETQUnidade);
    procedure SetModelo(const Value: TACBrETQModelo);
    procedure SetBackFeed(AValue: TACBrETQBackFeed);
    procedure SetLimparMemoria(const Value: Boolean);
    procedure SetTemperatura(const Value: Integer);
    procedure SetVelocidade(const Value: Integer);
    procedure SetDPI(const AValue: TACBrETQDPI);
    procedure SetPorta(const Value: String);
    procedure SetOrigem(AValue: TACBrETQOrigem);
    procedure SetAvanco(const AValue: Integer);
    procedure SetAtivo(const Value: Boolean);

    procedure AtivarSeNecessario;
  public
    constructor Create(AOwner: TComponent); override;
    Destructor Destroy; override;

    procedure Ativar;
    procedure Desativar;
    procedure IniciarEtiqueta;
    procedure FinalizarEtiqueta(Copias: Integer = 1; AvancoEtq: Integer = 0);

    procedure Imprimir(Copias: Integer = 1; AvancoEtq: Integer = 0);

    procedure ImprimirTexto(Orientacao: TACBrETQOrientacao; Fonte, MultiplicadorH,
      MultiplicadorV, Vertical, Horizontal: Integer; const Texto: String;
      SubFonte: Integer = 0; ImprimirReverso: Boolean = False); overload;
    procedure ImprimirTexto(Orientacao: TACBrETQOrientacao; const Fonte: String;
      MultiplicadorH, MultiplicadorV, Vertical, Horizontal: Integer; const Texto: String;
      SubFonte: Integer = 0; ImprimirReverso: Boolean = False); overload;

    procedure ImprimirBarras(Orientacao: TACBrETQOrientacao;
      TipoBarras: TACBrTipoCodBarra;
      LarguraBarraLarga, LarguraBarraFina, Vertical, Horizontal: Integer;
      const Texto: String; AlturaCodBarras: Integer; ExibeCodigo:
      TACBrETQBarraExibeCodigo = becPadrao); overload;
    procedure ImprimirBarras(Orientacao: TACBrETQOrientacao;
      const TipoBarras: String;
      LarguraBarraLarga, LarguraBarraFina, Vertical, Horizontal: Integer;
      const Texto: String; AlturaCodBarras: Integer; ExibeCodigo:
      TACBrETQBarraExibeCodigo = becPadrao); overload;
    procedure ImprimirBarras(Orientacao: TACBrETQOrientacao; const TipoBarras,
          LarguraBarraLarga, LarguraBarraFina: String; Vertical, Horizontal: Integer;
          const Texto: String; AlturaCodBarras: Integer = 0;
          ExibeCodigo: TACBrETQBarraExibeCodigo = becPadrao); overload;

    procedure ImprimirLinha(Vertical, Horizontal, Largura, Altura: Integer); overload;

    procedure ImprimirCaixa(Vertical, Horizontal, Largura, Altura,
      EspessuraVertical, EspessuraHorizontal: Integer);

    procedure ImprimirImagem(MultiplicadorImagem, Vertical, Horizontal: Integer;
      const NomeImagem: String);

    procedure CarregarImagem(aStream: TStream; const NomeImagem: String;
      Flipped: Boolean = True; const Tipo: String = ''); overload;

    procedure CarregarImagem(const ArquivoImagem, NomeImagem: String;
      Flipped: Boolean = True); overload;

    procedure GravarLog(aString: AnsiString; Traduz: Boolean = False);

    property ETQ:             TACBrETQClass    read fsETQ;
    property ListaCmd:        TACBrETQCmdList  read fsListaCmd;
    property ModeloStr:       String           read GetModeloStr;
    property EtqFinalizada:   Boolean          read fsEtqFinalizada;
    property EtqInicializada: Boolean          read fsEtqInicializada;

  published
    property Unidade:         TACBrETQUnidade  read GetUnidade       write SetUnidade default etqDecimoDeMilimetros;
    property Modelo:          TACBrETQModelo   read fsModelo         write SetModelo default etqNenhum;
    property BackFeed:        TACBrETQBackFeed read GetBackFeed      write SetBackFeed default bfNone;
    property LimparMemoria:   Boolean          read GetLimparMemoria write SetLimparMemoria default True;
    property Temperatura:     Integer          read GetTemperatura   write SetTemperatura default 10;
    property Velocidade:      Integer          read GetVelocidade    write SetVelocidade default -1;
    property Origem:          TACBrETQOrigem   read GetOrigem        write SetOrigem default ogNone;
    property DPI:             TACBrETQDPI      read GetDPI           write SetDPI default dpi203;
    property Avanco:          Integer          read GetAvanco        write SetAvanco default 0;
    property MargemEsquerda:  Integer          read fsMargemEsquerda write fsMargemEsquerda default 0;
    property OnGravarLog:     TACBrGravarLog   read fsOnGravarLog    write fsOnGravarLog;
    property ArqLOG:          String           read fsArqLOG         write fsArqLOG;
    property Porta:           String           read GetPorta         write SetPorta;
    property Ativo:           Boolean          read fsAtivo          write SetAtivo;

    { Instancia do Componente ACBrDevice, ser� passada para fsETQ.create }
    property Device: TACBrDevice read fsDevice;
  end;

implementation

uses
  math, typinfo,
  {$IFDEF COMPILER6_UP} StrUtils {$ELSE} ACBrD5{$ENDIF},
  ACBrUtil, ACBrETQPpla, ACBrETQZplII, ACBrETQEpl2;

{ TACBrETQCmdList }

function TACBrETQCmdList.Add(const S: string): Integer;
begin
  if NaoEstaVazio(S) then
    Result := inherited Add(S)
  else
    Result := -1;
end;

procedure TACBrETQCmdList.Insert(Index: Integer; const S: string);
begin
  if NaoEstaVazio(S) then
    inherited Insert(Index, S);
end;

{ TACBrETQ }

constructor TACBrETQ.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);

  fsAtivo    := False;
  fsModelo   := etqNenhum;
  fsListaCmd := TACBrETQCmdList.Create;

  { Instanciando SubComponente TACBrDevice }
  fsDevice := TACBrDevice.Create(Self);  // O dono � o proprio componente
  fsDevice.Name := 'ACBrDevice';         // Apenas para aparecer no Object Inspector
  {$IFDEF COMPILER6_UP}
  fsDevice.SetSubComponent(True);        // Para gravar no DFM/XFM
  {$ENDIF}
  fsDevice.Porta := 'LPT1';
  fsDevice.Serial.DeadlockTimeout := 1000;

  { Instanciando fsETQ com modelo Generico (TACBrETQClass) }
  fsETQ := TACBrETQClass.create(Self);

  fsArqLOG          := '';
  fsOnGravarLog     := Nil;
  fsEtqFinalizada   := False;
  fsEtqInicializada := False;
  fsMargemEsquerda  := 0;
end;

destructor TACBrETQ.Destroy;
begin
  Desativar;

  if Assigned(fsETQ) then
    FreeAndNil(fsETQ);

  FreeAndNil(fsListaCmd);
  FreeAndNil(fsDevice);

  inherited Destroy;
end;

function TACBrETQ.GetModeloStr: String;
begin
  Result := ACBrStr(fsETQ.ModeloStr);
end;

function TACBrETQ.GetLimparMemoria: Boolean;
begin
  Result := fsETQ.LimparMemoria;
end;

function TACBrETQ.GetBackFeed: TACBrETQBackFeed;
begin
  Result := fsETQ.BackFeed;
end;

function TACBrETQ.GetOrigem: TACBrETQOrigem;
begin
  Result := fsETQ.Origem;
end;

function TACBrETQ.GetUnidade: TACBrETQUnidade;
begin
  Result := fsETQ.Unidade;
end;

function TACBrETQ.GetTemperatura: Integer;
begin
  Result := fsETQ.Temperatura;
end;

function TACBrETQ.GetVelocidade: Integer;
begin
  Result := fsETQ.Velocidade;
end;

function TACBrETQ.GetPorta: String;
begin
  Result := fsDevice.Porta;
end;

function TACBrETQ.GetDPI: TACBrETQDPI;
begin
   Result := fsETQ.DPI;
end;

function TACBrETQ.GetAvanco: Integer;
begin
  Result := fsETQ.Avanco;
end;

procedure TACBrETQ.SetUnidade(const AValue: TACBrETQUnidade);
begin
  fsETQ.Unidade := AValue;
end;

procedure TACBrETQ.SetModelo(const Value: TACBrETQModelo);
var
  wUnidade: TACBrETQUnidade;
  wDPI: TACBrETQDPI;
  wLimparMemoria: Boolean;
  wTemperatura, wVelocidade, wAvanco: Integer;
begin
  GravarLog('- SetModelo. '+GetEnumName(TypeInfo(TACBrETQModelo), Integer(Value)));

  if (fsModelo = Value) then
    Exit;

  wTemperatura   := Temperatura;
  wLimparMemoria := LimparMemoria;
  wAvanco        := Avanco;
  wUnidade       := Unidade;
  wDPI           := DPI;
  wVelocidade    := Velocidade;

  if fsAtivo then
    raise Exception.Create(ACBrStr('N�o � poss�vel mudar o Modelo com ACBrETQ Ativo'));

  FreeAndNil(fsETQ);

  { Instanciando uma nova classe de acordo com fsModelo }
  case Value of
    etqPpla:          fsETQ := TACBrETQPpla.Create(Self);
    etqPplb, etqEpl2: fsETQ := TACBrETQEpl2.Create(Self);  // EPL2 = PPLB
    etqZPLII:         fsETQ := TACBrETQZplII.Create(Self);
  else
    fsETQ := TACBrETQClass.Create(Self);
  end;

  Temperatura  := wTemperatura;
  LimparMemoria:= wLimparMemoria;
  Avanco       := wAvanco;
  Unidade      := wUnidade;
  DPI          := wDPI;
  Velocidade   := wVelocidade;
  fsModelo     := Value;
end;

procedure TACBrETQ.SetBackFeed(AValue: TACBrETQBackFeed);
begin
  fsETQ.BackFeed := AValue;
end;

procedure TACBrETQ.SetTemperatura(const Value: Integer);
begin
  fsETQ.Temperatura := Value;
end;

procedure TACBrETQ.SetVelocidade(const Value: Integer);
begin
  fsETQ.Velocidade := Value;
end;

procedure TACBrETQ.SetDPI(const AValue: TACBrETQDPI);
begin
  fsETQ.DPI := AValue;
end;

procedure TACBrETQ.SetLimparMemoria(const Value: Boolean);
begin
  fsETQ.LimparMemoria := Value;
end;

procedure TACBrETQ.SetPorta(const Value: String);
begin
  fsDevice.Porta := Value;
end;

procedure TACBrETQ.SetOrigem(AValue: TACBrETQOrigem);
begin
  fsETQ.Origem := AValue;
end;

procedure TACBrETQ.SetAvanco(const AValue: Integer);
begin
  fsETQ.Avanco := AValue;
end;

procedure TACBrETQ.SetAtivo(const Value: Boolean);
begin
  if Value then
    Ativar
  else
    Desativar;
end;

procedure TACBrETQ.AtivarSeNecessario;
begin
  if (not Ativo) then
    Ativar;
end;

procedure TACBrETQ.Ativar;
begin
  if fsAtivo then
    Exit;

  GravarLog(sLineBreak + StringOfChar('-', 80) + sLineBreak +
    'ATIVAR - ' + FormatDateTime('dd/mm/yy hh:nn:ss:zzz', Now) +
    ' - Modelo: ' + ModeloStr +
    ' - Porta: '  + fsDevice.Porta +
    ' - Device: ' + fsDevice.DeviceToString(False) +
    sLineBreak + StringOfChar('-', 80) + sLineBreak);

  if (fsDevice.Porta <> '') then
    fsDevice.Ativar;

  fsAtivo           := True;
  fsEtqFinalizada   := False;
  fsEtqInicializada := False;
end;

procedure TACBrETQ.Desativar;
begin
  if (not fsAtivo) then
    Exit;

  GravarLog('DESATIVAR');

  if (fsDevice.Porta <> '') then
    fsDevice.Desativar;

  fsAtivo := False;
end;

procedure TACBrETQ.IniciarEtiqueta;
var
  wCmd: AnsiString;
begin
  GravarLog('- IniciarEtiqueta');

  AtivarSeNecessario;

  wCmd := fsETQ.ComandosIniciarEtiqueta;

  if (not (fsEtqInicializada or fsEtqFinalizada)) then
    fsListaCmd.Insert(0, wCmd)       //Se Etiqueta n�o foi iniciada, comandos inclu�dos no in�cio
  else
    fsListaCmd.Add(wCmd);    //Se Etiqueta foi iniciada, comandos s�o concatenados

  fsEtqInicializada := True;
  fsEtqFinalizada   := False;
end;

procedure TACBrETQ.FinalizarEtiqueta(Copias: Integer = 1; AvancoEtq: Integer = 0);
var
  wCmd: AnsiString;
begin
  GravarLog('- FinalizarEtiqueta: Copias:'+IntToStr(Copias)+', AvancoEtq:'+IntToStr(AvancoEtq));

  AtivarSeNecessario;

  wCmd := fsETQ.ComandosFinalizarEtiqueta(Copias, AvancoEtq);

  fsListaCmd.Add(wCmd);

  fsEtqInicializada := False;
  fsEtqFinalizada   := True;
end;

procedure TACBrETQ.GravarLog(aString: AnsiString; Traduz: Boolean);
var
  wTratado: Boolean;
begin
  wTratado := False;

  if Traduz then
    AString := TranslateUnprintable(AString);

  if Assigned(fsOnGravarLog) then
    fsOnGravarLog( AString, wTratado);

  if not wTratado then
    WriteLog(fsArqLOG, '-- ' + FormatDateTime('dd/mm hh:nn:ss:zzz', Now) + ' ' + AString);
end;

procedure TACBrETQ.Imprimir(Copias: Integer; AvancoEtq: Integer);
var
  wCmd: AnsiString;
begin
  GravarLog('- Imprimir. Copias:'+IntToStr(Copias)+', AvancoEtq:'+IntToStr(AvancoEtq));

  AtivarSeNecessario;

  try
    // Verifica se � necess�rio IniciarEtiqueta. S� ser� utilizado quando
    //  o comando n�o foi enviado manualmente
    if (not (fsEtqInicializada or fsEtqFinalizada)) then
      IniciarEtiqueta;

    // Verifica se ficou um bloco de etiquetas sem ser Finalizado
    if (not fsEtqFinalizada) then
      FinalizarEtiqueta(Copias, AvancoEtq);

    if LimparMemoria then
    begin
      wCmd := fsETQ.ComandoLimparMemoria;
      fsListaCmd.Add(wCmd);
    end;

    wCmd := fsETQ.TratarComandoAntesDeEnviar(ListaCmd.Text);
    GravarLog(wCmd, True);

    fsDevice.EnviaString(wCmd);
  finally
    fsListaCmd.Clear;
    fsEtqInicializada := False;
    fsEtqFinalizada   := False;
  end;
end;

procedure TACBrETQ.ImprimirTexto(Orientacao: TACBrETQOrientacao; Fonte,
  MultiplicadorH, MultiplicadorV, Vertical, Horizontal: Integer;
  const Texto: String; SubFonte: Integer; ImprimirReverso: Boolean);
var
  cFonte: Char;
begin
  if Fonte < 10 then
    cFonte := chr(48 + Fonte)  // '0'..'9'
  else
    cFonte := chr(55 + Fonte); // 'A'..'Z'

  ImprimirTexto(Orientacao, cFonte, MultiplicadorH, MultiplicadorV,
    Vertical, Horizontal, Texto, SubFonte, ImprimirReverso);
end;

procedure TACBrETQ.ImprimirTexto(Orientacao: TACBrETQOrientacao; const Fonte: String;
  MultiplicadorH, MultiplicadorV, Vertical, Horizontal: Integer; const Texto: String;
  SubFonte: Integer; ImprimirReverso: Boolean);
var
  wCmd: AnsiString;
begin
  GravarLog('- ImprimirTexto:'+
            '  Orientacao:'+GetEnumName(TypeInfo(TACBrETQOrientacao), Integer(Orientacao))+
            ', Fonte:'+Fonte+
            ', MultiplicadorH:'+IntToStr(MultiplicadorH)+
            ', MultiplicadorV:'+IntToStr(MultiplicadorV)+
            ', Vertical:'+IntToStr(Vertical)+
            ', Horizontal:'+IntToStr(Horizontal)+
            ', Texto:'+Texto+
            ', SubFonte:'+IntToStr(SubFonte)+
            ', ImprimirReverso:'+BoolToStr(ImprimirReverso, True));

  wCmd := fsETQ.ComandoImprimirTexto(Orientacao, Fonte, MultiplicadorH, MultiplicadorV,
    Vertical, (Horizontal+MargemEsquerda), Texto, SubFonte, ImprimirReverso);

  fsListaCmd.Add(wCmd);
end;

procedure TACBrETQ.ImprimirBarras(Orientacao: TACBrETQOrientacao;
  TipoBarras: TACBrTipoCodBarra; LarguraBarraLarga, LarguraBarraFina, Vertical,
  Horizontal: Integer; const Texto: String; AlturaCodBarras: Integer;
  ExibeCodigo: TACBrETQBarraExibeCodigo);
var
  TipoBarrasStr: String;
begin
  TipoBarrasStr := fsETQ.ConverterTipoBarras(TipoBarras);
  if (TipoBarrasStr = '') then
     raise Exception.Create(ACBrStr('C�digo '+
                            GetEnumName(TypeInfo(TACBrTipoCodBarra), Integer(TipoBarras))+
                            'n�o suportado por: '+fsETQ.ModeloStr));

  ImprimirBarras(Orientacao, TipoBarrasStr, LarguraBarraLarga,
    LarguraBarraFina, Vertical, Horizontal, Texto, AlturaCodBarras, ExibeCodigo);
end;

procedure TACBrETQ.ImprimirBarras(Orientacao: TACBrETQOrientacao; const TipoBarras,
  LarguraBarraLarga, LarguraBarraFina: String; Vertical, Horizontal: Integer;
  const Texto: String; AlturaCodBarras: Integer; ExibeCodigo: TACBrETQBarraExibeCodigo
  );

  function StrParamToInt(AParam: String): Integer;
  var
    cParam: Char;
  begin
    if StrIsNumber(AParam) then
      Result := StrToIntDef(AParam,0)
    else
    begin
      cParam := PadLeft(UpperCase(AParam),1,'A')[1];
      Result := ord(cParam)-55;  // Ex: 'A' = 65; 65-55 = 10
    end;
  end;

begin
  ImprimirBarras( Orientacao, TipoBarras,
                  StrParamToInt(LarguraBarraLarga),
                  StrParamToInt(LarguraBarraFina),
                  Vertical, Horizontal, Texto, AlturaCodBarras, ExibeCodigo);
end;

procedure TACBrETQ.ImprimirBarras(Orientacao: TACBrETQOrientacao;
  const TipoBarras: String; LarguraBarraLarga, LarguraBarraFina, Vertical,
  Horizontal: Integer; const Texto: String; AlturaCodBarras: Integer;
  ExibeCodigo: TACBrETQBarraExibeCodigo);
var
  wCmd: AnsiString;
begin
  GravarLog('- ImprimirBarras:'+
            '  Orientacao:'+GetEnumName(TypeInfo(TACBrETQOrientacao), Integer(Orientacao))+
            ', TipoBarras:'+TipoBarras+
            ', LarguraBarraLarga:'+IntToStr(LarguraBarraLarga)+
            ', LarguraBarraFina:'+IntToStr(LarguraBarraFina)+
            ', Vertical:'+IntToStr(Vertical)+
            ', Horizontal:'+IntToStr(Horizontal)+
            ', Texto:'+Texto+
            ', AlturaCodBarras:'+IntToStr(AlturaCodBarras)+
            ', ExibeCodigo:'+GetEnumName(TypeInfo(TACBrETQBarraExibeCodigo), Integer(ExibeCodigo)));

  wCmd := fsETQ.ComandoImprimirBarras(Orientacao, TipoBarras, LarguraBarraLarga,
    LarguraBarraFina, Vertical, (Horizontal+MargemEsquerda), Texto,
    AlturaCodBarras, ExibeCodigo);

  fsListaCmd.Add(wCmd);
end;

procedure TACBrETQ.ImprimirLinha(Vertical, Horizontal, Largura, Altura: Integer);
var
  wCmd: AnsiString;
begin
  GravarLog('- ImprimirLinha:'+
            '  Vertical:'+IntToStr(Vertical)+
            ', Horizontal:'+IntToStr(Horizontal)+
            ', Largura:'+IntToStr(Largura)+
            ', Altura:'+IntToStr(Altura));

  wCmd := fsETQ.ComandoImprimirLinha(Vertical, (Horizontal+MargemEsquerda), Largura, Altura);

  fsListaCmd.Add(wCmd);
end;

procedure TACBrETQ.ImprimirCaixa(Vertical, Horizontal, Largura, Altura,
  EspessuraVertical, EspessuraHorizontal: Integer);
var
  wCmd: AnsiString;
begin
  GravarLog('- ImprimirCaixa:'+
            '  Vertical:'+IntToStr(Vertical)+
            ', Horizontal:'+IntToStr(Horizontal)+
            ', Largura:'+IntToStr(Largura)+
            ', Altura:'+IntToStr(Altura)+
            ', EspessuraVertical:'+IntToStr(EspessuraVertical)+
            ', EspessuraHorizontal:'+IntToStr(EspessuraHorizontal));

  wCmd := fsETQ.ComandoImprimirCaixa(Vertical, (Horizontal+MargemEsquerda),
       Largura, Altura, EspessuraVertical, EspessuraHorizontal);

  fsListaCmd.Add(wCmd);
end;

procedure TACBrETQ.ImprimirImagem(MultiplicadorImagem, Vertical,
  Horizontal: Integer; const NomeImagem: String);
var
  wCmd: AnsiString;
begin
  GravarLog('- ImprimirImagem:'+
            '  MultiplicadorImagem:'+IntToStr(MultiplicadorImagem)+
            ', Vertical:'+IntToStr(Vertical)+
            ', Horizontal:'+IntToStr(Horizontal)+
            ', NomeImagem:'+NomeImagem);

  wCmd := fsETQ.ComandoImprimirImagem(MultiplicadorImagem, Vertical,
     (Horizontal+MargemEsquerda), NomeImagem);

  fsListaCmd.Add(wCmd);
end;

procedure TACBrETQ.CarregarImagem(aStream: TStream; const NomeImagem: String;
  Flipped: Boolean; const Tipo: String);
var
  wCmd: AnsiString;
begin
  GravarLog('- CarregarImagem:'+
            '  AStream.Size: '+IntToStr(aStream.Size)+
            ', NomeImagem: '+NomeImagem+
            ', Flipped: '+BoolToStr(Flipped, True)+
            ', Tipo: '+Tipo);

  AtivarSeNecessario;

  wCmd := fsETQ.ComandoCarregarImagem(aStream, NomeImagem, Flipped, Tipo);
  GravarLog(wCmd, True);
  fsDevice.EnviaString(wCmd);
end;

procedure TACBrETQ.CarregarImagem(const ArquivoImagem, NomeImagem: String;
  Flipped: Boolean = True);
var
  wMS: TMemoryStream;
  wTipo: AnsiString;
begin
  if (not FileExists(ArquivoImagem)) then
    raise Exception.Create(ACBrStr('Arquivo ' + ArquivoImagem + ' n�o encontrado'));

  wTipo := ExtractFileExt(ArquivoImagem);
  wMS   := TMemoryStream.Create;
  try
    wMS.LoadFromFile(ArquivoImagem);
    CarregarImagem(wMS, NomeImagem, Flipped, wTipo);
  finally
    wMS.Free;
  end;
end;

end.



