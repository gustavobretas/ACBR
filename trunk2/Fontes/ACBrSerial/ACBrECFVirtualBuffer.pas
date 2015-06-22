{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2004 Daniel Simoes de Almeida               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
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
{ http://www.opensource.org/licenses/gpl-license.php                           }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{$I ACBr.inc}

{.$IFDEF FPC}
 {$DEFINE Use_Stream}
{.$ENDIF}

unit ACBrECFVirtualBuffer ;

interface
uses
  Classes, SysUtils, IniFiles,
  ACBrDevice, ACBrECFVirtual, ACBrECFClass, ACBrUtil, ACBrConsts ;

const
  ACBrECFVirtualBuffer_VERSAO = '0.1.0a';

type

{ TACBrECFVirtualBuffer }

TACBrECFVirtualBuffer = class( TACBrECFVirtual )
  private
    function GetCabecalho: TStrings;
    function GetCabecalhoItem: TStrings;
    function GetMascaraItem: String;
    procedure SetCabecalho(AValue: TStrings);
    procedure SetCabecalhoItem(AValue: TStrings);
    procedure SetMascaraItem(AValue: String);
  protected
    procedure CreateVirtualClass ; override ;

    property Cabecalho     : TStrings read GetCabecalho     write SetCabecalho;
    property CabecalhoItem : TStrings read GetCabecalhoItem write SetCabecalhoItem;
    property MascaraItem   : String   read GetMascaraItem   write SetMascaraItem;
  end ;

{ TACBrECFVirtualBufferClass }

TACBrECFVirtualBufferClass = class( TACBrECFVirtualClass )
  private
    {$IFDEF Use_Stream}
      fsFSBuffer : TFileStream ;
    {$ELSE}
      fsArqBuf : TextFile;
    {$ENDIF}
    fsBuffer : TStringList ;

    fsCabecalho : TStringList ;
    fsCabecalhoItem : TStringList ;
    fsMascaraItem : String ;

    procedure AbreBuffer ;
    procedure GravaBuffer ;
    procedure SetCabecalho(AValue: TStringList);
    procedure SetCabecalhoItem(AValue: TStringList);
    procedure ZeraBuffer ;
    procedure ImprimeBuffer ;

    procedure InsertBufferCabecalho;
    procedure AddBufferCabecalho_Item;
    procedure AddBufferRelatorio ;
    procedure AddBufferRodape;

  protected
    procedure AddBufferLinhas( AString: AnsiString) ;

    function AjustaLinhaColunas( Linha: AnsiString ): AnsiString;
    function ColunasExpandido(): Integer; virtual;

    procedure AtivarVirtual ; override;

    procedure AbreDocumentoVirtual ; override;
    Procedure EnviaConsumidorVirtual ; override;
    procedure VendeItemVirtual( ItemCupom: TACBrECFVirtualClassItemCupom); override;
    Procedure CancelaItemVendidoVirtual( NumItem : Integer ) ; override ;
    Procedure SubtotalizaCupomVirtual( DescontoAcrescimo : Double = 0;
       MensagemRodape : AnsiString  = '' ) ; override ;
    Procedure EfetuaPagamentoVirtual( Pagto: TACBrECFVirtualClassPagamentoCupom) ; override ;
    Procedure FechaCupomVirtual( Observacao : AnsiString = ''; IndiceBMP : Integer = 0) ; override ;
    Procedure CancelaCupomVirtual ; override ;

    Procedure LeituraXVirtual ; override ;
    Procedure ReducaoZVirtual(DataHora : TDateTime = 0 ) ; override ;

    procedure AbreNaoFiscalVirtual(CPF_CNPJ: String; Nome: String; Endereco: String
      ); override;
    Procedure RegistraItemNaoFiscalVirtual( CNF : TACBrECFComprovanteNaoFiscal;
       Valor : Double; Obs : AnsiString = '') ; override ;
    procedure AbreRelatorioGerencialVirtual(Indice: Integer); override;
    procedure AbreCupomVinculadoVirtual(COO: String; FPG: TACBrECFFormaPagamento;
      CodComprovanteNaoFiscal: String; SubtotalCupomAnterior, ValorFPG: Double ); override;
    procedure FechaRelatorioVirtual; override;

  protected
    procedure Imprimir( AString : AnsiString ) ; overload ; virtual;
    procedure Imprimir( AStringList : TStringList ) ; overload ;

    function GetSubModeloECF: String ; override ;
    function GetNumVersao: String; override ;
    function GetCliche: AnsiString ; override ;

  public
    Constructor Create( AECFVirtual : TACBrECFVirtual ); overload; virtual;
    Destructor Destroy  ; override ;

    procedure INItoClass( ConteudoINI: TStrings ) ; override;

    property Cabecalho     : TStringList read fsCabecalho     write SetCabecalho;
    property CabecalhoItem : TStringList read fsCabecalhoItem write SetCabecalhoItem;
    property MascaraItem   : String      read fsMascaraItem   write fsMascaraItem;

    procedure Desativar ; override ;
    Function EnviaComando_ECF( cmd : AnsiString ) : AnsiString ; override ;

    Procedure AbreCupom ; override ;
    Procedure FechaCupom( Observacao : AnsiString = ''; IndiceBMP : Integer = 0) ; override ;

    Procedure LeituraX ; override ;
    Procedure LeituraXSerial( Linhas : TStringList) ; override ;

    Procedure ReducaoZ(DataHora : TDateTime = 0 ) ; override ;
    Procedure LinhaRelatorioGerencial( Linha : AnsiString; IndiceBMP: Integer = 0 ) ; override ;
    Procedure LinhaCupomVinculado( Linha : AnsiString ) ; override ;
    Procedure CortaPapel( const CorteParcial : Boolean = false) ; override ;

    Procedure AbreGaveta ; override ;
  end ;

Function StuffMascaraItem( Linha, MascaraItem : AnsiString; Letra : AnsiChar;
       TextoInserir : AnsiString; Fim:Boolean = False) : AnsiString ;

implementation

Uses
  math;

Function StuffMascaraItem( Linha, MascaraItem : AnsiString; Letra : AnsiChar;
   TextoInserir : AnsiString; Fim:Boolean = False) : AnsiString ;
Var A,B : Integer ;
    L   : AnsiChar ;
begin
  Result := '' ;

  if not FIM then
   begin
     B := 1 ;
     For A := 1 to length(MascaraItem) do
     begin
        L := MascaraItem[A] ;

        if L = Letra then
           if B > Length( TextoInserir ) then
              L := ' '
           else
            begin
              L := TextoInserir[B] ;
              B := B + 1 ;
            end
        else
           if A > Length( Linha ) then
              L := ' '
           else
              L := Linha[A] ;

        Result := Result + L ;
     end
   end
  else
   begin
     B := length(TextoInserir) ;
     For A := length(MascaraItem) downto 1 do
     begin
        L := MascaraItem[A] ;

        if L = Letra then
           if B < 1 then
              L := ' '
           else
            begin
              L := TextoInserir[B] ;
              B := B - 1 ;
            end
        else
           if A > Length( Linha ) then
              L := ' '
           else
              L := Linha[A] ;

        Result := L + Result ;
     end
   end;
end;

{ TACBrECFVirtualBuffer }

procedure TACBrECFVirtualBuffer.CreateVirtualClass;
begin
  fpECFVirtualClass := TACBrECFVirtualBufferClass.create( self );
end;

function TACBrECFVirtualBuffer.GetCabecalho: TStrings;
begin
  Result := TACBrECFVirtualBufferClass(fpECFVirtualClass).Cabecalho;
end;

function TACBrECFVirtualBuffer.GetCabecalhoItem: TStrings;
begin
  Result := TACBrECFVirtualBufferClass(fpECFVirtualClass).CabecalhoItem;
end;

function TACBrECFVirtualBuffer.GetMascaraItem: String;
begin
  Result := TACBrECFVirtualBufferClass(fpECFVirtualClass).MascaraItem;
end;

procedure TACBrECFVirtualBuffer.SetCabecalho(AValue: TStrings);
begin
  TACBrECFVirtualBufferClass(fpECFVirtualClass).Cabecalho.Assign( AValue );
end;

procedure TACBrECFVirtualBuffer.SetCabecalhoItem(AValue: TStrings);
begin
  TACBrECFVirtualBufferClass(fpECFVirtualClass).CabecalhoItem.Assign( AValue );
end;

procedure TACBrECFVirtualBuffer.SetMascaraItem(AValue: String);
begin
  TACBrECFVirtualBufferClass(fpECFVirtualClass).MascaraItem := AValue;
end;

{ TACBrECFVirtualBufferClass }

constructor TACBrECFVirtualBufferClass.Create(AECFVirtual: TACBrECFVirtual);
begin
  inherited create( AECFVirtual ) ;

  fsBuffer := TStringList.create ;

  fsCabecalho := TStringList.create ;
  fsCabecalho.add('Nome da Empresa') ;
  fsCabecalho.add('Nome da Rua , 1234  -  Bairro') ;
  fsCabecalho.add('Cidade  -  UF  -  99999-999') ;

  fsCabecalhoItem := TStringList.create ;
  fsCabecalhoItem.Add('ITEM   CODIGO             DESCRICAO') ;
  fsCabecalhoItem.Add('.             QTDxUNITARIO   Aliq    VALOR (R$)') ;
  fsCabecalhoItem.Add( '</linha_simples>' ) ;

  fsMascaraItem := 'III CCCCCCCCCCCCC DDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDDD '+
                   'QQQQQQQQ UUxVVVVVVVVV AAAAAAA TTTTTTTTTTT' ;
end;

destructor TACBrECFVirtualBufferClass.Destroy;
begin
  fsBuffer.Free ;
  fsCabecalho.Free ;
  fsCabecalhoItem.Free ;

  Desativar ;

  inherited Destroy ;
end;

procedure TACBrECFVirtualBufferClass.AtivarVirtual;
begin
  inherited AtivarVirtual;
  
  AbreBuffer ;
  if fsBuffer.Count > 0 then
    ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.Desativar;
begin
  {$IFDEF Use_Stream}
    if Assigned( fsFSBuffer ) then
      FreeAndNil( fsFSBuffer );
  {$ELSE}
    {$I-}
    try
      CloseFile( fsArqBuf ) ;
    except
    end ;
    {$I+}
  {$ENDIF}

  inherited Desativar ;
end;

function TACBrECFVirtualBufferClass.EnviaComando_ECF(cmd : AnsiString
  ) : AnsiString ;
begin
  cmd := AjustaLinhaColunas(cmd) ;
  Imprimir( cmd );

  fpComandoEnviado := cmd ;
  Result           := cmd ;
end;

function TACBrECFVirtualBufferClass.GetSubModeloECF: String;
begin
  Result := 'VirtualBuffer' ;
end;

function TACBrECFVirtualBufferClass.GetNumVersao: String ;
begin
  Result := ACBrECFVirtualBuffer_VERSAO ;
end;

function TACBrECFVirtualBufferClass.GetCliche : AnsiString ;
Var
  A : Integer ;
begin
  Result := '' ;
  For A := 0 to fsCabecalho.Count - 1 do
    Result := Result + PadCenter(fsCabecalho[A], Colunas) + CRLF;
end ;

procedure TACBrECFVirtualBufferClass.AbreBuffer ;
Var
  NomeArqBuffer : String ;
  Mode: Word;
begin
  NomeArqBuffer := ChangeFileExt( NomeArqINI, '.buf') ;

  {$IFDEF Use_Stream}
    if FileExists( NomeArqBuffer ) then
    begin
      fsBuffer.LoadFromFile( NomeArqBuffer );
      Mode := fmOpenReadWrite;
    end
    else
      Mode := fmCreate;

    fsFSBuffer := TFileStream.Create( NomeArqBuffer, Mode or fmShareDenyWrite );
    fsFSBuffer.Seek(0, soFromEnd);  // vai para EOF
  {$ELSE}
    AssignFile( fsArqBuf, NomeArqBuffer );
    FileMode := fmOpenReadWrite + fmShareExclusive ;

    try
      if FileExists( NomeArqBuffer ) then
      begin
        fsBuffer.LoadFromFile( NomeArqBuffer );
        Reset( fsArqBuf );
        if not SeekEof( fsArqBuf ) then
          raise EACBrECFERRO.Create(ACBrStr('Erro ao posicionar em EOF no arquivo: ')+
                                    NomeArqBuffer) ;
      end
      else
        ReWrite( fsArqBuf );
    except
      try
        {$I-}
        CloseFile( fsArqBuf );
        IOResult;
        {$I+}
      except
      end ;

      raise ;
    end ;
  {$ENDIF}
end;

procedure TACBrECFVirtualBufferClass.GravaBuffer ;
var
  A : Integer ;
  Buffer: String;
begin
  {$IFDEF Use_Stream}
    if not Assigned( fsFSBuffer ) then
      exit;
  {$ENDIF}

  For A := 0 to fsBuffer.Count - 1 do
  begin
    Buffer := fsBuffer[A];

    {$IFDEF Use_Stream}
      Buffer := Buffer + sLineBreak;
      fsFSBuffer.Write(Pointer(Buffer)^,Length(Buffer));
    {$ELSE}
      Writeln( fsArqBuf, Buffer ) ;
    {$ENDIF}
  end ;
end ;

procedure TACBrECFVirtualBufferClass.SetCabecalho(AValue: TStringList);
begin
  fsCabecalho.Assign( AValue );
end;

procedure TACBrECFVirtualBufferClass.SetCabecalhoItem(AValue: TStringList);
begin
  fsCabecalhoItem.Assign( AValue );
end;

procedure TACBrECFVirtualBufferClass.ZeraBuffer ;
begin
  {$IFDEF Use_Stream}
    if Assigned( fsFSBuffer ) then
      fsFSBuffer.Size := 0;
  {$ELSE}
    Rewrite( fsArqBuf ) ;
  {$ENDIF}
  fsBuffer.Clear ;
end ;

procedure TACBrECFVirtualBufferClass.ImprimeBuffer ;
begin
  Imprimir( fsBuffer );
  ZeraBuffer ;
end ;

procedure TACBrECFVirtualBufferClass.AddBufferRelatorio;
Var
  TotalAliq, BrutaDia : Double;
  A : Integer ;
begin
  TotalAliq := 0 ;
  BrutaDia  := 0 ;
  if fpAliquotas.Count > 2 then
  begin
    For A := 0 to 2 do
      with fpAliquotas[A] do
        TotalAliq := RoundTo(TotalAliq + Total,-2) ;
  end;

  with fsBuffer do
  begin
    Add( '</linha_simples>' ) ;
    Add( PadCenter(' Contadores ',Colunas,'-') ) ;
    Add( PadSpace('Reducoes Z:|'+IntToStrZero(fpReducoesZ,4),Colunas,'|') ) ;
    Add( PadSpace('Leitura  X:|'+IntToStrZero(fpLeiturasX,6),Colunas,'|') ) ;
    Add( PadSpace('Cancelamentos de Cupom:|'+IntToStrZero(fpCuponsCancelados,6), Colunas,'|') ) ;
    Add( PadSpace('COO do Primeiro Cupom:|'+IntToStrZero(fpCOOInicial,6), Colunas,'|') ) ;
    Add( PadSpace('COO do Ultimo Cupom:|'+IntToStrZero(fpCOOFinal,6),Colunas,'|'));
    Add( PadSpace('Relatorios Gerenciais:|'+IntToStrZero(fpNumCER,6),Colunas,'|') ) ;
    Add( PadCenter(' Totalizadores ',Colunas,'-') ) ;
    Add( PadSpace('Totalizador Geral:|'+FormatFloat('###,###,##0.00', fpGrandeTotal ),Colunas,'|') ) ;

    For A := 0 To fpAliquotas.Count - 1 do
      BrutaDia := RoundTo(BrutaDia + fpAliquotas[A].Total, -2);

    Add( PadSpace('Venda Bruta Diaria:|'+FormatFloat('###,###,##0.00', BrutaDia), Colunas, '|'));

    Add( PadCenter('Total Vendido por Aliquota',Colunas,'-') ) ;
    Add( PadSpace('Substituicao Tributaria (FF)|'+FormatFloat('###,###,##0.00', fpAliquotas[0].Total ), Colunas,'|') ) ;
    Add( PadSpace('Isencao (II)|'+FormatFloat('###,###,##0.00', fpAliquotas[1].Total ), Colunas,'|') ) ;
    Add( PadSpace('Nao Incidencia (NN)|'+FormatFloat('###,###,##0.00', fpAliquotas[2].Total ), Colunas,'|') ) ;

    For A := 3 to fpAliquotas.Count - 1 do
    begin
      with fpAliquotas[A] do
      begin
        Add( PadSpace(IntToStrZero(A,2)+'|'+ Tipo + FormatFloat('#0.00',Aliquota)+'%|'+
             FormatFloat('###,###,##0.00',Total),Colunas,'|') ) ;
        TotalAliq := RoundTo(TotalAliq + Total,-2) ;
      end ;
    end;

    Add( PadSpace('Total Cancelado R$|'+FormatFloat('###,###,##0.00', fpCuponsCanceladosTotal), Colunas,'|') ) ;
    Add( PadSpace('T O T A L   R$|'+FormatFloat('###,###,##0.00',TotalAliq), Colunas,'|') ) ;


    Add( PadCenter(' Relatorio Gerencial ',Colunas,'-') ) ;

    For A := 0 to fpRelatoriosGerenciais.Count - 1 do
    begin
      with fpRelatoriosGerenciais[A] do
      begin
        Add( PadSpace(Indice+'  '+PadRight(Descricao,20)+'|'+
             IntToStrZero(Contador, 5), Colunas,'|') ) ;
      end ;
    end;

    Add( PadCenter('Formas de Pagamento',Colunas,'-') ) ;

    For A := 0 to fpFormasPagamentos.Count - 1 do
    begin
      with fpFormasPagamentos[A] do
      begin
        Add( PadSpace(Indice+'  '+PadRight(Descricao,20)+'|'+
             FormatFloat('###,###,##0.00',Total), Colunas,'|') ) ;
      end ;
    end ;

    Add( PadCenter('Comprovantes nao Fiscal',Colunas,'-') ) ;
    For A := 0 to fpComprovantesNaoFiscais.Count - 1 do
    begin
      with fpComprovantesNaoFiscais[A] do
      begin
        Add( PadSpace(Indice+'  '+PadRight(Descricao,20)+'|'+
             FormatFloat('###,###,##0.00',Total), Colunas,'|') ) ;
      end ;
    end ;
  end ;

  AddBufferRodape ;
end;

procedure TACBrECFVirtualBufferClass.InsertBufferCabecalho;
Var
  A : Integer ;
  V, Linha : AnsiString ;
begin
  if fpVerao then
    V := 'V'
  else
    V := ' ' ;

  For A := 0 to fsCabecalho.Count - 1 do
  begin
    Linha := PadCenter(fsCabecalho[A], Colunas) ;
    if A = 0 then
      Linha := '</zera></ce></logo>'+ Linha ;

    fsBuffer.Insert( A, Linha ) ;
  end ;

  fsBuffer.Insert( fsCabecalho.Count,
                   PadSpace('CNPJ: '+CNPJ+'|IE: '+IE, Colunas, '|') );

  fsBuffer.Insert( fsCabecalho.Count+1,
                   PadSpace( DateToStr(now)+' '+TimeToStr(now)+V+'|COO:'+
                   IntToStrZero(fpNumCupom,6), Colunas, '|' ) ) ;
end;

procedure TACBrECFVirtualBufferClass.AddBufferCabecalho_Item;
Var
  A : Integer ;
begin
  fsBuffer.Add( PadCenter('COMPROVANTE  * NAO FISCAL *',Colunas) ) ;

  For A := 0 to fsCabecalhoItem.Count - 1 do
    fsBuffer.Add( fsCabecalhoItem[A] ) ;
end;

procedure TACBrECFVirtualBufferClass.AddBufferRodape;
Var
  V : AnsiString ;
  SL : TStringList;
begin
  if fpPAF <> '' then
  begin
    SL := TStringList.Create;
    try
      SL.Text := StringReplace(fpPAF,'|',sLineBreak,[rfReplaceAll]);
      fsBuffer.AddStrings( SL );
    finally
      SL.Free
    end ;
  end ;

  if fpVerao then
    V := 'V'
  else
    V := ' ' ;

//....+....1....+....2....+....3....+....4....+...
//N.Serie XXXXXXXXXXXXXXX Maq 999 v0.8.3b
//Oper. XXXXXXXXXXXXXXX 99/99/99 99:99:99V
//** N A O   E   C U P O M   F I S C A L **
  with fsBuffer do
  begin
    Add( '</linha_simples>' ) ;
    Add( PadSpace('N.Serie '+PadRight(fpNumSerie,21)+'|Maq '+GetNumECF+'|'+
              'v'+NumVersao,Colunas,'|') );
    Add( PadSpace('Oper. '+PadRight(Operador,15)  +'|'+
              FormatDateTime('dd/mm/yy hh:nn:ss',now)+V,  Colunas,'|') );
    Add( PadCenter('** N A O   E   C U P O M   F I S C A L **',Colunas) );
    Add( '</linha_dupla>' ) ;

    Add('</corte_total>'); // Corte total j� pula linhas
  end ;
end;

procedure TACBrECFVirtualBufferClass.AddBufferLinhas(AString: AnsiString);
var
  Linhas: TStringList;
begin
  if NaoEstaVazio(AString) then
  begin
    Linhas := TStringList.Create;
    try
      Linhas.Text := AjustaLinhaColunas(AString);
      fsBuffer.AddStrings( Linhas );
    finally
      Linhas.Free;
    end;
  end;
end;

function TACBrECFVirtualBufferClass.AjustaLinhaColunas(Linha: AnsiString
  ): AnsiString;
begin
  Result := AjustaLinhas( Linha, Colunas );
  Result := StringReplace( Result, #10, sLineBreak, [rfReplaceAll] ) ;
end;

function TACBrECFVirtualBufferClass.ColunasExpandido: Integer;
begin
  Result := Trunc(Colunas / 2);
end;

procedure TACBrECFVirtualBufferClass.AbreDocumentoVirtual;
begin
  InsertBufferCabecalho ;
  GravaBuffer ;
  ImprimeBuffer;
end;

procedure TACBrECFVirtualBufferClass.EnviaConsumidorVirtual;
begin
  if Consumidor.Documento <> '' then
  begin
    fsBuffer.Add( '</linha_simples>' ) ;
    fsBuffer.Add(PadRight('CPF/CNPJ consumidor: '+Consumidor.Documento,Colunas)) ;

    if Consumidor.Nome <> '' then
      fsBuffer.Add(PadRight('Nome: '+Consumidor.Nome,Colunas)) ;

    if Consumidor.Endereco <> '' then
      fsBuffer.Add(PadRight('Endereco: '+Consumidor.Endereco,Colunas)) ;

    fsBuffer.Add( '</linha_simples>' ) ;

    Consumidor.Enviado := True ;
  end ;
end;

procedure TACBrECFVirtualBufferClass.CancelaItemVendidoVirtual(NumItem: Integer);
begin
  ZeraBuffer;
  fsBuffer.Add( 'CANCELADO ITEM: '+IntToStrZero( NumItem,3) ) ;
  ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.SubtotalizaCupomVirtual(
  DescontoAcrescimo: Double; MensagemRodape: AnsiString);
var
  S: String;
begin
  ZeraBuffer;
  if DescontoAcrescimo <> 0 then
  begin
    if DescontoAcrescimo < 0 then
      S := 'Desconto '
    else
      S := 'Acrescimo' ;

    fsBuffer.Add( PadSpace('SUBTOTAL   R$|'+
                  FormatFloat('#,###,##0.00',SubTotal), Colunas,'|') ) ;
    fsBuffer.Add( PadSpace(S+'  R$|'+FormatFloat('#,###,##0.00',DescontoAcrescimo),
                       Colunas,'|') ) ;
  end ;

  fsBuffer.Add(  '<e>' +
                 PadSpace( 'TOTAL  R$|'+
                           FormatFloat('#,###,##0.00', SubTotal+DescontoAcrescimo),
	                   ColunasExpandido() ,'|') + '</e>' ) ;
  ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.EfetuaPagamentoVirtual(
  Pagto: TACBrECFVirtualClassPagamentoCupom);
var
  FPG: TACBrECFFormaPagamento;
  Troco: Double;
  Obs: String;
begin
  ZeraBuffer;
  FPG := fpFormasPagamentos[ Pagto.PosFPG ] ;

  fsBuffer.Add( PadSpace(FPG.Descricao+'|'+
                FormatFloat('#,###,##0.00', Pagto.ValorPago), Colunas,'|') ) ;

  Obs := Pagto.Observacao;
  while Obs <> '' do
  begin
    fsBuffer.Add( copy(Obs, 1, Colunas) ) ;
    Obs := copy(Obs, Colunas + 1, length(Obs) ) ;
  end ;

  if TotalPago >= SubTotal then   { Ultrapassou o Valor do Cupom }
  begin
    if fpPagamentosCupom.Count > 0 then
      fsBuffer.Add( PadSpace('SOMA  R$|'+FormatFloat('#,###,##0.00', TotalPago), Colunas, '|') );

     if TotalPago > SubTotal then  { Tem TROCO ? }
     begin
        Troco  := RoundTo(TotalPago - SubTotal,-2) ;
        fsBuffer.Add( '<e>' +
                      PadSpace( 'TROCO  R$|'+
                               FormatFloat('#,###,##0.00',Troco),
		               ColunasExpandido() ,'|' ) + '</e>' ) ;
     end ;
  end ;

  ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.FechaCupom(Observacao: AnsiString; IndiceBMP : Integer);
begin
  ZeraBuffer;
  inherited FechaCupom(Observacao, IndiceBMP);
end;

procedure TACBrECFVirtualBufferClass.FechaCupomVirtual(Observacao: AnsiString;
  IndiceBMP: Integer);
begin
  fsBuffer.Add( AjustaLinhaColunas(Observacao) ) ;
  AddBufferRodape ;

  ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.CancelaCupomVirtual;
begin
  ZeraBuffer;
  fsBuffer.Add( '<e>' +
		PadCenter('*** CUPOM CANCELADO ***', ColunasExpandido() ) +
                '</e>' ) ;

  case Estado of
    estVenda :
      begin
        fsBuffer.Insert(0, '<e>' +
                           PadSpace('TOTAL  R$|'+FormatFloat('#,###,##0.00',Subtotal),
                           ColunasExpandido(), '|') +
                           '</e>' ) ;
        AddBufferRodape ;
      end ;

    estPagamento, estNaoFiscal :
      AddBufferRodape ;
  else
    begin
      InsertBufferCabecalho;

      fsBuffer.Add( PadSpace('COO do Cupom Cancelado:|'+IntToStrZero(StrToInt(NumCupom)-1,6),
                         Colunas,'|') ) ;
      fsBuffer.Add( PadSpace('Valor da Operacao  R$:|'+
                         FormatFloat('#,###,##0.00',Subtotal),Colunas,'|') );
      fsBuffer.Add( '' ) ;
      fsBuffer.Add( 'Nome do Consumidor:' ) ;
      fsBuffer.Add( '' ) ;
      fsBuffer.Add( 'Telefone do Cosumidor:' ) ;
      fsBuffer.Add( '' ) ;

      AddBufferRodape ;
    end ;
  end;

  GravaBuffer ;
  ImprimeBuffer;
end;

procedure TACBrECFVirtualBufferClass.INItoClass( ConteudoINI: TStrings ) ;
begin
  inherited INItoClass( ConteudoINI ) ;

  ZeraBuffer;
end ;

procedure TACBrECFVirtualBufferClass.Imprimir(AString : AnsiString) ;
begin
  { ACBrECFVirtualBuffer n�o tem impress�o, sobrescrever nas classes filhas }
end ;

procedure TACBrECFVirtualBufferClass.Imprimir(AStringList : TStringList) ;
Var
  A, L: Integer ;
  Buf : AnsiString ;
begin
  AguardandoResposta := True ;
  try
    if MaxLinhasBuffer < 1 then
      Imprimir( AStringList.Text )
    else
    begin
      Buf := '' ;
      L   := 0 ;
      For A := 0 to AStringList.Count - 1 do
      begin
        Buf := Buf + AStringList[A] + CRLF ;
        Inc( L );

        if L >= MaxLinhasBuffer then
        begin
          Imprimir( Buf );
          Buf := '';
          L   := 0 ;
        end;
      end;
    end;

    if Buf <> '' then
    begin
      Imprimir( Buf );
      Buf := '';
    end;
  finally
    AguardandoResposta := False ;
  end ;
end ;

procedure TACBrECFVirtualBufferClass.AbreCupom ;
begin
  ZeraBuffer ;
  AddBufferCabecalho_Item ;

  inherited ;
end;

procedure TACBrECFVirtualBufferClass.VendeItemVirtual(
  ItemCupom: TACBrECFVirtualClassItemCupom);
var
  Aliq: TACBrECFAliquota;
  Linha, AliqStr, StrQtd, StrPreco, StrDescAcre : String;
  Total, PorcDesc : Double;
begin
  Aliq := fpAliquotas[ ItemCupom.PosAliq ];

  if Aliq.Aliquota > 0 then
    AliqStr := PadCenter(Aliq.Tipo + FormatFloat('#0.00',Aliq.Aliquota)+'%',7)
  else
    AliqStr := PadCenter(Aliq.Indice,7) ;

  if ItemCupom.Qtd = Round( ItemCupom.Qtd ) then
    StrQtd := FormatFloat('#######0', ItemCupom.Qtd )
  else
    StrQtd := FormatFloat('###0.000', ItemCupom.Qtd ) ;

  if RoundTo( ItemCupom.ValorUnit, -2 ) = ItemCupom.ValorUnit then
    StrPreco := FormatFloat('#####0.00', ItemCupom.ValorUnit )
  else
    StrPreco := FormatFloat('####0.000', ItemCupom.ValorUnit ) ;

  Total   := RoundABNT( ItemCupom.Qtd * ItemCupom.ValorUnit, -2) ;
  PorcDesc:= 0 ;
  StrDescAcre := '';
  if ItemCupom.DescAcres <> 0 then
  begin
    PorcDesc := abs( ItemCupom.DescAcres ) / Total * 100  ;

    if ItemCupom.DescAcres > 0 then
      StrDescAcre := 'ACRESCIMO'
    else
      StrDescAcre := 'DESCONTO' ;
  end ;

  with ItemCupom do
  begin
    Linha := fsMascaraItem ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'I', IntToStrZero(Sequencia,3)) ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'C', Codigo ) ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'D', Descricao ) ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'Q', StrQtd ) ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'U', Unidade ) ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'V', StrPreco ) ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'A', AliqStr ) ;
    Linha := StuffMascaraItem( Linha, fsMascaraItem, 'T', FormatFloat('###,##0.00', Total ), True ) ;
  end;

  ZeraBuffer;

  { Quebrando a linha pela COLUNA }
  Linha := Trim( Linha ) ;
  while Linha <> '' do
  begin
    fsBuffer.Add( copy(Linha,1,Colunas) ) ;
    Linha := copy(Linha,Colunas + 1, Length(Linha) ) ;
  end ;

  if StrDescAcre <> '' then
  begin
    Total := RoundTo(Total + ItemCupom.DescAcres, -2) ;
    fsBuffer.Add( PadSpace('|'+StrDescAcre+'|'+FormatFloat('#0.00', PorcDesc)+'%|R$ '+
                  FormatFloat('##,##0.00', ItemCupom.DescAcres)+'|'+
                  FormatFloat('###,##0.00',Total),Colunas,'|') ) ;
  end ;

  ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.LeituraX ;
