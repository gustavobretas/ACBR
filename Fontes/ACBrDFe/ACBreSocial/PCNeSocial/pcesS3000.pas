{******************************************************************************}
{ Projeto: Componente ACBreSocial                                              }
{  Biblioteca multiplataforma de componentes Delphi para envio dos eventos do  }
{ eSocial - http://www.esocial.gov.br/                                         }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
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
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doa��o do componente para o Projeto ACBr
|* 01/03/2016: Guilherme Costa
|*  - Passado o namespace para gera��o do cabe�alho
|* 07/03/2018:Edmar Fraz�o
|* Linha 220 Somente pode enviar CPF ou Periodo n�o os dois ao mesmo tempo
******************************************************************************}
{$I ACBr.inc}

unit pcesS3000;

interface

uses
  SysUtils, Classes,
  pcnConversao, ACBrUtil,
  pcesCommon, pcesConversaoeSocial, pcesGerador;

type
  TS3000Collection = class;
  TS3000CollectionItem = class;
  TEvtExclusao = class;
  TInfoExclusao = class;

  TS3000Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS3000CollectionItem;
    procedure SetItem(Index: Integer; Value: TS3000CollectionItem);
  public
    function Add: TS3000CollectionItem;
    property Items[Index: Integer]: TS3000CollectionItem read GetItem write SetItem; default;
  end;

  TS3000CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtExclusao: TEvtExclusao;
    procedure setEvtExclusao(const Value: TEvtExclusao);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtExclusao: TEvtExclusao read FEvtExclusao write setEvtExclusao;
  end;

  TEvtExclusao = class(TESocialEvento)
  private
    FIdeEvento: TIdeEvento;
    FIdeEmpregador: TIdeEmpregador;
    FInfoExclusao: TInfoExclusao;
    FACBreSocial: TObject;

    {Geradores espec�ficos da classe}
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor  Destroy; override;

    function GerarXML: boolean; override;
    function LerArqIni(const AIniString: String): Boolean;

    property IdeEvento: TIdeEvento read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property InfoExclusao: TInfoExclusao read FInfoExclusao write FInfoExclusao;
  end;

  TInfoExclusao = class
  private
    FtpEvento: TTipoEvento;
    FnrRecEvt: string;
    FIdeTrabalhador: TideTrabalhador2;
    FIdeFolhaPagto: TIdeFolhaPagto;
  public
    constructor Create;
    destructor Destroy; override;

    property tpEvento: TTipoEvento read FtpEvento write FtpEvento;
    property nrRecEvt: string read FnrRecEvt write FnrRecEvt;
    property IdeTrabalhador: TideTrabalhador2 read FIdeTrabalhador write FIdeTrabalhador;
    property IdeFolhaPagto: TIdeFolhaPagto read FIdeFolhaPagto write FIdeFolhaPagto;
  end;

implementation

uses
  IniFiles,
  ACBreSocial, ACBrDFeUtil;

{ TS3000Collection }

function TS3000Collection.Add: TS3000CollectionItem;
begin
  Result := TS3000CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS3000Collection.GetItem(Index: Integer): TS3000CollectionItem;
begin
  Result := TS3000CollectionItem(inherited GetItem(Index));
end;

procedure TS3000Collection.SetItem(Index: Integer;
  Value: TS3000CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS3000CollectionItem }

constructor TS3000CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS3000;
  FEvtExclusao := TEvtExclusao.Create(AOwner);
end;

destructor TS3000CollectionItem.Destroy;
begin
  FEvtExclusao.Free;

  inherited;
end;

procedure TS3000CollectionItem.setEvtExclusao(const Value: TEvtExclusao);
begin
  FEvtExclusao.Assign(Value);
end;

{ TInfoExclusao }

constructor TInfoExclusao.Create;
begin
  inherited;

  FIdeTrabalhador := TideTrabalhador2.Create;
  FIdeFolhaPagto := TIdeFolhaPagto.Create;
end;

destructor TInfoExclusao.destroy;
begin
  FIdeTrabalhador.Free;
  FIdeFolhaPagto.Free;

  inherited;
end;

{ TEvtExclusao }

constructor TEvtExclusao.Create(AACBreSocial: TObject);
begin
  inherited;

  FACBreSocial := AACBreSocial;
  FIdeEvento := TIdeEvento.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FInfoExclusao := TInfoExclusao.Create;
