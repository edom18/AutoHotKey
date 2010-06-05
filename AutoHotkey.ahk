;====================
;  CapsLock OFF
;====================
SetStoreCapslockMode, off

;====================
;  Hotkey Off.
;====================
#o::Suspend


;====================
;  Common
;====================
^+y::RButton
;LAlt & WheelDown::AltTab
;LAlt & WheelUp::ShiftAltTab
sc07B & WheelDown::Send,{PgDn}
sc07B & WheelUp::Send,{PgUp}
;sc07B & C::WinMaximize, A


;====================
;  Vim
;====================
#IfWinActive ahk_class Vim
^Tab::
  WinGetClass, className, A
  WinActivateBottom, ahk_class %className%
  return
#IfWinActive


;====================
;  Browser setting.
;====================

;--------------------
;  Firefox
;--------------------
vk1Csc079 & A::Goto, firefoxKey
sc07B & A::Goto, firefoxKey

firefoxKey:
Send, {Blind}{sc07B}
Process,Exist,firefox.exe
If ErrorLevel<>0
	WinActivate, ahk_pid %ErrorLevel%
else
	Run,firefox.exe
return

#IfWinActive ahk_class MozillaUIWindowClass
	~vk1Csc079 & A::WinMinimize,ahk_class MozillaUIWindowClass
	~sc07B & A::WinMinimize,ahk_class MozillaUIWindowClass
	return
#IfWinExist

;--------------------
;  Google Chrome
;--------------------
vk1Csc079 & S::Goto, chromeKey
sc07B & S::Goto, chromeKey

chromeKey:
Send, {Blind}{sc07B}
Process,Exist,chrome.exe
If ErrorLevel<>0
	WinActivate,ahk_pid %ErrorLevel%
else
	Run,chrome.exe
return

#IfWinActive ahk_class Chrome_WindowImpl_0
	~vk1Csc079 & S::WinMinimize,ahk_class Chrome_WindowImpl_0
	return
#IfWinActive


;--------------------
;  Safari
;--------------------
vk1Csc079 & D::
Send, {Blind}{sc07B}
Process,Exist,safari.exe
If ErrorLevel<>0
	WinActivate,ahk_pid %ErrorLevel%
else
	Run,safari.exe
return

#IfWinActive ahk_class {1C03B488-D53B-4a81-97F8-754559640193}
	~vk1Csc079 & D::WinMinimize,ahk_class {1C03B488-D53B-4a81-97F8-754559640193}
	return
#IfWinActive

;--------------------
;  IE
;--------------------
#v::Goto, vk1Csc079 & V
vk1Csc079 & V::
Send, {Blind}{sc07B}
Process,Exist,iexplore.exe
If ErrorLevel<>0
	WinActivate,ahk_pid %ErrorLevel%
else
	Run,iexplore.exe
return

;--------------------
;  Notepad
;--------------------
; Active or Run
vk1Csc079 & N::
Process,Exist,notepad.exe
If ErrorLevel<>0
	WinActivate,ahk_pid %ErrorLevel%
else
	Run,notepad.exe
return

;  Switch window by Tab button
#IfWinActive ahk_class Notepad
^Tab::
  WinGetClass, className, A
  WinActivateBottom, ahk_class %className%
  return
#IfWinActive


;====================
;  Activete
;====================

;--------------------
;  IE
;--------------------
#IfWinActive ahk_class IEFrame
^+v::
	WinMinimize,ahk_class IEFrame
	return

#IfWinExist ahk_class IEFrame
^+v::
	WinActivate,ahk_class IEFrame
	return
#IfWinExist

;--------------------
;  Skype
;--------------------
#IfWinActive ahk_class tSkMainForm.UnicodeClass
#s::
	WinMinimize,ahk_class tSkMainForm.UnicodeClass
	return
#IfWinActive

#IfWinExist ahk_class tSkMainForm.UnicodeClass
#s::
	WinActivate,ahk_class tSkMainForm.UnicodeClass
	return
#IfWinExist

;--------------------
;  Vim
;--------------------
#IfWinActive ahk_class Vim
	~vk1Csc079 & F::WinMinimize,ahk_class Vim
	~sc07B & F::WinMinimize,ahk_class Vim
	return
#IfWinActive

#IfWinExist ahk_class Vim
	~vk1Csc079 & F::WinActivate,ahk_class Vim
	~sc07B & F::WinActivate,ahk_class Vim
	return
#IfWinExist

;-------------------------------
;  Popup menu.
;-------------------------------
;CapsLock
;vkF0sc03A & Space::Goto, popup 
;sc07B & Space::Goto, popup

sc07B up:: DoubleKey("popup", 400) 
DoubleKey(label, timeout){
 if(A_PriorHotKey = A_ThisHotKey and A_TimeSincePriorHotkey < timeout)
	popup()
}


popup(){
Menu, popMenu, add, Firefox &F, runFx
Menu, popMenu, add, Google Chrome &G, runGC
Menu, popMenu, add, Safari &S, runSa
Menu, popMenu, add, Opera &O, runOp
Menu, popMenu, add, IETester &T, runIEtester
Menu, popMenu, add, Notepad &D, runNotepad
Menu, popMenu, add, MyDocument &A, runMyDoc
Menu,popMenu,show
return
}

runFx:
Run, firefox.exe
return

runGC:
Run, chrome.exe
return

runSa:
Run, safari.exe
return

runOp:
Run, C:\Program Files\Opera\opera.exe
return

