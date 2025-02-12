Set WshShell = CreateObject("WScript.Shell")
exePath = WshShell.ExpandEnvironmentStrings("%USERPROFILE%\.cargo\bin\wpmd.exe")
WshShell.Run exePath, 0, False
Set WshShell = Nothing
