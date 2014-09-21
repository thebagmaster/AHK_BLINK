#NoTrayIcon
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



wb := ComObjCreate("InternetExplorer.Application")
wb.Visible := true
clicked := false

loop {
    wb.Navigate("http://cogdev.net/blink/")
    while wb.busy or wb.ReadyState != 4
        Sleep 100
    if(wb.document.getElementById("featured_blink") and wb.document.getElementById("promo_description") and clicked == false){
        try{
            random, tik, 1,175
            wb.document.getElementsByName("buy[" . tik . "]")[0].click()
        }catch { 
        }
        clicked := true
        while wb.busy or wb.ReadyState != 4
            Sleep 100
    }
    else    
        clicked := false
    Random ,r,3000,5000
    sleep %r%
}

~f4::
wb.Visible := false
return