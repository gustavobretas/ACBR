{ This file was automatically created by Lazarus. Do not edit!
  This source is only used to compile and install the package.
 }

unit ACBr_NFe;

{$warn 5023 off : no warning about unused units}
interface

uses
  ACBrNFe, ACBrNFeReg, ACBrNFeNotasFiscais, ACBrNFeConfiguracoes, 
  ACBrNFeWebServices, ACBrNFeDANFEClass, pcnAdmCSCNFCe, pcnCadEmiDFe, 
  pcnCCeNFe, pcnConsCad, pcnConsNFeDest, pcnConsReciNFe, pcnConsSitNFe, 
  pcnConsStatServ, pcnDistDFeInt, pcnDownloadNFe, pcnEnvEventoNFe, 
  pcnEventoNFe, pcnInutNFe, pcnLayoutTXT, pcnNFe, pcnNFeR, pcnNFeRTXT, 
  pcnNFeW, pcnProcNFe, pcnRetAdmCSCNFCe, pcnRetAtuCadEmiDFe, pcnRetCancNFe, 
  pcnRetCCeNFe, pcnRetConsCad, pcnRetConsNFeDest, pcnRetConsReciNFe, 
  pcnRetConsSitNFe, pcnRetConsStatServ, pcnRetDistDFeInt, pcnRetDownloadNFe, 
  pcnRetEnvEventoNFe, pcnRetEnvNFe, pcnRetInutNFe, pcnConversaoNFe, 
  pcnNFeConsts, ACBrDFeDANFeReport, LazarusPackageIntf;

implementation

procedure Register;
begin
  RegisterUnit('ACBrNFeReg', @ACBrNFeReg.Register);
end;

initialization
  RegisterPackage('ACBr_NFe', @Register);
end.
