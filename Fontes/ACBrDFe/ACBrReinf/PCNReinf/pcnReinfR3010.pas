{******************************************************************************}
{ Projeto: Componente ACBrReinf                                                }
{  Biblioteca multiplataforma de componentes Delphi para envio de eventos do   }
{ Reinf                                                                        }

{ Direitos Autorais Reservados (c) 2017 Leivio Ramos de Fontenele              }
{                                                                              }

{ Colaboradores nesse arquivo:                                                 }

{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }


{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }

{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }

{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Leivio Ramos de Fontenele  -  leivio@yahoo.com.br                            }
{******************************************************************************}
{******************************************************************************
|* Historico
|*
|* 04/12/2017: Renato Rubinho
|*  - Implementados registros que faltavam e isoladas as respectivas classes
*******************************************************************************}

{$I ACBr.inc}

unit pcnReinfR3010;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnGerador, ACBrUtil,
  pcnCommonReinf, pcnConversaoReinf, pcnGeradorReinf;

type
  TR3010Collection = class;
  TR3010CollectionItem = class;
  TevtEspDesportivo = class;

  {Classes espec�ficas deste evento}
  TideEstabCollection = class;
  TideEstabCollectionItem = class;
  TboletimCollection = class;
  TboletimCollectionItem = class;
  TreceitaIngressosCollection = class;
  TreceitaIngressosCollectionItem = class;
  ToutrasReceitasCollection = class;
  ToutrasReceitasCollectionItem = class;
  TreceitaTotal = class;
  TinfoProcCollection = class;
  TinfoProcCollectionItem = class;

  TR3010Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TR3010CollectionItem;
    procedure SetItem(Index: Integer; Value: TR3010CollectionItem);
  public
    function Add: TR3010CollectionItem;
    property Items[Index: Integer]: TR3010CollectionItem read GetItem write SetItem; default;
  end;

  TR3010CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FevtEspDesportivo: TevtEspDesportivo;
    procedure setevtEspDesportivo(const Value: TevtEspDesportivo);
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property evtEspDesportivo: TevtEspDesportivo read FevtEspDesportivo write setevtEspDesportivo;
  end;

  TevtEspDesportivo = class(TReinfEvento) //Classe do elemento principal do XML do evento!
  private
    FIdeEvento: TIdeEvento3;
    FideContri: TideContri;
    FACBrReinf: TObject;
    FideEstab: TideEstabCollection;

    {Geradores espec�ficos desta classe}
    procedure GerarideEstab(Lista: TideEstabCollection);
    procedure Gerarboletim(Lista: TboletimCollection);
    procedure GerarreceitaIngressos(Lista: TreceitaIngressosCollection);
    procedure GeraroutrasReceitas(Lista: ToutrasReceitasCollection);
    procedure GerarTotal(Item: TreceitaTotal);
    procedure GerarinfoProc(Lista: TinfoProcCollection);
  public
    constructor Create(AACBrReinf: TObject); overload;
    destructor  Destroy; override;

    function GerarXML: Boolean; override;
    function LerArqIni(const AIniString: String): Boolean;

    property ideEvento: TIdeEvento3 read FIdeEvento write FIdeEvento;
    property ideContri: TideContri read FideContri write FideContri;
    property ideEstab: TideEstabCollection read FideEstab write FideEstab;
  end;

  TideEstabCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TideEstabCollectionItem;
    procedure SetItem(Index: Integer; Value: TideEstabCollectionItem);
  public
    constructor create(AOwner: TevtEspDesportivo);
    function Add: TideEstabCollectionItem;
    property Items[Index: Integer]: TideEstabCollectionItem read GetItem write SetItem; default;
  end;

  TideEstabCollectionItem = class(TCollectionItem)
  private
    FtpInscEstab: TtpInsc;
    FnrInscEstab: string;
    Fboletim: TboletimCollection;
    FreceitaTotal: TreceitaTotal;
  public
    constructor create; reintroduce;
    destructor Destroy; override;

    property tpInscEstab: TtpInsc read FtpInscEstab write FtpInscEstab default tiCNPJ;
    property nrInscEstab: string read FnrInscEstab write FnrInscEstab;
    property boletim: TboletimCollection read Fboletim write Fboletim;
    property receitaTotal: TreceitaTotal read FreceitaTotal write FreceitaTotal;
  end;

  TboletimCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TboletimCollectionItem;
    procedure SetItem(Index: Integer; Value: TboletimCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: TboletimCollectionItem;
    property Items[Index: Integer]: TboletimCollectionItem read GetItem write SetItem; default;
  end;

  TboletimCollectionItem = class(TCollectionItem)
  private
    FnrBoletim: String;
    FtpCompeticao: TtpCompeticao;
    FcategEvento: TcategEvento;
    FmodDesportiva: String;
    FnomeCompeticao: String;
    FcnpjMandante: String;
    FcnpjVisitante: String;
    FnomeVisitante: String;
    FpracaDesportiva: String;
    FcodMunic: Integer;
    Fuf: String;
    FqtdePagantes: Integer;
    FqtdeNaoPagantes: Integer;
    FreceitaIngressos: TreceitaIngressosCollection;
    FoutrasReceitas: ToutrasReceitasCollection;
  public
    constructor create; reintroduce;
    destructor Destroy; override;

    property nrBoletim: String read FnrBoletim write FnrBoletim;
    property tpCompeticao: TtpCompeticao read FtpCompeticao write FtpCompeticao;
    property categEvento: TcategEvento read FcategEvento write FcategEvento;
    property modDesportiva: String read FmodDesportiva write FmodDesportiva;
    property nomeCompeticao: String read FnomeCompeticao write FnomeCompeticao;
    property cnpjMandante: String read FcnpjMandante write FcnpjMandante;
    property cnpjVisitante: String read FcnpjVisitante write FcnpjVisitante;
    property nomeVisitante: String read FnomeVisitante write FnomeVisitante;
    property pracaDesportiva: String read FpracaDesportiva write FpracaDesportiva;
    property codMunic: Integer read FcodMunic write FcodMunic;
    property uf: String read Fuf write Fuf;
    property qtdePagantes: Integer read FqtdePagantes write FqtdePagantes;
    property qtdeNaoPagantes: Integer read FqtdeNaoPagantes write FqtdeNaoPagantes;
    property receitaIngressos: TreceitaIngressosCollection read FreceitaIngressos write FreceitaIngressos;
    property outrasReceitas: ToutrasReceitasCollection read FoutrasReceitas write FoutrasReceitas;
  end;

  TreceitaIngressosCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TreceitaIngressosCollectionItem;
    procedure SetItem(Index: Integer; Value: TreceitaIngressosCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: TreceitaIngressosCollectionItem;
    property Items[Index: Integer]: TreceitaIngressosCollectionItem read GetItem write SetItem; default;
  end;

  TreceitaIngressosCollectionItem = class(TCollectionItem)
  private
    FtpIngresso: TtpIngresso;
    FdescIngr: String;
    FqtdeIngrVenda: Integer;
    FqtdeIngrVendidos: Integer;
    FqtdeIngrDev: Integer;
    FprecoIndiv: double;
    FvlrTotal: double;
  public
    property tpIngresso: TtpIngresso read FtpIngresso write FtpIngresso;
    property descIngr: String read FdescIngr write FdescIngr;
    property qtdeIngrVenda: Integer read FqtdeIngrVenda write FqtdeIngrVenda;
    property qtdeIngrVendidos: Integer read FqtdeIngrVendidos write FqtdeIngrVendidos;
    property qtdeIngrDev: Integer read FqtdeIngrDev write FqtdeIngrDev;
    property precoIndiv: double read FprecoIndiv write FprecoIndiv;
    property vlrTotal: double read FvlrTotal write FvlrTotal;
  end;

  ToutrasReceitasCollection = class(TCollection)
  private
    function GetItem(Index: Integer): ToutrasReceitasCollectionItem;
    procedure SetItem(Index: Integer; Value: ToutrasReceitasCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: ToutrasReceitasCollectionItem;
    property Items[Index: Integer]: ToutrasReceitasCollectionItem read GetItem write SetItem; default;
  end;

  ToutrasReceitasCollectionItem = class(TCollectionItem)
  private
    FtpReceita: TtpReceita;
    FvlrReceita: double;
    FdescReceita: String;
  public
    property tpReceita: TtpReceita read FtpReceita write FtpReceita;
    property vlrReceita: double read FvlrReceita write FvlrReceita;
    property descReceita: String read FdescReceita write FdescReceita;
  end;

  { TreceitaTotal }
  TreceitaTotal = class(TPersistent)
  private
    FvlrReceitaTotal: double;
    FvlrCP: double;
    FvlrCPSuspTotal: double;
    FvlrReceitaClubes: double;
    FvlrRetParc: double;
    FinfoProc: TinfoProcCollection;
  public
    constructor Create;
    destructor Destroy; override;

    property vlrReceitaTotal: double read FvlrReceitaTotal write FvlrReceitaTotal;
    property vlrCP: double read FvlrCP write FvlrCP;
    property vlrCPSuspTotal: double read FvlrCPSuspTotal write FvlrCPSuspTotal;
    property vlrReceitaClubes: double read FvlrReceitaClubes write FvlrReceitaClubes;
    property vlrRetParc: double read FvlrRetParc write FvlrRetParc;
    property infoProc: TinfoProcCollection read FinfoProc write FinfoProc;
  end;

  TinfoProcCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TinfoProcCollectionItem;
    procedure SetItem(Index: Integer; Value: TinfoProcCollectionItem);
  public
    constructor create(); reintroduce;
    function Add: TinfoProcCollectionItem;
    property Items[Index: Integer]: TinfoProcCollectionItem read GetItem write SetItem; default;
  end;

  TinfoProcCollectionItem = class(TCollectionItem)
  private
    FtpProc: TtpProc;
    FnrProc: String;
    FcodSusp: String;
    FvlrCPSusp: double;
  public
    property tpProc: TtpProc read FtpProc write FtpProc;
    property nrProc: String read FnrProc write FnrProc;
    property codSusp: String read FcodSusp write FcodSusp;
    property vlrCPSusp: double read FvlrCPSusp write FvlrCPSusp;
  end;

implementation

uses
  IniFiles,
  ACBrReinf, ACBrDFeUtil;

{ TR3010Collection }

function TR3010Collection.Add: TR3010CollectionItem;
begin
  Result := TR3010CollectionItem(inherited Add);
end;

function TR3010Collection.GetItem(Index: Integer): TR3010CollectionItem;
begin
  Result := TR3010CollectionItem(inherited GetItem(Index));
end;

procedure TR3010Collection.SetItem(Index: Integer; Value: TR3010CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TR3010CollectionItem }

procedure TR3010CollectionItem.AfterConstruction;
begin
  inherited;
  FTipoEvento := teR3010;
  FevtEspDesportivo := TevtEspDesportivo.Create(Collection.Owner);
end;

procedure TR3010CollectionItem.BeforeDestruction;
begin
  inherited;
  FevtEspDesportivo.Free;
end;

procedure TR3010CollectionItem.setevtEspDesportivo(const Value: TevtEspDesportivo);
begin
  FevtEspDesportivo.Assign(Value);
end;

{ TevtEspDesportivo }

constructor TevtEspDesportivo.Create(AACBrReinf: TObject);
begin
  inherited;

  FACBrReinf := AACBrReinf;

  FideContri := TideContri.create;
  FIdeEvento := TIdeEvento3.create;
  FideEstab  := TideEstabCollection.Create(Self);
end;

destructor TevtEspDesportivo.Destroy;
begin
  FideContri.Free;
  FIdeEvento.Free;
  FideEstab.Free;

  inherited;
end;

{ TideEstabCollection }

function TideEstabCollection.Add: TideEstabCollectionItem;
begin
  Result := TideEstabCollectionItem(inherited add());
  Result.Create;
end;

constructor TideEstabCollection.create(AOwner: TevtEspDesportivo);
begin
  Inherited create(TideEstabCollectionItem);
end;

function TideEstabCollection.GetItem(
  Index: Integer): TideEstabCollectionItem;
begin
  Result := TideEstabCollectionItem(inherited GetItem(Index));
end;

procedure TideEstabCollection.SetItem(Index: Integer;
  Value: TideEstabCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TideEstabCollectionItem }

constructor TideEstabCollectionItem.create;
begin
  Fboletim      := TboletimCollection.Create;
  FreceitaTotal := TreceitaTotal.Create;
end;

destructor TideEstabCollectionItem.Destroy;
begin
  Fboletim.Free;
  FreceitaTotal.Free;

  inherited;
end;

{ TboletimCollection }

function TboletimCollection.Add: TboletimCollectionItem;
begin
  Result := TboletimCollectionItem(inherited add());
  Result.Create;
end;

constructor TboletimCollection.create;
begin
  Inherited create(TboletimCollectionItem);
end;

function TboletimCollection.GetItem(
  Index: Integer): TboletimCollectionItem;
begin
  Result := TboletimCollectionItem(inherited GetItem(Index));
end;

procedure TboletimCollection.SetItem(Index: Integer;
  Value: TboletimCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TboletimCollectionItem }

constructor TboletimCollectionItem.create;
begin
  FreceitaIngressos := TreceitaIngressosCollection.create;
  FoutrasReceitas   := ToutrasReceitasCollection.create;
end;

destructor TboletimCollectionItem.Destroy;
begin
  FreceitaIngressos.Free;
  FoutrasReceitas.Free;

  inherited;
end;

{ TreceitaIngressosCollection }

function TreceitaIngressosCollection.Add: TreceitaIngressosCollectionItem;
begin
  Result := TreceitaIngressosCollectionItem(inherited add());
//  Result.Create;
end;

constructor TreceitaIngressosCollection.create;
begin
  Inherited create(TreceitaIngressosCollectionItem);
end;

function TreceitaIngressosCollection.GetItem(
  Index: Integer): TreceitaIngressosCollectionItem;
begin
  Result := TreceitaIngressosCollectionItem(inherited GetItem(Index));
end;

procedure TreceitaIngressosCollection.SetItem(Index: Integer;
  Value: TreceitaIngressosCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ ToutrasReceitasCollection }

function ToutrasReceitasCollection.Add: ToutrasReceitasCollectionItem;
begin
  Result := ToutrasReceitasCollectionItem(inherited add());
//  Result.Create;
end;

constructor ToutrasReceitasCollection.create;
begin
  Inherited create(ToutrasReceitasCollectionItem);
end;

function ToutrasReceitasCollection.GetItem(
  Index: Integer): ToutrasReceitasCollectionItem;
begin
  Result := ToutrasReceitasCollectionItem(inherited GetItem(Index));
end;

procedure ToutrasReceitasCollection.SetItem(Index: Integer;
  Value: ToutrasReceitasCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TreceitaTotal }

constructor TreceitaTotal.Create;
begin
  FinfoProc := TinfoProcCollection.create;
end;

destructor TreceitaTotal.Destroy;
begin
  FinfoProc.Free;

  inherited;
end;

{ TinfoProcCollection }

function TinfoProcCollection.Add: TinfoProcCollectionItem;
begin
  Result := TinfoProcCollectionItem(inherited add());
//  Result.Create;
end;

constructor TinfoProcCollection.create;
begin
  Inherited create(TinfoProcCollectionItem);
end;

function TinfoProcCollection.GetItem(
  Index: Integer): TinfoProcCollectionItem;
begin
  Result := TinfoProcCollectionItem(inherited GetItem(Index));
end;

procedure TinfoProcCollection.SetItem(Index: Integer;
  Value: TinfoProcCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

procedure TevtEspDesportivo.GerarideEstab(Lista: TideEstabCollection);
var
  item: TideEstabCollectionItem;
  i: Integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Item := Lista.Items[i];

    Gerador.wGrupo('ideEstab');

    Gerador.wCampo(tcStr, '', 'tpInscEstab', 1,  1, 1, TpInscricaoToStr(item.tpInscEstab));
    Gerador.wCampo(tcStr, '', 'nrInscEstab', 1, 14, 1, item.nrInscEstab);

    Gerarboletim(item.boletim);
    GerarTotal(item.receitaTotal);

    Gerador.wGrupo('/ideEstab');
  end;

  if Lista.Count > 25 then
    Gerador.wAlerta('', 'ideEstab', 'Lista de Identifica��o de Estabelecimento', ERR_MSG_MAIOR_MAXIMO + '25');
end;

procedure TevtEspDesportivo.Gerarboletim(Lista: TboletimCollection);
var
  item: TboletimCollectionItem;
  i: Integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Item := Lista.Items[i];

    Gerador.wGrupo('boletim');

    Gerador.wCampo(tcStr, '', 'nrBoletim',        1,   4, 1, item.nrBoletim);
    Gerador.wCampo(tcStr, '', 'tpCompeticao',     1,   1, 1, tpCompeticaoToStr( item.tpCompeticao ));
    Gerador.wCampo(tcStr, '', 'categEvento',      1,   1, 1, categEventoToStr( item.categEvento ));
    Gerador.wCampo(tcStr, '', 'modDesportiva',    1, 100, 1, item.modDesportiva);
    Gerador.wCampo(tcStr, '', 'nomeCompeticao',   1, 100, 1, item.nomeCompeticao);
    Gerador.wCampo(tcStr, '', 'cnpjMandante',    14,  14, 1, item.cnpjMandante);
    Gerador.wCampo(tcStr, '', 'cnpjVisitante',   14,  14, 0, item.cnpjVisitante);
    Gerador.wCampo(tcStr, '', 'nomeVisitante',    1,  80, 0, item.nomeVisitante);
    Gerador.wCampo(tcStr, '', 'pracaDesportiva',  1, 100, 1, item.pracaDesportiva);
    Gerador.wCampo(tcInt, '', 'codMunic',         7,   7, 0, item.codMunic);
    Gerador.wCampo(tcStr, '', 'uf',               2,   2, 1, item.uf);
    Gerador.wCampo(tcInt, '', 'qtdePagantes',     1,   6, 1, item.qtdePagantes);
    Gerador.wCampo(tcInt, '', 'qtdeNaoPagantes',  1,   6, 1, item.qtdeNaoPagantes);

    GerarreceitaIngressos(item.receitaIngressos);
    GeraroutrasReceitas(item.outrasReceitas);

    Gerador.wGrupo('/boletim');
  end;

  if Lista.Count > 999 then
    Gerador.wAlerta('', 'boletim', 'Lista de Boletim', ERR_MSG_MAIOR_MAXIMO + '99');
end;

procedure TevtEspDesportivo.GerarreceitaIngressos(
  Lista: TreceitaIngressosCollection);
var
  item: TreceitaIngressosCollectionItem;
  i: Integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Item := Lista.Items[i];

    Gerador.wGrupo('receitaIngressos');

    Gerador.wCampo(tcStr, '', 'tpIngresso',       1,  1, 1, tpIngressoToStr( item.tpIngresso ));
    Gerador.wCampo(tcStr, '', 'descIngr',         1, 30, 1, item.descIngr);
    Gerador.wCampo(tcInt, '', 'qtdeIngrVenda',    1,  6, 1, item.qtdeIngrVenda);
    Gerador.wCampo(tcInt, '', 'qtdeIngrVendidos', 1,  6, 1, item.qtdeIngrVendidos);
    Gerador.wCampo(tcInt, '', 'qtdeIngrDev',      1,  6, 1, item.qtdeIngrDev);
    Gerador.wCampo(tcDe2, '', 'precoIndiv',       1, 14, 1, item.precoIndiv);
    Gerador.wCampo(tcDe2, '', 'vlrTotal',         1, 14, 1, item.vlrTotal);

    Gerador.wGrupo('/receitaIngressos');
  end;

  if Lista.Count > 999 then
    Gerador.wAlerta('', 'receitaIngressos', 'Lista de Receita de venda de ingressos', ERR_MSG_MAIOR_MAXIMO + '99');
end;

procedure TevtEspDesportivo.GeraroutrasReceitas(
  Lista: ToutrasReceitasCollection);
var
  item: ToutrasReceitasCollectionItem;
  i: Integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Item := Lista.Items[i];

    Gerador.wGrupo('outrasReceitas');

    Gerador.wCampo(tcStr, '', 'tpReceita',   1,  1, 1, tpReceitaToStr( item.tpReceita ));
    Gerador.wCampo(tcDe2, '', 'vlrReceita',  1, 14, 1, item.vlrReceita);
    Gerador.wCampo(tcStr, '', 'descReceita', 1, 20, 1, item.descReceita);

    Gerador.wGrupo('/outrasReceitas');
  end;

  if Lista.Count > 999 then
    Gerador.wAlerta('', 'outrasReceitas', 'Lista de Outras Receitas', ERR_MSG_MAIOR_MAXIMO + '99');
end;

procedure TevtEspDesportivo.GerarTotal(Item: TreceitaTotal);
begin
  Gerador.wGrupo('receitaTotal');

  Gerador.wCampo(tcDe2, '', 'vlrReceitaTotal',  1, 14, 1, Item.vlrReceitaTotal);
  Gerador.wCampo(tcDe2, '', 'vlrCP',            1, 14, 1, Item.vlrCP);
  Gerador.wCampo(tcDe2, '', 'vlrCPSuspTotal',   1, 14, 0, Item.vlrCPSuspTotal);
  Gerador.wCampo(tcDe2, '', 'vlrReceitaClubes', 1, 14, 1, Item.vlrReceitaClubes);
  Gerador.wCampo(tcDe2, '', 'vlrRetParc',       1, 14, 1, Item.vlrRetParc);

  GerarinfoProc(item.infoProc);

  Gerador.wGrupo('/receitaTotal');
end;

procedure TevtEspDesportivo.GerarinfoProc(Lista: TinfoProcCollection);
var
  item: TinfoProcCollectionItem;
  i: Integer;
begin
  for i := 0 to Lista.Count - 1 do
  begin
    Item := Lista.Items[i];

    Gerador.wGrupo('infoProc');

    Gerador.wCampo(tcStr, '', 'tpProc',    1,  1, 1, TpProcToStr( item.tpProc ));
    Gerador.wCampo(tcStr, '', 'nrProc',    1, 21, 1, item.nrProc);
    Gerador.wCampo(tcStr, '', 'codSusp',   1, 14, 0, item.codSusp);
    Gerador.wCampo(tcDe2, '', 'vlrCPSusp', 1, 14, 1, item.vlrCPSusp);

    Gerador.wGrupo('/infoProc');
  end;

  if Lista.Count > 50 then
    Gerador.wAlerta('', 'infoProc', 'Lista de Informa��es de Processos', ERR_MSG_MAIOR_MAXIMO + '50');
end;

function TevtEspDesportivo.GerarXML: Boolean;
begin
  try
    Self.VersaoDF := TACBrReinf(FACBrReinf).Configuracoes.Geral.VersaoDF;

    Self.Id := GerarChaveReinf(now, self.ideContri.NrInsc, self.Sequencial);

    GerarCabecalho('evtEspDesportivo');
    Gerador.wGrupo('evtEspDesportivo id="' + Self.Id + '"');

    GerarIdeEvento3(Self.IdeEvento);

    Gerador.wGrupo('ideContri');

    GerarideContri(Self.ideContri, False);
    GerarideEstab(Self.ideEstab);

    Gerador.wGrupo('/ideContri');

    Gerador.wGrupo('/evtEspDesportivo');

    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtEspDesportivo');

    Validar(schevtEspDesportivo);
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '');
end;

function TevtEspDesportivo.LerArqIni(const AIniString: String): Boolean;
var
  INIRec: TMemIniFile;
  Ok: Boolean;
  sSecao, sFim: String;
  I, J, K: Integer;
begin
  Result := False;

  INIRec := TMemIniFile.Create('');
  try
    LerIniArquivoOuString(AIniString, INIRec);

    with Self do
    begin
      sSecao := 'evtEspDesportivo';
      Id         := INIRec.ReadString(sSecao, 'Id', '');
      Sequencial := INIRec.ReadInteger(sSecao, 'Sequencial', 0);

      sSecao := 'ideEvento';
      ideEvento.indRetif   := StrToIndRetificacao(Ok, INIRec.ReadString(sSecao, 'indRetif', '1'));
      ideEvento.NrRecibo   := INIRec.ReadString(sSecao, 'nrRecibo', EmptyStr);
      ideEvento.dtApuracao := StringToDateTime(INIRec.ReadString(sSecao, 'dtApuracao', '0'));
      ideEvento.TpAmb      := StrTotpAmbReinf(Ok, INIRec.ReadString(sSecao, 'tpAmb', '1'));
      ideEvento.ProcEmi    := StrToProcEmiReinf(Ok, INIRec.ReadString(sSecao, 'procEmi', '1'));
      ideEvento.VerProc    := INIRec.ReadString(sSecao, 'verProc', EmptyStr);

      sSecao := 'ideContri';
      ideContri.OrgaoPublico := (TACBrReinf(FACBrReinf).Configuracoes.Geral.TipoContribuinte = tcOrgaoPublico);
      ideContri.TpInsc       := StrToTpInscricao(Ok, INIRec.ReadString(sSecao, 'tpInsc', '1'));
      ideContri.NrInsc       := INIRec.ReadString(sSecao, 'nrInsc', EmptyStr);

      I := 1;
      while true do
      begin
        // de 01 at� 25
        sSecao := 'ideEstab' + IntToStrZero(I, 2);
        sFim   := INIRec.ReadString(sSecao, 'tpInscEstab', 'FIM');

        if (sFim = 'FIM') or (Length(sFim) <= 0) then
          break;

        with ideEstab.Add do
        begin
          tpInscEstab := StrToTpInscricao(Ok, sFim);
          nrInscEstab := INIRec.ReadString(sSecao, 'nrInscEstab', '');

          J := 1;
          while true do
          begin
            // de 001 at� 999
            sSecao := 'boletim' + IntToStrZero(I, 2) + IntToStrZero(J, 3);
            sFim   := INIRec.ReadString(sSecao, 'nrBoletim', 'FIM');

            if (sFim = 'FIM') or (Length(sFim) <= 0) then
              break;

            with boletim.Add do
            begin
              nrBoletim       := sFim;
              tpCompeticao    := StrTotpCompeticao(Ok, INIRec.ReadString(sSecao, 'tpCompeticao', '1'));
              categEvento     := StrTocategEvento(Ok, INIRec.ReadString(sSecao, 'vlrAjuste', '1'));
              modDesportiva   := INIRec.ReadString(sSecao, 'modDesportiva', '');
              nomeCompeticao  := INIRec.ReadString(sSecao, 'nomeCompeticao', '');
              cnpjMandante    := INIRec.ReadString(sSecao, 'cnpjMandante', '');
              cnpjVisitante   := INIRec.ReadString(sSecao, 'cnpjVisitante', '');
              nomeVisitante   := INIRec.ReadString(sSecao, 'nomeVisitante', '');
              pracaDesportiva := INIRec.ReadString(sSecao, 'pracaDesportiva', '');
              codMunic        := INIRec.ReadInteger(sSecao, 'codMunic', 0);
              uf              := INIRec.ReadString(sSecao, 'uf', 'SP');
              qtdePagantes    := INIRec.ReadInteger(sSecao, 'qtdePagantes', 0);
              qtdeNaoPagantes := INIRec.ReadInteger(sSecao, 'qtdeNaoPagantes', 0);

              k := 1;
              while true do
              begin
                // de 001 at� 999
                sSecao := 'receitaIngressos' + IntToStrZero(I, 2) +
                                     IntToStrZero(J, 3) + IntToStrZero(K, 3);
                sFim   := INIRec.ReadString(sSecao, 'tpIngresso', 'FIM');

                if (sFim = 'FIM') or (Length(sFim) <= 0) then
                  break;

                with receitaIngressos.Add do
                begin
                  tpIngresso       := StrTotpIngresso(Ok, sFim);
                  descIngr         := INIRec.ReadString(sSecao, 'descIngr', '');
                  qtdeIngrVenda    := INIRec.ReadInteger(sSecao, 'qtdeIngrVenda', 0);
                  qtdeIngrVendidos := INIRec.ReadInteger(sSecao, 'qtdeIngrVendidos', 0);
                  qtdeIngrDev      := INIRec.ReadInteger(sSecao, 'qtdeIngrDev', 0);
                  precoIndiv       := StringToFloatDef(INIRec.ReadString(sSecao, 'precoIndiv', ''), 0);
                  vlrTotal         := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrTotal', ''), 0);
                end;

                Inc(K);
              end;

              k := 1;
              while true do
              begin
                // de 000 at� 999
                sSecao := 'outrasReceitas' + IntToStrZero(I, 2) +
                                     IntToStrZero(J, 3) + IntToStrZero(K, 3);
                sFim   := INIRec.ReadString(sSecao, 'tpReceita', 'FIM');

                if (sFim = 'FIM') or (Length(sFim) <= 0) then
                  break;

                with outrasReceitas.Add do
                begin
                  tpReceita   := StrTotpReceita(Ok, sFim);
                  vlrReceita  := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrReceita', ''), 0);
                  descReceita := INIRec.ReadString(sSecao, 'descReceita', '');
                end;

                Inc(K);
              end;
            end;

            Inc(J);
          end;

          with receitaTotal do
          begin
            sSecao := 'receitaTotal' + IntToStrZero(I, 2);
            vlrReceitaTotal  := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrReceitaTotal', ''), 0);
            vlrCP            := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrCP', ''), 0);
            vlrCPSuspTotal   := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrCPSuspTotal', ''), 0);
            vlrReceitaClubes := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrReceitaClubes', ''), 0);
            vlrRetParc       := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrRetParc', ''), 0);

            J := 1;
            while true do
            begin
              // de 00 at� 50
              sSecao := 'infoProc' + IntToStrZero(I, 2) + IntToStrZero(J, 2);
              sFim   := INIRec.ReadString(sSecao, 'tpProc', 'FIM');

              if (sFim = 'FIM') or (Length(sFim) <= 0) then
                break;

              with infoProc.Add do
              begin
                tpProc    := StrToTpProc(Ok, sFim);
                nrProc    := INIRec.ReadString(sSecao, 'nrProc', '');
                codSusp   := INIRec.ReadString(sSecao, 'codSusp', '');
                vlrCPSusp := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrCPSusp', ''), 0);
              end;

              Inc(J);
            end;
          end;
        end;

        Inc(I);
      end;
    end;

    GerarXML;

    Result := True;
  finally
     INIRec.Free;
  end;
end;

end.
