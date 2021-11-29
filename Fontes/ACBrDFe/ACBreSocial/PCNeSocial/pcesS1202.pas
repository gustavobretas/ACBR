{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Italo Jurisato Junior                           }
{                              Jean Carlo Cantu                                }
{                              Tiago Ravache                                   }
{                              Guilherme Costa                                 }
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
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doa��o do componente para o Projeto ACBr
|* 28/08/2017: Leivio Fontenele - leivio@yahoo.com.br
|*  - Implementa��o comunica��o, envelope, status e retorno do componente com webservice.
******************************************************************************}

{$I ACBr.inc}

unit pcesS1202;

interface

uses
  SysUtils, Classes, Dialogs, Controls,
  {$IF DEFINED(HAS_SYSTEM_GENERICS)}
   System.Generics.Collections, System.Generics.Defaults,
  {$ELSEIF DEFINED(DELPHICOMPILER16_UP)}
   System.Contnrs,
  {$IfEnd}
  ACBrBase,
  pcnConversao, pcnGerador, ACBrUtil, pcnConsts,
  pcesCommon, pcesConversaoeSocial, pcesGerador;

type

  TEvtRmnRPPS = class;
  TeS1202IdeTrabalhador = class;
  TInfoComplem = class;
  TSucessaoVinc3 = class;
  TDMDevCollection = class;
  TDMDevCollectionItem = class;
  TInfoPerApur = class;
  TIdeEstabCollection = class;
  TIdeEstabCollectionItem = class;
  TRemunPerApur1202Collection = class;
  TS1202CollectionItem = class;
  TInfoPerAnt = class;
  TIdePeriodoCollection = class;
  TIdePeriodoCollectionItem = class;

  TS1202Collection = class(TeSocialCollection)
  private
    function GetItem(Index: integer): TS1202CollectionItem;
    procedure SetItem(Index: integer; Value: TS1202CollectionItem);
  public
    function Add: TS1202CollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TS1202CollectionItem;
    property Items[Index: integer]: TS1202CollectionItem read GetItem write SetItem;
      default;
  end;

  TS1202CollectionItem = class(TObject)
  private
    FTipoEvento: TTipoEvento;
    FEvtRmnRPPS: TEvtRmnRPPS;
  public
    constructor Create(AOwner: TComponent);
    destructor Destroy; override;
    property TipoEvento: TTipoEvento read FTipoEvento;
    property evtRmnRPPS: TEvtRmnRPPS read FEvtRmnRPPS write FEvtRmnRPPS;
  end;

  TDMDevCollection = class(TACBrObjectList)
  private
    function GetItem(Index: integer): TDMDevCollectionItem;
    procedure SetItem(Index: integer; Value: TDMDevCollectionItem);
  public
    function Add: TDMDevCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TDMDevCollectionItem;
    property Items[Index: integer]: TDMDevCollectionItem read GetItem write SetItem;
      default;
  end;

  TDMDevCollectionItem = class(TObject)
  private
    FIdeDmDev: string;
    FCodCateg: integer;
    FInfoPerApur: TInfoPerApur;
    FInfoPerAnt: TInfoPerAnt;

    function getInfoPerApur(): TInfoPerApur;
    function getInfoPerAnt(): TInfoPerAnt;
  public
    constructor Create;
    destructor Destroy; override;

    function infoPerApurInst(): boolean;
    function infoPerAntInst(): boolean;

    property codCateg: integer read FCodCateg write FCodCateg;
    property ideDmDev: string read FIdeDmDev write FIdeDmDev;
    property infoPerApur: TInfoPerApur read getInfoPerApur write FInfoPerApur;
    property infoPerAnt: TInfoPerAnt read getInfoPerAnt write FInfoPerAnt;
  end;

  TEvtRmnRPPS = class(TeSocialEvento)
  private
    FIdeEvento: TIdeEvento3;
    FIdeEmpregador: TIdeEmpregador;
    FIdeTrabalhador: TeS1202IdeTrabalhador;
    FDMDev: TDMDevCollection;

    { Geradores espec�ficos desta classe }
    procedure GerarIdeEstab(objIdeEstab: TIdeEstabCollection;
      const nomeRemunPer: string = 'remunPerApur');
    procedure GerarRemunPer(objRemunPer: TRemunPerApur1202Collection;
      const nomeRemunPer: string = 'remunPerApur');
    procedure GerarIdePeriodo(objIdePeriodo: TIdePeriodoCollection);

    procedure GerarIdeTrabalhador;
    procedure GerarDmDev;
    procedure GerarInfoPerApur(pInfoPerApur: TInfoPerApur);
    procedure GerarInfoPerAnt(pInfoPerAnt: TInfoPerAnt);
    procedure GerarInfoComplem(pInfoComplem: TInfoComplem);
  public
    constructor Create(AACBreSocial: TObject); override;
    destructor Destroy; override;

    function GerarXML: boolean; override;
    function LerArqIni(const AIniString: String): Boolean;

    property ideEvento: TIdeEvento3 read FIdeEvento write FIdeEvento;
    property ideEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property ideTrabalhador: TeS1202IdeTrabalhador read FIdeTrabalhador write FIdeTrabalhador;
    property dmDev: TDMDevCollection read FDMDev write FDMDev;
  end;

  TRemunPerApur1202Collection = class(TACBrObjectList)
  private
    function GetItem(Index: integer): TRemunPerCollectionItem;
    procedure SetItem(Index: integer; Value: TRemunPerCollectionItem);
  public
    function Add: TRemunPerCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TRemunPerCollectionItem;
    property Items[Index: integer]: TRemunPerCollectionItem read GetItem write SetItem;
  end;

  TIdeEstabCollection = class(TACBrObjectList)
  private
    function GetItem(Index: integer): TIdeEstabCollectionItem;
    procedure SetItem(Index: integer; Value: TIdeEstabCollectionItem);
  public
    function Add: TIdeEstabCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TIdeEstabCollectionItem;
    property Items[Index: integer]: TIdeEstabCollectionItem read GetItem write SetItem;
  end;

  TIdeEstabCollectionItem = class(TObject)
  private
    FTpInsc: TpTpInsc;
    FNrInsc: string;
    FRemunPerApur: TRemunPerApur1202Collection;
    FRemunPerAnt: TRemunPerApur1202Collection;
  public
    constructor Create;
    destructor Destroy; override;

    property tpInsc: TpTPInsc read FTpInsc write FTpInsc;
    property nrInsc: string read FNrInsc write FNrInsc;
    property remunPerApur: TRemunPerApur1202Collection read FRemunPerApur write FRemunPerApur;
    property remunPerAnt: TRemunPerApur1202Collection read FRemunPerAnt write FRemunPerAnt;
  end;

  TIdePeriodoCollection = class(TACBrObjectList)
  private
    function GetItem(Index: integer): TIdePeriodoCollectionItem;
    procedure SetItem(Index: integer; Value: TIdePeriodoCollectionItem);
  public
    function Add: TIdePeriodoCollectionItem; overload; deprecated {$IfDef SUPPORTS_DEPRECATED_DETAILS} 'Obsoleta: Use a fun��o New'{$EndIf};
    function New: TIdePeriodoCollectionItem;
    property Items[Index: integer]: TIdePeriodoCollectionItem read GetItem write SetItem;
  end;

  TIdePeriodoCollectionItem = class(TObject)
  private
    FPerRef: string;
    FIdeEstab: TIdeEstabCollection;
  public
    constructor Create;
    destructor Destroy; override;

    property perRef: string read FPerRef write FPerRef;
    property ideEstab: TIdeEstabCollection read FIdeEstab write FIdeEstab;
  end;

  TInfoPerAnt = class(TObject)
  private
    FremunOrgSuc: tpSimNao;
    FIdePeriodo: TIdePeriodoCollection;
  public
    constructor Create;
    destructor Destroy; override;

    property remunOrgSuc: tpSimNao read FremunOrgSuc write FremunOrgSuc;
    property idePeriodo: TIdePeriodoCollection read FIdePeriodo write FIdePeriodo;
  end;

  TInfoPerApur = class(TObject)
  private
    FIdeEstab: TIdeEstabCollection;
  public
    constructor Create;
    destructor Destroy; override;

    property ideEstab: TIdeEstabCollection read FIdeEstab write FIdeEstab;
  end;

  TeS1202IdeTrabalhador = class(TideTrabalhador)
  private
    FInfoComplem: TInfoComplem;

    function getInfoComplem(): TInfoComplem;
  public
    constructor Create;
    destructor Destroy; override;

    function InfoComplemInst(): boolean;

    property InfoComplem: TInfoComplem read getInfoComplem write FInfoComplem;
  end;

  TInfoComplem = class(TObject)
  private
    FNmTrab: string;
    FDtNascto: TDateTime;
    FSucessaoVinc: TSucessaoVinc3;

    function getSucessaoVinc(): TSucessaoVinc3;
  public
    constructor Create;
    destructor Destroy; override;

    function SucessaoVincInst(): boolean;

    property nmTrab: string read FNmTrab write FNmTrab;
    property dtNascto: TDateTime read FDtNascto write FDtNascto;
    property sucessaoVinc: TSucessaoVinc3 read getSucessaoVinc write FSucessaoVinc;
  end;

  TSucessaoVinc3 = class
  private
    FcnpjOrgaoAnt: string;
    FmatricAnt: string;
    FdtExercicio: TDateTime;
    Fobservacao: string;
  public
    property cnpjOrgaoAnt: string read FcnpjOrgaoAnt write FcnpjOrgaoAnt;
    property matricAnt: string read FmatricAnt write FmatricAnt;
    property dtExercicio: TDateTime read FdtExercicio write FdtExercicio;
    property observacao: string read Fobservacao write Fobservacao;
  end;

