SetDefaultMouseSpeed 0

!Esc:: Pause -1
F13:: {
    global IsTurnOn := true
    InfDragMode()
}
^F13:: {
    global IsTurnOn := false
}

GetDisplacement(X0, Y0, X, Y) {
    return (Abs(X - X0) + Abs(Y - Y0))
}

WaitUntilDisplacementOutOfRange(StartPosX, StartPosY) {
    while (true) {
        MouseGetPos &EndPosX, &EndPosY
        if (GetDisplacement(StartPosX, StartPosY, EndPosX, EndPosY) > 50) {
            return
        }
        if (!IsTurnOn) {
            SendEvent "{Click R Up}"
            return
        }
        Sleep 50
    }
}

DragMode(StartPosX, StartPosY) {
    SendEvent "{Click R Down}"
    WaitUntilDisplacementOutOfRange(StartPosX, StartPosY)
    ResetMousePos := "{Click R Up}{Click " StartPosX ", " StartPosY ", 0}{Click R Down}"
    SendEvent ResetMousePos
}

InfDragMode() {
    MouseGetPos &StartPosX, &StartPosY
    while (true) {
        DragMode(StartPosX, StartPosY)
        if (!IsTurnOn) {
            return
        }
    }
}
