	.section .text.m4a_1, "ax", %progbits
@ m4a_1 region-same asm TU: JP 0x080D41B0 (US 0x080CF4B8, shift +0x4CF8); descriptive incbin baserom.gba
	.thumb
	.global umul3232H32
	.thumb_func
umul3232H32:
	.incbin "baserom.gba", 0xD41B0, 0x10
	.global SoundMain
	.thumb_func
SoundMain:
	.incbin "baserom.gba", 0xD41C0, 0x84
	.global SoundMainRAM
	.thumb_func
SoundMainRAM:
	.incbin "baserom.gba", 0xD4244, 0x3A4
	.global SoundMainBTM
	.thumb_func
SoundMainBTM:
	.incbin "baserom.gba", 0xD45E8, 0x18
	.global RealClearChain
	.thumb_func
RealClearChain:
	.incbin "baserom.gba", 0xD4600, 0x20
	.global ply_fine
	.thumb_func
ply_fine:
	.incbin "baserom.gba", 0xD4620, 0x30
	.global MPlayJumpTableCopy
	.thumb_func
MPlayJumpTableCopy:
	.incbin "baserom.gba", 0xD4650, 0x34
	.global ld_r3_tp_adr_i
	.thumb_func
ld_r3_tp_adr_i:
	.incbin "baserom.gba", 0xD4684, 0xC
	.global ply_goto
	.thumb_func
ply_goto:
	.incbin "baserom.gba", 0xD4690, 0x20
	.global ply_patt
	.thumb_func
ply_patt:
	.incbin "baserom.gba", 0xD46B0, 0x1C
	.global ply_pend
	.thumb_func
ply_pend:
	.incbin "baserom.gba", 0xD46CC, 0x14
	.global ply_rept
	.thumb_func
ply_rept:
	.incbin "baserom.gba", 0xD46E0, 0x30
	.global ply_prio
	.thumb_func
ply_prio:
	.incbin "baserom.gba", 0xD4710, 0xC
	.global ply_tempo
	.thumb_func
ply_tempo:
	.incbin "baserom.gba", 0xD471C, 0x14
	.global ply_keysh
	.thumb_func
ply_keysh:
	.incbin "baserom.gba", 0xD4730, 0x14
	.global ply_voice
	.thumb_func
ply_voice:
	.incbin "baserom.gba", 0xD4744, 0x30
	.global ply_vol
	.thumb_func
ply_vol:
	.incbin "baserom.gba", 0xD4774, 0x14
	.global ply_pan
	.thumb_func
ply_pan:
	.incbin "baserom.gba", 0xD4788, 0x14
	.global ply_bend
	.thumb_func
ply_bend:
	.incbin "baserom.gba", 0xD479C, 0x14
	.global ply_bendr
	.thumb_func
ply_bendr:
	.incbin "baserom.gba", 0xD47B0, 0x14
	.global ply_lfodl
	.thumb_func
ply_lfodl:
	.incbin "baserom.gba", 0xD47C4, 0xC
	.global ply_modt
	.thumb_func
ply_modt:
	.incbin "baserom.gba", 0xD47D0, 0x18
	.global ply_tune
	.thumb_func
ply_tune:
	.incbin "baserom.gba", 0xD47E8, 0x14
	.global ply_port
	.thumb_func
ply_port:
	.incbin "baserom.gba", 0xD47FC, 0x18
	.global m4aSoundVSync
	.thumb_func
m4aSoundVSync:
	.incbin "baserom.gba", 0xD4814, 0x4C
	.global MPlayMain
	.thumb_func
MPlayMain:
	.incbin "baserom.gba", 0xD4860, 0x268
	.global TrackStop
	.thumb_func
TrackStop:
	.incbin "baserom.gba", 0xD4AC8, 0x44
	.global ChnVolSetAsm
	.thumb_func
ChnVolSetAsm:
	.incbin "baserom.gba", 0xD4B0C, 0x30
	.global ply_note
	.thumb_func
ply_note:
	.incbin "baserom.gba", 0xD4B3C, 0x200
	.global ply_endtie
	.thumb_func
ply_endtie:
	.incbin "baserom.gba", 0xD4D3C, 0x40
	.global clear_modM
	.thumb_func
clear_modM:
	.incbin "baserom.gba", 0xD4D7C, 0x28
	.global ply_lfos
	.thumb_func
ply_lfos:
	.incbin "baserom.gba", 0xD4DA4, 0x14
	.global ply_mod
	.thumb_func
ply_mod:
	.incbin "baserom.gba", 0xD4DB8, 0x14
