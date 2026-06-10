	.section .text.m4a_1, "ax", %progbits
@ m4a_1 region-same asm TU: JP 0x080D41B0 (US 0x080CF4B8, shift +0x4CF8); descriptive incbin baserom.gba
	.thumb
	.global umul3232H32
	.thumb_func
umul3232H32:
	.incbin "data/sound/umul3232H32.bin"
	.global SoundMain
	.thumb_func
SoundMain:
	.incbin "data/sound/SoundMain.bin"
	.global SoundMainRAM
	.thumb_func
SoundMainRAM:
	.incbin "data/sound/SoundMainRAM.bin"
	.global SoundMainBTM
	.thumb_func
SoundMainBTM:
	.incbin "data/sound/SoundMainBTM.bin"
	.global RealClearChain
	.thumb_func
RealClearChain:
	.incbin "data/sound/RealClearChain.bin"
	.global ply_fine
	.thumb_func
ply_fine:
	.incbin "data/sound/ply_fine.bin"
	.global MPlayJumpTableCopy
	.thumb_func
MPlayJumpTableCopy:
	.incbin "data/sound/MPlayJumpTableCopy.bin"
	.global ld_r3_tp_adr_i
	.thumb_func
ld_r3_tp_adr_i:
	.incbin "data/sound/ld_r3_tp_adr_i.bin"
	.global ply_goto
	.thumb_func
ply_goto:
	.incbin "data/sound/ply_goto.bin"
	.global ply_patt
	.thumb_func
ply_patt:
	.incbin "data/sound/ply_patt.bin"
	.global ply_pend
	.thumb_func
ply_pend:
	.incbin "data/sound/ply_pend.bin"
	.global ply_rept
	.thumb_func
ply_rept:
	.incbin "data/sound/ply_rept.bin"
	.global ply_prio
	.thumb_func
ply_prio:
	.incbin "data/sound/ply_prio.bin"
	.global ply_tempo
	.thumb_func
ply_tempo:
	.incbin "data/sound/ply_tempo.bin"
	.global ply_keysh
	.thumb_func
ply_keysh:
	.incbin "data/sound/ply_keysh.bin"
	.global ply_voice
	.thumb_func
ply_voice:
	.incbin "data/sound/ply_voice.bin"
	.global ply_vol
	.thumb_func
ply_vol:
	.incbin "data/sound/ply_vol.bin"
	.global ply_pan
	.thumb_func
ply_pan:
	.incbin "data/sound/ply_pan.bin"
	.global ply_bend
	.thumb_func
ply_bend:
	.incbin "data/sound/ply_bend.bin"
	.global ply_bendr
	.thumb_func
ply_bendr:
	.incbin "data/sound/ply_bendr.bin"
	.global ply_lfodl
	.thumb_func
ply_lfodl:
	.incbin "data/sound/ply_lfodl.bin"
	.global ply_modt
	.thumb_func
ply_modt:
	.incbin "data/sound/ply_modt.bin"
	.global ply_tune
	.thumb_func
ply_tune:
	.incbin "data/sound/ply_tune.bin"
	.global ply_port
	.thumb_func
ply_port:
	.incbin "data/sound/ply_port.bin"
	.global m4aSoundVSync
	.thumb_func
m4aSoundVSync:
	.incbin "data/sound/m4aSoundVSync.bin"
	.global MPlayMain
	.thumb_func
MPlayMain:
	.incbin "data/sound/MPlayMain.bin"
	.global TrackStop
	.thumb_func
TrackStop:
	.incbin "data/sound/TrackStop.bin"
	.global ChnVolSetAsm
	.thumb_func
ChnVolSetAsm:
	.incbin "data/sound/ChnVolSetAsm.bin"
	.global ply_note
	.thumb_func
ply_note:
	.incbin "data/sound/ply_note.bin"
	.global ply_endtie
	.thumb_func
ply_endtie:
	.incbin "data/sound/ply_endtie.bin"
	.global clear_modM
	.thumb_func
clear_modM:
	.incbin "data/sound/clear_modM.bin"
	.global ply_lfos
	.thumb_func
ply_lfos:
	.incbin "data/sound/ply_lfos.bin"
	.global ply_mod
	.thumb_func
ply_mod:
	.incbin "data/sound/ply_mod.bin"
