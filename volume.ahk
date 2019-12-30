; reassign the Pause and ScrollLock keys to VolUp and VolDown, respectively. 
; reassign Ctrl+End to Mute for somewhat easy access
; Also assign Shift+Pause and Shift+ScrollLock to the keys' native functions
; Does not show an icon, so hyper+Z will exit (hyper+Z is my default exit command,
; therefore most custom key scripts will all exit at once when pressed)

; #NoTrayIcon
Pause::Volume_Up
ScrollLock::Volume_Down
+Pause::Pause
+ScrollLock::ScrollLock
^Ins::Volume_Mute
