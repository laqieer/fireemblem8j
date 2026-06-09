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

