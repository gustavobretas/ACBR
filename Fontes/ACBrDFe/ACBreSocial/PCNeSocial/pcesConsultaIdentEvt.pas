{ ****************************************************************************** }
{ Projeto: Componente ACBreSocial }
{ Biblioteca multiplataforma de componentes Delphi para envio dos eventos do }
{ eSocial - http://www.esocial.gov.br/ }
{ }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto }
{ Daniel Simoes de Almeida }
{ Andr� Ferreira de Moraes }
{ }
{ Colaboradores nesse arquivo: }
{ }
{ Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr }
{ }
{ }
{ Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior. }
{ }
{ Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor }
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT) }
{ }
{ Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto }
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc., }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA. }
{ Voc� tamb�m pode obter uma copia da licen�a em: }
{ http://www.opensource.org/licenses/lgpl-license.php }
{ }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br }
{ Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410 }
{ }
{ ****************************************************************************** }

{$I ACBr.inc}

unit pcesConsultaIdentEvt;

interface

uses
  SysUtils, Classes, pcnConversao, pcesConversaoeSocial, pcnGerador, pcnConsts;

type

  TConsultaIdentEvt = class(TPersistent)
  private
    FGerador: TGerador;
    FSoapEnvelope: String;
    FtipoConsulta: tpConsulta;

    FtpInsc: String;
    FnrInsc: String;
    FTipoEvento: TTipoEvento;
    FperApur: String;
    FchEvt: String;
    FdtIni: TDateTime;
    FdtFim: TDateTime;
    FcpfTrab: String;

  public
    constructor Create;
    destructor Destroy; override;
    function GerarXML: Boolean;
  published
    property Gerador: TGerador        read FGerador      write FGerador;
    property SoapEnvelope: String     read FSoapEnvelope write FSoapEnvelope;
    property tipoConsulta: tpConsulta read FtipoConsulta write FtipoConsulta;

    property tpInsc: String           read FtpInsc       write FtpInsc;
    property nrInsc: String           read FnrInsc       write FnrInsc;
    property TipoEvento: TTipoEvento  read FTipoEvento   write FTipoEvento;
    property perApur: String          read FperApur      write FperApur;
    property chEvt: String            read FchEvt        write FchEvt;
    property dtIni: TDateTime         read FdtIni        write FdtIni;
    property dtFim: TDateTime         read FdtFim        write FdtFim;
    property cpfTrab: String          read FcpfTrab      write FcpfTrab;
  end;

implementation

uses
  pcnAuxiliar;

{ TConsultaIdentEvt }

constructor TConsultaIdentEvt.Create;
begin
  FGerador := TGerador.Create;
end;

destructor TConsultaIdentEvt.Destroy;
begin
  FGerador.Free;

  inherited;
end;

function TConsultaIdentEvt.GerarXML: Boolean;
begin
  Gerador.ArquivoFormatoXML := '';

  Gerador.wGrupo('eSocial xmlns="' + SoapEnvelope + '"');
  Gerador.wGrupo('consultaIdentificadoresEvts');

  Gerador.wGrupo('ideEmpregador');
  Gerador.wCampo(tcInt, '', 'tpInsc', 01, 01, 1, tpInsc, 'XXX');
  Gerador.wCampo(tcStr, '', 'nrInsc', 11, 14, 1, nrInsc, 'XXX');
  Gerador.wGrupo('/ideEmpregador');

  case tipoConsulta of
    tcEmpregador:
      begin
        Gerador.wGrupo('consultaEvtsEmpregador');
        Gerador.wCampo(tcStr, '', 'tpEvt  ', 06, 06, 1, TipoEventoToStr(TipoEvento), 'XXX');
        Gerador.wCampo(tcStr, '', 'perApur', 07, 07, 1, perApur, 'XXX');
        Gerador.wGrupo('/consultaEvtsEmpregador');
      end;
    tcTabela:
      begin
        Gerador.wGrupo('consultaEvtsTabela');
        Gerador.wCampo(tcStr, '', 'tpEvt', 06, 006, 1, TipoEventoToStr(TipoEvento), 'XXX');
        Gerador.wCampo(tcStr, '', 'chEvt', 01, 100, 0, chEvt, 'XXX');
        Gerador.wCampo(tcDatHor, '', 'dtIni', 19, 19, 0, dtIni, 'XXX');
        Gerador.wCampo(tcDatHor, '', 'dtFim', 19, 19, 0, dtFim, 'XXX');
        Gerador.wGrupo('/consultaEvtsTabela');
      end;
    tcTrabalhador:
      begin
        Gerador.wGrupo('consultaEvtsTrabalhador');
        Gerador.wCampo(tcStr, '', 'cpfTrab', 11, 11, 1, cpfTrab, 'XXX');
        Gerador.wCampo(tcDatHor, '', 'dtIni', 19, 19, 1, dtIni, 'XXX');
        Gerador.wCampo(tcDatHor, '', 'dtFim', 19, 19, 1, dtFim, 'XXX');
        Gerador.wGrupo('/consultaEvtsTrabalhador');
      end;
  end;

  Gerador.wGrupo('/consultaIdentificadoresEvts');
  Gerador.wGrupo('/eSocial');

  Result := (Gerador.ListaDeAlertas.Count = 0);
end;

end.

