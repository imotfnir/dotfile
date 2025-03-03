MouseStepDistance := 12
AccMulti := 6
A_MaxHotkeysPerInterval := 500 ; Default is 70

#HotIf A_ComputerName != "IMOTFNIR"
    #Include "./annepro2_keymap.ahk"
#HotIf

; Function
MouseIsOver(WinTitle, WinName := unset) {
    MouseGetPos(, , &Win)
    WinObjectExp := WinTitle " ahk_id " Win
    Hwnd := WinExist(WinObjectExp)
    if (!Hwnd) {
        return 0
    }
    if (!IsSet(WinName)) {
        return Hwnd
    }
    if (!RegExMatch(WinGetTitle(WinObjectExp), ".*" WinName ".*")) {
        return 0
    }
    return Hwnd
}

Debug(Str) {
    FileAppend Str "`n", "test.log"
}

IsFullScreenInSomeWebsite(Website) {
    try {
        MouseGetPos , , &Win, &Control
    } catch Error as e {
        return false
    }
    WinObjectExp := "ahk_class Chrome_WidgetWin_1 ahk_exe msedge.exe ahk_id" Win

    ; Full screen check
    if (!RegExMatch(Control, "Intermediate D3D Window.*")) {
        return false
    }
    try {
        WinGetPos(, , &Width, &Height, WinObjectExp)
    } catch Error as e {
        return false
    }
    if (Width != 1920) {
        return false
    }
    if (Height != 1080) {
        return false
    }

    ; Website check
    if (!WinActive(WinObjectExp)) {
        return false
    }
    if (!RegExMatch(WinGetTitle(WinObjectExp), ".*" Website ".*")) {
        return false
    }
    return true
}

GetOnMouseProcessPath() {
    MouseGetPos(, , &Win)
    PID := WinGetPID("ahk_id " Win)
    Path := ProcessGetPath(PID)
    return Path
}

IsOnMouseProcessPath(Path) {
    if (GetOnMouseProcessPath() == Path) {
        return true
    }
    return false
}

SmartQuote() {
    paired := Map('(', ')', '[', ']', '{', '}')
    SendText(paired[SubStr(A_ThisHotkey, 2)])
    Send('{Left}')
    return
}

SmartQuoteAdvanced() {
    paired := Map('(', ')', '[', ']', '{', '}')
    SelectedText := GetSelectedText()
    if (SelectedText == '') {
        SendText(A_ThisHotkey)
        SendText(paired[A_ThisHotkey])
        Send('{Left}')
        return
    }
    SendText(A_ThisHotkey SelectedText paired[A_ThisHotkey])
    Send('{Left}')
    return
}

GetSelectedText() {
    MouseGetPos(, , &OutputVarWin, &OutputVarControl, 2)
    try {
        SelectedText := EditGetSelectedText(OutputVarControl, " ahk_id " OutputVarWin)
        Debug (SelectedText)
    } catch Error as e {
        Debug("Error Type：" type(e) " `n Error Message：" e.Message)
        return ''
    }
    return SelectedText
}


; System control
WheelLeft:: Click "WheelRight"
WheelRight:: Click "WheelLeft"
#!^l:: DllCall("PowrProf\SetSuspendState", "int", 0, "int", 0, "int", 0)
#^l::
{
    Sleep 1000
    SendMessage(0x112, 0xF170, 2, , "Program Manager") ; Turn off screen https://learn.microsoft.com/en-us/windows/win32/menurc/wm-syscommand
}

; Use Keypad to control mouse movement
NumpadAdd:: Click "WheelUp"
NumpadSub:: Click "WheelDown"
NumpadMult:: Click "WheelRight"
NumpadDiv:: Click "WheelLeft"
Numpad4:: Click -MouseStepDistance, 0, "0 Relative"
Numpad2:: Click 0, MouseStepDistance, "0 Relative"
Numpad8:: Click 0, -MouseStepDistance, "0 Relative"
Numpad6:: Click MouseStepDistance, 0, "0 Relative"
^Numpad4:: Click -MouseStepDistance * AccMulti, 0, "0 Relative"
^Numpad2:: Click 0, MouseStepDistance * AccMulti, "0 Relative"
^Numpad8:: Click 0, -MouseStepDistance * AccMulti, "0 Relative"
^Numpad6:: Click MouseStepDistance * AccMulti, 0, "0 Relative"
!Numpad4:: Click -MouseStepDistance / AccMulti, 0, "0 Relative"
!Numpad2:: Click 0, MouseStepDistance / AccMulti, "0 Relative"
!Numpad8:: Click 0, -MouseStepDistance / AccMulti, "0 Relative"
!Numpad6:: Click MouseStepDistance / AccMulti, 0, "0 Relative"
Numpad1::MButton
Numpad3::RButton
Numpad5::LButton
Numpad7:: Click

; Media viewer support
; Telegram Media viewer
#HotIf MouseIsOver("ahk_class Qt51515QWindowIcon ahk_exe Telegram.exe", "Media viewer")
WheelUp:: Send "{Left}"
WheelDown:: Send "{Right}"
Up:: Send "{WheelUp}"
Down:: Send "{WheelDown}"
#HotIf

#HotIf MouseIsOver("ahk_class Qt51515QWindowIcon ahk_exe Telegram.exe")
MButton:: Send "{Browser_Back}"
#HotIf

; PotPlayer
#HotIf MouseIsOver("ahk_exe PotPlayerMini64.exe")
WheelUp:: Send "{Left}"
WheelDown:: Send "{Right}"
^WheelUp:: Send "^{Left}"
^WheelDown:: Send "^{Right}"
+WheelUp:: Send "x"
+WheelDown:: Send "c"
^+WheelUp:: Send "^+{Left}"     ; next keyframe
^+WheelDown:: Send "^+{Right}"  ; previous keyframe
!WheelUp:: Send "f"             ; next frame
!WheelDown:: Send "d"           ; previous frame
#HotIf

; Edge Browser
#HotIf IsFullScreenInSomeWebsite("(YouTube)|(Gimy 劇迷)|(MX动漫)|(ANi Open)|(唐人街影院)|(Hanime1.me)|(Pornhub)|(Jable)|(Miss)")
WheelUp:: Send "{Left}"
WheelDown:: Send "{Right}"
MButton:: Send "{Esc}"
#HotIf MouseIsOver("ahk_class Chrome_WidgetWin_1 ahk_exe msedge.exe")
!WheelUp:: Send "!{Left}"
!WheelDown:: Send "!{Right}"
+WheelUp:: Send "^+{Tab}"
+WheelDown:: Send "^{Tab}"
#HotIf

; Heptabase move line
#HotIf MouseIsOver("ahk_class Chrome_WidgetWin_1 ahk_exe Heptabase.exe")
!Up::^+Up
!Down::^+Down
!Left::^+Left
!Right::^+Right
#HotIf

; Notepad
; #HotIf MouseIsOver("ahk_class Notepad++ ahk_exe notepad++.exe")
; {::
; (::
; [:: SmartQuoteAdvanced()
