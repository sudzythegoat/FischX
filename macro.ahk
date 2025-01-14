control := 0.2 ; The amount of control your rod has
rodCast := 1000 ; How long it holds down to cast your rod

; ========== Do not change any vars below ==========

ToolTip, Task: Setting Up Macro, x, y, 1
ToolTip, Control: %control%, x, y, 2
ToolTip, Lure Speed: %lureSpeed%, x, y, 3
ToolTip, Error: None, x, y, 4
ToolTip, Press P to Start, x, y, 5
ToolTip, Press T to Stop, x, y, 6

CastRod() {
    global rodCast
    Click down
    Sleep %rodCast%
    Click up
}

ShakeRod() {
    BarColor := 0x000000
    barCenterX := PIXEL LOCATION
    barCenterY := PIXEL LOCATION

    Send {\}
    Sleep 50
    While (BarColor != 0xFFFFFF) {
        PixelGetColor, BarColor, barCenterX, barCenterY
        Send {Down}
        Sleep 50
        Send {Enter}
        Sleep 50
    }
}

Minigame() {
    barLeftX := PIXEL LOCATION
    barLeftY := PIXEL LOCATION
    barRightX := PIXEL LOCATION
    barRightY := PIXEL LOCATION
    barCheckLeft := 0x000000
    barCheckRight := 0x000000

    Loop {
        PixelGetColor, BarCheck, barLeftX, barLeftY
        if (BarCheckLeft != 0xFFFFFF) {
            Click down
            PixelGetColor, BarCheckRight, barRightX, barRightY
            Sleep 1000
            if (BarCheckRight != 0xFFFFFF)
            Click up
        }
    }
}

p::
Loop
{  
    Sleep 200
    ToolTip, Task: Casting Rod, x, y, 1
    Sleep 50
    CastRod()
    Sleep 50
    ToolTip, Task: Shaking Rod, x, y, 1
    Sleep 50
    ShakeRod()
    Sleep 350
    Minigame()
    Sleep 3000
}
t::ExitApp