implementation

uses
  IniFiles,
  ACBreSocial;

{ TRemunPerApur1202Collection }

function TRemunPerApur1202Collection.Add: TRemunPerCollectionItem;
begin
  Result := Self.New;
end;

function TRemunPerApur1202Collection.GetItem(Index: integer): TRemunPerCollectionItem;
begin
  Result := TRemunPerCollectionItem(inherited Items[Index]);
end;

procedure TRemunPerApur1202Collection.SetItem(Index: integer; Value: TRemunPerCollectionItem);
begin
  inherited Items[Index] := Value;
end;

function TRemunPerApur1202Collection.New: TRemunPerCollectionItem;
begin
  Result := TRemunPerCollectionItem.Create;
  Self.Add(Result);
end;

{ TIdeEstabCollectionItem }

constructor TIdeEstabCollectionItem.Create;
begin
  inherited Create;

  FRemunPerApur := TRemunPerApur1202Collection.Create;
  FRemunPerAnt  := TRemunPerApur1202Collection.Create;
end;

destructor TIdeEstabCollectionItem.Destroy;
begin
  FRemunPerApur.Free;
  FRemunPerAnt.Free;

  inherited;
end;

{ TIdeEstabCollection }

function TIdeEstabCollection.Add: TIdeEstabCollectionItem;
begin
  Result := Self.New;
