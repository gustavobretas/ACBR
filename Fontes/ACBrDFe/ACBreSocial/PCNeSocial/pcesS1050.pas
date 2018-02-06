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
******************************************************************************}
{$I ACBr.inc}

unit pcesS1050;

interface

uses
  SysUtils, Classes,
  pcnConversao, pcnGerador,
  pcesCommon, pcesConversaoeSocial, pcesGerador;


type
  TS1050Collection = class;
  TS1050CollectionItem = class;
  TEvtTabHorTur = class;
  TideHorContratual = class;
  TDadosHorContratual = class;
  TInfoHorContratual = class;

  TS1050Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1050CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1050CollectionItem);
  public
    function Add: TS1050CollectionItem;
    property Items[Index: Integer]: TS1050CollectionItem read GetItem write SetItem; default;
  end;

  TS1050CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtTabHorContratual: TEvtTabHorTur;
    procedure setEvtTabHorContratual(const Value: TEvtTabHorTur);
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtTabHorContratual: TEvtTabHorTur read FEvtTabHorContratual write setEvtTabHorContratual;
  end;

  TEvtTabHorTur = class(TESocialEvento)
  private
    FModoLancamento: TModoLancamento;
    fIdeEvento: TIdeEvento;
    fIdeEmpregador: TIdeEmpregador;
    fInfoHorContratual: TInfoHorContratual;

    {Geradores espec�ficos da classe}
    procedure GerarDadosHorContratual;
    procedure GerarHorarioIntervalo;
    procedure GerarIdeHorContratual;
  public
    constructor Create(AACBreSocial: TObject); overload;
    destructor  Destroy; override;

    function GerarXML(ATipoEmpregador: TEmpregador): boolean; override;

    property ModoLancamento: TModoLancamento read FModoLancamento write FModoLancamento;
    property IdeEvento: TIdeEvento read fIdeEvento write fIdeEvento;
    property IdeEmpregador: TIdeEmpregador read fIdeEmpregador write fIdeEmpregador;
    property InfoHorContratual: TInfoHorContratual read fInfoHorContratual write fInfoHorContratual;
  end;

  TideHorContratual = class(TPersistent)
  private
    FCodHorContrat: string;
    FIniValid: string;
    FFimValid: string;
  public
    property codHorContrat: string read FCodHorContrat write FCodHorContrat;
    property iniValid: string read FIniValid write FIniValid;
    property fimValid: string read FFimValid write FFimValid;
  end;

  TDadosHorContratual = class(TPersistent)
  private
    FHrEntr: string;
    FHrSaida: string;
    FDurJornada: integer;
    FPerHorFlexivel: tpSimNao;
    FHorarioIntervalo: THorarioIntervaloCollection;
  public
    constructor create;
    destructor destroy; override;

    property hrEntr: string read FHrEntr write FHrEntr;
    property hrSaida: string read FHrSaida write FHrSaida;
    property durJornada: integer read FDurJornada write FDurJornada;
    property perHorFlexivel: tpSimNao read FPerHorFlexivel write FPerHorFlexivel;
    property horarioIntervalo: THorarioIntervaloCollection read FHorarioIntervalo write FHorarioIntervalo;
  end;

  TInfoHorContratual = class(TPersistent)
  private
    fideHorContratual: TideHorContratual;
    fdadosHorContratual: TdadosHorContratual;
    fnovaValidade : TIdePeriodo;

    function getDadosHorContratual: TdadosHorContratual;
    function getNovaValidade: TIdePeriodo;
  public
    constructor create;
    destructor destroy; override;

    function dadosHorContratualInst(): Boolean;
    function novaValidadeInst(): Boolean;

    property ideHorContratual: TideHorContratual read fideHorContratual write fideHorContratual;
    property dadosHorContratual: TdadosHorContratual read getDadosHorContratual write fdadosHorContratual;
    property novaValidade: TIdePeriodo read getNovaValidade write fnovaValidade;
  end;

implementation

{ TS1050Collection }

function TS1050Collection.Add: TS1050CollectionItem;
begin
  Result := TS1050CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1050Collection.GetItem(Index: Integer): TS1050CollectionItem;
begin
  Result := TS1050CollectionItem(inherited GetItem(Index));
end;

procedure TS1050Collection.SetItem(Index: Integer;
  Value: TS1050CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TS1050CollectionItem }

constructor TS1050CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1050;
  FEvtTabHorContratual := TEvtTabHorTur.Create(AOwner);
end;

destructor TS1050CollectionItem.Destroy;
begin
  FEvtTabHorContratual.Free;

  inherited;
end;

procedure TS1050CollectionItem.setEvtTabHorContratual(
  const Value: TEvtTabHorTur);
begin
  FEvtTabHorContratual.Assign(Value);
end;

{ TdadosHorContratual }

constructor TdadosHorContratual.create;
begin
  FHorarioIntervalo := THorarioIntervaloCollection.Create;
end;

destructor TdadosHorContratual.destroy;
begin
  FHorarioIntervalo.Free;

  inherited;
end;

{ TInfoHorContratual }

constructor TInfoHorContratual.create;
begin
  fideHorContratual := TideHorContratual.Create;
  fdadosHorContratual := nil;
  fnovaValidade := nil;
end;

function TInfoHorContratual.dadosHorContratualInst: Boolean;
begin
  Result := Assigned(fdadosHorContratual);
end;

