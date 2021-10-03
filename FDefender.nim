import RegHelper
import cligen
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
            for Pro in ListOfProtections:
                if Disable(Pro) == false:
                    echo "Disable has been failed"
                else:
                    echo Pro, " has been disabled"
        if EnableAll:
            for Pro in ListOfProtections:
                
                if Enable(Pro) == false:
                    echo "Enable has been failed"
                else:
                    echo Pro, " has been Enabled"
        if On:
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
        if Off:
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

                


when isMainModule:
    dispatch(FuckDefender, help = {"Info" : "Get status of windows defender",
    "DisableAll" : "Disable all protections",
    "EnableAll": "Enable all protections", 
    "Sample" :"Turn On/Off Automatic sample submission",
    "Real": "Turn On/Off Real-time Protection",
    "Cloud":"Turn On/Off Cloud-Delivered protection",
    "Network":"Turn On/Off Network Protection",
    "Folder":"Turn On/Off Controlled folder access"})
