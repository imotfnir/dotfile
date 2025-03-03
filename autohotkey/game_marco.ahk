!Esc:: Pause -1
SetMouseDelay 0.5 ;remove delays from mouse actions


; Back 4 Blood
; 刷燃燒卡
F1::
{
    while true {
        Click
        Sleep 500
        Click
        Sleep 500
        Send('x')
        Sleep 500
        Send('{Space}')
        Sleep 2000
        Send('{Space}')
        Sleep 4000
    }
}

; 刷子彈
F2::
{
    Send('{Tab}')
    Sleep 50
    Click 960, 450
    Sleep 100
    Send('{Tab}')
    Sleep 100
    Send('e')
    Sleep 100
}

; 刷配件
F3::
{
    Click
    Click "0 -40 Down Rel"
    Sleep 1
    Click "0 -60 Up Rel"
}