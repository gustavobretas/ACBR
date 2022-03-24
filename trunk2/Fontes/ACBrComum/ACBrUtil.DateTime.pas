{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2020 Daniel Simoes de Almeida               }
{                                                                              }
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
{                                                                              }
{  Algumas fun�oes dessa Unit foram extraidas de outras Bibliotecas, veja no   }
{ cabe�alho das Fun�oes no c�digo abaixo a origem das informa�oes, e autores...}
{                                                                              }
{******************************************************************************}

{$I ACBr.inc}

{$IFDEF FPC}
 {$IFNDEF NOGUI}
  {$DEFINE USE_LCLIntf}
 {$ENDIF}
{$ENDIF}

unit ACBrUtil.DateTime;

interface

Uses
  SysUtils, Math, Classes,
  ACBrBase, ACBrConsts, IniFiles,
  {$IfDef COMPILER6_UP} StrUtils, DateUtils {$Else} ACBrD5, FileCtrl {$EndIf}
  {$IfDef FPC}
    ,dynlibs, LazUTF8, LConvEncoding, LCLType
    {$IfDef USE_LCLIntf} ,LCLIntf {$EndIf}
  {$EndIf}
  {$IfDef MSWINDOWS}
    ,Windows, ShellAPI
  {$Else}
    {$IfNDef FPC}
      {$IfDef ANDROID}
      ,System.IOUtils
      {$EndIf}
      {$IfDef  POSIX}
      ,Posix.Stdlib
      ,Posix.Unistd
      ,Posix.Fcntl
      {$Else}
      ,Libc
      {$EndIf}
    {$Else}
      ,unix, BaseUnix
    {$EndIf}
    {$IfNDef NOGUI}
      {$IfDef FMX}
        ,FMX.Forms
      {$Else}
        ,Forms
      {$EndIf}
    {$EndIf}
  {$EndIf} ;

function FormatDateBr(const ADateTime: TDateTime; AFormat: String = ''): String;
function FormatDateTimeBr(const ADate: TDateTime; AFormat: String = ''): String;
function StringToDateTime( const DateTimeString : String; const Format : String = '') : TDateTime;
function StringToDateTimeDef( const DateTimeString : String; const DefaultValue : TDateTime;
    const Format : String = '') : TDateTime;
function StoD( YYYYMMDDhhnnss: String) : TDateTime;
function DtoS( ADate : TDateTime) : String;
function DTtoS( ADateTime : TDateTime) : String;

function Iso8601ToDateTime(const AISODate: string): TDateTime;
function DateTimeToIso8601(ADate: TDateTime; const ATimeZone: string = ''): string;

function IsWorkingDay(ADate: TDateTime): Boolean;
function WorkingDaysBetween(StartDate, EndDate: TDateTime): Integer;
function IncWorkingDay(ADate: TDateTime; WorkingDays: Integer): TDatetime;

implementation

uses
  ACBrUtil;

{-----------------------------------------------------------------------------
  Converte uma <ADateTime> para String, semelhante ao FormatDateTime,
  por�m garante que o separador de Data SEMPRE ser� a '/'.
  Usa o padr�o Brasileiro DD/MM/YYYY.
  <AFormat> pode ser especificado, para mudar a apresenta��o.
 ---------------------------------------------------------------------------- }
function FormatDateBr(const ADateTime: TDateTime; AFormat: String): String;
begin
  if AFormat = '' then
     AFormat := 'DD/MM/YYYY';

  Result := FormatDateTimeBr( DateOf(ADateTime), AFormat);
end;

{-----------------------------------------------------------------------------
  Converte uma <ADateTime> para String, semelhante ao FormatDateTime,
  por�m garante que o separador de Data SEMPRE ser� a '/', e o de Hora ':'.
  Usa o padr�o Brasileiro DD/MM/YYYY hh:nn:ss.
  <AFormat> pode ser especificado, para mudar a apresenta��o.
 ---------------------------------------------------------------------------- }
function FormatDateTimeBr(const ADate: TDateTime; AFormat: String): String;
Var
  {$IFDEF HAS_FORMATSETTINGS}
  FS: TFormatSettings;
  {$ELSE}
  OldDateSeparator: Char ;
  OldTimeSeparator: Char ;
  {$ENDIF}
