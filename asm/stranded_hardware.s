	.section .text.s_08000F54, "ax", %progbits
@ GetTileIndex region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08000F54..0x08000F74
	.thumb
	.align 2, 0
	.global GetTileIndex
	.thumb_func
GetTileIndex:
	.incbin "baserom.gba", 0xF54, 0x20

	.section .text.s_08000FB4, "ax", %progbits
@ SetBackgroundMapDataOffset region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08000FB4..0x08000FFC
	.thumb
	.align 2, 0
	.global SetBackgroundMapDataOffset
	.thumb_func
SetBackgroundMapDataOffset:
	.incbin "baserom.gba", 0xFB4, 0x48

	.section .text.s_0800101C, "ax", %progbits
@ BG_SetColorBpp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0800101C..0x08001044
	.thumb
	.align 2, 0
	.global BG_SetColorBpp
	.thumb_func
BG_SetColorBpp:
	.incbin "baserom.gba", 0x101C, 0x28

