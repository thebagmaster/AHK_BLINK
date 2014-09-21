;#NoTrayIcon
#NoEnv
SendMode Input
SetWorkingDir %A_ScriptDir%
DetectHiddenWindows On
SetKeyDelay,-1,-1

run "chrome" "cogdev.net/blink/"
Random ,r,2000,4000
sleep %r%
chrome := winexist("SOMER Blink")
controlget, window, hwnd,,Chrome_RenderWidgetHostHWND1,ahk_id %chrome%
controlget, urlbar, hwnd,,Chrome_OmniboxView1,ahk_id %chrome%

loop{
	ControlSetText,,% "javascript:"
	. "if(document.getElementById('featured_blink') && document.getElementById('promo_description')){"
	. "	var ran = Math.floor((Math.random()*200)+1);"
	. "	while(!document.getElementsByName('buy[' + ran + ']')){"
	. " ran = Math.floor((Math.random()*300)+16);}"
	. " document.getElementsByName('buy[' + ran + ']')[0].focus();}", ahk_id %urlbar%

	controlsend,,{enter}, ahk_id %urlbar%
	sleep,100
	controlfocus,, ahk_id %window%
	controlsend,,{space}, ahk_id %window%
	
	Random ,r,2000,4000
	sleep %r%
	ControlSetText,,% "http://cogdev.net/blink/", ahk_id %urlbar%
	controlsend,,{enter}, ahk_id %urlbar%
	Random ,r,2000,4000
	sleep %r%
}
~f9::winhide, ahk_id %chrome%return
~f10::winshow, ahk_id %chrome%return