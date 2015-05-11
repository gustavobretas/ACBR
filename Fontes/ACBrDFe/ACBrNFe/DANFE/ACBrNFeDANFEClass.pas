{******************************************************************************}
{ Projeto: Componente ACBrNFe                                                  }
{  Biblioteca multiplataforma de componentes Delphi para emiss�o de Nota Fiscal}
{ eletr�nica - NFe - http://www.nfe.fazenda.gov.br                             }
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

{*******************************************************************************
|* Historico
|*
|* 16/12/2008: Wemerson Souto
|*  - Doa��o do componente para o Projeto ACBr
*******************************************************************************}

{$I ACBr.inc}

unit ACBrNFeDANFEClass;

interface

uses
  SysUtils, Classes,
  {$IF DEFINED(VisualCLX)}
     QForms,
  {$ELSEIF DEFINED(FMX)}
     FMX.Forms,
  {$ELSE}
     Forms,
  {$IFEND}
  pcnNFe, pcnConversao;

type

  TCasasDecimais = class(TComponent)
  private
    FqCom: Integer;
    FvUnCom: Integer;
    FMask_qCom: String;
    FMask_vUnCom: String;

    procedure Set_qCom(AValue: Integer);
    procedure Set_vUnCom(AValue: Integer);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  published
    property _qCom: Integer       read FQCom        write Set_qCom;
    property _vUnCom: Integer     read FvUnCom      write Set_vUnCom;
    property _Mask_qCom: String   read FMask_qCom   write FMask_qCom;
    property _Mask_vUnCom: String read FMask_vUnCom write FMask_vUnCom;
  end;

  { TACBrNFeDANFEClass }

  TACBrNFeDANFEClass = class( TComponent )
   private
    procedure SetNFE(const Value: TComponent);
    procedure ErroAbstract(NomeProcedure: String);
  protected
    FACBrNFe: TComponent;
    FLogo: String;
    FSistema: String;
    FUsuario: String;
    FPathPDF: String;
    FImpressora: String;
    FImprimirTotalLiquido: Boolean;
    FMostrarPreview: Boolean;
    FMostrarStatus: Boolean;
    FTipoDANFE: TpcnTipoImpressao;
    FNumCopias: Integer;
    FExpandirLogoMarca: Boolean;
    FFax: String;
    FSite: String;
    FEmail: String;
    FImprimeDescPorc: Boolean;
    FProtocoloNFe: String;
    FMargemInferior: Double;
    FMargemSuperior: Double;
    FMargemEsquerda: Double;
    FMargemDireita: Double;
    FCasasDecimais: TCasasDecimais;
    FExibeResumoCanhoto: Boolean;
    FExibeResumoCanhoto_Texto: String;
    FFormularioContinuo: Boolean;
    FTamanhoFonte_DemaisCampos: Integer;
    FProdutosPorPagina: Integer;
    FImprimirDetalhamentoEspecifico: Boolean;
    FNFeCancelada: Boolean;
    FLocalImpCanhoto: Integer;
    // Incluido por Italo em 27/03/2014
    // Destinado exclusivamente ao DANFE da NFC-e
    FImprimeItens: Boolean;

    // Incluido por Edilson Alves de Oliveira em 10/10/2014
    // Destinado exclusivamente ao DANFE da NFC-e
    FViaConsumidor : Boolean;
    FvTroco: Currency;

    // Incluido por Leandro da Silva Alves em 17/04/2015
    FTributosSeparadamente : Boolean; //informa��o dos tributos separadamente
    FvTribFed: Currency; //total tributos federais
    FvTribEst: Currency; //total tributos estaduais
    FvTribMun: Currency; //total tributos municipais
    FFonteTributos: String;
    FChaveTributos: String;

    FPosCanhoto: TPosRecibo;

    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    function GetPathPDF(Data: TDateTime = 0; CNPJ : String = ''): String;

    procedure ImprimirDANFE(NFE: TNFe = nil); virtual;
    procedure ImprimirDANFEResumido(NFE: TNFe = nil); virtual;
    procedure ImprimirDANFEPDF(NFE: TNFe = nil); virtual;
    procedure ImprimirDANFEResumidoPDF(NFE: TNFe = nil); virtual;
    procedure ImprimirEVENTO(NFE: TNFe = nil); virtual;
    procedure ImprimirEVENTOPDF(NFE: TNFe = nil); virtual;
    procedure ImprimirINUTILIZACAO(NFE: TNFe = nil); virtual;
    procedure ImprimirINUTILIZACAOPDF(NFE: TNFe = nil); virtual;
  published
    property ACBrNFe: TComponent                     read FACBrNFe                        write SetNFE;
    property Logo: String                            read FLogo                           write FLogo;
    property Sistema: String                         read FSistema                        write FSistema;
    property Usuario: String                         read FUsuario                        write FUsuario;
    property PathPDF: String                         read FPathPDF                        write FPathPDF;
    property Impressora: String                      read FImpressora                     write FImpressora;
    property MostrarPreview: Boolean                 read FMostrarPreview                 write FMostrarPreview;
    property MostrarStatus: Boolean                  read FMostrarStatus                  write FMostrarStatus;
    property TipoDANFE: TpcnTipoImpressao            read FTipoDANFE                      write FTipoDANFE;
    property NumCopias: Integer                      read FNumCopias                      write FNumCopias;
    property Fax: String                             read FFax                            write FFax;
    property Site: String                            read FSite                           write FSite;
    property Email: String                           read FEmail                          write FEmail;
    property ImprimirDescPorc: Boolean               read FImprimeDescPorc                write FImprimeDescPorc;
    property ImprimirTotalLiquido: Boolean           read FImprimirTotalLiquido           write FImprimirTotalLiquido;
    property ProtocoloNFe: String                    read FProtocoloNFe                   write FProtocoloNFe;
    property MargemInferior: Double                  read FMargemInferior                 write FMargemInferior;
    property MargemSuperior: Double                  read FMargemSuperior                 write FMargemSuperior;
    property MargemEsquerda: Double                  read FMargemEsquerda                 write FMargemEsquerda;
    property MargemDireita: Double                   read FMargemDireita                  write FMargemDireita;
    property CasasDecimais: TCasasDecimais           read FCasasDecimais;
    property ExibirResumoCanhoto: Boolean            read FExibeResumoCanhoto             write FExibeResumoCanhoto;
    property ExibirResumoCanhoto_Texto: String       read FExibeResumoCanhoto_Texto       write FExibeResumoCanhoto_Texto;
    property FormularioContinuo: Boolean             read FFormularioContinuo             write FFormularioContinuo;
    property ExpandirLogoMarca: Boolean              read FExpandirLogoMarca              write FExpandirLogoMarca default false;
    property TamanhoFonte_DemaisCampos: Integer      read FTamanhoFonte_DemaisCampos      write FTamanhoFonte_DemaisCampos;
    property ProdutosPorPagina: Integer              read FProdutosPorPagina              write FProdutosPorPagina;
    property ImprimirDetalhamentoEspecifico: Boolean read FImprimirDetalhamentoEspecifico write FImprimirDetalhamentoEspecifico;
    property NFeCancelada: Boolean                   read FNFeCancelada                   write FNFeCancelada;
    property LocalImpCanhoto: Integer                read FLocalImpCanhoto                write FLocalImpCanhoto;
    // Incluido por Italo em 27/03/2014
    // Destinado exclusivamente ao DANFE da NFC-e
    property ImprimirItens: Boolean                  read FImprimeItens                   write FImprimeItens;
    property vTroco: Currency                        read FvTroco                         write FvTroco;
    property ViaConsumidor : Boolean                 read FViaConsumidor                  write FViaConsumidor;

    // Incluido por Leandro da Silva Alves em 17/04/2015
    property TributosSeparadamente: Boolean          read FTributosSeparadamente          write FTributosSeparadamente;
    property vTribFed: Currency                      read FvTribFed                       write FvTribFed;
    property vTribEst: Currency                      read FvTribEst                       write FvTribEst;
    property vTribMun: Currency                      read FvTribMun                       write FvTribMun;
    property FonteTributos: String                   read FFonteTributos                  write FFonteTributos;
    property ChaveTributos: String                   read FChaveTributos                  write FChaveTributos;

    property PosCanhoto: TPosRecibo read FPosCanhoto write FPosCanhoto; // default prCabecalho;
  end;

implementation

uses
  ACBrNFe, ACBrUtil;

//Casas Decimais
constructor TCasasDecimais.Create(AOwner: TComponent);
begin
  inherited create( AOwner );

  FQCom := 2;
  FvUnCom := 2;

end;

destructor TCasasDecimais.Destroy;
begin

  inherited Destroy;
end;

procedure TCasasDecimais.Set_qCom(AValue: Integer);
begin
  if ((AValue >= 0) and
      (AValue <= 4))  then
    FqCom := AValue
  else
    FqCom := 2;
end;

procedure TCasasDecimais.Set_vUnCom(AValue: Integer);
begin
  if ((AValue >= 0) and
      (AValue <= 10))  then
    FvUnCom := AValue
  else
    FvUnCom := 2;
end;

//DANFE CLASS
constructor TACBrNFeDANFEClass.Create(AOwner: TComponent);
begin
  inherited create( AOwner );

  FACBrNFe    := nil;
  FLogo       := '';
  FSistema    := '';
  FUsuario    := '';
  FPathPDF    := '';
  FImpressora := '';
  
  FImprimirTotalLiquido := False;
  FMostrarPreview       := True;
  FMostrarStatus        := True;
  FNumCopias := 1;
  FFax       := '';
  FSite      := '';
  FEmail     := '';
  FImprimeDescPorc := False;
  FProtocoloNFe    := '';
  FMargemInferior  := 0.8;
  FMargemSuperior  := 0.8;
  FMargemEsquerda  := 0.6;
  FMargemDireita   := 0.51;
  FExibeResumoCanhoto := false;
  FExibeResumoCanhoto_Texto := '';
  FFormularioContinuo := false;
  FTamanhoFonte_DemaisCampos := 10;
  FProdutosPorPagina := 0;
  FImprimirDetalhamentoEspecifico := true;
  FImprimirTotalLiquido:= True;
  FNFeCancelada := False;
  FLocalImpCanhoto := 0;
  FCasasDecimais := TCasasDecimais.Create(self);
  FCasasDecimais.Name:= 'CasasDecimais';

  FImprimeItens := True;
  FViaConsumidor:= True;
  FvTroco       := 0.0;

  FTributosSeparadamente:= False;
  FvTribFed:= 0.0;
  FvTribEst:= 0.0;
  FvTribMun:= 0.0;

  {$IFDEF COMPILER6_UP}
      FCasasDecimais.SetSubComponent( true );{ para gravar no DFM/XFM }
  {$ENDIF}
end;

destructor TACBrNFeDANFEClass.Destroy;
begin

  inherited Destroy;
end;

procedure TACBrNFeDANFEClass.ImprimirDANFE(NFE : TNFe = nil);
begin
  ErroAbstract('Imprimir');
end;

procedure TACBrNFeDANFEClass.ImprimirDANFEResumido(NFE : TNFe = nil);
begin
  ErroAbstract('ImprimirResumido');
end;

procedure TACBrNFeDANFEClass.ImprimirDANFEPDF(NFE : TNFe = nil);
begin
  ErroAbstract('ImprimirPDF');
end;

procedure TACBrNFeDANFEClass.ImprimirDANFEResumidoPDF(NFE: TNFe);
begin
  ErroAbstract('ImprimirDANFEResumidoPDF');
end;

procedure TACBrNFeDANFEClass.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited Notification(AComponent, Operation);

  if (Operation = opRemove) and (FACBrNFe <> nil) and (AComponent is TACBrNFe) then
     FACBrNFe := nil;
end;

procedure TACBrNFeDANFEClass.SetNFE(const Value: TComponent);
  Var OldValue : TACBrNFe;
begin
  if Value <> FACBrNFe then
  begin
     if Value <> nil then
        if not (Value is TACBrNFe) then
           raise EACBrNFeException.Create('ACBrDANFE.NFE deve ser do tipo TACBrNFe');

     if Assigned(FACBrNFe) then
        FACBrNFe.RemoveFreeNotification(Self);

     OldValue := TACBrNFe(FACBrNFe);   // Usa outra variavel para evitar Loop Infinito
     FACBrNFe := Value;                 // na remo��o da associa��o dos componentes

     if Assigned(OldValue) then
        if Assigned(OldValue.DANFE) then
           OldValue.DANFE := nil;

     if Value <> nil then
     begin
        Value.FreeNotification(self);
        TACBrNFe(Value).DANFE := self;
     end;
  end;
end;

procedure TACBrNFeDANFEClass.ErroAbstract(NomeProcedure: String);
begin
  raise EACBrNFeException.Create( NomeProcedure );
end;

function TACBrNFeDANFEClass.GetPathPDF(Data: TDateTime = 0; CNPJ : String = ''): String;
begin
  Result := TACBrNFe(FACBrNFe).Configuracoes.Arquivos.GetPath(FPathPDF, 'NFe', CNPJ, Data);
(*
  if EstaVazio(FPathPDF) then
     if Assigned(FACBrNFe) then
        FPathPDF := TACBrNFe(FACBrNFe).Configuracoes.Arquivos.PathSalvar;

  if NaoEstaVazio(FPathPDF) then
     if not DirectoryExists(FPathPDF) then
        ForceDirectories(FPathPDF);

  Result := PathWithDelim(FPathPDF);
*)
end;

procedure TACBrNFeDANFEClass.ImprimirEVENTO(NFE: TNFe);
begin
  ErroAbstract('Imprimir');
end;

procedure TACBrNFeDANFEClass.ImprimirEVENTOPDF(NFE: TNFe);
begin
  ErroAbstract('ImprimirPDF');
end;

procedure TACBrNFeDANFEClass.ImprimirINUTILIZACAO(NFE: TNFe);
begin
  ErroAbstract('Imprimir');
end;

procedure TACBrNFeDANFEClass.ImprimirINUTILIZACAOPDF(NFE: TNFe);
begin
  ErroAbstract('ImprimirPDF');
end;

end.
