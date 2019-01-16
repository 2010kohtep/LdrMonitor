unit Xander.LdrMonitor;

{$I Default.inc}

interface

type
  PCUNICODE_STRING = ^UNICODE_STRING;
  UNICODE_STRING = packed record
    Length: Word;
    MaximumLength: Word;
    Buffer: PWideChar;
  end;
  TUnicodeString = UNICODE_STRING;
  PUnicodeString = ^TUnicodeString;

type
  NotificationReasonEnum = (LDR_DLL_NOTIFICATION_REASON_LOADED = 1, LDR_DLL_NOTIFICATION_REASON_UNLOADED = 2);
  TNotificationReason = NotificationReasonEnum;

  PLDR_DLL_LOADED_NOTIFICATION_DATA = ^LDR_DLL_LOADED_NOTIFICATION_DATA;
  LDR_DLL_LOADED_NOTIFICATION_DATA = record
    Flags: LongWord;
    FullDllName: PUnicodeString;
    BaseDllName: PUnicodeString;
    DllBase: Pointer;
    SizeOfImage: LongWord;
  end;
  TLdrDLLLoadedNotificationData = LDR_DLL_LOADED_NOTIFICATION_DATA;
  PLdrDLLLoadedNotificationData = ^TLdrDLLLoadedNotificationData;

  PLdrDLLUnloadedNotificationData = ^TLdrDLLUnloadedNotificationData;
  TLdrDLLUnloadedNotificationData = TLdrDLLLoadedNotificationData;

  PLDR_DLL_NOTIFICATION_DATA = ^LDR_DLL_NOTIFICATION_DATA;
  LDR_DLL_NOTIFICATION_DATA = record
    case Integer of
      0: (Loaded: TLdrDLLLoadedNotificationData);
      1: (Unloaded: TLdrDLLUnloadedNotificationData);
  end;
  TLdrDllNotificationData = LDR_DLL_NOTIFICATION_DATA;
  PLdrDllNotificationData = ^TLdrDllNotificationData;

type
  TLdrRegisterDllNotification = function(Flags: LongWord; NotificationFunction: Pointer; Context: Pointer; Cookie: Pointer): LongWord; stdcall;

function LdrRegisterDllNotification(Flags: LongWord; NotificationFunction: Pointer; Context: Pointer; Cookie: Pointer): LongWord; stdcall; external 'ntdll.dll' name 'LdrRegisterDllNotification' delayed;

implementation

end.
