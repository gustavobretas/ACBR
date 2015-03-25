////////////////////////////////////////////////////////////////////////////////
//                                                                            //
//              PCN - Projeto Cooperar NFe                                    //
//                                                                            //
//   Descri��o: Classes para gera��o/leitura dos arquivos xml da NFe          //
//                                                                            //
//        site: www.projetocooperar.org/nfe                                   //
//       email: projetocooperar@zipmail.com.br                                //
//       forum: http://br.groups.yahoo.com/group/projeto_cooperar_nfe/        //
//     projeto: http://code.google.com/p/projetocooperar/                     //
//         svn: http://projetocooperar.googlecode.com/svn/trunk/              //
//                                                                            //
// Coordena��o: (c) 2009 - Paulo Casagrande                                   //
//                                                                            //
//      Equipe: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//      Vers�o: Vide o arquivo leiame.txt na pasta raiz do projeto            //
//                                                                            //
//     Licen�a: GNU Lesser General Public License (GNU LGPL)                  //
//                                                                            //
//              - Este programa � software livre; voc� pode redistribu�-lo    //
//              e/ou modific�-lo sob os termos da Licen�a P�blica Geral GNU,  //
//              conforme publicada pela Free Software Foundation; tanto a     //
//              vers�o 2 da Licen�a como (a seu crit�rio) qualquer vers�o     //
//              mais nova.                                                    //
//                                                                            //
//              - Este programa � distribu�do na expectativa de ser �til,     //
//              mas SEM QUALQUER GARANTIA; sem mesmo a garantia impl�cita de  //
//              COMERCIALIZA��O ou de ADEQUA��O A QUALQUER PROP�SITO EM       //
//              PARTICULAR. Consulte a Licen�a P�blica Geral GNU para obter   //
//              mais detalhes. Voc� deve ter recebido uma c�pia da Licen�a    //
//              P�blica Geral GNU junto com este programa; se n�o, escreva    //
//              para a Free Software Foundation, Inc., 59 Temple Place,       //
//              Suite 330, Boston, MA - 02111-1307, USA ou consulte a         //
//              licen�a oficial em http://www.gnu.org/licenses/gpl.txt        //
//                                                                            //
//    Nota (1): - Esta  licen�a  n�o  concede  o  direito  de  uso  do nome   //
//              "PCN  -  Projeto  Cooperar  NFe", n�o  podendo o mesmo ser    //
//              utilizado sem previa autoriza��o.                             //
//                                                                            //
//    Nota (2): - O uso integral (ou parcial) das units do projeto esta       //
//              condicionado a manuten��o deste cabe�alho junto ao c�digo     //
//                                                                            //
////////////////////////////////////////////////////////////////////////////////
{******************************************************************************
|* Historico
|*
|* 30/09/2010: Italo
|*  - Inclu�do tipo TcDe6
******************************************************************************}

{$I ACBr.inc}

unit pcnLeitor;

interface

uses
  SysUtils, Classes,
{$IFNDEF VER130}
  Variants,
{$ENDIF}
  pcnAuxiliar, pcnConversao;

type

  TLeitor = class(TPersistent)
  private
    FArquivo: AnsiString;
    FGrupo: AnsiString;
    FNivel: TStringList;
  public
    constructor Create;
    destructor Destroy; override;
    function rExtrai(const nivel: integer; const TagInicio: string; TagFim: string = ''; const item: integer = 1): AnsiString;
    function rCampo(const Tipo: TpcnTipoCampo; TAG: string; TAGparada: string = ''): variant;
    function rCampoCNPJCPF(TAGparada: string = ''): string;
    function rAtributo(Atributo: string): variant;
    function CarregarArquivo(const CaminhoArquivo: string): boolean; overload;
    function CarregarArquivo(const Stream: TStringStream): boolean; overload;
    function PosLast(const SubStr, S: AnsiString ): Integer;    
  published
    property Arquivo: AnsiString read FArquivo write FArquivo;
    property Grupo: AnsiString read FGrupo write FGrupo;
  end;

implementation

uses
  ACBrConsts, ACBrUtil;

{ TLeitor }

constructor TLeitor.Create;
var
  i: integer;
begin
  inherited Create;
  FNivel := TStringList.Create;
  for i := 1 to 10 do
    FNivel.add('');