begin
  ZeraBuffer;
  inherited;
end;

procedure TACBrECFVirtualBufferClass.LeituraXSerial(Linhas: TStringList);
begin
  InsertBufferCabecalho ;
  LeituraXVirtual;
  Linhas.Assign(fsBuffer);
end;

procedure TACBrECFVirtualBufferClass.LeituraXVirtual;
begin
  fsBuffer.Add( '<e>' +
                PadCenter('LEITURA X', ColunasExpandido() ) +
                '</e>' );

  AddBufferRelatorio ;
end;

procedure TACBrECFVirtualBufferClass.ReducaoZ(DataHora : TDateTime) ;
begin
  ZeraBuffer;
  inherited;
end;

procedure TACBrECFVirtualBufferClass.ReducaoZVirtual(DataHora: TDateTime);
begin
  fsBuffer.Add( '<e>' +
                PadCenter('REDUCAO Z', ColunasExpandido() ) +
                '</e>' );

  AddBufferRelatorio ;
end;

procedure TACBrECFVirtualBufferClass.LinhaRelatorioGerencial(Linha: AnsiString; IndiceBMP: Integer);
begin
  Imprimir( AjustaLinhaColunas(Linha) );
end;

procedure TACBrECFVirtualBufferClass.LinhaCupomVinculado(Linha: AnsiString);
begin
  LinhaRelatorioGerencial( Linha );
