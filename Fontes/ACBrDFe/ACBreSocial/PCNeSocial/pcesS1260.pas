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

unit pcesS1260;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnGerador,
  pcesCommon, pcesConversaoeSocial, pcesGerador;

type
  TS1260Collection = class;
  TS1260CollectionItem = class;
  TEvtComProd = class;
  TInfoComProd=class;
  TIdeEstabel=class;
  TTpComercItem = class;
  TTpComercColecao = class;
  TIdeAdquirItem = class;
  TIdeAdquirColecao = class;

  TS1260Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1260CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1260CollectionItem);
  public
    function Add: TS1260CollectionItem;
    property Items[Index: Integer]: TS1260CollectionItem read GetItem write SetItem; default;
  end;

  TS1260CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtComProd: TEvtComProd;

    procedure setEvtComProd(const Value: TEvtComProd);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtComProd: TEvtComProd read FEvtComProd write setEvtComProd;
  end;

  TEvtComProd = class(TESocialEvento)
  private
    FIdeEvento: TIdeEvento3;
    FIdeEmpregador: TIdeEmpregador;
    FInfoComProd: TInfoComProd;

    {Geradores espec�ficos da classe}
    procedure GerarInfoComProd;
    procedure GerarIdeEstabel;
    procedure GerarTpComerc(pTpComerc: TTpComercColecao);
    procedure GerarIdeAdquir(pIdeAdquir: TIdeAdquirColecao);
    procedure GerarInfoProcJud(pInfoProcJud: TInfoProcJudCollection);
  public
    constructor Create(AACBreSocial: TObject);overload;
    destructor Destroy; override;

    function GerarXML(ATipoEmpregador: TEmpregador): boolean; override;

    property IdeEvento: TIdeEvento3 read FIdeEvento write FIdeEvento;
    property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property InfoComProd: TInfoComProd read FInfoComProd write FInfoComProd;
  end;

  TInfoComProd=class(TPersistent)
  private
    FIdeEstabel: TIdeEstabel;
  public
    constructor create;
    destructor Destroy; override;

    property IdeEstabel: TIdeEstabel read FIdeEstabel write FIdeEstabel;
  end;

  TIdeEstabel=class(TPersistent)
  private
    FnrInscEstabRural: string;
    FTpComerc: TTpComercColecao;
  public
    constructor create;
    destructor Destroy; override;

    property nrInscEstabRural: string read FnrInscEstabRural write FnrInscEstabRural;
    property TpComerc: TTpComercColecao read FTpComerc write FTpComerc;
  end;

  TTpComercColecao = class(TCollection)
  private
    function GetItem(Index: Integer): TTpComercItem;
    procedure SetItem(Index: Integer; const Value: TTpComercItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TTpComercItem;
    property Items[Index: Integer]: TTpComercItem read GetItem write SetItem;
  end;

  TTpComercItem = class(TCollectionItem)
  private
    FindComerc: tpIndComerc;
    FvrTotCom: Double;
    FIdeAdquir: TIdeAdquirColecao;
    FInfoProcJud: TInfoProcJudCollection;
  public
    constructor create; reintroduce;
    destructor Destroy; override;

    property indComerc: tpIndComerc read FindComerc write FindComerc;
    property vrTotCom: double read FvrTotCom write FvrTotCom;
    property IdeAdquir: TIdeAdquirColecao read FIdeAdquir write FIdeAdquir;
    property InfoProcJud: TInfoProcJudCollection read FInfoProcJud write FInfoProcJud;
  end;

  TIdeAdquirColecao = class(TCollection)
  private
    function GetItem(Index: Integer): TIdeAdquirItem;
    procedure SetItem(Index: Integer; const Value: TIdeAdquirItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TIdeAdquirItem;
    property Items[Index: Integer]: TIdeAdquirItem read GetItem write SetItem;
  end;

  TIdeAdquirItem = class(TCollectionItem)
  private
    FtpInsc: tpTpInsc;
    FnrInsc: string;
    FvrComerc: Double;
    FvrRetPR: Double;
    FNfs: TNfsColecao;
    function getNfs: TNfsColecao;
  public
    constructor Create; reintroduce;
    destructor Destroy; override;
    function nfsInst: boolean;

    property tpInsc: tpTpInsc read FtpInsc write FtpInsc;
    property nrInsc: string read FnrInsc write FnrInsc;
    property vrComerc: Double read FvrComerc write FvrComerc;
    property vrRetPR: Double read FvrRetPR write FvrRetPR;
    property nfs: TNfsColecao read getNfs write FNfs;
  end;

implementation

{ TS1260Collection }

function TS1260Collection.Add: TS1260CollectionItem;
begin
  Result := TS1260CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1260Collection.GetItem(Index: Integer): TS1260CollectionItem;
begin
  Result := TS1260CollectionItem(inherited GetItem(Index));
end;

procedure TS1260Collection.SetItem(Index: Integer; Value: TS1260CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{TS1260CollectionItem}
constructor TS1260CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1260;
  FEvtComProd := TEvtComProd.Create(AOwner);
end;

destructor TS1260CollectionItem.Destroy;
begin
  FEvtComProd.Free;

  inherited;
end;

procedure TS1260CollectionItem.setEvtComProd(const Value: TEvtComProd);
begin
  FEvtComProd.Assign(Value);
end;

{ TEvtComProd }
constructor TEvtComProd.Create(AACBreSocial: TObject);
begin
  inherited;

  FIdeEvento     := TIdeEvento3.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FInfoComProd   := TInfoComProd.create;
end;

destructor TEvtComProd.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FInfoComProd.Free;

  inherited;
end;

procedure TEvtComProd.GerarInfoComProd;
begin
  Gerador.wGrupo('infoComProd');

  GerarIdeEstabel;

  Gerador.wGrupo('/infoComProd');
end;

procedure TEvtComProd.GerarIdeEstabel;
begin
  Gerador.wGrupo('ideEstabel');

  Gerador.wCampo(tcStr, '', 'nrInscEstabRural', 1, 15, 1, InfoComProd.IdeEstabel.nrInscEstabRural);

  GerarTpComerc(InfoComProd.IdeEstabel.TpComerc);

  Gerador.wGrupo('/ideEstabel');
end;

procedure TEvtComProd.GerarIdeAdquir(pIdeAdquir: TIdeAdquirColecao);
var
  i: integer;
begin
  for i := 0 to pIdeAdquir.Count - 1 do
  begin
    Gerador.wGrupo('ideAdquir');

    Gerador.wCampo(tcStr, '', 'tpInsc',   1,  1, 1, eSTpInscricaoToStr(pIdeAdquir.Items[i].tpInsc));
    Gerador.wCampo(tcStr, '', 'nrInsc',   1, 15, 1, pIdeAdquir.Items[i].nrInsc);
    Gerador.wCampo(tcDe2, '', 'vrComerc', 1, 14, 1, pIdeAdquir.Items[i].vrComerc);

    if pIdeAdquir.Items[i].nfsInst() then
      GerarNfs(pIdeAdquir.Items[i].nfs);

    Gerador.wGrupo('/ideAdquir');
  end;

  if pIdeAdquir.Count > 9999 then
    Gerador.wAlerta('', 'ideAdquir', 'Lista de Adquirentes de Produ��o', ERR_MSG_MAIOR_MAXIMO + '9999');
end;

procedure TEvtComProd.GerarInfoProcJud(pInfoProcJud: TInfoProcJudCollection);
var
  i : Integer;
begin
  for i := 0 to pInfoProcJud.Count - 1 do
  begin
    Gerador.wGrupo('infoProcJud');

    Gerador.wCampo(tcStr, '', 'tpProc',      1,  1, 1, pInfoProcJud.Items[i].tpProc);
    Gerador.wCampo(tcStr, '', 'nrProc',      1, 20, 1, pInfoProcJud.Items[i].nrProcJud);
    Gerador.wCampo(tcInt, '', 'codSusp',     1, 14, 1, pInfoProcJud.Items[i].codSusp);
    Gerador.wCampo(tcDe2, '', 'vrCPSusp',    1, 14, 0, pInfoProcJud.Items[i].vrCPSusp);
    Gerador.wCampo(tcDe2, '', 'vrRatSusp',   1, 14, 0, pInfoProcJud.Items[i].vrRatSusp);
    Gerador.wCampo(tcDe2, '', 'vrSenarSusp', 1, 14, 0, pInfoProcJud.Items[i].vrSenarSusp);

    Gerador.wGrupo('/infoProcJud');
  end;

  if pInfoProcJud.Count > 10 then
    Gerador.wAlerta('', 'infoProcJud', 'Lista de Informa��es de Processos', ERR_MSG_MAIOR_MAXIMO + '10');
end;

procedure TEvtComProd.GerarTpComerc(pTpComerc: TTpComercColecao);
var
  i: Integer;
begin
  for i := 0 to pTpComerc.Count - 1 do
  begin
    Gerador.wGrupo('tpComerc');

    Gerador.wCampo(tcStr, '', 'indComerc', 1,  1, 1, eSIndComercStr(pTpComerc.Items[i].indComerc));
    Gerador.wCampo(tcDe2, '', 'vrTotCom',  1, 14, 1, pTpComerc.Items[i].vrTotCom);

    GerarIdeAdquir(pTpComerc.Items[i].IdeAdquir);
    GerarInfoProcJud(pTpComerc.Items[i].InfoProcJud);

    Gerador.wGrupo('/tpComerc');
  end;

  if pTpComerc.Count > 4 then
    Gerador.wAlerta('', 'tpComerc', 'Lista de Comercializa��o', ERR_MSG_MAIOR_MAXIMO + '4');
end;

function TEvtComProd.GerarXML(ATipoEmpregador: TEmpregador): boolean;
begin
  try
    Self.Id := GerarChaveEsocial(now, self.ideEmpregador.NrInsc,
     self.Sequencial, ATipoEmpregador);

    GerarCabecalho('evtComProd');
    Gerador.wGrupo('evtComProd Id="' + Self.Id + '"');

    GerarIdeEvento3(self.IdeEvento);
    GerarIdeEmpregador(self.IdeEmpregador);
    GerarInfoComProd;

    Gerador.wGrupo('/evtComProd');

    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtComProd');

    Validar('evtComProd');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TTpComercColecao }
function TTpComercColecao.Add: TTpComercItem;
begin
  Result := TTpComercItem(inherited add);
  Result.Create;
end;

constructor TTpComercColecao.create(AOwner: TPersistent);
begin
  inherited create(TTpComercItem)
end;

function TTpComercColecao.GetItem(Index: Integer): TTpComercItem;
begin
  Result := TTpComercItem(inherited GetItem(Index));
end;

procedure TTpComercColecao.SetItem(Index: Integer; const Value: TTpComercItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoComProd }
constructor TInfoComProd.create;
begin
  inherited;

  FIdeEstabel := TIdeEstabel.create;
end;

destructor TInfoComProd.destroy;
begin
  FIdeEstabel.Free;

  inherited;
end;

{ TTpComercItem }
constructor TTpComercItem.create;
begin
  FIdeAdquir := TIdeAdquirColecao.Create(self);
  FInfoProcJud := TInfoProcJudCollection.Create(self);
end;

destructor TTpComercItem.destroy;
begin
  FIdeAdquir.Free;
  FInfoProcJud.Free;

  inherited;
end;

{ TIdeAdquirColecao }
function TIdeAdquirColecao.Add: TIdeAdquirItem;
begin
  Result := TIdeAdquirItem(inherited Add);
  Result.Create;
end;

constructor TIdeAdquirColecao.Create(AOwner: TPersistent);
begin
  inherited Create(TIdeAdquirItem);
end;

function TIdeAdquirColecao.GetItem(Index: Integer): TIdeAdquirItem;
begin
  Result := TIdeAdquirItem(inherited GetItem(Index));
end;

procedure TIdeAdquirColecao.SetItem(Index: Integer;
  const Value: TIdeAdquirItem);
begin
  inherited SetItem(Index, Value);
end;

{ TIdeAdquirItem }

constructor TIdeAdquirItem.Create;
begin
  FNfs := nil;
end;

destructor TIdeAdquirItem.Destroy;
begin
  FreeAndNil(FNfs);

  inherited;
end;

function TIdeAdquirItem.getNfs: TNfsColecao;
begin
  if not Assigned(FNfs) then
    FNfs := TNfsColecao.Create(FNfs);
  Result := FNfs;
end;

function TIdeAdquirItem.nfsInst: boolean;
begin
  result := Assigned(FNfs);
end;

{ TIdeEstabel }
constructor TIdeEstabel.create;
begin
  inherited;

  FTpComerc := TTpComercColecao.Create(self);
end;

destructor TIdeEstabel.destroy;
begin
  FTpComerc.Free;

  inherited;
end;

end.
