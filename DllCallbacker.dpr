program DllCallbacker;

{$I Default.inc}

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Winapi.Windows,
  Xander.DllCallback in 'Xander.DllCallback.pas',
  Xander.LdrMonitor in 'Xander.LdrMonitor.pas';

procedure DllCallback(const Name: string; Base: Pointer); register;
begin
  WriteLn('DLL loaded; Name: ', Name, ', Base: $', IntToHex(Integer(Base), 8));
end;

procedure Init;
begin
  WriteLn('DLL Callbacker');
  WriteLn('Alexander B. 2018');
  WriteLn;

  Xander.DllCallback.Setup(DllCallback);

  if LoadLibrary('DllStub.dll') = 0 then
    WriteLn('WARNING: Stub DLL could not be found.');

  ReadLn;
end;

begin
  Init;
end.
