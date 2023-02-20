;; memory required to load instructions 
;; 1 page of memory loaded (64kB)
(import "env" "memory" (memory 1))

;;-------------------Drawing Functions
;;-------------------
(; Copies pixels to the framebuffer. ;)
(import "env" "blit" (func $blit (param i32 i32 i32 i32 i32 i32)))

(; Copies a subregion within a larger sprite atlas to the framebuffer. ;)
(import "env" "blitSub" (func $blitSub (param i32 i32 i32 i32 i32 i32 i32 i32 i32)))

(; Draws a line between two points. ;)
(import "env" "line" (func $line (param i32 i32 i32 i32)))

(; Draws a horizontal line. ;)
(import "env" "hline" (func $hline (param i32 i32 i32)))

(; Draws a vertical line. ;)
(import "env" "vline" (func $vline (param i32 i32 i32)))

(; Draws an oval (or circle). ;)
(import "env" "oval" (func $oval (param i32 i32 i32 i32)))

(; Draws a rectangle. ;)
(import "env" "rect" (func $rect (param i32 i32 i32 i32)))

(; Draws text using the built-in system font. ;)
(import "env" "text" (func $text (param i32 i32 i32)))

(; Plays a sound tone. ;)
(import "env" "tone" (func $tone (param i32 i32 i32 i32)))

;;------------------Storage Functions
;;------------------
(; Reads up to `size` bytes from persistent storage into the pointer `dest`. ;)
(import "env" "diskr" (func $diskr (param i32 i32)))

(; Writes up to `size` bytes from the pointer `src` into persistent storage. ;)
(import "env" "diskw" (func $diskw (param i32 i32)))

(; Prints a message to the debug console. ;)
(import "env" "trace" (func $trace (param i32)))

(; Prints a message to the debug console. ;)
(import "env" "tracef" (func $tracef (param i32 i32)))

;;-----------------------Memory Addresses
;;-----------------------
;; palette0 is usually the background color
(global $PALETTE0 i32 (i32.const 0x04))  
(global $PALETTE1 i32 (i32.const 0x08))
(global $PALETTE2 i32 (i32.const 0x0c))
(global $PALETTE3 i32 (i32.const 0x10))
(global $DRAW_COLORS i32 (i32.const 0x14))
(global $GAMEPAD1 i32 (i32.const 0x16))
(global $GAMEPAD2 i32 (i32.const 0x17))
(global $GAMEPAD3 i32 (i32.const 0x18))
(global $GAMEPAD4 i32 (i32.const 0x19))
(global $MOUSE_X i32 (i32.const 0x1a))
(global $MOUSE_Y i32 (i32.const 0x1c))
(global $MOUSE_BUTTONS i32 (i32.const 0x1e))
(global $SYSTEM_FLAGS i32 (i32.const 0x1f))
(global $NETPLAY i32 (i32.const 0x20))
(global $FRAMEBUFFER i32 (i32.const 0xa0))

(global $BUTTON_1 i32 (i32.const 1))
(global $BUTTON_2 i32 (i32.const 2))
(global $BUTTON_LEFT i32 (i32.const 16))
(global $BUTTON_RIGHT i32 (i32.const 32))
(global $BUTTON_UP i32 (i32.const 64))
(global $BUTTON_DOWN i32 (i32.const 128))

(global $MOUSE_LEFT i32 (i32.const 1))
(global $MOUSE_RIGHT i32 (i32.const 2))
(global $MOUSE_MIDDLE i32 (i32.const 4))

(global $SYSTEM_PRESERVE_FRAMEBUFFER i32 (i32.const 1))
(global $SYSTEM_HIDE_GAMEPAD_OVERLAY i32 (i32.const 2))

(global $BLIT_2BPP i32 (i32.const 1))
(global $BLIT_1BPP i32 (i32.const 0))
(global $BLIT_FLIP_X i32 (i32.const 2))
(global $BLIT_FLIP_Y i32 (i32.const 4))
(global $BLIT_ROTATE i32 (i32.const 8))