end;

function TIdeEstabCollection.GetItem(Index: integer): TIdeEstabCollectionItem;
begin
  Result := TIdeEstabCollectionItem(inherited Items[Index]);
end;

procedure TIdeEstabCollection.SetItem(Index: integer;
  Value: TIdeEstabCollectionItem);
begin
  inherited Items[Index] := Value;
end;

function TIdeEstabCollection.New: TIdeEstabCollectionItem;
begin
  Result := TIdeEstabCollectionItem.Create;
  Self.Add(Result);
end;

{ TIdePeriodoCollectionItem }

constructor TIdePeriodoCollectionItem.Create;
begin
  inherited Create;
  FIdeEstab := TIdeEstabCollection.Create;
end;

destructor TIdePeriodoCollectionItem.Destroy;
begin
  FIdeEstab.Free;

  inherited;
end;

{ TIdePeriodoCollection }

function TIdePeriodoCollection.Add: TIdePeriodoCollectionItem;
begin
  Result := Self.New;
end;

function TIdePeriodoCollection.GetItem(Index: integer): TIdePeriodoCollectionItem;
begin
  Result := TIdePeriodoCollectionItem(inherited Items[Index]);
end;

procedure TIdePeriodoCollection.SetItem(Index: integer;
  Value: TIdePeriodoCollectionItem);
begin
  inherited Items[Index] := Value;
end;

function TIdePeriodoCollection.New: TIdePeriodoCollectionItem;
begin
  Result := TIdePeriodoCollectionItem.Create;
  Self.Add(Result);
end;

{ TInfoPerAnt }

constructor TInfoPerAnt.Create;
begin
  inherited;

  FIdePeriodo := TIdePeriodoCollection.Create;
end;

destructor TInfoPerAnt.Destroy;
begin
  FreeAndNil(FIdePeriodo);

  inherited;
end;

{ TInfoPerApur }

constructor TInfoPerApur.Create;
begin
  inherited;

  FIdeEstab := TIdeEstabCollection.Create;
end;

destructor TInfoPerApur.Destroy;
begin
  FIdeEstab.Free;

  inherited;
end;

{ TideTrabalhador }

constructor TeS1202IdeTrabalhador.Create;
begin
  inherited Create;

  FInfoComplem := nil;
end;

destructor TeS1202IdeTrabalhador.Destroy;
begin
  FreeAndNil(FInfoComplem);

  inherited;
end;

function TeS1202IdeTrabalhador.getInfoComplem: TInfoComplem;
begin
  if not (Assigned(FInfoComplem)) then
    FInfoComplem := TInfoComplem.Create;
  Result := FInfoComplem;
