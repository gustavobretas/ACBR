{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2022 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo: Italo Giurizzato Junior                         }
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

{$I ACBr.inc}

unit ACBrDFeRetConsStatServ;

interface

uses
  SysUtils, Classes, DateUtils,
  {$IF DEFINED(HAS_SYSTEM_GENERICS)}
   System.Generics.Collections, System.Generics.Defaults,
  {$ELSEIF DEFINED(DELPHICOMPILER16_UP)}
   System.Contnrs,
  {$IFEND}
  ACBrBase, ACBrXmlBase;

type

  TRetConsStatServ = class(TObject)
  private
    Fversao: String;
    FtpAmb: TACBrTipoAmbiente;
    FdhRecbto: TDateTime;
    FcStat: Integer;
    FxMotivo: String;
    FcUF: Integer;
    FverAplic: String;
    FtMed: Integer;
    FdhRetorno: TDateTime;
    FxObs: String;
    FtagGrupoMsg: String;

    FXmlRetorno: String;
  public
    constructor Create(const AtagGrupoMsg: String);
    destructor Destroy; override;

    function LerXml: Boolean;

    property versao: String           read Fversao    write Fversao;
    property tpAmb: TACBrTipoAmbiente read FtpAmb     write FtpAmb;
    property verAplic: String         read FverAplic  write FverAplic;
    property cStat: Integer           read FcStat     write FcStat;
    property xMotivo: String          read FxMotivo   write FxMotivo;
    property cUF: Integer             read FcUF       write FcUF;
    property dhRecbto: TDateTime      read FdhRecbto  write FdhRecbto;
    property tMed: Integer            read FtMed      write FtMed;
    property dhRetorno: TDateTime     read FdhRetorno write FdhRetorno;
    property xObs: String             read FxObs      write FxObs;

    property XmlRetorno: String read FXmlRetorno write FXmlRetorno;
  end;

implementation

uses
  ACBrXmlDocument;

{ TRetConsStatServ }

constructor TRetConsStatServ.Create(const AtagGrupoMsg: String);
begin
  inherited Create;

  FtagGrupoMsg := AtagGrupoMsg;
end;

destructor TRetConsStatServ.Destroy;
begin

  inherited;
end;

function TRetConsStatServ.LerXml: Boolean;
var
  Document: TACBrXmlDocument;
  ANode: TACBrXmlNode;
  ok: Boolean;
begin
  Document := TACBrXmlDocument.Create;

  try
    Document.LoadFromXml(XmlRetorno);

    ANode := Document.Root; //.Childrens.FindAnyNs('retConsStatServ' + FtagGrupoMsg);

    if ANode <> nil then
    begin
      versao := ObterConteudoTag(ANode.Attributes.Items['versao']);
      tpAmb := StrToTipoAmbiente(ok, ObterConteudoTag(Anode.Childrens.FindAnyNs('tpAmb'), tcStr));
      verAplic := ObterConteudoTag(ANode.Childrens.FindAnyNs('verAplic'), tcStr);
      cStat := ObterConteudoTag(ANode.Childrens.FindAnyNs('cStat'), tcInt);
      xMotivo := ObterConteudoTag(ANode.Childrens.FindAnyNs('xMotivo'), tcStr);
      cUF := ObterConteudoTag(Anode.Childrens.FindAnyNs('cUF'), tcInt);
      dhRecbto := ObterConteudoTag(Anode.Childrens.FindAnyNs('dhRecbto'), tcDatHor);
      tMed := ObterConteudoTag(ANode.Childrens.FindAnyNs('tMed'), tcInt);
      dhRetorno := ObterConteudoTag(Anode.Childrens.FindAnyNs('dhRetorno'), tcDatHor);
      xObs := ObterConteudoTag(ANode.Childrens.FindAnyNs('xObs'), tcStr);
    end;

    FreeAndNil(Document);
    Result := True;
  except
    Result := False;
  end;
end;

end.

