{******************************************************************************}
{ Projeto: Componentes ACBr                                                    }
{  Biblioteca multiplataforma de componentes Delphi para interação com equipa- }
{ mentos de Automação Comercial utilizados no Brasil                           }

{ Direitos Autorais Reservados (c) 2018 Daniel Simoes de Almeida               }

{ Colaboradores nesse arquivo: Rafael Teno Dias                                }

{  Você pode obter a última versão desse arquivo na pagina do  Projeto ACBr    }
{ Componentes localizado em      http://www.sourceforge.net/projects/acbr      }

{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }

{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }

{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/gpl-license.php                           }

{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{        Rua Cel.Aureliano de Camargo, 973 - Tatuí - SP - 18270-170            }

{******************************************************************************}

{$I ACBr.inc}

unit ACBrDeviceConfig;

interface

uses
  Classes, SysUtils, IniFiles,
  ACBrDevice;

type

  { TDeviceConfig }

  TDeviceConfig = class
  private
    FSessao: String;
    FBaud: Integer;
    FData : Integer;
    FParity: TACBrSerialParity;
    FStop: TACBrSerialStop;
    FMaxBandwidth: Integer;
    FSendBytesCount: Integer;
    FSendBytesInterval: Integer;
    FHandShake: TACBrHandShake;
    FHardFlow: Boolean;
    FSoftFlow: Boolean;


  public
    constructor Create(ASessao: String);

    procedure DefinirValoresPadroes;
    procedure LerIni(const AIni: TCustomIniFile);
    procedure GravarIni(const AIni: TCustomIniFile);
    procedure Assign(const Device: TACBrDevice);

    property Baud: Integer read FBaud write FBaud;
    property Data: Integer read FData write FData;
    property Parity: TACBrSerialParity read FParity write FParity;
    property Stop: TACBrSerialStop read FStop write FStop;
    property MaxBandwidth: Integer read  FMaxBandwidth write FMaxBandwidth;
    property SendBytesCount: Integer read  FSendBytesCount write FSendBytesCount;
    property SendBytesInterval: Integer read  FSendBytesInterval write FSendBytesInterval;
    property HandShake: TACBrHandShake read FHandShake write FHandShake;
    property SoftFlow: Boolean read FSoftFlow write FSoftFlow;
    property HardFlow: Boolean read FHardFlow write FHardFlow;

  end;

implementation

uses
  ACBrLibConsts, ACBrLibComum, ACBrUtil;

{ TLogConfig }

constructor TDeviceConfig.Create(ASessao: String);
begin
  inherited Create;
  FSessao := ASessao;
  DefinirValoresPadroes;
end;

procedure TDeviceConfig.DefinirValoresPadroes;
begin
  FBaud := 9600;
  FData := 8;
  FParity := pNone;
  FStop := s1;
  FMaxBandwidth := 0;
  FSendBytesCount := 0;
  FSendBytesInterval := 0;
  FHandShake := hsNenhum;
  FHardFlow := False;
  FSoftFlow := False;
end;

procedure TDeviceConfig.LerIni(const AIni: TCustomIniFile);
begin
  FBaud := AIni.ReadInteger(FSessao, CChaveBaud, FBaud);
  FData := AIni.ReadInteger(FSessao, CChaveData, FData);
  FParity := TACBrSerialParity(AIni.ReadInteger(FSessao, CChaveParity, Integer(FParity)));
  FStop := TACBrSerialStop(AIni.ReadInteger(FSessao, CChaveStop, Integer(FStop)));
  FMaxBandwidth := AIni.ReadInteger(FSessao, CChaveMaxBandwidth, FMaxBandwidth);
  FSendBytesCount := AIni.ReadInteger(FSessao, CChaveSendBytesCount, FSendBytesCount);
  FSendBytesInterval := AIni.ReadInteger(FSessao, CChaveSendBytesInterval, FSendBytesInterval);
  FHandShake := TACBrHandShake(AIni.ReadInteger(FSessao, CChaveHandShake, Integer(FHandShake)));
  FHardFlow := AIni.ReadBool(FSessao, CChaveSoftFlow, FHardFlow);
  FSoftFlow := AIni.ReadBool(FSessao, CChaveHardFlow, FSoftFlow);
end;

procedure TDeviceConfig.GravarIni(const AIni: TCustomIniFile);
begin
  AIni.WriteInteger(FSessao, CChaveBaud, FBaud);
  AIni.WriteInteger(FSessao, CChaveData, FData);
  AIni.WriteInteger(FSessao, CChaveParity, Integer(FParity));
  AIni.WriteInteger(FSessao, CChaveStop, Integer(FStop));
  AIni.WriteInteger(FSessao, CChaveMaxBandwidth, FMaxBandwidth);
  AIni.WriteInteger(FSessao, CChaveSendBytesCount, FSendBytesCount);
  AIni.WriteInteger(FSessao, CChaveSendBytesInterval, FSendBytesInterval);
  AIni.WriteInteger(FSessao, CChaveHandShake, Integer(FHandShake));
  AIni.WriteBool(FSessao, CChaveSoftFlow, FHardFlow);
  AIni.WriteBool(FSessao, CChaveHardFlow, FSoftFlow);
end;

procedure TDeviceConfig.Assign(const Device: TACBrDevice);
begin
  Device.Baud := Baud;
  Device.Data := Data;
  Device.Parity := Parity;
  Device.Stop := Stop;
  Device.MaxBandwidth := MaxBandwidth;
  Device.SendBytesCount :=SendBytesCount;
  Device.SendBytesInterval := SendBytesInterval;
  Device.HandShake := HandShake;
  Device.HardFlow := HardFlow;
  Device.SoftFlow := SoftFlow;
end;

end.
