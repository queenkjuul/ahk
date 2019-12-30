; screenshots.ahk
; customize PrtScn behavior to my liking--allow for snip tool to be invoked by single PtrScn press, among others
; found to only work with 64-bit AHK on 64-bit Win10

; #NoTrayIcon
snipclass = Microsoft-Windows-SnipperToolbar
snipedit = Microsof-Windows-SnipperEditor
snippath = %windir%\system32\SnippingTool.exe
#^!+z::ExitApp
PrintScreen::
{
    WinGetActiveStats, Title, Width, Height, X, Y
    if (not WinExist("ahk_class %snipclass%") or WinExist("ahk_class %snipedit%"))
    {
        Run, %snippath%,,,pid
        WinWait ahk_class %snipclass%
        WinActivate, ahk_pid %pid%
        Send !{m}
        Send {r}
        Send !{n}
    }
    else (WinExist("ahk_exe SnippingTool.exe"))
    {
        WinActivate, ahk_exe SnippingTool.exe
        ;MsgBox WinExist
        Send !{m}
        Send {r}
        Send !{n}
    }
}

$Space::
{
    WinGetActiveStats, Title, Width, Height, X, Y
    ;MsgBox %Title%
    if (Title = Snipping Tool)
    {
        ;MsgBox Detected Snipper
        Send !{m}
        Send {w}
    }
    else
    {
        Send {Space} 
    }
}
