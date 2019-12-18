{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para intera��o com equipa- }
{ mentos de Automa��o Comercial utilizados no Brasil                           }
{                                                                              }
{ Direitos Autorais Reservados (c) 2009   Daniel Simoes de Almeida             }
{                                         Isaque Pinheiro                      }
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
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida - daniel@projetoacbr.com.br - www.projetoacbr.com.br}
{       Rua Coronel Aureliano de Camargo, 963 - Tatu� - SP - 18270-170         }
{******************************************************************************}

unit ACBrInstallUtils;

interface

uses SysUtils, Windows, Messages, Classes, Forms;

  function RunAsAdminAndWaitForCompletion(hWnd: HWND; const filename: string; Fapp: TApplication): Boolean;
  procedure GetDriveLetters(AList: TStrings);
  function RegistrarActiveXServer(const AServerLocation: string; const ARegister: Boolean): Boolean;
  procedure DesligarDefineACBrInc(const ArquivoACBrInc: TFileName; const ADefineName: String; const ADesligar: Boolean);
  function FindDirPackage(const aDir: String; const sPacote: String): string;

implementation

uses
  ShellApi, Types, IOUtils;

procedure GetDriveLetters(AList: TStrings);
var
  vDrivesSize: Cardinal;
  vDrives: array[0..128] of Char;
  vDrive: PChar;
  vDriveType: Cardinal;
begin
  AList.BeginUpdate;
  try
    // clear the list from possible leftover from prior operations
    AList.Clear;
    vDrivesSize := GetLogicalDriveStrings(SizeOf(vDrives), vDrives);
    if vDrivesSize = 0 then
      Exit;

    vDrive := vDrives;
    while vDrive^ <> #0 do
    begin
      // adicionar somente drives fixos
      vDriveType := GetDriveType(vDrive);
      if vDriveType = DRIVE_FIXED then
        AList.Add(StrPas(vDrive));

      Inc(vDrive, SizeOf(vDrive));
    end;
  finally
	  AList.EndUpdate;
  end;
end;

function RunAsAdminAndWaitForCompletion(hWnd: HWND; const filename: string; Fapp: TApplication): Boolean;
{
    See Step 3: Redesign for UAC Compatibility (UAC)
    http://msdn.microsoft.com/en-us/library/bb756922.aspx
}
var
  sei: TShellExecuteInfo;
  ExitCode: DWORD;
begin
  ZeroMemory(@sei, SizeOf(sei));
  sei.cbSize       := SizeOf(TShellExecuteInfo);
  sei.Wnd          := hwnd;
  sei.fMask        := SEE_MASK_FLAG_DDEWAIT or SEE_MASK_FLAG_NO_UI or SEE_MASK_NOCLOSEPROCESS;
  sei.lpVerb       := PWideChar('runas');
  sei.lpFile       := PWideChar(Filename);
  sei.lpParameters := PWideChar('');
  sei.nShow        := SW_HIDE;

  if ShellExecuteEx(@sei) then
  begin
    repeat
      FApp.ProcessMessages;
      GetExitCodeProcess(sei.hProcess, ExitCode) ;
    until (ExitCode <> STILL_ACTIVE) or  FApp.Terminated;
  end;
  Result := True;
end;

function RegistrarActiveXServer(const AServerLocation: string;
  const ARegister: Boolean): Boolean;
var
  ServerDllRegisterServer: function: HResult; stdcall;
  ServerDllUnregisterServer: function: HResult; stdcall;
  ServerHandle: THandle;

  procedure UnloadServerFunctions;
  begin
    @ServerDllRegisterServer := nil;
    @ServerDllUnregisterServer := nil;
    FreeLibrary(ServerHandle);
  end;

  function LoadServerFunctions: Boolean;
  begin
    Result := False;
    ServerHandle := SafeLoadLibrary(AServerLocation);

    if (ServerHandle <> 0) then
    begin
      @ServerDllRegisterServer := GetProcAddress(ServerHandle, 'DllRegisterServer');
      @ServerDllUnregisterServer := GetProcAddress(ServerHandle, 'DllUnregisterServer');

      if (@ServerDllRegisterServer = nil) or (@ServerDllUnregisterServer = nil) then
        UnloadServerFunctions
      else
        Result := True;
    end;
  end;
begin
  Result := False;
  try
    if LoadServerFunctions then
    try
      if ARegister then
        Result := ServerDllRegisterServer = S_OK
      else
        Result := ServerDllUnregisterServer = S_OK;
    finally
      UnloadServerFunctions;
    end;
  except
  end;
end;

procedure DesligarDefineACBrInc(const ArquivoACBrInc: TFileName; const ADefineName: String; const ADesligar: Boolean);
var
  F: TStringList;
  I: Integer;
begin
  F := TStringList.Create;
  try
    F.LoadFromFile(ArquivoACBrInc);
    for I := 0 to F.Count - 1 do
    begin
      if Pos(ADefineName.ToUpper, F[I].ToUpper) > 0 then
      begin
        if ADesligar then
          F[I] := '{$DEFINE ' + ADefineName + '}'
        else
          F[I] := '{.$DEFINE ' + ADefineName + '}';

        Break;
      end;
    end;
    F.SaveToFile(ArquivoACBrInc);
  finally
    F.Free;
  end;
end;

function FindDirPackage(const aDir: String; const sPacote: String): string;
var
  oDirList: TSearchRec;
  sDir: String;
begin
  //Retorna uma string vazia caso n�o tenha encontrado o diret�rio do pacote.
  Result := '';
  sDir := IncludeTrailingPathDelimiter(aDir);
  if not DirectoryExists(sDir) then
    Exit;

  if SysUtils.FindFirst(sDir + '*.*', faAnyFile, oDirList) = 0 then
  begin
    try
      repeat
        if (oDirList.Name = '.')  or (oDirList.Name = '..') or (oDirList.Name = '__history') or
           (oDirList.Name = '__recovery') or (oDirList.Name = 'backup') then
          Continue;

        if DirectoryExists(sDir + oDirList.Name) then
        begin
          Result := FindDirPackage(sDir + oDirList.Name, sPacote);
        end
        else
        begin
          if UpperCase(oDirList.Name) = UpperCase(sPacote) then
            Result := IncludeTrailingPathDelimiter(sDir);
        end;

      until (SysUtils.FindNext(oDirList) <> 0) or (Result <> '');
    finally
      SysUtils.FindClose(oDirList);
    end;
  end;
end;

end.
