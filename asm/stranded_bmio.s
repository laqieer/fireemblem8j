	.section .text.s_080306A8, "ax", %progbits
@ WfxFlamesInitGradientPublic region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080306A8..0x08030728
	.thumb
	.align 2, 0
	.global WfxFlamesInitGradientPublic
	.thumb_func
WfxFlamesInitGradientPublic:
	.incbin "baserom.gba", 0x306A8, 0x80