begin
  if AFormat = '' then
     AFormat := 'DD/MM/YYYY hh:nn:ss';

  {$IFDEF HAS_FORMATSETTINGS}
  FS := CreateFormatSettings;
  FS.DateSeparator := '/';
  FS.TimeSeparator := ':';
  Result := FormatDateTime(AFormat, ADate, FS);
  {$ELSE}
  OldDateSeparator := DateSeparator;
  OldTimeSeparator := TimeSeparator;
  try
    DateSeparator := '/';
    TimeSeparator := ':';
    Result := FormatDateTime(AFormat, ADate);
  finally
    DateSeparator := OldDateSeparator;
    TimeSeparator := OldTimeSeparator;
  end;
  {$ENDIF}
end;

{-----------------------------------------------------------------------------
  Converte uma <DateTimeString> para TDateTime, semelhante ao StrToDateTime,
  mas verifica se o seprador da Data � compativo com o S.O., efetuando a
  convers�o se necess�rio. Se n�o for possivel converter, dispara Exception
 ---------------------------------------------------------------------------- }
function StringToDateTime(const DateTimeString : String ; const Format : String
   ) : TDateTime ;
Var
  AStr : String;
  DS, TS: Char;
  {$IFDEF HAS_FORMATSETTINGS}
  FS: TFormatSettings;
  DateFormat, TimeFormat: String;
  p: Integer;
  {$ELSE}
  OldShortDateFormat: String ;
  {$ENDIF}

  function AjustarDateTimeString(const DateTimeString: String; DS, TS: Char): String;
  var
    AStr: String;
  begin
    AStr := Trim(DateTimeString);
    if (DS <> '.') then
      AStr := StringReplace(AStr, '.', DS, [rfReplaceAll]);

    if (DS <> '-') then
      AStr := StringReplace(AStr, '-', DS, [rfReplaceAll]);

    if (DS <> '/') then
      AStr := StringReplace(AStr, '/', DS, [rfReplaceAll]);

    if (TS <> ':') then
      AStr := StringReplace(AStr, ':', TS, [rfReplaceAll]) ;

    Result := AStr;
  end;
begin
  Result := 0;
  if (DateTimeString = '0') or (DateTimeString = '') then
    exit;

  {$IFDEF HAS_FORMATSETTINGS}
  FS := CreateFormatSettings;
  if (Format <> '') then
  begin
    DateFormat := Format;
    TimeFormat := '';
    p := pos(' ',Format);
    if (p > 0) then
    begin
      TimeFormat := Trim(Copy(Format, p, Length(Format)));
      DateFormat := Trim(copy(Format, 1, p));
    end;
    FS.ShortDateFormat := DateFormat;
    if (TimeFormat <> '') then
      FS.ShortTimeFormat := TimeFormat;
  end;

  DS := FS.DateSeparator;
  TS := FS.TimeSeparator;

  if (Format <> '') then
  begin
    if (DS <> '/') and (pos('/', Format) > 0) then
      DS := '/'
    else if (DS <> '-') and (pos('-', Format) > 0) then
      DS := '-'
    else if (DS <> '.') and (pos('.', Format) > 0) then
      DS := '.';

    if (DS <> FS.DateSeparator) then
      FS.DateSeparator := DS;
  end;

  AStr := AjustarDateTimeString(DateTimeString, DS, TS);
  Result := StrToDateTime(AStr, FS);
  {$ELSE}
  OldShortDateFormat := ShortDateFormat ;
  try
    if Format <> '' then
      ShortDateFormat := Format ;

    DS := DateSeparator;
    TS := TimeSeparator;

    AStr := AjustarDateTimeString(DateTimeString, DS, TS);
    Result := StrToDateTime( AStr ) ;
  finally
    ShortDateFormat := OldShortDateFormat ;
  end ;
  {$ENDIF}
end ;

{-----------------------------------------------------------------------------
  Converte uma <DateTimeString> para TDateTime, semelhante ao StrToDateTimeDef,
  mas verifica se o seprador da Data � compativo com o S.O., efetuando a
  convers�o se necess�rio. Se n�o for possivel converter, retorna <DefaultValue>
 ---------------------------------------------------------------------------- }
function StringToDateTimeDef(const DateTimeString : String ;
   const DefaultValue : TDateTime ; const Format : String) : TDateTime ;
begin
  if EstaVazio(DateTimeString) then
     Result := DefaultValue
  else
   begin
     try
        Result := StringToDateTime( DateTimeString, Format ) ;
     except
        Result := DefaultValue ;
     end ;
   end;
end ;

{-----------------------------------------------------------------------------
  Converte uma String no formato YYYYMMDDhhnnss  para TDateTime
 ---------------------------------------------------------------------------- }