runIEtester:
Process,Exist,IETester.exe
If ErrorLevel<>0
	WinActivate,ahk_pid %ErrorLevel%
else
	Run,C:\Program Files\IETester\IETester.exe
return

runMyDoc:
Run, C:\Documents and Settings\hiruma-kazuya\My Documents
return

runNotepad:
Process,Exist, notepad.exe
If ErrorLevel<>0
	WinActivate,ahk_pid %ErrorLevel%
else
	Run, notepad.exe
return

;-------------------------------
;  key bind to 'muhenkan' button.
;-------------------------------

;  cursor key.
~sc07B & 1::Send, {Blind}{F1}
sc07B & 2::Send, {Blind}{F2}
sc07B & 3::Send, {Blind}{F3}
sc07B & 4::Send, {Blind}{F4}
sc07B & 5::Send, {Blind}{F5}
sc07B & 6::Send, {Blind}{F6}
sc07B & 7::Send, {Blind}{F7}
sc07B & 8::Send, {Blind}{F8}
sc07B & 9::Send, {Blind}{F9}
sc07B & 0::Send, {Blind}{F0}

sc07B & sc079::Send, {Blind}{LButton}

sc07B & V::Send, {Blind}{F12}
sc07B & H::Send, {Blind}{Left}
sc07B & K::Send, {Blind}{Up}
sc07B & J::Send, {Blind}{Down}
sc07B & I::Send, {Blind}{Esc}
sc07B & L::Send, {Blind}{Right}
sc07B & O::Send, {Blind}{END}
sc07B & U::Send, {Blind}{HOME}
;sc07B & S::Send, {Blind}{F2}
sc07B & G::Send, {Blind}{F2}
sc07B & E::Send, {Blind}{Esc}
sc07B & T::Send, {Blind}^T
sc07B & M::Send, {Blind}{PgUP}
sc07B & N::Send, {Blind}{PgDn}
sc07B & Y::Send, {Blind}{BS}
sc07B & B::Send, {Blind}{DEL}
sc07B & Q::Goto, ~vk1Csc079 & Q
sc07B & `;::Send, ^c
sc07B & p::Send, ^v

; window maximize or restore.
sc07B & C:: MaxRest()
MaxRest() {
	WinGet, win, ,A
	chk := H2IsZ(win)
	if chk
		WinRestore, A
	else
		WinMaximize, A
	return
}


;-------------------------------
;  CaspLock key bind
;-------------------------------
;sc03A & S::Send, {F2}{sc03A}


;-------------------------------
;  move window
;-------------------------------
sc07B & left::
MouseMove, -5,0,0,R
return

sc07B & right::
MouseMove, 5,0,0,R
return

sc07B & up::
MouseMove, 0,-5,0,R
return

sc07B & down::
MouseMove, 0,5,0,R
return

sc07B & R::Send, {Blind}{F5}

sc07B & W::
WinClose, A
return

sc07B & z::
WinMinimize, A
return

sc07B & Tab::Send, ^{Tab}


;-----------------------------
; key bind to 'henkan' button.
;-----------------------------
~vk1Csc079 & R::Send, {Blind}{sc07B}{F5}{sc07B}
~vk1Csc079 & 1::Send, {Blind}{sc07B}{F1}{sc07B}
~vk1Csc079 & 2::Send, {Blind}{sc07B}{F2}{sc07B}
~vk1Csc079 & 3::Send, {Blind}{sc07B}{F3}{sc07B}
~vk1Csc079 & 4::Send, {Blind}{sc07B}{F4}{sc07B}
~vk1Csc079 & 5::Send, {Blind}{sc07B}{F5}{sc07B}
~vk1Csc079 & 6::Send, {Blind}{sc07B}{F6}{sc07B}
~vk1Csc079 & 7::Send, {Blind}{sc07B}{F7}{sc07B}
~vk1Csc079 & 8::Send, {Blind}{sc07B}{F8}{sc07B}
~vk1Csc079 & 9::Send, {Blind}{sc07B}{F9}{sc07B}
~vk1Csc079 & 0::Send, {Blind}{sc07B}{F0}{sc07B}
~sc079 & T::Goto, sc07B & T
~sc079 & H::Send, {Blind}^+{Tab}
~sc079 & L::Send, {Blind}^{Tab}

~vk1Csc079 & W::
Send, {Blind}{sc07B}
WinClose, A
return

~vk1Csc079 & z::
Send, {Blind}{sc07B}
WinMinimize, A
return

~vk1Csc079 & Q::
Send, {Blind}{sc07B}
WinMinimizeAll
return

~vk1Csc079 & T::AltTab

;====================
;  X-Finder
;====================
sc07b & D::
Process,Exist,XF.exe
If ErrorLevel<>0
	WinActivate,ahk_pid %ErrorLevel%
else
	Run, C:\Documents and Settings\user\デスクトップ\MyDesktop\tool\xf11-5\XF.exe
return

;#IfWinExist ahk_class TXFinder.UnicodeClass
;  sc07b & D::WinActivate,ahk_class TXFinder.UnicodeClass
;#IfWinExist

#IfWinActive ahk_class TXFinder.UnicodeClass
  sc07B & D::Goto, !x
  !x::WinMinimize
#IfWinActive


;====================
;  Hotstring
;====================
::fth::set ft=html
::fen8::set fenc=utf-8
::fens::set fenc=shift_jis

;====================
; check active window status Maximize or not.
;====================
H2IsZ(hWindow)
{
	Return DllCall("user32.dll\IsZoomed", "UInt", hWindow)
}
