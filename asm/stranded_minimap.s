	.section .text.s_080ACE28, "ax", %progbits
@ InitMinimapFlashPalette region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080ACE28..0x080ACEB4
	.thumb
	.align 2, 0
	.global InitMinimapFlashPalette
	.thumb_func
InitMinimapFlashPalette:
	.incbin "data/residual/InitMinimapFlashPalette.bin"

