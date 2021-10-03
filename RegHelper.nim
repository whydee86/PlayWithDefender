
import winregistry
proc Query * (Key:string): bool =
    var 
        WindowsDefender_Handle : RegHandle
        def_reg_path = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Policy Manager"
        status : int 
    try:
        WindowsDefender_Handle = open(def_reg_path, samRead)
        status = WindowsDefender_Handle.readInt32(Key)
        if status == 0:
            echo Key," Is disable"
        else:
            echo Key," Is enable"
        result = true
    except RegistryError:
        result = false
    finally:
        close(WindowsDefender_Handle)
proc Disable * (Key:string): bool =
    var 
        WindowsDefender_Handle : RegHandle
        def_reg_path = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Policy Manager"
    try:
        WindowsDefender_Handle = open(def_reg_path, samWrite)
        WindowsDefender_Handle.writeInt32(Key,0)
        result = true
    except RegistryError:
        result = false
    finally:
        close(WindowsDefender_Handle)
proc Enable * (Key:string): bool =
    var 
        WindowsDefender_Handle : RegHandle
        def_reg_path = "HKEY_LOCAL_MACHINE\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Policy Manager"
    try:
        WindowsDefender_Handle = open(def_reg_path, samWrite)
        WindowsDefender_Handle.writeInt32(Key,1)
        result = true
    except RegistryError:
        result = false
    finally:
        close(WindowsDefender_Handle)