end;

destructor TLeitor.Destroy;
begin
  FNivel.Free;
  inherited;
end;

function TLeitor.CarregarArquivo(const CaminhoArquivo: string): boolean;
var
  ArquivoXML: TStringList;
begin
  //NOTA: Carrega o arquivo xml na mem�ria para posterior leitura de sua tag's
  Result := False;
  ArquivoXML := TStringList.Create;
  try
    ArquivoXML.LoadFromFile(CaminhoArquivo);
    FArquivo := ArquivoXML.Text; // .ToString;
    Result := True;
  finally
    ArquivoXML.Free;
  end;
end;

function TLeitor.CarregarArquivo(const Stream: TStringStream): boolean;
begin
  //NOTA: Carrega o arquivo xml na mem�ria para posterior leitura de sua tag's
  FArquivo := Stream.DataString;
  Result := True;
end;

function TLeitor.rExtrai(const nivel: integer; const TagInicio: string; TagFim: string = ''; const item: integer = 1): AnsiString;
var
  Texto: AnsiString;
  i,j: integer;
begin
  //NOTA: Extrai um grupo de dentro do nivel informado
  FNivel.strings[0] := FArquivo;
  if Trim(TagFim) = '' then
    TagFim := TagInicio;
  Texto := FNivel.Strings[nivel - 1];
  Result := '';
  FGrupo := '';
  for i := 1 to item do
    if i < item then
      Texto := copy(Texto, pos('</' + Trim(TagFim) + '>', Texto) + length(Trim(TagFim)) + 3, maxInt);

  j := pos('</' + Trim(TagFim) + '>', Texto);
  if j = 0 then
    j := pos('</' + Trim(TagFim) + ':', Texto); // Corre��o para WebServices do Cear�/MG

  //Corre��o para leitura de tags em que a primeira � diferente da segunda Ex: <infProt id=XXX> e a segunda apenas <infProt>
//  Texto := copy(Texto, 1, pos('</' + Trim(TagFim) + '>', Texto) + length(Trim(TagFim)) + 3);
  Texto := copy(Texto, 1, j + length(Trim(TagFim)) + 3);

  i := pos('<' + Trim(TagInicio) + '>', Texto);
  if i = 0 then
    i := pos('<' + Trim(TagInicio) + ' ', Texto);
  if i = 0 then
    i := pos('<' + Trim(TagInicio) + ':', Texto); //corre��o para webservice do Cear�
  if i = 0 then
    exit;
  Texto := copy(Texto, i, maxInt);

  // Alterado por Claudemir em 13/03/2013: j:=pos('</' + Trim(TagFim) + '>',Texto);
//  j:=pos('</' + Trim(TagFim) + '>', Texto) + length(Trim(TagFim)) + 3;
  j:=pos('</' + Trim(TagFim) + '>', Texto);

  if j=0 then
   j:=pos('</' + Trim(TagFim) + ':', Texto); //corre��o para webservice do Cear�

//  Result := TrimRight(copy(Texto, 1, j - 1));
  Result := TrimRight(copy(Texto, 1, j - 1 + (length(Trim(TagFim)) + 3)));
  FNivel.strings[nivel] := Result;
  FGrupo := result;
end;

function TLeitor.rCampoCNPJCPF(TAGparada: string = ''): string;
begin
  result := rCampo(tcStr, 'CNPJ', TAGparada);
  if trim(result) = '' then
    result := rCampo(tcStr, 'CPF', TAGparada);
end;

function TLeitor.rCampo(const Tipo: TpcnTipoCampo; TAG: string; TAGparada: string = ''): variant;
var
  ConteudoTag: string;
  inicio, fim, inicioTAGparada: integer;