end;

function TeS1202IdeTrabalhador.InfoComplemInst(): boolean;
begin
  Result := Assigned(FInfoComplem);
end;

{ TinfoComplem }

constructor TinfoComplem.Create;
begin
  inherited Create;

  FSucessaoVinc := nil;
end;

destructor TinfoComplem.Destroy;
begin
  FreeAndNil(FSucessaoVinc);

  inherited;
end;

function TinfoComplem.getSucessaoVinc: TSucessaoVinc3;
begin
  if not (Assigned(FSucessaoVinc)) then
    FSucessaoVinc := TSucessaoVinc3.Create;
  Result := FSucessaoVinc;
end;

function TinfoComplem.SucessaoVincInst(): boolean;
begin
  Result := Assigned(FSucessaoVinc);
end;

{ TDMDevCollection }

function TDMDevCollection.Add: TDMDevCollectionItem;
begin
  Result := Self.New;
end;

function TDMDevCollection.GetItem(Index: integer): TDMDevCollectionItem;
begin
  Result := TDMDevCollectionItem(inherited Items[Index]);
end;

procedure TDMDevCollection.SetItem(Index: integer; Value: TDMDevCollectionItem);
begin
  inherited Items[Index] := Value;
end;

function TDMDevCollection.New: TDMDevCollectionItem;
begin
  Result := TDMDevCollectionItem.Create;
  Self.Add(Result);
end;

{ TDMDevCollectionItem }

constructor TDMDevCollectionItem.Create;
begin
  inherited Create;
  FInfoPerApur := nil;
  FInfoPerAnt  := nil;
end;

destructor TDMDevCollectionItem.Destroy;
begin
  FreeAndNil(FInfoPerApur);
  FreeAndNil(FInfoPerAnt);

  inherited;
end;

function TDMDevCollectionItem.getInfoPerApur: TInfoPerApur;
begin
  if not (Assigned(FInfoPerApur)) then
    FInfoPerApur := TInfoPerApur.Create;
  Result := FInfoPerApur;
end;

function TDMDevCollectionItem.infoPerApurInst: boolean;
begin
  Result := Assigned(FInfoPerApur);
end;

function TDMDevCollectionItem.getInfoPerAnt: TInfoPerAnt;
begin
  if not (Assigned(FInfoPerAnt)) then
    FInfoPerAnt := TInfoPerAnt.Create;
  Result := FInfoPerAnt;
end;

function TDMDevCollectionItem.infoPerAntInst: boolean;
begin
  Result := Assigned(FInfoPerAnt);
end;

{ TEvtRmnRPPS }

constructor TEvtRmnRPPS.Create(AACBreSocial: TObject);
begin
  inherited Create(AACBreSocial);

  FIdeEvento      := TIdeEvento3.Create;
  FIdeEmpregador  := TIdeEmpregador.Create;
  FIdeTrabalhador := TeS1202IdeTrabalhador.Create;
  FDMDev          := TDMDevCollection.Create;
end;

destructor TEvtRmnRPPS.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeTrabalhador.Free;
  FDMDev.Free;

  inherited;
end;

procedure TEvtRmnRPPS.GerarIdeEstab(objIdeEstab: TIdeEstabCollection;
  const nomeRemunPer: string = 'remunPerApur');
var
  i: integer;
begin
  for i := 0 to objIdeEstab.Count - 1 do
  begin
    Gerador.wGrupo('ideEstab');

    Gerador.wCampo(tcInt, '', 'tpInsc', 1,  1, 1, eSTpInscricaoToStr(objIdeEstab.Items[i].tpInsc));
    Gerador.wCampo(tcStr, '', 'nrInsc', 1, 15, 1, objIdeEstab.Items[i].nrInsc);

    if nomeRemunPer = 'remunPerApur' then
      GerarRemunPer(objIdeEstab.Items[i].remunPerApur, nomeRemunPer)
    else
      GerarRemunPer(objIdeEstab.Items[i].remunPerAnt, nomeRemunPer);

    Gerador.wGrupo('/ideEstab');
  end;

  if objIdeEstab.Count > 24 then
    Gerador.wAlerta('', 'ideEstab', 'Lista de ' + nomeRemunPer, ERR_MSG_MAIOR_MAXIMO + '24');
end;

procedure TEvtRmnRPPS.GerarIdePeriodo(objIdePeriodo: TIdePeriodoCollection);
var
  i: integer;
