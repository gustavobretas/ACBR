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

{ ******************************************************************************
|* Historico
|*
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doa��o do componente para o Projeto ACBr
|* 29/02/2015: Guilherme Costa
|*  - n�o estava sendo gerada a tag "tpProc"
****************************************************************************** }

{$I ACBr.inc}
unit pcesRetConsultaLote;

interface

uses
  SysUtils, Classes,
  ACBrUtil, pcnAuxiliar, pcnConversao, pcnLeitor,
  pcesCommon, pcesRetornoClass, pcesConversaoeSocial,
  pcesS5001, pcesS5002, pcesS5011, pcesS5012;

type
  TtotCollection = class;
  TtotCollectionItem = class;
  TRetEventosCollection = class;
  TRetEventosCollectionItem = class;
  TRetConsultaLote = class;

  TtotCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TtotCollectionItem;
    procedure SetItem(Index: Integer; Value: TtotCollectionItem);
  public
    constructor create(AOwner: TRetEventosCollectionItem);

    function Add: TtotCollectionItem;
    property Items[Index: Integer]: TtotCollectionItem read GetItem write SetItem; default;
  end;

  TtotCollectionItem = class(TCollectionItem)
  private
    Ftipo: String;
    FXML: AnsiString;
    FEvento: IEventoeSocial;

  public
    property tipo: String read Ftipo write Ftipo;
    property XML: AnsiString read FXML write FXML;
    property Evento: IEventoeSocial read FEvento write FEvento;

  end;

  TRetEventosCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TRetEventosCollectionItem;
    procedure SetItem(Index: Integer; Value: TRetEventosCollectionItem);
  public
    constructor create(AOwner: TRetConsultaLote);

    function Add: TRetEventosCollectionItem;
    property Items[Index: Integer]: TRetEventosCollectionItem read GetItem
      write SetItem; default;
  end;

  TRetEventosCollectionItem = class(TCollectionItem)
  private
    FIDEvento: string;
    FevtDupl: boolean;
    FIdeEmpregador: TInscricao;
    FRecepcao: TRecepcao;
    FProcessamento: TProcessamento;
    FRecibo: TRecibo;
    Ftot: TtotCollection;

    procedure Settot(const Value: TtotCollection);
  public
    constructor create; reintroduce;
    destructor Destroy; override;

    property Id: string read FIDEvento write FIDEvento;
    property evtDupl: boolean read FevtDupl write FevtDupl;
    property IdeEmpregador: TInscricao read FIdeEmpregador write FIdeEmpregador;
    property Recepcao: TRecepcao read FRecepcao write FRecepcao;
    property Processamento: TProcessamento read FProcessamento write FProcessamento;
    property Recibo: TRecibo read FRecibo write FRecibo;
    property tot: TtotCollection read Ftot write Settot;
  end;

  TRetConsultaLote = class(TPersistent)
  private
    FLeitor: TLeitor;
    FIdeEmpregador: TInscricao;
    FIdeTransmissor: TInscricao;
    FStatus: TStatus;
    FDadosRecLote: TDadosRecepcaoLote;
    FDadosProcLote: TDadosProcLote;
    FRetEventos: TRetEventosCollection;

    procedure SetEventos(const Value: TRetEventosCollection);
  public
    constructor create;
    destructor Destroy; override;

    function LerXml: boolean;
  published
    property Leitor: TLeitor read FLeitor write FLeitor;

    property IdeEmpregador: TInscricao read FIdeEmpregador write FIdeEmpregador;
    property IdeTransmissor: TInscricao read FIdeTransmissor write FIdeTransmissor;
    property Status: TStatus read FStatus write FStatus;
    property DadosRecLote: TDadosRecepcaoLote read FDadosRecLote write FDadosRecLote;
    property DadosProcLote: TDadosProcLote read FDadosProcLote write FDadosProcLote;
    property RetEventos: TRetEventosCollection read FRetEventos write SetEventos;
  end;

implementation

{ TtotCollection }

function TtotCollection.Add: TtotCollectionItem;
begin
  Result := TtotCollectionItem(inherited Add());
//  Result.create;
end;

constructor TtotCollection.create(AOwner: TRetEventosCollectionItem);
begin
  inherited create(TtotCollectionItem);
end;

function TtotCollection.GetItem(Index: Integer): TtotCollectionItem;
begin
  Result := TtotCollectionItem(Inherited GetItem(Index));
end;

procedure TtotCollection.SetItem(Index: Integer;
  Value: TtotCollectionItem);
begin
  Inherited SetItem(Index, Value);
end;