end;

procedure TACBrECFVirtualBufferClass.CortaPapel(const CorteParcial : Boolean) ;
begin
  if CorteParcial Then
    Imprimir( '</corte_parcial>' )
  else
    Imprimir( '</corte_total>' ) ;

  Sleep(100);
end ;

procedure TACBrECFVirtualBufferClass.AbreNaoFiscalVirtual(CPF_CNPJ: String;
  Nome: String; Endereco: String);
begin
  ZeraBuffer;
  CPF_CNPJ := trim(CPF_CNPJ) ;
  if CPF_CNPJ <> '' then
  begin
     fsBuffer.Add( '</linha_simples>' ) ;
     fsBuffer.Add(PadRight('CPF/CNPJ Consumidor: '+CPF_CNPJ,Colunas)) ;
     if Nome <> '' then
        fsBuffer.Add(PadRight('Nome: '+Nome,Colunas)) ;
     if Endereco <> '' then
        fsBuffer.Add(PadRight('Endereco: '+Endereco,Colunas)) ;
     fsBuffer.Add( '</linha_simples>' ) ;
  end ;
end;

procedure TACBrECFVirtualBufferClass.RegistraItemNaoFiscalVirtual(
  CNF: TACBrECFComprovanteNaoFiscal; Valor: Double; Obs: AnsiString);