destructor TInfoHorContratual.destroy;
begin
  fideHorContratual.Free;
  FreeAndNil(fdadosHorContratual);
  FreeAndNil(fnovaValidade);

  inherited;
end;

function TInfoHorContratual.getDadosHorContratual: TdadosHorContratual;
begin
  if Not(Assigned(fdadosHorContratual)) then
    fdadosHorContratual := TDadosHorContratual.create;
  Result := fdadosHorContratual;
end;

function TInfoHorContratual.getNovaValidade: TIdePeriodo;
begin
  if Not(Assigned(fnovaValidade)) then
    fnovaValidade := TIdePeriodo.Create;
  Result := fnovaValidade;
end;

function TInfoHorContratual.novaValidadeInst: Boolean;
begin
  Result := Assigned(fnovaValidade);
end;

{ TEvtTabHorContratual }

constructor TEvtTabHorTur.Create(AACBreSocial: TObject);
begin
  inherited;

  fIdeEvento := TIdeEvento.Create;
  fIdeEmpregador := TIdeEmpregador.Create;
  fInfoHorContratual := TInfoHorContratual.Create;
end;

destructor TEvtTabHorTur.Destroy;
begin
  fIdeEvento.Free;
  fIdeEmpregador.Free;
  fInfoHorContratual.Free;

  inherited;
end;

procedure TEvtTabHorTur.GerarDadosHorContratual;
begin
  Gerador.wGrupo('dadosHorContratual');

  Gerador.wCampo(tcStr, '', 'hrEntr',         4, 4, 1, self.InfoHorContratual.dadosHorContratual.hrEntr);
  Gerador.wCampo(tcStr, '', 'hrSaida',        4, 4, 1, self.InfoHorContratual.dadosHorContratual.hrSaida);
  Gerador.wCampo(tcStr, '', 'durJornada',     1, 4, 1, self.InfoHorContratual.dadosHorContratual.durJornada);
  Gerador.wCampo(tcStr, '', 'perHorFlexivel', 1, 1, 1, eSSimNaoToStr(self.InfoHorContratual.dadosHorContratual.perHorFlexivel));

  GerarHorarioIntervalo;

  Gerador.wGrupo('/dadosHorContratual');
end;


procedure TEvtTabHorTur.GerarHorarioIntervalo;
var
  i: Integer;
  objHorarioIntervalo: THorarioIntervaloCollectionItem;
begin
  for i := 0 to InfoHorContratual.dadosHorContratual.horarioIntervalo.Count - 1 do
  begin
    objHorarioIntervalo := InfoHorContratual.dadosHorContratual.horarioIntervalo.Items[i];

    Gerador.wGrupo('horarioIntervalo');

    Gerador.wCampo(tcStr, '', 'tpInterv',  1, 1, 1, eSTpIntervaloToStr(objHorarioIntervalo.tpInterv));
    Gerador.wCampo(tcStr, '', 'durInterv', 1, 3, 1, objHorarioIntervalo.durInterv);

    if (objHorarioIntervalo.tpInterv = tinHorarioFixo) then
    begin
      Gerador.wCampo(tcStr, '', 'iniInterv',  4, 4, 1, objHorarioIntervalo.iniInterv);
      Gerador.wCampo(tcStr, '', 'termInterv', 4, 4, 1, objHorarioIntervalo.termInterv);
    end;

    Gerador.wGrupo('/horarioIntervalo');
  end;

  if InfoHorContratual.dadosHorContratual.horarioIntervalo.Count > 99 then
    Gerador.wAlerta('', 'horarioIntervalo', 'Lista de Hor�rio de Intervalo', ERR_MSG_MAIOR_MAXIMO + '99');
end;

procedure TEvtTabHorTur.GerarIdeHorContratual;
begin
  Gerador.wGrupo('ideHorContratual');

  Gerador.wCampo(tcStr, '', 'codHorContrat', 1, 30, 1, InfoHorContratual.ideHorContratual.codHorContrat);
  Gerador.wCampo(tcStr, '', 'iniValid',      7,  7, 1, InfoHorContratual.ideHorContratual.iniValid);
  Gerador.wCampo(tcStr, '', 'fimValid',      7,  7, 0, InfoHorContratual.ideHorContratual.fimValid);

  Gerador.wGrupo('/ideHorContratual');
end;

function TEvtTabHorTur.GerarXML(ATipoEmpregador: TEmpregador): boolean;
begin
  try
    Self.Id := GerarChaveEsocial(now, self.ideEmpregador.NrInsc,
     self.Sequencial, ATipoEmpregador);

    GerarCabecalho('evtTabHorTur');
    Gerador.wGrupo('evtTabHorTur Id="' + Self.Id + '"');

    GerarIdeEvento(self.IdeEvento);
    GerarIdeEmpregador(self.IdeEmpregador);

    Gerador.wGrupo('infoHorContratual');

    GerarModoAbertura(Self.ModoLancamento);
    GerarIdeHorContratual;

    if Self.ModoLancamento <> mlExclusao then
    begin
      GerarDadosHorContratual;

      if Self.ModoLancamento = mlAlteracao then
        if (InfoHorContratual.novaValidadeInst()) then
          GerarIdePeriodo(self.InfoHorContratual.novaValidade, 'novaValidade');
    end;

    GerarModoFechamento(Self.ModoLancamento);

    Gerador.wGrupo('/infoHorContratual');
    Gerador.wGrupo('/evtTabHorTur');

    GerarRodape;

    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtTabHorTur');

    Validar('evtTabHorTur');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '') 
end;

end.
 
