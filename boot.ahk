; initgrab.ahk
; the sole function is to reside in the background at all times to allow restarting of 
; my default customizations en masse. 
; each script [that I write at least] will generally have a exit hotkey of hyper+Z
; this includes my mastershortcuts.ahk file that starts add-on scripts (e.g. colorette)
; this way hyper+z followed by my init hotkey will more or less reboot my ahk setup

;#NoTrayIcon
Run init.ahk
#^!+i::Run init.ahk