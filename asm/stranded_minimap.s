	.section .text.s_080AC8DC, "ax", %progbits
@ Minimap_OnHBlank region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080AC8DC..0x080AC91C
	.thumb
	.align 2, 0
	.global Minimap_OnHBlank
	.thumb_func
Minimap_OnHBlank:
	.incbin "baserom.gba", 0xAC8DC, 0x40

	.section .text.s_080AC91C, "ax", %progbits
@ InitMinimapWindowBuffers region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080AC91C..0x080AC934
	.thumb
	.align 2, 0
	.global InitMinimapWindowBuffers
	.thumb_func
InitMinimapWindowBuffers:
	.incbin "baserom.gba", 0xAC91C, 0x18

	.section .text.s_080ACE28, "ax", %progbits
@ InitMinimapFlashPalette region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080ACE28..0x080ACEB4
	.thumb
	.align 2, 0
	.global InitMinimapFlashPalette
	.thumb_func
InitMinimapFlashPalette:
	.incbin "baserom.gba", 0xACE28, 0x8C

