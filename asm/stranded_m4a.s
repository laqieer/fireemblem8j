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