end;

destructor TEvtExclusao.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FInfoExclusao.Free;

  inherited;
end;

function TEvtExclusao.GerarXML: boolean;
begin
  try
    Self.VersaoDF := TACBreSocial(FACBreSocial).Configuracoes.Geral.VersaoDF;
     
    Self.Id := GerarChaveEsocial(now, self.ideEmpregador.NrInsc, self.Sequencial);

    GerarCabecalho('evtExclusao');
    Gerador.wGrupo('evtExclusao Id="' + Self.Id + '"');

    GerarIdeEvento(self.IdeEvento);
    GerarIdeEmpregador(self.IdeEmpregador);

    Gerador.wGrupo('infoExclusao');

    Gerador.wCampo(tcStr, '', 'tpEvento', 1,  6, 1, TipoEventoToStr(self.InfoExclusao.tpEvento));
    Gerador.wCampo(tcStr, '', 'nrRecEvt', 1, 40, 1, self.InfoExclusao.nrRecEvt);
                                 
    if ( self.InfoExclusao.tpEvento In [teS1200,teS1202,teS1210] ) then
      begin 
        GerarIdeTrabalhador2(self.InfoExclusao.IdeTrabalhador, True);
        GerarIdeFolhaPagto(self.InfoExclusao.IdeFolhaPagto);
      end
    else 
      begin
        if ( self.InfoExclusao.IdeFolhaPagto.perApur = '' ) then
           GerarIdeTrabalhador2(self.InfoExclusao.IdeTrabalhador, True)
        else
           GerarIdeFolhaPagto(self.InfoExclusao.IdeFolhaPagto);
      end;
    

    Gerador.wGrupo('/infoExclusao');
    Gerador.wGrupo('/evtExclusao');

    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtExclusao');

    Validar(schevtExclusao);
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

function TEvtExclusao.LerArqIni(const AIniString: String): Boolean;
var
  INIRec: TMemIniFile;
  Ok: Boolean;
  sSecao: String;
begin
  Result := False;

  INIRec := TMemIniFile.Create('');
  try
    LerIniArquivoOuString(AIniString, INIRec);

    with Self do
    begin
      sSecao := 'evtExclusao';
      Sequencial := INIRec.ReadInteger(sSecao, 'Sequencial', 0);

      sSecao := 'ideEvento';
      ideEvento.TpAmb       := eSStrTotpAmb(Ok, INIRec.ReadString(sSecao, 'tpAmb', '1'));
      ideEvento.ProcEmi     := eSStrToProcEmi(Ok, INIRec.ReadString(sSecao, 'procEmi', '1'));
      ideEvento.VerProc     := INIRec.ReadString(sSecao, 'verProc', EmptyStr);

      sSecao := 'ideEmpregador';
      ideEmpregador.OrgaoPublico := (TACBreSocial(FACBreSocial).Configuracoes.Geral.TipoEmpregador = teOrgaoPublico);
      ideEmpregador.TpInsc       := eSStrToTpInscricao(Ok, INIRec.ReadString(sSecao, 'tpInsc', '1'));
      ideEmpregador.NrInsc       := INIRec.ReadString(sSecao, 'nrInsc', EmptyStr);

      sSecao := 'infoExclusao';
      infoExclusao.tpEvento := StrToTipoEvento(Ok, INIRec.ReadString(sSecao, 'tpEvento', EmptyStr));
      infoExclusao.nrRecEvt := INIRec.ReadString(sSecao, 'nrRecEvt', EmptyStr);

      sSecao := 'ideTrabalhador';
      infoExclusao.ideTrabalhador.cpfTrab := INIRec.ReadString(sSecao, 'cpfTrab', EmptyStr);
      infoExclusao.ideTrabalhador.nisTrab := INIRec.ReadString(sSecao, 'nisTrab', EmptyStr);

      sSecao := 'ideFolhaPagto';
      infoExclusao.ideFolhaPagto.indApuracao := eSStrToIndApuracao(Ok, INIRec.ReadString(sSecao, 'indApuracao', '1'));
      infoExclusao.ideFolhaPagto.perApur     := INIRec.ReadString(sSecao, 'perApur', EmptyStr);
    end;

    GerarXML;

    Result := True;
  finally
     INIRec.Free;
  end;
end;

end.
