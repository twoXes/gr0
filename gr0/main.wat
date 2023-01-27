;;
;; WASM-4: https://wasm4.org/docs

(import "env" "memory" (memory 1))

;; ┌───────────────────────────────────────────────────────────────────────────┐
;; │                                                                           │
;; │ Drawing Functions                                                         │
;; │                                                                           │
;; └───────────────────────────────────────────────────────────────────────────┘
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

;; ┌───────────────────────────────────────────────────────────────────────────┐
;; │                                                                           │
;; │ Sound Functions                                                           │
;; │                                                                           │
;; └───────────────────────────────────────────────────────────────────────────┘
(; Plays a sound tone. ;)
(import "env" "tone" (func $tone (param i32 i32 i32 i32)))

;; ┌───────────────────────────────────────────────────────────────────────────┐
;; │                                                                           │
;; │ Storage Functions                                                         │
;; │                                                                           │
;; └───────────────────────────────────────────────────────────────────────────┘
(; Reads up to `size` bytes from persistent storage into the pointer `dest`. ;)
(import "env" "diskr" (func $diskr (param i32 i32)))

(; Writes up to `size` bytes from the pointer `src` into persistent storage. ;)
(import "env" "diskw" (func $diskw (param i32 i32)))

(; Prints a message to the debug console. ;)
(import "env" "trace" (func $trace (param i32)))

(; Prints a message to the debug console. ;)
(import "env" "tracef" (func $tracef (param i32 i32)))


;; ┌───────────────────────────────────────────────────────────────────────────┐
;; │                                                                           │
;; │ Memory Addresses                                                          │
;; │                                                                           │
;; └───────────────────────────────────────────────────────────────────────────┘

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


;; smiley
(data (i32.const 0x19a0) "\11\11\11\11\11\11\11\11")
(data (i32.const 0x19a8) "\ab\ba\12\21\43\34\ba\ab")
(data (i32.const 0x19b0) "\ab\cd\ef\ff\fe\dc\ba\ab")
(data (i32.const 0x19b8) "\01\23\45\67\84\ab\cd\ef")
(data (i32.const 0x19c0) "\98\76\54\32\1f\ed\cb\af")
(data (i32.const 0x19c8) "\66\66\66\66\66\66\66\66")
(data (i32.const 0x19d0) "\77\77\77\77\77\77\77\77")
(data (i32.const 0x19d8) "\88\88\88\88\88\88\88\88")
(data (i32.const 0x19e0) "\99\99\99\99\99\99\99\99")
(data (i32.const 0x19e8) "\aa\aa\aa\aa\aa\aa\aa\aa")
(data (i32.const 0x19f0) "\bb\bb\bb\bb\bb\bb\bb\bb")
(data (i32.const 0x19f8) "\cc\cc\cc\cc\cc\cc\cc\cc")
(data (i32.const 0x20a0) "\dd\dd\dd\dd\dd\dd\dd\dd")
(data (i32.const 0x20a8) "\ee\ee\ee\ee\ee\ee\ee\ee")
(data (i32.const 0x20b0) "\ff\ff\ff\ff\ff\ff\ff\ff")
(func (export "start")
)

(func (export "update")
  (local $gamepad i32)

  ;; *DRAW_COLORS = 2
  (i32.store16 (global.get $DRAW_COLORS) (i32.const 2))

  ;; text("Hello from Wat!", 10, 10);
;;  (call $text (i32.const 0x19a8) (i32.const 10) (i32.const 10))

  ;; uint8_t gamepad = *GAMEPAD1;
  (local.set $gamepad (i32.load8_u (global.get $GAMEPAD1)))

  ;; if (gamepad & BUTTON_1) {
  ;;     *DRAW_COLORS = 4;
  ;; }
  (if (i32.and (local.get $gamepad) (global.get $BUTTON_1))
    (then
      (i32.store16 (global.get $DRAW_COLORS) (i32.const 4))
    ))

  ;; blit(smiley, 76, 76, 8, 8, BLIT_1BPP);
  (call $blit (i32.const 0x19a0) (i32.const 10) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19a8) (i32.const 20) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19b0) (i32.const 30) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19b8) (i32.const 40) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19c0) (i32.const 50) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19c8) (i32.const 60) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19d0) (i32.const 70) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19d8) (i32.const 80) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19e0) (i32.const 90) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19e8) (i32.const 100) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19f0) (i32.const 110) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x19f8) (i32.const 120) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  (call $blit (i32.const 0x20a0) (i32.const 130) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
 ;; (call $blit (i32.const 0x20a8) (i32.const 140) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
;;  (call $blit (i32.const 0x20b0) (i32.const 150) (i32.const 96) (i32.const 8) (i32.const 8) (global.get $BLIT_1BPP))
  ;; text("Press X to blink", 16, 90);
 ;; (call $text (i32.const 0x19b8) (i32.const 16) (i32.const 90))
)
