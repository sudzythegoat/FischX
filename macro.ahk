control := 0.2 ; The amount of control your rod has
lureSpeed := 50 ; The lure speed percent your rod has
rodCast := 1000 ; How long it holds down to cast your rod

; Do not change any vars below
barLeft := PIXEL LOCATION
barRight := PIXEL LOCATION

ToolTip, Task: Setting Up Macro, x, y, 1
ToolTip, Control: %control%, x, y, 2
ToolTip, Lure Speed: %lureSpeed%, x, y, 3

CastRod() {
    global rodCast
    Click down
    Sleep %rodCast%
    Click up
}
p::
Loop
{
    ToolTip, Task: Casting Rod, x, y, 1
    
}
