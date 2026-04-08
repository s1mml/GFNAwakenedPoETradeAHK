#Requires AutoHotkey v2.0

;## 	SETUP
;##	1 - Create new Google Doc, set it to public, put the ID in the Source variable below
;##	2 - Open Steam Overlay Settings on GFN, change Overlay shortcut key to F7
;##	3 - Change Web browser home page to your Google Doc
;##	4 - Right click AwakenedPoeTrade Icon and open in Browser
;##	5 - Open Settings, under General change PoE Window Title to "Path of Exile on GeForce NOW"
;##	6 - Before using this, make sure the Google Doc is loaded when pressing F7
;##	7 - Enjoy!  

;### replace ID with your gDoc ID (the text between /d/ and /edit|view)
Source := "https://docs.google.com/document/d/---> YOUR ID HERE <---/export?format=txt"

;## hotkeys, change them if you want
F5::gotoHideout()
F6::copyItem()

;## teleports to hideout
gotoHideout(){
	Send "{enter}"
	sleep 20
	Send "/hideout"	
	sleep 20
	Send "{enter}"
}

;## 
copyItem(){
	SetKeyDelay 0,60
	Send "^!c"
	Sleep 20
	Send "{F7}"
	Sleep 20
	SendEvent "^{a}"
	Sleep 20
	SendEvent "^{v}"
	Sleep 20
	Send "{F7}"
	
	getGdoc()

} 


getGdoc(){
	
	oldClipboard := A_Clipboard
	whr := ComObject("WinHttp.WinHttpRequest.5.1")
	whr.Open("GET", Source, true)
	whr.Send()
	whr.WaitForResponse()

	text := RegExReplace(whr.ResponseText, "[^[:ascii:]—]") ; Replaces some weird Characters, idk why they're there
	
	SendEvent "^!d"
	Sleep 50
	A_Clipboard := text
	Sleep 200
	A_Clipboard := oldClipboard
}