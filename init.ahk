; ini.ahk
; this script will be run in Start>Startup on login, and launch other ahk scripts in ~/ahk
#NoTrayIcon
#^!+z::ExitApp
Run mastershortcuts.ahk
Run volume.ahk
