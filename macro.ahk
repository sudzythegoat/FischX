control := 0.2 ; The amount of control your rod has
rodCast := 1000 ; How long it holds down to cast your rod

; ========== Do not change any vars below ==========

ToolTip, Task: Setting Up Macro, x, y, 1
ToolTip, Control: %control%, x, y, 2
ToolTip, Error: None, x, y, 4
ToolTip, Press P to Start, x, y, 5
ToolTip, Press T to Stop, x, y, 6

CastRod() {
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
    PixelSearch, FishX, FishY, 246, 533, 569, 533, 0x434b5b, 3, FastRGB
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
