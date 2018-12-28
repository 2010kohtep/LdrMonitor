unit Xander.LdrMonitor;

{$I Default.inc}

interface

type
  PUnicodeString = ^TUnicodeString;
  TUnicodeString = packed record
    Length: Word;
    MaximumLength: Word;
    Buffer: PWideChar;
  end;

type
  TNotificationReason = (LDR_DLL_NOTIFICATION_REASON_LOADED = 1, LDR_DLL_NOTIFICATION_REASON_UNLOADED = 2);

  PLdrDLLLoadedNotificationData = ^TLdrDLLLoadedNotificationData;
  TLdrDLLLoadedNotificationData = record
    Flags: LongWord;
    FullDllName: PUnicodeString;
    BaseDllName: PUnicodeString;
    DllBase: Pointer;
    SizeOfImage: LongWord;
  end;

  PLdrDLLUnloadedNotificationData = ^TLdrDLLUnloadedNotificationData;
  TLdrDLLUnloadedNotificationData = TLdrDLLLoadedNotificationData;

  PLdrDllNotificationData = ^TLdrDllNotificationData;
  TLdrDllNotificationData = record
    case Integer of
      0: (Loaded: TLdrDLLLoadedNotificationData);
      1: (Unloaded: TLdrDLLUnloadedNotificationData);
  end;

type
  TLdrRegisterDllNotification = function(Flags: LongWord; NotificationFunction: Pointer; Context: Pointer; Cookie: Pointer): LongWord; stdcall;

function LdrRegisterDllNotification(Flags: LongWord; NotificationFunction: Pointer; Context: Pointer; Cookie: Pointer): LongWord; stdcall; external 'ntdll.dll' name 'LdrRegisterDllNotification' delayed;

implementation

end.