begin
  Tag := UpperCase(Trim(TAG));
  inicio := pos('<' + Tag + '>', UpperCase(FGrupo));

  if Trim(TAGparada) <> '' then
   begin
    inicioTAGparada := pos('<' + UpperCase(Trim(TAGparada)) + '>', UpperCase(FGrupo));
    if inicioTAGparada = 0 then
      inicioTAGparada := inicio;
   end
   else
    inicioTAGparada := inicio;

  if (inicio = 0) or (InicioTAGparada < inicio) then
    ConteudoTag := ''
  else
  begin
    inicio := inicio + Length(Tag) + 2;
    fim := pos('</' + Tag + '>', UpperCase(FGrupo)) - inicio;
    ConteudoTag := trim(copy(FGrupo, inicio, fim));
  end;
  case Tipo of
    tcStr     : result := ReverterFiltroTextoXML(ConteudoTag);
    tcDat     : begin
                  if length(ConteudoTag)>0 then
                    result := EncodeDate(StrToInt(copy(ConteudoTag, 01, 4)), StrToInt(copy(ConteudoTag, 06, 2)), StrToInt(copy(ConteudoTag, 09, 2)))
                  else
                    result:=0;
                  end;
    tcDatVcto : begin
                  if length(ConteudoTag)>0 then
                    result := EncodeDate(StrToInt(copy(ConteudoTag, 07, 4)), StrToInt(copy(ConteudoTag, 03, 2)), StrToInt(copy(ConteudoTag, 01, 2)))
                  else
                    Result:= 0;
                end;
    tcDatCFe  : begin
                  if length(ConteudoTag)>0 then
                    result := EncodeDate(StrToInt(copy(ConteudoTag, 01, 4)), StrToInt(copy(ConteudoTag, 05, 2)), StrToInt(copy(ConteudoTag, 07, 2)))
                  else
                    result:=0;
                  end;
    tcDatHor  : begin
                    if length(ConteudoTag)>0 then
                      result := EncodeDate(StrToInt(copy(ConteudoTag, 01, 4)), StrToInt(copy(ConteudoTag, 06, 2)), StrToInt(copy(ConteudoTag, 09, 2))) +
                      EncodeTime(StrToInt(copy(ConteudoTag, 12, 2)), StrToInt(copy(ConteudoTag, 15, 2)), StrToInt(copy(ConteudoTag, 18, 2)), 0)
                    else
                      result:=0;
                  end;
    tcHor     : begin
                    if length(ConteudoTag)>0 then
                    result := EncodeTime(StrToInt(copy(ConteudoTag, 1, 2)), StrToInt(copy(ConteudoTag, 4, 2)), StrToInt(copy(ConteudoTag, 7, 2)), 0)
                    else
                    result:=0;
                  end;
    tcHorCFe  : begin
                    if length(ConteudoTag)>0 then
                    result := EncodeTime(StrToInt(copy(ConteudoTag, 1, 2)), StrToInt(copy(ConteudoTag, 3, 2)), StrToInt(copy(ConteudoTag, 5, 2)), 0)
                    else
                    result:=0;
                  end;
    tcDe2,
    tcDe3,
    tcDe4,
    tcDe6,
    tcDe10    : result := StringToFloatDef(ConteudoTag, 0);
    tcEsp     : result := ConteudoTag;
    tcInt     : result := StrToIntDef(Trim(SomenteNumeros(ConteudoTag)),0);
    else
      raise Exception.Create('Tag <' + Tag + '> com conte�do inv�lido. '+ConteudoTag);
  end;
end;

function TLeitor.rAtributo(Atributo: string): variant;
var
  ConteudoTag, Aspas: string;
  inicio, fim: integer;
begin
  Result := '';
  Atributo := Trim(Atributo);
  inicio   := pos(Atributo, FGrupo);
  if inicio > 0 then
  begin
     inicio := inicio + Length(Atributo);
    ConteudoTag := trim(copy(FGrupo, inicio, maxInt));

    if Pos('"', ConteudoTag) <> 0 then
      Aspas := '"'
     else
      Aspas := '''';

    inicio := pos(Aspas, ConteudoTag) + 1;
    if inicio > 0 then
    begin
      ConteudoTag := trim(copy(ConteudoTag, inicio, maxInt));
      fim := pos(Aspas, ConteudoTag) - 1;
      if fim > 0 then
      begin
        ConteudoTag := copy(ConteudoTag, 1, fim);
        result := ReverterFiltroTextoXML(ConteudoTag)
      end
    end ;
  end ;
end;

function TLeitor.PosLast(const SubStr, S: AnsiString ): Integer;
Var P : Integer ;
begin
  Result := 0 ;
  P := Pos( SubStr, S) ;
  while P <> 0 do
  begin
     Result := P ;
     P := RetornarPosEx( SubStr, S, P+1) ;
  end ;
end ;

end.

