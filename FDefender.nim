import RegHelper
import cligen
import winim

proc IsElevated() : bool =
    var
        IsElevated : bool = false
        hToken : HANDLE
        elevation : TOKEN_ELEVATION
        dwSize : DWORD
    
    if OpenProcessToken(GetCurrentProcess(), TOKEN_QUERY, &hToken) == FALSE:
        return false
    
    if GetTokenInformation(hToken, 20, &elevation, DWORD(sizeof(elevation)), &dwSize) == FALSE:
        CloseHandle(hToken)
        return false

    IsElevated = elevation.TokenIsElevated
    return IsElevated


proc FuckDefender(Info=false,On=false,Off=false,DisableAll=false,EnableAll=false,Sample=false,Real=false,Cloud=false,Network=false,Folder=false) =
    var ListOfProtections = @["AllowRealtimeMonitoring","AllowCloudProtection","EnableControlledFolderAccess","EnableNetworkProtection","SubmitSamplesConsent"]
    if Info == false and On == false and Off  == false and DisableAll == false and EnableAll == false:
        echo "You Must set flags"
    else:
        if Info:
            for Pro in ListOfProtections:
                if Query(Pro) == false:
                    echo "Query failed"
        if DisableAll:
            if IsElevated():
                for Pro in ListOfProtections:
                    if Disable(Pro) == false:
                        echo "Disable has been failed"
                    else:
                        echo Pro, " has been disabled"
            else:
                echo "Not running as administrator!"
                quit(-1)
        if EnableAll:
            if IsElevated():
                for Pro in ListOfProtections:
                    
                    if Enable(Pro) == false:
                        echo "Enable has been failed"
                    else:
                        echo Pro, " has been Enabled"
            else:
                echo "Not running as administrator!"
                quit(-1)
        if On:
            if IsElevated():
                if Sample:
                    if Enable("SubmitSamplesConsent") == false:
                        echo "Enable has been failed"
                    else:
                        echo "Submit Samples has been enabled"
                if Real:
                    if Enable("AllowRealtimeMonitoring") == false:
                        echo "Enable has been failed"
                    else:
                        echo "Real-Time Protection has been enabled"
                if Cloud:
                    if Enable("AllowCloudProtection") == false:
                        echo "Enable has been failed"
                    else:
                        echo "Cloud Protection has been enabled"
                if Network:
                    if Enable("EnableNetworkProtection") == false:
                        echo "Enable has been failed"
                    else:
                        echo "Network Protection has been enabled"
                if Folder:
                    if Enable("EnableControlledFolderAccess") == false:
                        echo "Enable has been failed"
                    else:
                        echo "Controlled folder access has been enabled"
            else:
                echo "Not running as administrator!"
                quit(-1) 
        if Off:
            if IsElevated():
                if Sample:
                    if Disable("SubmitSamplesConsent") == false:
                        echo "Disable has been failed"
                    else:
                        echo "Submit Samples has been Disabled"
                if Real:
                    if Disable("AllowRealtimeMonitoring") == false:
                        echo "Disable has been failed"
                    else:
                        echo "Real-Time Protection has been Disabled"
                if Cloud:
                    if Disable("AllowCloudProtection") == false:
                        echo "Disable has been failed"
                    else:
                        echo "Cloud Protection has been Disabled"
                if Network:
                    if Disable("EnableNetworkProtection") == false:
                        echo "Disable has been failed"
                    else:
                        echo "Network Protection has been Disabled"
                if Folder:
                    if Disable("EnableControlledFolderAccess") == false:
                        echo "Disable has been failed"
                    else:
                        echo "Controlled folder access has been Disabled"
            else:
                echo "Not running as administrator!"
                quit(-1) 


                


when isMainModule:
    dispatch(FuckDefender, help = {"Info" : "Get status of windows defender",
    "DisableAll" : "Disable all protections",
    "EnableAll": "Enable all protections", 
    "Sample" :"Turn On/Off Automatic sample submission",
    "Real": "Turn On/Off Real-time Protection",
    "Cloud":"Turn On/Off Cloud-Delivered protection",
    "Network":"Turn On/Off Network Protection",
    "Folder":"Turn On/Off Controlled folder access"})
