Get-ChildItem "$env:APPDATA\AutoHotkey\*.ahk" | ForEach-Object {
    Start-Process $_.FullName
}