begin
  ZeraBuffer ;
  fsBuffer.Add( PadSpace( IntToStrZero(fpCNFCupom.Count + 1,3) +'|'+
                      CNF.Descricao +'|'+
                      FormatFloat('#,###,##0.00',Valor), Colunas, '|'  ) ) ;

  AddBufferLinhas( Obs );
  ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.AbreRelatorioGerencialVirtual(Indice: Integer);
begin
  ZeraBuffer ;
  fsBuffer.Add( PadSpace('GNF:'+IntToStrZero(fpNumGNF,6) +'|'+
                'GRG:'+IntToStrZero(fpNumGRG,6), Colunas, '|') ) ;
  fsBuffer.Add( '</linha_simples>' ) ;
  fsBuffer.Add( PadCenter('NAO E DOCUMENTO FISCAL',Colunas) ) ;

  fsBuffer.Add( '<e>' +
		PadCenter('RELATORIO GERENCIAL', ColunasExpandido() ) +
                '</e>' );
  fsBuffer.Add( '' ) ;
end;

procedure TACBrECFVirtualBufferClass.AbreCupomVinculadoVirtual(COO: String;
  FPG: TACBrECFFormaPagamento; CodComprovanteNaoFiscal: String;
  SubtotalCupomAnterior, ValorFPG: Double);
