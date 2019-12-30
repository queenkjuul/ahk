; screenshots.ahk
; customize PrtScn behavior to my liking--allow for snip tool to be invoked by single PtrScn press, among others
; found to only work with 64-bit AHK on 64-bit Win10

/*

    General Keys Setup:
        PrtScn:     open Snipping Tool. If already open, focus it, and start a new rectangle selection
        Space:      if Snipping Tool is open, focus it, and start a new Single Window selection
        Enter:      if Snipping Tool is open, focus it, and take a Full Screen screenshot
        Win+PrtScn:     Not actually assigned in this script, but Windows will engage default Win+PrtScn behavior (save full screenshot to Picture/Screenshots)
        Control+PrtScn: Not actually assigned in this script, but Windows will engage default PrtScn behavior (copy full screenshot to clipboard)
        Control+Shift+4 (optional): Optional line to assign the Mac screenshot shortcut to PrtScn
        Control+Shift+3 (optional): Optional line to assign the Mac full screen screenshot command (will take a full-screen Snip, not save like Win+PrtScn)

*/

; #NoTrayIcon
snipclass = Microsoft-Windows-SnipperToolbar
snipedit = Microsof-Windows-SnipperEditor
snippath = %windir%\system32\SnippingTool.exe
sniptitle = Snipping Tool
newRectangle()
{
    WinGetActiveStats, Title, Width, Height, X, Y
    if (Title = %sniptitle%)
    {
        Send !{m}
        Send {r}
        Send !{n}
    }
}
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
