	.section .text.s_08076C6C, "ax", %progbits
@ EkrLvupHBlank region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08076C6C..0x08076CAC
	.thumb
	.align 2, 0
	.global EkrLvupHBlank
	.thumb_func
EkrLvupHBlank:
	.incbin "data/residual/EkrLvupHBlank.bin"