(global $TONE_PULSE1 i32 (i32.const 0))
(global $TONE_PULSE2 i32 (i32.const 1))
(global $TONE_TRIANGLE i32 (i32.const 2))
(global $TONE_NOISE i32 (i32.const 3))
(global $TONE_MODE1 i32 (i32.const 0))
(global $TONE_MODE2 i32 (i32.const 4))
(global $TONE_MODE3 i32 (i32.const 8))
(global $TONE_MODE4 i32 (i32.const 12))
(global $TONE_PAN_LEFT i32 (i32.const 16))
(global $TONE_PAN_RIGHT i32 (i32.const 32))

;; Player character position
(global $x (mut i32) (i32.const 46))
(global $y (mut i32) (i32.const 76))

(data (i32.const 0x19a0) "\c3\99\99\99\99\99\99\99") ;; N(unchuk)
(data (i32.const 0x19a8) "\c3\99\99\99\99\99\99\c3") ;; O
(data (i32.const 0x19b0) "\c3\cc\cc\cc\cc\cc\cc\c3") ;; thickD
(data (i32.const 0x19b8) "\11\11\11\11\11\11\11\11") ;; II
(data (i32.const 0x19c0) "\c3\66\66\66\66\66\66\c3") ;; I - you
(data (i32.const 0x19c8) "\c3\88\88\88\88\88\88\c3") ;; ironO
(data (i32.const 0x19d0) "\c3\ff\ff\ff\ff\ff\ff\c3") ;; linesacross1
(data (i32.const 0x19d8) "\dd\dd\dd\dd\dd\dd\dd\dd") ;; uplines
(data (i32.const 0x19e0) "\81\ee\ee\ee\ee\ee\ee\81") ;; thinD
(data (i32.const 0x19e8) "\81\ff\ff\ff\ff\ff\ff\81") ;; linesacross2
(data (i32.const 0x19f0) "\69\96\69\96\69\96\69\96") ;; floor
(data (i32.const 0x19f8) "\09\69\69\69\69\69\69\09") ;; oi
(data (i32.const 0x2000) "\13\07\39\39\39\39\07\13") ;; mol1-rotate
(data (i32.const 0x2008) "\13\35\39\39\39\39\35\13") ;; cCar-rotate
(data (i32.const 0x2010) "\13\07\52\52\52\52\07\13") ;; mol2-rotate
(data (i32.const 0x2018) "\13\07\65\65\65\65\07\13") ;; mol3-rotate
(data (i32.const 0x2020) "\13\07\11\11\11\11\07\13") ;; mol4-rotate
(data (i32.const 0x2028) "\13\07\55\55\55\55\07\13") ;; mol5-rotate
(data (i32.const 0x2030) "\13\07\88\88\88\88\07\13") ;; molcar-rotate
(data (i32.const 0x2038) "\07\11\18\18\18\18\11\07") ;; shape01
(data (i32.const 0x2040) "\81\08\24\08\24\08\24\81") ;; razor
(data (i32.const 0x2048) "\81\08\24\24\24\24\08\81") ;; 0-razor-rotate
(data (i32.const 0x2050) "\24\81\08\08\08\08\81\24") ;; spider
(data (i32.const 0x2058) "\24\08\81\81\81\81\08\ff") ;; castle
(data (i32.const 0x2060) "\23\23\06\06\06\06\23\23") ;; yman-rotate
(data (i32.const 0x2068) "\06\06\23\23\23\23\06\06") ;; faceman-rotate
(data (i32.const 0x2070) "\23\06\23\06\23\06\23\06") ;;building-rotate
(data (i32.const 0x2078) "\a1\a1\10\10\10\10\a1\a1") ;;hatman-rotate
(data (i32.const 0x2080) "\c3\81\24\81\24\81\24\c3") ;;house1
(data (i32.const 0x2088) "\c3\24\81\24\81\24\81\c3") ;;house2
(data (i32.const 0x2090) "\00\58\13\58\13\58\13\00") ;;house3
(data (i32.const 0x2098) "\c3\34\55\89\00\89\34\c3") ;;cat
(data (i32.const 0x20a0) "\03\00\3f\01\80\fc\00\C0") ;; S
(data (i32.const 0x20a8) "\bd\3c\3c\00\00\3c\3c\bd") ;; R
(data (i32.const 0x20b0) "\01\00\3c\00\01\3c\3c\3c")
;;(data (i32.const 0x20a8) "\04\10\04\10\0F\F0\3C\3C\3C\3C\0F\F0\03\C0\00\00\02\80\02\A0\0A\A0\08\20\3C\3C\3C\3C\3C\3C\28\28")  

