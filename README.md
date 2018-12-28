# DllCallbacker (LdrMonitor)

A project that implements a monitor for LoadLibrary calls using existing functions of the operating system without any splicing technics.

File **Xander.LdrMonitor.pas** contains the declaration of some Native API types, as well as the types necessary to implement the handler for the function **LdrRegisterDllNotification**.

File **Xander.DllCallback.pas** contains the implementation of the handler that calls the monitor function, which is set by the function **Xander.DllCallback.Setup**. An example can be seen in the **DllCallbacker.dpr** file.

Tested on Windows XP and Windows 10 operating systems.

Developed with **Embarcadero Delphi 10.2 Tokyo**.

# DllStub

Test project required to demonstrate the work of **DllCallbacker** project.