{ TRetEventosCollection }

function TRetEventosCollection.Add: TRetEventosCollectionItem;
begin
  Result := TRetEventosCollectionItem(inherited Add());
  Result.create;
end;

constructor TRetEventosCollection.create(AOwner: TRetConsultaLote);
begin
  inherited create(TRetEventosCollectionItem);
end;

function TRetEventosCollection.GetItem(Index: Integer)
  : TRetEventosCollectionItem;
begin
  Result := TRetEventosCollectionItem(Inherited GetItem(Index));
end;

procedure TRetEventosCollection.SetItem(Index: Integer;
  Value: TRetEventosCollectionItem);
begin
  Inherited SetItem(Index, Value);
end;

{ TRetEventosCollectionItem }

constructor TRetEventosCollectionItem.create;
begin
  FIdeEmpregador := TInscricao.Create;
  FRecepcao := TRecepcao.create;
  FProcessamento := TProcessamento.create;
  FRecibo := TRecibo.create;
  Ftot := TtotCollection.create(Self);
end;

destructor TRetEventosCollectionItem.Destroy;
begin
  FIdeEmpregador.Free;
  FRecepcao.Free;
  FProcessamento.Free;
  FRecibo.Free;
  Ftot.Free;

  inherited;
end;

procedure TRetEventosCollectionItem.Settot(const Value: TtotCollection);
begin
  Ftot := Value;
end;

{ TRetConsultaLote }

constructor TRetConsultaLote.create;
begin
  FLeitor := TLeitor.create;

  FIdeEmpregador := TInscricao.create;
  FIdeTransmissor := TInscricao.create;
  FStatus := TStatus.create;
  FDadosRecLote := TDadosRecepcaoLote.create;
  FDadosProcLote := TDadosProcLote.create;
  FRetEventos := TRetEventosCollection.create(Self);
end;

destructor TRetConsultaLote.Destroy;
begin
  FLeitor.Free;
  FIdeEmpregador.Free;
  FIdeTransmissor.Free;
  FStatus.Free;
  FDadosRecLote.Free;
  FDadosProcLote.Free;
  FRetEventos.Free;

  inherited;
end;

procedure TRetConsultaLote.SetEventos(const Value: TRetEventosCollection);
begin
  FRetEventos := Value;
end;

function TRetConsultaLote.LerXml: boolean;
var
  ok: boolean;
  i, j, k: Integer;
