program ACBrInStoreDemo;

{$MODE Delphi}

uses
  Forms, Interfaces,
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
