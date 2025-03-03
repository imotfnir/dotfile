MouseStepDistance := 12
AccMulti := 6

CapsLock::return
RAlt::CapsLock

CapsLock & w::Up
CapsLock & a::Left
CapsLock & s::Down
CapsLock & d::Right
CapsLock & k::Up
CapsLock & h::Left
CapsLock & j::Down
CapsLock & l::Right
CapsLock & p::PrintScreen
CapsLock & [::Home
CapsLock & ]::End
CapsLock & \::PrintScreen
CapsLock & `;::PgUp
CapsLock & '::PgDn
CapsLock & .::Ins
CapsLock & /::Del


CapsLock & r:: Click "WheelUp"
CapsLock & f:: Click "WheelDown"
CapsLock & e:: Click "WheelRight"
CapsLock & q:: Click "WheelLeft"
CapsLock & y:: Click -MouseStepDistance, 0, "0 Relative"
CapsLock & u:: Click 0, MouseStepDistance, "0 Relative"
CapsLock & i:: Click 0, -MouseStepDistance, "0 Relative"
CapsLock & o:: Click MouseStepDistance, 0, "0 Relative"
; ^CapsLock & y:: Click -MouseStepDistance * AccMulti, 0, "0 Relative"
; ^CapsLock & u:: Click 0, MouseStepDistance * AccMulti, "0 Relative"
; ^CapsLock & i:: Click 0, -MouseStepDistance * AccMulti, "0 Relative"
; ^CapsLock & o:: Click MouseStepDistance * AccMulti, 0, "0 Relative"
; !CapsLock & y:: Click -MouseStepDistance / AccMulti, 0, "0 Relative"
; !CapsLock & u:: Click 0, MouseStepDistance / AccMulti, "0 Relative"
; !CapsLock & i:: Click 0, -MouseStepDistance / AccMulti, "0 Relative"
; !CapsLock & o:: Click MouseStepDistance / AccMulti, 0, "0 Relative"
CapsLock & x::MButton
CapsLock & c::RButton
CapsLock & Space::LButton
CapsLock & z:: Click
CapsLock & v::NumpadEnter