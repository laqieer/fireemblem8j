	.section .text.s_080D4E34, "ax", %progbits
@ MPlayContinue region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D4E34..0x080D4E50
	.thumb
	.align 2, 0
	.global MPlayContinue
	.thumb_func
MPlayContinue:
	.incbin "data/sound/MPlayContinue.bin"

	.section .text.s_080D4E50, "ax", %progbits
@ MPlayFadeOut region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D4E50..0x080D4E70
	.thumb
	.align 2, 0
	.global MPlayFadeOut
	.thumb_func
MPlayFadeOut:
	.incbin "data/sound/MPlayFadeOut.bin"

	.section .text.s_080D509C, "ax", %progbits
@ m4aMPlayFadeOutTemporarily region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D509C..0x080D50BC
	.thumb
	.align 2, 0
	.global m4aMPlayFadeOutTemporarily
	.thumb_func
m4aMPlayFadeOutTemporarily:
	.incbin "data/sound/m4aMPlayFadeOutTemporarily.bin"

	.section .text.s_080D50BC, "ax", %progbits
@ m4aMPlayFadeIn region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D50BC..0x080D50E4
	.thumb
	.align 2, 0
	.global m4aMPlayFadeIn
	.thumb_func
m4aMPlayFadeIn:
	.incbin "data/sound/m4aMPlayFadeIn.bin"

	.section .text.s_080D50E4, "ax", %progbits
@ m4aMPlayImmInit region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D50E4..0x080D512C
	.thumb
	.align 2, 0
	.global m4aMPlayImmInit
	.thumb_func
m4aMPlayImmInit:
	.incbin "data/sound/m4aMPlayImmInit.bin"

	.section .text.s_080D540C, "ax", %progbits
@ m4aSoundMode region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D540C..0x080D54A4
	.thumb
	.align 2, 0
	.global m4aSoundMode
	.thumb_func
m4aSoundMode:
	.incbin "data/sound/m4aSoundMode.bin"

	.section .text.s_080D54F8, "ax", %progbits
@ m4aSoundVSyncOff region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D54F8..0x080D5574
	.thumb
	.align 2, 0
	.global m4aSoundVSyncOff
	.thumb_func
m4aSoundVSyncOff:
	.incbin "data/sound/m4aSoundVSyncOff.bin"

	.section .text.s_080D5574, "ax", %progbits
@ m4aSoundVSyncOn region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5574..0x080D55B0
	.thumb
	.align 2, 0
	.global m4aSoundVSyncOn
	.thumb_func
m4aSoundVSyncOn:
	.incbin "data/sound/m4aSoundVSyncOn.bin"

	.section .text.s_080D5628, "ax", %progbits
@ MPlayStart region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5628..0x080D570C
	.thumb
	.align 2, 0
	.global MPlayStart
	.thumb_func
MPlayStart:
	.incbin "data/sound/MPlayStart.bin"

	.section .text.s_080D574C, "ax", %progbits
@ FadeOutBody region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D574C..0x080D5814
	.thumb
	.align 2, 0
	.global FadeOutBody
	.thumb_func
FadeOutBody:
	.incbin "data/sound/FadeOutBody.bin"

	.section .text.s_080D5814, "ax", %progbits
@ TrkVolPitSet region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5814..0x080D58C8
	.thumb
	.align 2, 0
	.global TrkVolPitSet
	.thumb_func
TrkVolPitSet:
	.incbin "data/sound/TrkVolPitSet.bin"

	.section .text.s_080D5970, "ax", %progbits
@ CgbOscOff region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5970..0x080D59C0
	.thumb
	.align 2, 0
	.global CgbOscOff
	.thumb_func
CgbOscOff:
	.incbin "data/sound/CgbOscOff.bin"

	.section .text.s_080D59C0, "ax", %progbits
@ CgbModVol region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D59C0..0x080D5A28
	.thumb
	.align 2, 0
	.global CgbModVol
	.thumb_func
CgbModVol:
	.incbin "data/sound/CgbModVol.bin"

	.section .text.s_080D5E74, "ax", %progbits
@ m4aMPlayTempoControl region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D5E74..0x080D5E9C
	.thumb
	.align 2, 0
	.global m4aMPlayTempoControl
	.thumb_func
m4aMPlayTempoControl:
	.incbin "data/sound/m4aMPlayTempoControl.bin"

	.section .text.s_080D6000, "ax", %progbits
@ m4aMPlayModDepthSet region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6000..0x080D6074
	.thumb
	.align 2, 0
	.global m4aMPlayModDepthSet
	.thumb_func
m4aMPlayModDepthSet:
	.incbin "data/sound/m4aMPlayModDepthSet.bin"

	.section .text.s_080D6074, "ax", %progbits
@ m4aMPlayLFOSpeedSet region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6074..0x080D60E8
	.thumb
	.align 2, 0
	.global m4aMPlayLFOSpeedSet
	.thumb_func
m4aMPlayLFOSpeedSet:
	.incbin "data/sound/m4aMPlayLFOSpeedSet.bin"

	.section .text.s_080D6274, "ax", %progbits
@ ply_xwave region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080D6274..0x080D62BC
	.thumb
	.align 2, 0
	.global ply_xwave
	.thumb_func
ply_xwave:
	.incbin "data/sound/ply_xwave.bin"

