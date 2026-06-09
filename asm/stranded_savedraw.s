	.section .text.s_080B0004, "ax", %progbits
@ SaveDraw_InitParticles region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080B0004..0x080B0028
	.thumb
	.align 2, 0
	.global SaveDraw_InitParticles
	.thumb_func
SaveDraw_InitParticles:
	.incbin "baserom.gba", 0xB0004, 0x24

