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
|*  - Altera��es para valida��o com o XSD
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S2220;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnGerador,
  eSocial_Common, eSocial_Conversao, eSocial_Consts, eSocial_Gerador;

type
  TS2220Collection = class;
  TS2220CollectionItem = class;
  TEvtASO = class;
  TAso = class;
  TExameColecaoItem = class;
  TExameColecao = class;
  TRespMonit = class;
  TMedico = class;
  TCrm = class;
  TIdeServSaude = class;
  
  TS2220Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS2220CollectionItem;
    procedure SetItem(Index: Integer; Value: TS2220CollectionItem);
  public
    function Add: TS2220CollectionItem;
    property Items[Index: Integer]: TS2220CollectionItem read GetItem write SetItem; default;
  end;

  TS2220CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtASO: TEvtASO;

    procedure setEvtASO(const Value: TEvtASO);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtASO: TEvtASO read FEvtASO write setEvtASO;
  end;

  TEvtASO = class(TeSocialEvento)
  private
    FIdeEvento: TIdeEvento2;
    FIdeEmpregador: TIdeEmpregador;
    FIdeVinculo: TIdeVinculo;
    FAso: TAso;

    procedure GerarExame;
    procedure GerarMedico;
    procedure GerarCRM;
    procedure GerarAso;
    procedure GerarIdeServSaude;
    procedure GerarRespMonit(pRespMonit: TRespMonit);
  public
    constructor Create(AACBreSocial: TObject); overload;
    destructor Destroy; override;

    function GerarXML: boolean; override;

    property IdeEvento: TIdeEvento2 read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property IdeVinculo: TIdeVinculo read FIdeVinculo write FIdeVinculo;
    property Aso: TAso read FAso write FAso;
  end;

  TAso = class(TPersistent)
  private
    FDtAso: TDateTime;
    FtpAso: tpTpAso;
    FResAso: tpResAso;
    FExame: TExameColecao;
    FIdeServSaude: TIdeServSaude;
  public
    constructor create;
    destructor destroy; override;

    property DtAso: TDateTime read FDtAso write FDtAso;
    property tpAso: tpTpAso read FtpAso write FtpAso;
    property ResAso: tpResAso read FResAso write FResAso;
    property Exame: TExameColecao read FExame write FExame;
    property IdeServSaude: TIdeServSaude read FIdeServSaude write FIdeServSaude;
  end;

  TExameColecaoItem = class(TCollectionItem)
  private
    FDtExm: TDateTime;
    FProcRealizado: integer;
    FObsProc: string;
    FInterprExm: tpInterprExm;
    FOrdExame: tpOrdExame;
    FDtIniMonit: TDateTime;
    FDtFimMonit: TDateTime;
    FIndResult: tpIndResult;
    FRespMonit: TRespMonit;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;

    property DtExm: TDateTime read FDtExm write FDtExm;
    property ProcRealizado: integer read FProcRealizado write FProcRealizado;
    property obsProc: string read FObsProc write FObsProc;
    property interprExm: tpInterprExm read FInterprExm write FInterprExm;
    property ordExame: tpOrdExame read FOrdExame write FOrdExame;
    property dtIniMonit: TDateTime read FDtIniMonit write FDtIniMonit;
    property dtFimMonit: TDateTime read FDtFimMonit write FDtFimMonit;
    property indResult: tpIndResult read FIndResult write FIndResult;
    property respMonit: TRespMonit read FRespMonit write FRespMonit;
  end;

  TExameColecao = class(TCollection)
  private
    function GetItem(Index: Integer): TExameColecaoItem;
    procedure SetItem(Index: Integer; const Value: TExameColecaoItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TExameColecaoItem;
    property Items[Index: Integer]: TExameColecaoItem read GetItem write SetItem;
  end;

  TRespMonit = class
  private
    FNisResp: string;
    FNrConsClasse: string;
    FUfConsClasse: tpuf;
  public
    property NisResp: string read FNisResp write FNisResp;
    property NrConsClasse: string read FNrConsClasse write FNrConsClasse;
    property UfConsClasse: tpuf read FUfConsClasse write FUfConsClasse;
  end;

  TIdeServSaude = class
  private
    FCodCNES: string;
    FFrmCtt: string;
    FEmail: string;
    FMedico: TMedico;
  public
    constructor create;
    destructor destroy; override;
  published
    property CodCNES: string read FCodCNES write FCodCNES;
    property FrmCtt: string read FFrmCtt write FFrmCtt;
    property Email: string read FEmail write FEmail;
    property Medico: TMedico read FMedico write FMedico;
  end;

  TCrm = class
  private
    FNrCRM: string;
    FUfCRM: tpuf;
  published
    property NrCRM: string read FNrCRM write FNrCRM;
    property UfCRM: tpuf read FUfCRM write FUfCRM;
  end;

  TMedico = class
  private
    FNmMed: string;
    FCRM: TCRM;
  public
    constructor create;
    destructor destroy; override;
  public
    property NmMed: string read FNmMed write FNmMed;
    property CRM: TCRM read FCRM write FCRM;
  end;

implementation

uses
  eSocial_NaoPeriodicos;

{ TS2220Collection }

function TS2220Collection.Add: TS2220CollectionItem;
begin
  Result := TS2220CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS2220Collection.GetItem(Index: Integer): TS2220CollectionItem;
begin
  Result := TS2220CollectionItem(inherited GetItem(Index));
end;

procedure TS2220Collection.SetItem(Index: Integer;
  Value: TS2220CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS2220CollectionItem }

constructor TS2220CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS2220;
  FEvtASO     := TEvtASO.Create(AOwner);
end;

destructor TS2220CollectionItem.Destroy;
begin
  FEvtASO.Free;

  inherited;
end;

procedure TS2220CollectionItem.setEvtASO(const Value: TEvtASO);
begin
  FEvtASO.Assign(Value);
end;

{ TAso }

constructor TAso.create;
begin
  inherited;

  FExame := TExameColecao.Create(self);
  FIdeServSaude := TIdeServSaude.create;
end;

destructor TAso.destroy;
begin
  FExame.Free;
  FIdeServSaude.Free;

  inherited;
end;

{ TExameColecao }

function TExameColecao.Add: TExameColecaoItem;
begin
  Result := TExameColecaoItem(inherited Add);
  Result.Create;
end;

constructor TExameColecao.Create(AOwner: TPersistent);
begin
  inherited Create(TExameColecaoItem);
end;

function TExameColecao.GetItem(Index: Integer): TExameColecaoItem;
begin
  Result := TExameColecaoItem(inherited GetItem(Index));
end;

procedure TExameColecao.SetItem(Index: Integer;
  const Value: TExameColecaoItem);
begin
  inherited SetItem(Index, Value);
end;

{ TExameColecaoItem }

constructor TExameColecaoItem.Create;
begin
  FRespMonit := TRespMonit.Create;
end;

destructor TExameColecaoItem.Destroy;
begin
  FRespMonit.Free;

  inherited;
end;

{ TEvtASO }

constructor TEvtASO.Create(AACBreSocial: TObject);
begin
  inherited;

  FIdeEvento := TIdeEvento2.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeVinculo := TIdeVinculo.Create;
  FAso := TAso.Create;
end;

destructor TEvtASO.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeVinculo.Free;
  FAso.Free;

  inherited;
end;

procedure TEvtASO.GerarAso;
begin
  Gerador.wGrupo('aso');

  Gerador.wCampo(tcDat, '', 'dtAso',  10, 10, 1, self.Aso.DtAso);
  Gerador.wCampo(tcStr, '', 'tpAso',   1,  1, 1, eSTpAsoToStr(self.Aso.tpAso));
  Gerador.wCampo(tcStr, '', 'resAso',  1,  1, 1, eSResAsoToStr(self.Aso.ResAso));

  GerarExame;
  GerarIdeServSaude;

  Gerador.wGrupo('/aso');
end;

procedure TEvtASO.GerarCRM;
begin
  Gerador.wGrupo('crm');

  Gerador.wCampo(tcStr, '', 'nrCRM', 1, 8, 1, self.Aso.IdeServSaude.Medico.CRM.NrCRM);
  Gerador.wCampo(tcStr, '', 'ufCRM', 2, 2, 1, eSufToStr(self.Aso.IdeServSaude.Medico.CRM.UfCRM));

  Gerador.wGrupo('/crm');
end;

procedure TEvtASO.GerarExame;
var
  i: integer;
begin
  for i:= 0 to self.Aso.Exame.Count-1 do
  begin
    Gerador.wGrupo('exame');

    Gerador.wCampo(tcDat, '', 'dtExm',         10,  10, 1, self.Aso.Exame.Items[i].dtExm);
    Gerador.wCampo(tcStr, '', 'procRealizado',  1,   8, 0, self.Aso.Exame.Items[i].procRealizado);
    Gerador.wCampo(tcStr, '', 'obsProc',        1, 200, 0, self.Aso.Exame.Items[i].obsProc);
    Gerador.wCampo(tcInt, '', 'interprExm',     1,   1, 1, eSInterprExmToStr(self.Aso.Exame.Items[i].interprExm));
    Gerador.wCampo(tcInt, '', 'ordExame',       1,   1, 1, eSOrdExameToStr(self.Aso.Exame.Items[i].ordExame));
    Gerador.wCampo(tcDat, '', 'dtIniMonit',    10,  10, 1, self.Aso.Exame.Items[i].dtIniMonit);
    Gerador.wCampo(tcDat, '', 'dtFimMonit',    10,  10, 0, self.Aso.Exame.Items[i].dtFimMonit);
    Gerador.wCampo(tcInt, '', 'indResult',      1,   1, 0, eSIndResultToStr(self.Aso.Exame.Items[i].indResult));

    GerarRespMonit(self.Aso.Exame.Items[i].respMonit);

    Gerador.wGrupo('/exame');
  end;

  if self.Aso.Exame.Count > 99 then
    Gerador.wAlerta('', 'exame', 'Lista de Exames', ERR_MSG_MAIOR_MAXIMO + '99');
end;

procedure TEvtASO.GerarIdeServSaude;
begin
  Gerador.wGrupo('ideServSaude');

  Gerador.wCampo(tcStr, '', 'codCNES', 1,   7, 0, self.Aso.IdeServSaude.CodCNES);
  Gerador.wCampo(tcStr, '', 'frmCtt',  1, 100, 1, self.Aso.IdeServSaude.FrmCtt);
  Gerador.wCampo(tcStr, '', 'email',   1,  60, 0, self.Aso.IdeServSaude.Email);

  GerarMedico;

  Gerador.wGrupo('/ideServSaude');
end;

procedure TEvtASO.GerarMedico;
begin
  Gerador.wGrupo('medico');

  Gerador.wCampo(tcStr, '', 'nmMed', 1, 70, 1, self.Aso.IdeServSaude.Medico.NmMed);

  GerarCRM;

  Gerador.wGrupo('/medico');
end;

procedure TEvtASO.GerarRespMonit(pRespMonit: TRespMonit);
begin
  Gerador.wGrupo('respMonit');

  Gerador.wCampo(tcStr, '', 'nisResp',      1, 11, 1, pRespMonit.nisResp);
  Gerador.wCampo(tcStr, '', 'nrConsClasse', 1,  8, 1, pRespMonit.NrConsClasse);

  if (eSufToStr(pRespMonit.UfConsClasse) <> '') then
    Gerador.wCampo(tcStr, '', 'ufConsClasse', 2, 2, 0, eSufToStr(pRespMonit.UfConsClasse));

  Gerador.wGrupo('/respMonit');
end;

function TEvtASO.GerarXML: boolean;
begin
  try
    GerarCabecalho('evtMonit');
    Gerador.wGrupo('evtMonit Id="' + GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0) + '"');

    GerarIdeEvento2(self.IdeEvento);
    GerarIdeEmpregador(self.IdeEmpregador);
    GerarIdeVinculo(self.IdeVinculo);
    GerarAso;

    Gerador.wGrupo('/evtMonit');

    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtMonit');

    Validar('evtMonit');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TMedico }

constructor TMedico.create;
begin
  FCRM := TCRM.Create;
end;

destructor TMedico.destroy;
begin
  FCRM.Free;

  inherited;
end;

{ TIdeServSaude }

constructor TIdeServSaude.create;
begin
  FMedico := TMedico.create;
end;

destructor TIdeServSaude.destroy;
begin
  FMedico.Free;

  inherited;
end;

end.
 
