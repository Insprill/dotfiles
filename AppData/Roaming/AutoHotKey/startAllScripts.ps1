Get-Process "AutoHotkey" | Stop-Process

Get-ChildItem "$env:APPDATA\AutoHotkey\*.ahk" | ForEach-Object {
    Start-Process $_.FullName
}
