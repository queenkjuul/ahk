; initgrab.ahk
; the sole function is to reside in the background at all times to allow restarting of 
; my default customizations en masse. 
; each script [that I write at least] will generally have a exit hotkey of hyper+Z
; this includes my mastershortcuts.ahk file that starts add-on scripts (e.g. colorette)
; this way hyper+z followed by my init hotkey will more or less reboot my ahk setup

#NoTrayIcon

;functions
;AHKPanic from None at autohotkey.com forums
;https://autohotkey.com/board/topic/57028-ahkpanic-pause-suspend-or-close-all-running-scripts/

AHKPanic(Kill=1, Pause=0, Suspend=0, SelfToo=0) {
DetectHiddenWindows, On
WinGet, IDList ,List, ahk_class AutoHotkey
Loop %IDList%
  {
  ID:=IDList%A_Index%
  WinGetTitle, ATitle, ahk_id %ID%
  IfNotInString, ATitle, %A_ScriptFullPath%
    {
    If Suspend
      PostMessage, 0x111, 65305,,, ahk_id %ID%  ; Suspend. 
    If Pause
      PostMessage, 0x111, 65306,,, ahk_id %ID%  ; Pause.
    If Kill
      WinClose, ahk_id %ID% ;kill
    }
  }
If SelfToo
  {
  If Suspend
    Suspend, Toggle  ; Suspend. 
  If Pause
    Pause, Toggle, 1  ; Pause.
  If Kill
    ExitApp
  }
}

Run init.ahk
#^!+i::Run init.ahk
#^!+z::AHKPanic()