begin
  for i := 0 to objIdePeriodo.Count - 1 do
  begin
    Gerador.wGrupo('idePeriodo');
    Gerador.wCampo(tcStr, '', 'perRef', 7, 7, 1, objIdePeriodo.Items[i].perRef);

    GerarIdeEstab(objIdePeriodo.Items[i].ideEstab, 'remunPerAnt');

    Gerador.wGrupo('/idePeriodo');
  end;

  if objIdePeriodo.Count > 200 then
    Gerador.wAlerta('', 'idePeriodo', 'Lista de Periodos', ERR_MSG_MAIOR_MAXIMO + '200');
end;

procedure TEvtRmnRPPS.GerarIdeTrabalhador;
begin
  Gerador.wGrupo('ideTrabalhador');

  Gerador.wCampo(tcStr, '', 'cpfTrab',  11, 11, 1, ideTrabalhador.cpfTrab);

  if ideTrabalhador.InfoComplemInst() then
    GerarInfoComplem(ideTrabalhador.InfoComplem);

  Gerador.wGrupo('/ideTrabalhador');
end;

procedure TEvtRmnRPPS.GerarInfoComplem(pInfoComplem: TInfoComplem);
begin
  if pInfoComplem.nmTrab <> EmptyStr then
  begin
    Gerador.wGrupo('infoComplem');

    Gerador.wCampo(tcStr, '', 'nmTrab',    2, 70, 1, pInfoComplem.nmTrab);
    Gerador.wCampo(tcDat, '', 'dtNascto', 10, 10, 1, pInfoComplem.dtNascto);

    if pInfoComplem.SucessaoVincInst() then
    begin
      Gerador.wGrupo('sucessaoVinc');

      Gerador.wCampo(tcStr, '', 'cnpjOrgaoAnt', 14,  14, 1, pInfoComplem.sucessaoVinc.cnpjOrgaoAnt);
      Gerador.wCampo(tcStr, '', 'matricAnt'   ,  1,  30, 0, pInfoComplem.sucessaoVinc.matricAnt);
      Gerador.wCampo(tcDat, '', 'dtExercicio' , 10,  10, 1, pInfoComplem.sucessaoVinc.dtExercicio);
      Gerador.wCampo(tcStr, '', 'observacao'  ,  1, 255, 0, pInfoComplem.sucessaoVinc.observacao);

      Gerador.wGrupo('/sucessaoVinc');
    end;

    Gerador.wGrupo('/infoComplem');
  end;
end;

procedure TEvtRmnRPPS.GerarInfoPerAnt(pInfoPerAnt: TInfoPerAnt);
begin
  Gerador.wGrupo('infoPerAnt');

  Gerador.wCampo(tcStr, '', 'remunOrgSuc', 1, 1, 1, eSSimNaoToStr(pInfoPerAnt.remunOrgSuc));

  GerarIdePeriodo(pInfoPerAnt.idePeriodo);

  Gerador.wGrupo('/infoPerAnt');
end;

procedure TEvtRmnRPPS.GerarDmDev;
var
  i: integer;
begin
  for i := 0 to dmDev.Count - 1 do
  begin
    Gerador.wGrupo('dmDev');

    Gerador.wCampo(tcStr, '', 'ideDmDev', 1, 30, 1, dmDev[i].ideDmDev);
    Gerador.wCampo(tcInt, '', 'codCateg', 1,  3, 1, dmDev[i].codCateg);

    if (dmDev[i].infoPerApurInst()) then
      GerarInfoPerApur(dmDev[i].infoPerApur);

    if (dmDev[i].infoPerAntInst()) then
      GerarInfoPerAnt(dmDev[i].infoPerAnt);

    Gerador.wGrupo('/dmDev');
  end;

  if dmDev.Count > 999 then
    Gerador.wAlerta('', 'dmDev', 'Lista de Identifica��o de Demostrativos', ERR_MSG_MAIOR_MAXIMO + '999');
end;

procedure TEvtRmnRPPS.GerarInfoPerApur(pInfoPerApur: TInfoPerApur);
begin
  Gerador.wGrupo('infoPerApur');

  GerarIdeEstab(pInfoPerApur.ideEstab);

  Gerador.wGrupo('/infoPerApur');
end;

procedure TEvtRmnRPPS.GerarRemunPer(objRemunPer: TRemunPerApur1202Collection;
  const nomeRemunPer: string = 'remunPerApur');
var
  i: integer;
begin
  for i := 0 to objRemunPer.Count - 1 do
  begin
    Gerador.wGrupo(nomeRemunPer);

    Gerador.wCampo(tcStr, '', 'matricula', 1, 30, 0, objRemunPer.Items[i].matricula);

    GerarItensRemun(objRemunPer.Items[i].itensRemun, 'itensRemun');

    Gerador.wGrupo('/' + nomeRemunPer);
  end;

  if objRemunPer.Count > 8 then
    Gerador.wAlerta('', nomeRemunPer, 'Lista de ' + nomeRemunPer, ERR_MSG_MAIOR_MAXIMO + '8');
