{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ACBr_NF3e_DANF3eESCPOS;

{$warn 5023 off : no warning about unused units}
interface

uses
  ACBrNF3eDANF3eESCPOS, ACBrNF3eDANF3eESCPOSReg, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ACBrNF3eDANF3eESCPOSReg', @ACBrNF3eDANF3eESCPOSReg.Register);
end;

initialization
  RegisterPackage('ACBr_NF3e_DANF3eESCPOS', @Register);
end.
