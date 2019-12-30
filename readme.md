# QueenKJuul's AutoHotKey Scripts

Just some nonsense to learn git and ahk and make windows more useful

- boot.ahk: inital script which will run the init.ahk and listen for hyper+i hotkey to re-initialize. hyper-z is set as a killswitch in each individual script, so hyper+z then hyper+i will restart everything. Shortcut to boot.ahk is placed in Start>Startup to run on login. 
- init.ahk: start all of my scripts, to allow easy editing of which scripts start and which don't
- mastershortcuts.ahk: system-wide shortcuts to run individual scripts or reassign hotkeys that are not part of individual scripts (e.g. launch Colorette on Win+C)
- Dlg.ahk: from [majkinetor's ahk framework](https://github.com/majkinetor/mm-autohotkey), dependency for Colorette
- colorpicker.ahk: [Appifyer's Colorette.ahk color picker script](https://github.com/Appifyer/Colorette)
- volume.ahk: reassigns Pause to VolUp, ScrLk to VolDown, Ctrl+End to Mute--probably not super useful for people that don't have my keyboard
- screenshots.ahk: Works with Snipping Tool to make Windows screenshotting work more like Mac screenshotting