(func $inputHandler (local $gamepad i32) (local $dx i32) (local $dy i32) 
      ;;gamepad 1 (at memory 0x16) loaded here
      ;; load an unsigned 8-bit number and convert it into an i32 
      ;; here taking the 8bit controller and making it i32
      ;; set the gamepad with the current number on the stack? 0x16 
      i32.const 0x16
      i32.load8_u
      local.set $gamepad
 
      ;;left  
      local.get $gamepad
      i32.const 0x10
      i32.and 
      if 
        i32.const -1 
        local.set $dx
      end 

      ;;right 
      local.get $gamepad
      i32.const 0x20
      i32.and
      if
        i32.const 1 
        local.set $dx
      end 

      ;; up 
      local.get $gamepad 
      i32.const 0x40 
      i32.and 
      if 
        i32.const -1 
        local.set $dy
      end 

      ;;down 
      local.get $gamepad 
      i32.const 0x80 
      i32.and 
      if 
        i32.const 1 
        local.set $dy
      end 
    
      global.get $x
      local.get $dx
      i32.add
      global.set $x

      global.get $y 
      local.get $dy 
      i32.add 
      global.set $y 
)

(func (export "start")
(i32.store (global.get $PALETTE0) (i32.const 0x1e1c32))
(i32.store (global.get $PALETTE1) (i32.const 0xFF00FF))
(i32.store (global.get $PALETTE2) (i32.const 0xFFFFFF))
(i32.store (global.get $PALETTE3) (i32.const 0x00FF00))
)

(func (export "update")
  call $inputHandler


  (i32.store16 (global.get $DRAW_COLORS) (i32.const 4))
  (call $blit (i32.const 0x20a0) (i32.const 65) (i32.const 36) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; S
  (call $blit (i32.const 0x20a8) (i32.const 73) (i32.const 36) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; H
  (call $blit (i32.const 0x20b0) (i32.const 80) (i32.const 36) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; R
  (call $blit (i32.const 0x19a8) (i32.const 88) (i32.const 36) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; O
  (call $blit (i32.const 0x19a8) (i32.const 94) (i32.const 36) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; O
  (call $blit (i32.const 0x19a0) (i32.const 101) (i32.const 36) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; M1
  (call $blit (i32.const 0x19a0) (i32.const 105) (i32.const 36) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; M2
 
  (call $blit (i32.const 0x19a0) (i32.const 85) (i32.const 46) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; N
 
  (call $blit (i32.const 0x19b0) (i32.const 75) (i32.const 56) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; D
  (call $blit (i32.const 0x19a8) (i32.const 83) (i32.const 56) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; O
  (call $blit (i32.const 0x19a8) (i32.const 90) (i32.const 56) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; O
  (call $blit (i32.const 0x19a0) (i32.const 97) (i32.const 56) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; M1
  (call $blit (i32.const 0x19a0) (i32.const 101) (i32.const 56) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; M2
  
  (call $blit (i32.const 0x19b8) (i32.const 83) (i32.const 66) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP)) ;; II 
 
 
  (call $blit (i32.const 0x2000) (i32.const 83) (i32.const 86) (i32.const 8) (i32.const 8) (i32.or(global.get $BLIT_1BPP )(global.get $BLIT_ROTATE)))

  (i32.store16 (global.get $DRAW_COLORS) (i32.const 0x4320))
 ;; (call $blit (i32.const 0x20a0) (i32.const 75) (i32.const 96) (i32.const 8) (i32.const 16) (global.get $BLIT_2BPP))
    ;;add main character and move with game pad
    i32.const 0x19c0
    global.get $x
    global.get $y
    i32.const 8
    i32.const 8
    i32.const 0
    call $blit
)