begin
  Result := False;
  try
    Leitor.Grupo := Leitor.Arquivo;
    if Leitor.rExtrai(1, 'retornoProcessamentoLoteEventos') <> '' then
    begin
      if Leitor.rExtrai(2, 'ideEmpregador') <> '' then
      begin
        IdeEmpregador.TpInsc := eSStrToTpInscricao(ok, FLeitor.rCampo(tcStr, 'tpInsc'));
        IdeEmpregador.NrInsc := FLeitor.rCampo(tcStr, 'nrInsc');
      end;

      if Leitor.rExtrai(2, 'ideTransmissor') <> '' then
      begin
        IdeTransmissor.TpInsc := eSStrToTpInscricao(ok, FLeitor.rCampo(tcStr, 'tpInsc'));
        IdeTransmissor.NrInsc := FLeitor.rCampo(tcStr, 'nrInsc');
      end;

      if Leitor.rExtrai(2, 'status') <> '' then
      begin
        Status.cdResposta := Leitor.rCampo(tcInt, 'cdResposta');
        Status.descResposta := Leitor.rCampo(tcStr, 'descResposta');
        Status.tempoEstimadoConclusao :=
          Leitor.rCampo(tcInt, 'tempoEstimadoConclusao');

        if Leitor.rExtrai(3, 'ocorrencias') <> '' then
        begin
          i := 0;
          while Leitor.rExtrai(4, 'ocorrencia', '', i + 1) <> '' do
          begin
            Status.Ocorrencias.Add;
            Status.Ocorrencias.Items[i].Codigo := FLeitor.rCampo(tcInt, 'codigo');
            Status.Ocorrencias.Items[i].Descricao := FLeitor.rCampo(tcStr, 'descricao');
            Status.Ocorrencias.Items[i].Tipo := FLeitor.rCampo(tcInt, 'tipo');
            Status.Ocorrencias.Items[i].Localizacao := FLeitor.rCampo(tcStr, 'localizacao');
            inc(i);
          end;
        end;

      end;

      if Leitor.rExtrai(2, 'dadosRecepcaoLote') <> '' then
      begin
        DadosRecLote.dhRecepcao := Leitor.rCampo(tcDatHor, 'dhRecepcao');
        DadosRecLote.versaoAplicRecepcao :=
          FLeitor.rCampo(tcStr, 'versaoAplicativoRecepcao');
        DadosRecLote.Protocolo := FLeitor.rCampo(tcStr, 'protocoloEnvio');
      end;

      if Leitor.rExtrai(2, 'dadosProcessamentoLote') <> '' then
        DadosProcLote.versaoAplicProcLote :=
          FLeitor.rCampo(tcStr, 'versaoAplicativoProcessamentoLote');

      if Leitor.rExtrai(2, 'retornoEventos') > '' then
      begin
        i := 0;
        while Leitor.rExtrai(3, 'evento', '', i + 1) <> '' do
        begin
          RetEventos.Add;
          RetEventos.Items[i].Id := FLeitor.rAtributo('Id=', 'evento');

          if (FLeitor.rAtributo('evtDupl=', 'evento') <> '') then
            RetEventos.Items[i].evtDupl := StrToBool(FLeitor.rAtributo('evtDupl=', 'evento'));

          if Leitor.rExtrai(4, 'eSocial') <> '' then
          begin
            if Leitor.rExtrai(5, 'retornoEvento') <> '' then
            begin

              if Leitor.rExtrai(6, 'ideEmpregador') <> '' then
              begin
                RetEventos.Items[i].IdeEmpregador.TpInsc := eSStrToTpInscricao(ok, Leitor.rCampo(tcStr, 'tpInsc'));
                RetEventos.Items[i].IdeEmpregador.NrInsc := Leitor.rCampo(tcStr, 'nrInsc');
              end;

              if Leitor.rExtrai(6, 'recepcao') <> '' then
              begin
                RetEventos.Items[i].Recepcao.tpAmb := eSStrTotpAmb(ok, Leitor.rCampo(tcStr, 'tpAmb'));
                RetEventos.Items[i].Recepcao.dhRecepcao := Leitor.rCampo(tcDatHor, 'dhRecepcao', '');
                RetEventos.Items[i].Recepcao.versaoAplicRecepcao := Leitor.rCampo(tcStr, 'versaoAppRecepcao');
                RetEventos.Items[i].Recepcao.Protocolo := Leitor.rCampo(tcStr, 'protocoloEnvioLote');
              end;

              if Leitor.rExtrai(6, 'processamento') <> '' then
              begin
                RetEventos.Items[i].Processamento.cdResposta := Leitor.rCampo(tcInt, 'cdResposta');
                RetEventos.Items[i].Processamento.descResposta := Leitor.rCampo(tcStr, 'descResposta');
                RetEventos.Items[i].Processamento.versaoAplicProcLote := Leitor.rCampo(tcStr, 'versaoAppProcessamento');
                RetEventos.Items[i].Processamento.dhProcessamento := Leitor.rCampo(tcDatHor, 'dhProcessamento');

                if Leitor.rExtrai(7, 'ocorrencias') <> '' then
                begin
                  j := 0;
                  while Leitor.rExtrai(8, 'ocorrencia', '', j + 1) <> '' do
                  begin
                    RetEventos.Items[i].Processamento.Ocorrencias.Add;
                    RetEventos.Items[i].Processamento.Ocorrencias.Items[j].Codigo := Leitor.rCampo(tcInt, 'codigo');
                    RetEventos.Items[i].Processamento.Ocorrencias.Items[j].Descricao := Leitor.rCampo(tcStr, 'descricao');
                    RetEventos.Items[i].Processamento.Ocorrencias.Items[j].Tipo := Leitor.rCampo(tcInt, 'tipo');
                    RetEventos.Items[i].Processamento.Ocorrencias.Items[j].Localizacao := Leitor.rCampo(tcStr, 'localizacao');
                    inc(j);
                  end;
                end;
              end;

              if Leitor.rExtrai(6, 'recibo') <> '' then
              begin
                RetEventos.Items[i].Recibo.nrRecibo := Leitor.rCampo(tcStr, 'nrRecibo');
                RetEventos.Items[i].Recibo.Hash := Leitor.rCampo(tcStr, 'hash');

                if Leitor.rExtrai(7, 'contrato') <> '' then
                begin
                  if Leitor.rExtrai(8, 'ideEmpregador') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.IdeEmpregador.TpInsc := eSStrToTpInscricao(ok, Leitor.rCampo(tcStr, 'tpInsc'));
                    RetEventos.Items[i].Recibo.Contrato.IdeEmpregador.NrInsc := Leitor.rCampo(tcStr, 'nrInsc');
                  end;

                  if Leitor.rExtrai(8, 'trabalhador') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.trabalhador.CpfTrab := Leitor.rCampo(tcStr, 'cpfTrab');
                    RetEventos.Items[i].Recibo.Contrato.trabalhador.NisTrab := Leitor.rCampo(tcStr, 'nisTrab');
                    RetEventos.Items[i].Recibo.Contrato.trabalhador.NmTrab  := Leitor.rCampo(tcStr, 'nmTrab');
                  end;

                  if Leitor.rExtrai(8, 'infoDeficiencia') <> '' then
                    RetEventos.Items[i].Recibo.Contrato.infoDeficiencia.InfoCota := Leitor.rCampo(tcStr, 'infoCota');

                  if Leitor.rExtrai(8, 'vinculo') <> '' then
                    RetEventos.Items[i].Recibo.Contrato.vinculo.Matricula := Leitor.rCampo(tcStr, 'matricula');

                  if Leitor.rExtrai(8, 'infoCeletista') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.infoCeletista.DtAdm    := Leitor.rCampo(tcDat, 'dtAdm');
                    RetEventos.Items[i].Recibo.Contrato.infoCeletista.TpRegJor := eSStrToTpRegJor(ok, Leitor.rCampo(tcStr, 'tpRegJor'));
                    RetEventos.Items[i].Recibo.Contrato.infoCeletista.dtBase   := Leitor.rCampo(tcDat, 'dtBase');
                    RetEventos.Items[i].Recibo.Contrato.infoCeletista.cnpjSindCategProf := Leitor.rCampo(tcStr, 'cnpjSindCategProf');
                  end;

                  if Leitor.rExtrai(8, 'infoEstatutario') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.infoEstatutario.DtPosse     := Leitor.rCampo(tcDat, 'dtPosse');
                    RetEventos.Items[i].Recibo.Contrato.infoEstatutario.DtExercicio := Leitor.rCampo(tcDat, 'dtExercicio');
                  end;

                  if Leitor.rExtrai(8, 'infoContrato') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.infoContrato.codCateg := Leitor.rCampo(tcStr, 'codCateg');

                    if Leitor.rExtrai(9, 'cargo') <> '' then
                    begin
                      RetEventos.Items[i].Recibo.Contrato.infoContrato.Cargo.codCargo := Leitor.rCampo(tcStr, 'codCargo');
                      RetEventos.Items[i].Recibo.Contrato.infoContrato.Cargo.nmCargo  := Leitor.rCampo(tcStr, 'nmCargo');
                      RetEventos.Items[i].Recibo.Contrato.infoContrato.Cargo.codCBO   := Leitor.rCampo(tcStr, 'codCBO');
                    end;

                    if Leitor.rExtrai(9, 'funcao') <> '' then
                    begin
                      RetEventos.Items[i].Recibo.Contrato.infoContrato.funcao.codFuncao := Leitor.rCampo(tcStr, 'codFuncao');
                      RetEventos.Items[i].Recibo.Contrato.infoContrato.funcao.nmFuncao  := Leitor.rCampo(tcStr, 'nmFuncao');
                      RetEventos.Items[i].Recibo.Contrato.infoContrato.funcao.codCBO    := Leitor.rCampo(tcStr, 'codCBO');
                    end;
                  end;

                  if Leitor.rExtrai(8, 'remuneracao') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.remuneracao.VrSalFx    := Leitor.rCampo(tcDe2, 'vrSalFx');
                    RetEventos.Items[i].Recibo.Contrato.remuneracao.UndSalFixo := eSStrToUndSalFixo(ok, Leitor.rCampo(tcStr, 'undSalFixo'));
                    RetEventos.Items[i].Recibo.Contrato.remuneracao.DscSalVar  := Leitor.rCampo(tcStr, 'dscSalVar');
                  end;

                  if Leitor.rExtrai(8, 'duracao') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.duracao.TpContr   := eSStrToTpContr(ok, Leitor.rCampo(tcDe2, 'tpContr'));
                    RetEventos.Items[i].Recibo.Contrato.duracao.dtTerm    := Leitor.rCampo(tcDat, 'dtTerm');
                    RetEventos.Items[i].Recibo.Contrato.duracao.clauAssec := eSStrToSimNao(ok, Leitor.rCampo(tcStr, 'clauAssec'));
                  end;

                  if Leitor.rExtrai(8, 'localTrabGeral') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.localTrabGeral.TpInsc := eSStrToTpInscricao(ok, Leitor.rCampo(tcDe2, 'tpInsc'));
                    RetEventos.Items[i].Recibo.Contrato.localTrabGeral.NrInsc := Leitor.rCampo(tcStr, 'nrInsc');
                    RetEventos.Items[i].Recibo.Contrato.localTrabGeral.Cnae   := Leitor.rCampo(tcStr, 'cnae');
                  end;

                  if Leitor.rExtrai(8, 'horContratual') <> '' then
                  begin
                    RetEventos.Items[i].Recibo.Contrato.horContratual.QtdHrsSem := Leitor.rCampo(tcInt, 'qtdHrsSem');
                    RetEventos.Items[i].Recibo.Contrato.horContratual.TpJornada := eSStrToTpJornada(ok, Leitor.rCampo(tcStr, 'tpJornada'));
                    RetEventos.Items[i].Recibo.Contrato.horContratual.DscTpJorn := Leitor.rCampo(tcStr, 'dscTpJorn');
                    RetEventos.Items[i].Recibo.Contrato.horContratual.tmpParc   := StrTotpTmpParc(ok, Leitor.rCampo(tcStr, 'tmpParc'));

                    j := 0;
                    while Leitor.rExtrai(9, 'horario', '', j + 1) <> '' do
                    begin
                      RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Add;
                      RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].dia            := eSStrToTpDia(ok, FLeitor.rCampo(tcStr, 'dia'));
                      RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].codHorContrat  := FLeitor.rCampo(tcStr, 'codHorContrat');
                      RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].hrEntr         := FLeitor.rCampo(tcStr, 'hrEntr');
                      RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].hrSaida        := FLeitor.rCampo(tcStr, 'hrSaida');
                      RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].durJornada     := FLeitor.rCampo(tcInt, 'durJornada');
                      RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].perHorFlexivel := FLeitor.rCampo(tcStr, 'perHorFlexivel');

                      k := 0;
                      while Leitor.rExtrai(10, 'horarioIntervalo', '', k + 1) <> '' do
                      begin
                        RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].horarioIntervalo.Add;
                        RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].horarioIntervalo.Items[k].tpInterv   := eSStrToTpIntervalo(ok, FLeitor.rCampo(tcStr, 'tpInterv'));
                        RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].horarioIntervalo.Items[k].durInterv  := FLeitor.rCampo(tcInt, 'durInterv');
                        RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].horarioIntervalo.Items[k].iniInterv  := FLeitor.rCampo(tcStr, 'iniInterv');
                        RetEventos.Items[i].Recibo.Contrato.horContratual.horario.Items[j].horarioIntervalo.Items[k].termInterv := FLeitor.rCampo(tcStr, 'termInterv');

                        inc(k);
                      end;

                      inc(j);
                    end;
                  end;
                end;
              end;
            end;
            // ToDo: Verifica se a necessidade da leitura do grupo <Signature>
          end;

          j := 0;
          while Leitor.rExtrai(4, 'tot', '', j + 1) <> '' do
          begin
            RetEventos.Items[i].tot.Add;
            RetEventos.Items[i].tot.Items[j].tipo := FLeitor.rAtributo('tipo=', 'tot');
            RetEventos.Items[i].tot.Items[j].XML := RetornarConteudoEntre(Leitor.Grupo, '>', '</tot');

            if RetEventos.Items[i].tot.Items[j].tipo = 'S5001' then
            begin
              RetEventos.Items[i].tot.Items[j].Evento := TS5001.Create;
              RetEventos.Items[i].tot.Items[j].Evento.Xml := RetEventos.Items[i].tot.Items[j].XML;
            end;

            if RetEventos.Items[i].tot.Items[j].tipo = 'S5002' then
            begin
              RetEventos.Items[i].tot.Items[j].Evento := TS5002.Create;
              RetEventos.Items[i].tot.Items[j].Evento.Xml := RetEventos.Items[i].tot.Items[j].XML;
            end;

            if RetEventos.Items[i].tot.Items[j].tipo = 'S5011' then
            begin
              RetEventos.Items[i].tot.Items[j].Evento := TS5011.Create;
              RetEventos.Items[i].tot.Items[j].Evento.Xml := RetEventos.Items[i].tot.Items[j].XML;
            end;

            if RetEventos.Items[i].tot.Items[j].tipo = 'S5012' then
            begin
              RetEventos.Items[i].tot.Items[j].Evento := TS5012.Create;
              RetEventos.Items[i].tot.Items[j].Evento.Xml := RetEventos.Items[i].tot.Items[j].XML;
            end;

            inc(j);
          end;

          inc(i);
        end;
      end;

      Result := True;
    end;
  except
    Result := False;
  end;
end;

end.
