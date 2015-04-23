unit FMX.OleServer;

{$R-}
{$WARN SYMBOL_PLATFORM OFF}


interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ActiveX, System.SysUtils,
  System.Classes, System.Win.ComObj;

type
  TVariantArray = System.Win.ComObj.TOleVariantArray;
  TOleServer    = class;
  TConnectKind  = (ckRunningOrNew,          // Attach to a running or create a new instance of the server
                   ckNewInstance,           // Create a new instance of the server
                   ckRunningInstance,       // Attach to a running instance of the server
                   ckRemote,                // Bind to a remote instance of the server
                   ckAttachToInterface);    // Don't bind to server, user will provide interface via 'CpnnectTo'

  TServerEventDispatch = class(TObject, IUnknown, IDispatch)
  private
    FServer: TOleServer;
    InternalRefCount : Integer;
  protected
    { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; stdcall;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;
    { IDispatch }
    function GetTypeInfoCount(out Count: Integer): HResult; stdcall;
    function GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult; stdcall;
    function GetIDsOfNames(const IID: TGUID; Names: Pointer;
      NameCount, LocaleID: Integer; DispIDs: Pointer): HResult; stdcall;
    function Invoke(DispID: Integer; const IID: TGUID; LocaleID: Integer;
      Flags: Word; var Params; VarResult, ExcepInfo, ArgErr: Pointer): HResult; stdcall;
    property Server: TOleServer read FServer;
    function ServerDisconnect :Boolean;
  public
    constructor Create(Server: TOleServer);
  end;

  PServerData = ^TServerData;

  TServerData = record
    ClassID: TGUID;                   // CLSID of CoClass
    IntfIID: TGUID;                   // IID of default interface
    EventIID: TGUID;                  // IID of default source interface
    LicenseKey: Pointer;              // Pointer to license string (not implemented)
    Version: Integer;                 // Version of this structure
    InstanceCount: Integer;           // Instance of the Server running
  end;

  TOleServer = class(TComponent, IUnknown)
  private
    FServerData:        PServerData;
    FRefCount:          Longint;
    FEventDispatch:     TServerEventDispatch;
    FEventsConnection:  Longint;
    FAutoConnect:       Boolean;
    FRemoteMachineName: string;
    FConnectKind:       TConnectKind;

  protected
      { IUnknown }
    function QueryInterface(const IID: TGUID; out Obj): HResult; override;
    function _AddRef: Integer; stdcall;
    function _Release: Integer; stdcall;

    procedure Loaded; override;
    procedure InitServerData; virtual; abstract;

    function  GetServer: IUnknown; virtual;

    procedure ConnectEvents(const Obj: IUnknown);
    procedure DisconnectEvents(const Obj: Iunknown);
    procedure InvokeEvent(DispID: TDispID; var Params: TVariantArray); virtual;

    function  GetConnectKind: TConnectKind;
    procedure SetConnectKind(ck: TConnectKind);

    function  GetAutoConnect: Boolean;
    procedure SetAutoConnect(flag: Boolean);

    property  ServerData: PServerData read FServerData write FServerData;
    property  EventDispatch: TServerEventDispatch read FEventDispatch write FEventDispatch;

  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

    // NOTE: If derived class is generated by TLIBIMP or ImportTypeLibraryCodeGenerator,
    //       the derived class will also expose a 'ConnectTo(interface)' function.
    //       You must invoke that method if you're using 'ckAttachToInterface' connection
    //       kind.
    procedure Connect; virtual; abstract;
    procedure Disconnect; virtual; abstract;

  published
    property AutoConnect: Boolean read GetAutoConnect write SetAutoConnect;
    property ConnectKind: TConnectKind read GetConnectKind write SetConnectKind;
    property RemoteMachineName: string read FRemoteMachineName write FRemoteMachineName;
  end;

implementation

uses
  FMX.OleConst, FMX.Controls, FMX.Types;


{ TServerEventDispatch }
constructor TServerEventDispatch.Create(Server: TOleServer);
begin
  FServer := Server;
  InternalRefCount := 1;
end;

{ TServerEventDispatch.IUnknown }
function TServerEventDispatch.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
  begin
    Result := S_OK;
    Exit;
  end;
  if IsEqualIID(IID, FServer.FServerData^.EventIID) then
  begin
    GetInterface(IDispatch, Obj);
    Result := S_OK;
    Exit;
  end;
  Result := E_NOINTERFACE;
end;

function TServerEventDispatch._AddRef: Integer;
begin
  if FServer <> nil then FServer._AddRef;
  InternalRefCount := InternalRefCount + 1;
  Result := InternalRefCount;
end;

function TServerEventDispatch._Release: Integer;
begin
  if FServer <> nil then FServer._Release;
  InternalRefCount := InternalRefCount -1;
  Result := InternalRefCount;
end;

{ TServerEventDispatch.IDispatch }
function TServerEventDispatch.GetTypeInfoCount(out Count: Integer): HResult;
begin
  Count := 0;
  Result:= S_OK;
end;

function TServerEventDispatch.GetTypeInfo(Index, LocaleID: Integer; out TypeInfo): HResult;
begin
  Pointer(TypeInfo) := nil;
  Result := E_NOTIMPL;
end;

function TServerEventDispatch.GetIDsOfNames(const IID: TGUID; Names: Pointer;
  NameCount, LocaleID: Integer; DispIDs: Pointer): HResult;
begin
  Result := E_NOTIMPL;
end;

function TServerEventDispatch.Invoke(DispID: Integer; const IID: TGUID;
  LocaleID: Integer; Flags: Word; var Params;
  VarResult, ExcepInfo, ArgErr: Pointer): HResult;
var
  vPDispParams: PDispParams;
begin
  vPDispParams := PDispParams(@Params);  // DispParams
  Result := EventDispatchInvoke(DispID, vPDispParams^,
                                procedure(DispId: Integer; var Params: TVariantArray)
                                begin
                                  // Invoke Server proxy class
                                  if FServer <> nil then
                                    FServer.InvokeEvent(DispID, Params);
                                end);
end;

function TServerEventDispatch.ServerDisconnect : Boolean;
begin
  Result := FServer <> nil;
  FServer := nil;
end;

{TOleServer}
constructor TOleServer.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  // Allow derived class to initialize ServerData structure pointer
  InitServerData;
  // Make sure derived class set ServerData pointer to some valid structure
  Assert(FServerData <> nil);
  // Increment instance count (not used currently)
  Inc(FServerData^.InstanceCount);
  // Create Event Dispatch Handler
  FEventDispatch := TServerEventDispatch.Create(Self);
end;

destructor TOleServer.Destroy;
begin
  // Disconnect from the Server (NOTE: Disconnect must handle case when we're no longer connected)
  Disconnect;
  // Free Events dispatcher
  FEventDispatch.ServerDisconnect;
  if (FEventDispatch._Release = 0) then FEventDispatch.Free;
  // Decrement refcount
  Dec(FServerData^.InstanceCount);
  inherited Destroy;
end;

procedure TOleServer.Loaded;
begin
  inherited Loaded;

  // Load Server if user requested 'AutoConnect' and we're not in Design mode
  if not (csDesigning in ComponentState) then
    if AutoConnect then
        Connect;
end;

procedure TOleServer.InvokeEvent(DispID: TDispID; var Params: TVariantArray);
begin
  // To be overriden in derived classes to do dispatching
end;

function TOleServer.GetServer: IUnknown;
var
  HR: HResult;
  ErrorStr: string;
begin
  case ConnectKind of
    ckNewInstance:
      Result := CreateComObject(FServerData^.ClassId);

    ckRunningInstance:
    begin
      HR := GetActiveObject(FServerData^.ClassId, nil, Result);
      if not Succeeded(HR) then
      begin
        ErrorStr := Format(sNoRunningObject, [ClassIDToProgID(FServerData^.ClassId),
                                              GuidToString(FServerData^.ClassId)]);
        raise EOleSysError.Create(ErrorStr, HR, 0);
      end;
    end;

    ckRunningOrNew:
      if not Succeeded(GetActiveObject(FServerData^.ClassId, nil, Result)) then
        Result := CreateComObject(FServerData^.ClassId);

    ckRemote:
      {Highly inefficient: requires at least two round trips - GetClassObject + QI}
      Result := CreateRemoteComObject(RemoteMachineName, FServerData^.ClassID);
  end;
end;

procedure TOleServer.ConnectEvents(const Obj: IUnknown);
begin
  System.Win.ComObj.InterfaceConnect(Obj, FServerData^.EventIID, FEventDispatch, FEventsConnection);
end;

procedure TOleServer.DisconnectEvents(const Obj: Iunknown);
begin
  System.Win.ComObj.InterfaceDisconnect(Obj, FServerData^.EventIID, FEventsConnection);
end;

function  TOleServer.GetConnectKind: TConnectKind;
begin
  // Should the setting of a RemoteMachine name override the Connection Kind ??
  if RemoteMachineName <> '' then
    Result := ckRemote
  else
    Result := FConnectKind;
end;

procedure TOleServer.SetConnectKind(cK: TConnectKind);
begin
  // Should we validate that we have a RemoteMachineName for ckRemote ??
  FConnectKind := cK;
end;

function  TOleServer.GetAutoConnect: Boolean;
begin
  // If user wants to provide the interface to connect to, then we won't
  // 'automatically' connect to a server.
  if ConnectKind = ckAttachToInterface then
    Result := False
  else
    Result := FAutoConnect;
end;

procedure TOleServer.SetAutoConnect(flag: Boolean);
begin
  FAutoConnect := flag;
end;

{ TOleServer.IUnknown }
function TOleServer.QueryInterface(const IID: TGUID; out Obj): HResult;
begin
  if GetInterface(IID, Obj) then
    Result := S_OK
  else
    Result := E_NOINTERFACE;
end;

function TOleServer._AddRef: Integer;
begin
  Inc(FRefCount);
  Result := FRefCount;
end;

function TOleServer._Release: Integer;
begin
  Dec(FRefCount);
  Result := FRefCount;
end;

//initialization
//  GroupDescendentsWith(TOleServer, FMX.Types.TControl);

end.
