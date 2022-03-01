## Disable Windows Defender via registry ##
An easy tool to disable and enable windows defender protections

### Install & Compile ###
```
nimble install winregistry winim
nim c -x -f Fdefender.nim
```
## How to use ##

Protection                          | Command
----------------------------------- | ----------------------
Disable all protections             | Fdefender.exe -D
Enable all protections              | Fdefender.exe -E
Disable Automatic sample submission | Fdefender.exe -S --Off
Enable Automatic sample submission  | Fdefender.exe -S --On
Disable Real-Time protection        | Fdefender.exe -R --Off
Enable Real-Time protection         | Fdefender.exe -R --On
Disable Cloud-Delivered protection  | Fdefender.exe -C --Off
Enable Cloud-Delivered protection   | Fdefender.exe -C --On
Disable Network Protection          | Fdefender.exe -N --Off
Enable Network Protection           | Fdefender.exe -N --On
Disable Controlled folder access    | Fdefender.exe -F --Off
Enable Controlled folder access     | Fdefender.exe -F --On

### You can also combine flags in order to disable/enable many protections together. ###
Fdefender.exe -FRS --On | Fdefender.exe -FRS --Off

#### All Flags must start with Capital letters: Info, Off, On. ####
------
### Good To Mention ###
I want to mention that the following technique to turn on and off "windows defender" came from the necessity to quickly turn off "windows defender" on a computer managed by an organization.
The registry values under:
"Computer\HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Policy Manager"
They appear only if the computer is under an organization.
#### BUT ####
It still works on a computer that is not managed. All you have to do is execute "Fdefender.exe -E" which will enable all defender protections in order to create the values we need under the key above. After that, you can manage your defender via this tool.
### TODO ###
- [ ] Auto Privilege escalation using exploit/Vul driver


