	.section .text.s_080D4E34, "ax", %progbits
@ MPlayContinue region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D4E34..0x080D4E50
	.thumb
	.align 2, 0
	.global MPlayContinue
	.thumb_func
MPlayContinue:
	.incbin "baserom.gba", 0xD4E34, 0x1C

	.section .text.s_080D4E50, "ax", %progbits
@ MPlayFadeOut region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D4E50..0x080D4E70
	.thumb
	.align 2, 0
	.global MPlayFadeOut
	.thumb_func
MPlayFadeOut:
	.incbin "baserom.gba", 0xD4E50, 0x20

	.section .text.s_080D509C, "ax", %progbits
@ m4aMPlayFadeOutTemporarily region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D509C..0x080D50BC
	.thumb
	.align 2, 0
	.global m4aMPlayFadeOutTemporarily
	.thumb_func
m4aMPlayFadeOutTemporarily:
	.incbin "baserom.gba", 0xD509C, 0x20

	.section .text.s_080D50BC, "ax", %progbits
@ m4aMPlayFadeIn region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D50BC..0x080D50E4
	.thumb
	.align 2, 0
	.global m4aMPlayFadeIn
	.thumb_func
m4aMPlayFadeIn:
	.incbin "baserom.gba", 0xD50BC, 0x28

	.section .text.s_080D50E4, "ax", %progbits
@ m4aMPlayImmInit region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D50E4..0x080D512C
	.thumb
	.align 2, 0
	.global m4aMPlayImmInit
	.thumb_func
m4aMPlayImmInit:
	.incbin "baserom.gba", 0xD50E4, 0x48

	.section .text.s_080D540C, "ax", %progbits
@ m4aSoundMode region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D540C..0x080D54A4
	.thumb
	.align 2, 0
	.global m4aSoundMode
	.thumb_func
m4aSoundMode:
	.incbin "baserom.gba", 0xD540C, 0x98

	.section .text.s_080D54F8, "ax", %progbits
@ m4aSoundVSyncOff region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D54F8..0x080D5574
	.thumb
	.align 2, 0
	.global m4aSoundVSyncOff
	.thumb_func
m4aSoundVSyncOff:
	.incbin "baserom.gba", 0xD54F8, 0x7C

	.section .text.s_080D5574, "ax", %progbits
@ m4aSoundVSyncOn region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5574..0x080D55B0
	.thumb
	.align 2, 0
	.global m4aSoundVSyncOn
	.thumb_func
m4aSoundVSyncOn:
	.incbin "baserom.gba", 0xD5574, 0x3C

	.section .text.s_080D5628, "ax", %progbits
@ MPlayStart region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5628..0x080D570C
	.thumb
	.align 2, 0
	.global MPlayStart
	.thumb_func
MPlayStart:
	.incbin "baserom.gba", 0xD5628, 0xE4

	.section .text.s_080D570C, "ax", %progbits
@ m4aMPlayStop region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D570C..0x080D574C
	.thumb
	.align 2, 0
	.global m4aMPlayStop
	.thumb_func
m4aMPlayStop:
	.incbin "baserom.gba", 0xD570C, 0x40

	.section .text.s_080D574C, "ax", %progbits
@ FadeOutBody region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D574C..0x080D5814
	.thumb
	.align 2, 0
	.global FadeOutBody
	.thumb_func
FadeOutBody:
	.incbin "baserom.gba", 0xD574C, 0xC8

	.section .text.s_080D5814, "ax", %progbits
@ TrkVolPitSet region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5814..0x080D58C8
	.thumb
	.align 2, 0
	.global TrkVolPitSet
	.thumb_func
TrkVolPitSet:
	.incbin "baserom.gba", 0xD5814, 0xB4

	.section .text.s_080D5970, "ax", %progbits
@ CgbOscOff region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5970..0x080D59C0
	.thumb
	.align 2, 0
	.global CgbOscOff
	.thumb_func
CgbOscOff:
	.incbin "baserom.gba", 0xD5970, 0x50

	.section .text.s_080D59C0, "ax", %progbits
@ CgbModVol region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D59C0..0x080D5A28
	.thumb
	.align 2, 0
	.global CgbModVol
	.thumb_func
CgbModVol:
	.incbin "baserom.gba", 0xD59C0, 0x68

	.section .text.s_080D5E74, "ax", %progbits
@ m4aMPlayTempoControl region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5E74..0x080D5E9C
	.thumb
	.align 2, 0
	.global m4aMPlayTempoControl
	.thumb_func
m4aMPlayTempoControl:
	.incbin "baserom.gba", 0xD5E74, 0x28

