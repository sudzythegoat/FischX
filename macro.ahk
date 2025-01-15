control := 0.2 ; The amount of control your rod has
rodCast := 1000 ; How long it holds down to cast your rod

; ========== Do not change any vars below ==========

p::
Loop
{  
    fail := 0
    Sleep 200
    ToolTip, Task: Casting Rod, x, y, 1
    Sleep 50
    Click down
    Sleep 1000
    Click up
    Sleep 50
    ; ToolTip, Task: Shaking Rod, x, y, 1
    Sleep 50
    BarColor := 0x000000
    barCenterX := 943
    barCenterY := 884
    Send {\}
    Sleep 200
    While (true) {
       PixelSearch, FoundX, FoundY, 520, 809, 1379, 942, 0x434B5B, 3, Fast RGB
       if (ErrorLevel) {
           ; Pixel not found, perform actions
           Send {Down}
           Sleep 50
           Send {Enter}
           Sleep 50
       } else {
           Break
       }
    }
    Sleep 350
    While (fail < 5) {
       PixelSearch, FoundX, FoundY, 520, 809, 1379, 942, 0x434B5B, 3, Fast RGB
       if (!ErrorLevel) {
           Tooltip, FISCH LOCATION, FoundX, 800
           While (FoundX > BarCenter) {
	       Click Down
               Sleep 50
	   }
	   Click up
      	   Sleep 50
       } else {
           Tooltip, Not Found
           fail += 1
	   Sleep 50
       }
    }
    Sleep 3000
}
t::ExitApp