begin
  ZeraBuffer ;
  fsBuffer.Add( PadCenter('GNF:'+IntToStrZero(fpNumGNF,6) +'         '+
                'CDC:'+IntToStrZero(fpNumCDC,6),Colunas) ) ;
  fsBuffer.Add( '' ) ;
  fsBuffer.Add( PadCenter('COMPROVANTE NAO FISCAL VINCULADO',Colunas) ) ;
  fsBuffer.Add( '' ) ;
  fsBuffer.Add( PadSpace('COO do documento de compra:|' + COO, Colunas,'|') ) ;
  fsBuffer.Add( PadSpace('VALOR TOTAL DA COMPRA   R$:|'+
                FormatFloat('##,###,##0.00',SubtotalCupomAnterior),Colunas,'|') ) ;
  fsBuffer.Add( PadSpace(PadRight(FPG.Descricao,23)+' R$:|'+
                FormatFloat('##,###,##0.00',ValorFPG),Colunas,'|') ) ;
  fsBuffer.Add( '' ) ;
end;

procedure TACBrECFVirtualBufferClass.FechaRelatorioVirtual;
begin
  ZeraBuffer ;
  AddBufferRodape ;
  ImprimeBuffer ;
end;

procedure TACBrECFVirtualBufferClass.AbreGaveta ;
begin
  Imprimir( '</abre_gaveta>' );
end ;

end.

