## Disable Windows Defender via registry ##
An easy tool to disable and enable windows defender protections

### Compile ###
nim c -x -f Fdefender.nim

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

### TODO ###
[ ] Auto Privilege escalation using exploit/Vul driver

### All Flags must start with Capital letters: Info, Off, On. ###