function StoD( YYYYMMDDhhnnss: String) : TDateTime;
begin
  YYYYMMDDhhnnss := trim( YYYYMMDDhhnnss ) ;

  try
    Result := EncodeDateTime( StrToIntDef(copy(YYYYMMDDhhnnss, 1,4),0),  // YYYY
                              StrToIntDef(copy(YYYYMMDDhhnnss, 5,2),0),  // MM
                              StrToIntDef(copy(YYYYMMDDhhnnss, 7,2),0),  // DD
                              StrToIntDef(copy(YYYYMMDDhhnnss, 9,2),0),  // hh
                              StrToIntDef(copy(YYYYMMDDhhnnss,11,2),0),  // nn
                              StrToIntDef(copy(YYYYMMDDhhnnss,13,2),0),  // ss
                              0 );
  except
    Result := 0;
  end;
end;

{-----------------------------------------------------------------------------
  Converte um TDateTime para uma String no formato YYYYMMDD
 ---------------------------------------------------------------------------- }
function DtoS( ADate : TDateTime) : String;
begin
  Result := FormatDateTime('yyyymmdd', ADate ) ;
end ;

{-----------------------------------------------------------------------------
  Converte um TDateTime para uma String no formato YYYYMMDDhhnnss
 ---------------------------------------------------------------------------- }
function DTtoS( ADateTime : TDateTime) : String;
begin
  Result := FormatDateTime('yyyymmddhhnnss', ADateTime ) ;
end ;


function Iso8601ToDateTime(const AISODate: string): TDateTime;
var
  y, m, d, h, n, s, z: word;
begin
  y := StrToInt(Copy(AISODate, 1, 4));
  m := StrToInt(Copy(AISODate, 6, 2));
  d := StrToInt(Copy(AISODate, 9, 2));
  h := StrToInt(Copy(AISODate, 12, 2));
  n := StrToInt(Copy(AISODate, 15, 2));
  s := StrToInt(Copy(AISODate, 18, 2));
  z := StrToIntDef(Copy(AISODate, 21, 3), 0);

  Result := EncodeDateTime(y,m,d, h,n,s,z);
end;

function DateTimeToIso8601(ADate: TDateTime; const ATimeZone: string = ''): string;
const
  SDateFormat: string = 'yyyy''-''mm''-''dd''T''hh'':''nn'':''ss''.''zzz''Z''';
begin
  Result := FormatDateTime(SDateFormat, ADate);
  if ATimeZone <> '' then
  begin ;
    // Remove the Z, in order to add the UTC_Offset to the string.
    SetLength(Result, Length(Result) - 1);
    Result := Result + ATimeZone;
  end;
end;

{-----------------------------------------------------------------------------
  Retornar True, se a Data for de Segunda a Sexta-feira. Falso para S�bado e Domingo
 -----------------------------------------------------------------------------}
function IsWorkingDay(ADate: TDateTime): Boolean;
begin
  Result := (DayOfWeek(ADate) in [2..6]);
end;

{-----------------------------------------------------------------------------
  Retornar o total de dias �teis em um per�odo de datas, exceto feriados.
 -----------------------------------------------------------------------------}
function WorkingDaysBetween(StartDate, EndDate: TDateTime): Integer;
var
  ADate: TDateTime;
begin
  Result := 0;
  if (StartDate <= 0) then
    exit;

  ADate  := IncDay(StartDate, 1);
  while (ADate <= EndDate) do
  begin
    if IsWorkingDay(ADate) then
      Inc(Result);

    ADate := IncDay(ADate, 1)
  end;
end;

{-----------------------------------------------------------------------------
  Retornar uma data calculando apenas dias �teis, a partir de uma data inicial,
  exceto feriados.
 -----------------------------------------------------------------------------}
function IncWorkingDay(ADate: TDateTime; WorkingDays: Integer): TDatetime;
var
  DaysToIncrement, WorkingDaysAdded: Integer;

  function GetNextWorkingDay(ADate: TDateTime): TDateTime;
  begin
    Result := ADate;
    while not IsWorkingDay(Result) do
      Result := IncDay(Result, DaysToIncrement);
  end;

begin
  DaysToIncrement := ifthen(WorkingDays < 0,-1,1);

  if (WorkingDays = 0) then
    Result := GetNextWorkingDay(ADate)
  else
  begin
    Result := ADate;
    WorkingDaysAdded := 0;

    while (WorkingDaysAdded <> WorkingDays) do
    begin
      Result := GetNextWorkingDay( IncDay(Result, DaysToIncrement) );
      WorkingDaysAdded := WorkingDaysAdded + DaysToIncrement;
    end;
  end;
end;


end.
