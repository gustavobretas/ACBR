program ACBrMonitor;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  Interfaces, sysutils,IniFiles,// this includes the LCL widgetset
  {$IFDEF MSWINDOWS}
   Windows, Dialogs,
  {$ENDIF}
  Forms, printer4lazarus, UtilUnit, ACBrMonitor1, CmdUnit, ConfiguraSerial,
  DoACBrUnit, DoBALUnit, DoCHQUnit, DoDISUnit, DoECFBemafi32, DoECFObserver,
  DoECFUnit, DoETQUnit, DoGAVUnit, DoLCBUnit, Sobre, DoBoletoUnit, DoCEPUnit,
  DoIBGEUnit, DoEmailUnit, DoNcmUnit, DoACBrNFeUnit, DoACBrCTeUnit,
  DoACBrMDFeUnit, DoSATUnit;

{$R *.res}
var
  Ini : TIniFile;
  UmaInstancia : Boolean;
begin
  Ini := TIniFile.Create(  ExtractFilePath(Application.ExeName)+ 'ACBrMonitor.ini' ) ;
  try
     UmaInstancia := Ini.ReadBool('ACBrMonitor','Uma_Instancia',false);
  finally
     Ini.Free;
  end;
  //DeleteFile( 'c:\temp\heaptrclog.trc');
  //SetHeapTraceOutput( 'c:\temp\heaptrclog.trc');
  Application.Initialize;

  {$IFDEF MSWINDOWS}
   if UmaInstancia then
   begin
     CreateMutex(nil, True, 'ACBrMonitor');
     if GetLastError = ERROR_ALREADY_EXISTS then
     begin
        MessageDlg('ACBrMonitor','O programa ACBrMonitor já está em execução',
            mtError, [mbOK], 0);
        Application.Terminate;
        exit ;
     end;
   end;
  {$ENDIF}

  Application.CreateForm(TFrmACBrMonitor, FrmACBrMonitor) ;
  Application.Run;
end.

