program ACBrNFeTest;

uses
  System.StartUpCopy,
  FMX.Forms,
  ACBrNFeTestFr in 'ACBrNFeTestFr.pas' {ACBrNFCeTestForm},
  FileSelectFr in 'FileSelectFr.pas' {FileSelectForm};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TACBrNFCeTestForm, ACBrNFCeTestForm);
  Application.Run;
end.