end;

function TEvtRmnRPPS.GerarXML: boolean;
begin
  try
    Self.VersaoDF := TACBreSocial(FACBreSocial).Configuracoes.Geral.VersaoDF;

    Self.Id := GerarChaveEsocial(now, self.ideEmpregador.NrInsc, self.Sequencial);

    GerarCabecalho('evtRmnRPPS');
    Gerador.wGrupo('evtRmnRPPS Id="' + Self.Id + '"');

    GerarIdeEvento3(Self.IdeEvento);
    GerarIdeEmpregador(Self.ideEmpregador);
    GerarIdeTrabalhador;
    GerarDmDev;

    Gerador.wGrupo('/evtRmnRPPS');

    GerarRodape;

    FXML := Gerador.ArquivoFormatoXML;
//    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtRmnRPPS');

//    Validar(schevtRmnRPPS);
  except on e: Exception do
    raise Exception.Create('ID: ' + Self.Id + sLineBreak + ' ' + e.Message);
  end;

  Result := (Gerador.ArquivoFormatoXML <> '');
end;

function TEvtRmnRPPS.LerArqIni(const AIniString: String): Boolean;
{
var
  INIRec: TMemIniFile;
  Ok: Boolean;
  sSecao, sFim: String;
  I, J, K, L, M, N: Integer;
}
begin
  Result := True;
{ Falta Adaptar }
{
  INIRec := TMemIniFile.Create('');
  try
    LerIniArquivoOuString(AIniString, INIRec);

    with Self do
    begin
      sSecao := 'evtRmnRPPS';
      Id         := INIRec.ReadString(sSecao, 'Id', '');
      Sequencial := INIRec.ReadInteger(sSecao, 'Sequencial', 0);

      sSecao := 'ideEvento';
      ideEvento.indRetif    := eSStrToIndRetificacao(Ok, INIRec.ReadString(sSecao, 'indRetif', '1'));
      ideEvento.NrRecibo    := INIRec.ReadString(sSecao, 'nrRecibo', EmptyStr);
      ideEvento.IndApuracao := eSStrToIndApuracao(Ok, INIRec.ReadString(sSecao, 'indApuracao', '1'));
      ideEvento.perApur     := INIRec.ReadString(sSecao, 'perApur', EmptyStr);
      ideEvento.ProcEmi     := eSStrToProcEmi(Ok, INIRec.ReadString(sSecao, 'procEmi', '1'));
      ideEvento.VerProc     := INIRec.ReadString(sSecao, 'verProc', EmptyStr);

      sSecao := 'ideEmpregador';
      ideEmpregador.OrgaoPublico := (TACBreSocial(FACBreSocial).Configuracoes.Geral.TipoEmpregador = teOrgaoPublico);
      ideEmpregador.TpInsc       := eSStrToTpInscricao(Ok, INIRec.ReadString(sSecao, 'tpInsc', '1'));
      ideEmpregador.NrInsc       := INIRec.ReadString(sSecao, 'nrInsc', EmptyStr);

      sSecao := 'ideTrabalhador';
      ideTrabalhador.cpfTrab  := INIRec.ReadString(sSecao, 'cpfTrab', EmptyStr);
      ideTrabalhador.nisTrab  := INIRec.ReadString(sSecao, 'nisTrab', EmptyStr);
      ideTrabalhador.qtdDepFP := INIRec.ReadInteger(sSecao, 'qtdDepFP', 0);

      I := 1;
      while true do
      begin
        // de 01 at� 99
        sSecao := 'procJudTrab' + IntToStrZero(I, 2);
        sFim   := INIRec.ReadString(sSecao, 'nrProcJud', 'FIM');

        if (sFim = 'FIM') or (Length(sFim) <= 0) then
          break;

        with ideTrabalhador.procJudTrab.New do
        begin
          tpTrib    := eSStrToTpTributo(Ok, INIRec.ReadString(sSecao, 'tpTrib', '1'));
          nrProcJud := sFim;
          codSusp   := INIRec.ReadString(sSecao, 'codSusp', '');
        end;

        Inc(I);
      end;

      I := 1;
      while true do
      begin
        // de 01 at� 99
        sSecao := 'dmDev' + IntToStrZero(I, 2);
        sFim   := INIRec.ReadString(sSecao, 'ideDmDev', 'FIM');

        if (sFim = 'FIM') or (Length(sFim) <= 0) then
          break;

        with dmDev.New do
        begin
          ideDmDev := sFim;

          J := 1;
          while true do
          begin
            // de 01 at� 24
            sSecao := 'ideEstab' + IntToStrZero(I, 2) + IntToStrZero(J, 2);
            sFim   := INIRec.ReadString(sSecao, 'nrInsc', 'FIM');

            if (sFim = 'FIM') or (Length(sFim) <= 0) then
              break;

            with infoPerApur.ideEstab.New do
            begin
              tpInsc     := eSStrToTpInscricao(Ok, INIRec.ReadString(sSecao, 'tpInsc', '1'));
              nrInsc     := sFim;

              K := 1;
              while true do
              begin
                // de 01 at� 10
                sSecao := 'remunPerApur' + IntToStrZero(I, 2) + IntToStrZero(J, 2) +
                     IntToStrZero(K, 2);
                sFim   := INIRec.ReadString(sSecao, 'matricula', 'FIM');

                if (sFim = 'FIM') or (Length(sFim) <= 0) then
                  break;

                with remunPerApur.New do
                begin
                  matricula := sFim;
                  codCateg  := INIRec.ReadInteger(sSecao, 'codCateg', 0);

                  L := 1;
                  while true do
                  begin
                    // de 001 at� 200
                    sSecao := 'itensRemun' + IntToStrZero(I, 2) +
                                IntToStrZero(J, 2) + IntToStrZero(K, 2) +
                                IntToStrZero(L, 3);
                    sFim   := INIRec.ReadString(sSecao, 'codRubr', 'FIM');

                    if (sFim = 'FIM') or (Length(sFim) <= 0) then
                      break;

                    with itensRemun.New do
                    begin
                      codRubr    := sFim;
                      ideTabRubr := INIRec.ReadString(sSecao, 'ideTabRubr', '');
                      qtdRubr    := StringToFloatDef(INIRec.ReadString(sSecao, 'qtdRubr', ''), 0);
                      fatorRubr  := StringToFloatDef(INIRec.ReadString(sSecao, 'fatorRubr', ''), 0);
                      vrUnit     := StringToFloatDef(INIRec.ReadString(sSecao, 'vrUnit', ''), 0);
                      vrRubr     := StringToFloatDef(INIRec.ReadString(sSecao, 'vrRubr', ''), 0);
                    end;

                    Inc(L);
                  end;

                  L := 1;
                  while true do
                  begin
                    // de 01 at� 99
                    sSecao := 'detOper' + IntToStrZero(I, 2) +
                                IntToStrZero(J, 2) + IntToStrZero(K, 2) +
                                IntToStrZero(L, 2);
                    sFim   := INIRec.ReadString(sSecao, 'cnpjOper', 'FIM');

                    if (sFim = 'FIM') or (Length(sFim) <= 0) then
                      break;

                    with infoSaudeColet.detOper.New do
                    begin
                      cnpjOper := sFim;
                      regANS   := INIRec.ReadString(sSecao, 'regANS', '');
                      vrPgTit  := StringToFloatDef(INIRec.ReadString(sSecao, 'vrPgTit', ''), 0);

                      M := 1;
                      while true do
                      begin
                        // de 01 at� 99
                        sSecao := 'detPlano' + IntToStrZero(I, 2) +
                                    IntToStrZero(J, 2) + IntToStrZero(K, 2) +
                                    IntToStrZero(L, 2) + IntToStrZero(M, 2);
                        sFim   := INIRec.ReadString(sSecao, 'cpfDep', 'FIM');

                        if (sFim = 'FIM') or (Length(sFim) <= 0) then
                          break;

                        with detPlano.New do
                         begin
                          tpDep    := eSStrToTpDep(Ok, INIRec.ReadString(sSecao, 'tpDep', '00'));
                          cpfDep   := sFim;
                          nmDep    := INIRec.ReadString(sSecao, 'nmDep', '');
                          dtNascto := StringToDateTime(INIRec.ReadString(sSecao, 'dtNascto', '0'));
                          vlrPgDep := StringToFloatDef(INIRec.ReadString(sSecao, 'vlrPgDep', ''), 0);
                        end;

                        Inc(M);
                      end;

                    end;

                    Inc(L);
                  end;

                end;

                Inc(K);
              end;

            end;

            Inc(J);
          end;

          J := 1;
          while true do
          begin
            // de 1 at� 8
            sSecao := 'ideADC' + IntToStrZero(I, 2) + IntToStrZero(J, 1);
            sFim   := INIRec.ReadString(sSecao, 'dtLei', 'FIM');

            if (sFim = 'FIM') or (Length(sFim) <= 0) then
              break;

            with infoPerAnt.ideADC.New do
            begin
              dtLei := StringToDateTime(sFim);
              nrLei := INIRec.ReadString(sSecao, 'nrLei', '');
              dtEf  := StringToDateTime(INIRec.ReadString(sSecao, 'dtEf', '0'));

              K := 1;
              while true do
              begin
                // de 001 at� 200
                sSecao := 'idePeriodo' + IntToStrZero(I, 2) + IntToStrZero(J, 1) +
                   IntToStrZero(K, 3);
                sFim   := INIRec.ReadString(sSecao, 'perRef', 'FIM');

                if (sFim = 'FIM') or (Length(sFim) <= 0) then
                  break;

                with idePeriodo.New do
                begin
                  perRef := sFim;

                  L := 1;
                  while true do
                  begin
                    // de 01 at� 24
                    sSecao := 'ideEstab' + IntToStrZero(I, 2) + IntToStrZero(J, 1) +
                       IntToStrZero(K, 3) + IntToStrZero(L, 2);
                    sFim   := INIRec.ReadString(sSecao, 'nrInsc', 'FIM');

                    if (sFim = 'FIM') or (Length(sFim) <= 0) then
                      break;

                    with ideEstab.New do
                    begin
                      tpInsc     := eSStrToTpInscricao(Ok, INIRec.ReadString(sSecao, 'tpInsc', '1'));
                      nrInsc     := sFim;

                      M := 1;
                      while true do
                      begin
                        // de 01 at� 10
                        sSecao := 'remunPerAnt' + IntToStrZero(I, 2) + IntToStrZero(J, 1) +
                           IntToStrZero(K, 3) + IntToStrZero(L, 2) + IntToStrZero(M, 2);
                        sFim   := INIRec.ReadString(sSecao, 'matricula', 'FIM');

                        if (sFim = 'FIM') or (Length(sFim) <= 0) then
                          break;

                        with remunPerAnt.New do
                        begin
                          matricula := sFim;
                          codCateg  := INIRec.ReadInteger(sSecao, 'codCateg', 0);

                          N := 1;
                          while true do
                          begin
                            // de 001 at� 200
                            sSecao := 'itensRemun' + IntToStrZero(I, 2) +
                                        IntToStrZero(J, 1) + IntToStrZero(K, 3) +
                                        IntToStrZero(L, 2) + IntToStrZero(M, 2) +
                                        IntToStrZero(N, 3);
                            sFim   := INIRec.ReadString(sSecao, 'codRubr', 'FIM');

                            if (sFim = 'FIM') or (Length(sFim) <= 0) then
                              break;

                            with itensRemun.New do
                            begin
                              codRubr    := sFim;
                              ideTabRubr := INIRec.ReadString(sSecao, 'ideTabRubr', '');
                              qtdRubr    := StringToFloatDef(INIRec.ReadString(sSecao, 'qtdRubr', ''), 0);
                              fatorRubr  := StringToFloatDef(INIRec.ReadString(sSecao, 'fatorRubr', ''), 0);
                              vrUnit     := StringToFloatDef(INIRec.ReadString(sSecao, 'vrUnit', ''), 0);
                              vrRubr     := StringToFloatDef(INIRec.ReadString(sSecao, 'vrRubr', ''), 0);
                            end;

                            Inc(N);
                          end;

                        end;

                        Inc(M);
                      end;

                    end;

                    Inc(L);
                  end;

                end;

                Inc(K);
              end;

            end;

            Inc(J);
          end;

        end;

        Inc(I);
      end;
    end;

    GerarXML;
    XML := FXML;
  finally
    INIRec.Free;
  end;
}
end;

{ TS1202CollectionItem }

constructor TS1202CollectionItem.Create(AOwner: TComponent);
begin
  inherited Create;

  FTipoEvento := teS1202;
  FEvtRmnRPPS := TEvtRmnRPPS.Create(AOwner);
end;

destructor TS1202CollectionItem.Destroy;
begin
  FEvtRmnRPPS.Free;

  inherited;
end;

{ TS1202Collection }

function TS1202Collection.Add: TS1202CollectionItem;
begin
  Result := Self.New;
end;

function TS1202Collection.GetItem(Index: integer): TS1202CollectionItem;
begin
  Result := TS1202CollectionItem(inherited Items[Index]);
end;

procedure TS1202Collection.SetItem(Index: integer; Value: TS1202CollectionItem);
begin
  inherited Items[Index] := Value;
end;

function TS1202Collection.New: TS1202CollectionItem;
begin
  Result := TS1202CollectionItem.Create(FACBreSocial);
  Self.Add(Result);
end;

end.
