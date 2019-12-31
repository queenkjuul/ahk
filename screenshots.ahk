; screenshots.ahk
; customize PrtScn behavior to my liking--allow for snip tool to be invoked by single PtrScn press, among others
; found to only work with 64-bit AHK on 64-bit Win10

/*

    General Keys Setup:
        PrtScn:     open Snipping Tool. If already open, focus it, and start a new rectangle selection
        Space:      if Snipping Tool is open, focus it, and start a new Single Window selection
        3:          if Snipping Tool is open, focus it, and take a Full Screen screenshot
        f:          if Snipping Tool is open, focus it, and take a Free Form snip
        r:          if Snipping Tool is open, focus it, and take a Rectangle snip
        Win+PrtScn:     Not actually assigned in this script, but Windows will engage default Win+PrtScn behavior (save full screenshot to Picture/Screenshots)
        Control+PrtScn: Not actually assigned in this script, but Windows will engage default PrtScn behavior (copy full screenshot to clipboard)
        Control+Shift+4 (optional): Optional line to assign the Mac screenshot shortcut to PrtScn

*/

#NoTrayIcon
#SingleInstance Force

snippath = %windir%\system32\SnippingTool.exe
sniptitle = Snipping Tool

; functions

activateWindow()
{
    WinActivate, ahk_exe snippath
}

newRectangle()
{
    ControlSend, , !n, ahk_exe SnippingTool.exe
    Sleep, 500
    ControlSend, , !m, ahk_exe SnippingTool.exe
    ControlSend, , r, ahk_exe SnippingTool.exe
}

newWindow()
{
    ControlSend, , !n, ahk_exe SnippingTool.exe
    Sleep, 500
    ControlSend, , !m, ahk_exe SnippingTool.exe
    ControlSend, , w, ahk_exe SnippingTool.exe
}

newFullscreen()
{
    ControlSend, , !n, ahk_exe SnippingTool.exe
    Sleep, 500
    ControlSend, , !m, ahk_exe SnippingTool.exe
    ControlSend, , s, ahk_exe SnippingTool.exe
}

newFreeform()
{
    ControlSend, , !n, ahk_exe SnippingTool.exe
    Sleep, 500
    ControlSend, , !m, ahk_exe SnippingTool.exe
    ControlSend, , f, ahk_exe SnippingTool.exe
}

; hotkeys

PrintSCreen::
{
    if (Not WinExist("ahk_exe SnippingTool.exe"))
    {
        Run, %snippath%, , , pid
    }
    WinWait, ahk_exe SnippingTool.exe
    activateWindow()
    newRectangle()
    Return
}

$Space::
{
    WinGetActiveStats, Title, Width, Height, X, Y
    if (Title = sniptitle)
    {
        newWindow()
        Return
    }
    else
    {
        Send {Space} 
        Return
    }
    
}

$3::
{
    WinGetActiveStats, Title, Width, Height, X, Y
    if (Title = sniptitle)
    {
        newFullscreen()
        Return
    }
    else
    {
        Send {3} 
        Return
    }   
}

$f::
{
    WinGetActiveStats, Title, Width, Height, X, Y
    if (Title = sniptitle)
    {
        newFreeform()
        Return
    }
    else
    {
        Send {f} 
        Return
    }  
}

$r::
{
    WinGetActiveStats, Title, Width, Height, X, Y
    if (Title = sniptitle)
    {
        newRectangle()
        Return
    }
    else
    {
        Send {r} 
        Return
    }  
}
; uncomment this next line to enable macOS shortcut
;^+4::Gosub, PrintScreen       ; ctrl+shift+4 for new rectangle (macOS Cmd+Shift+4 equivalent)
