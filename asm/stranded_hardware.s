	.section .text.s_08000F54, "ax", %progbits
@ GetTileIndex region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08000F54..0x08000F74
	.thumb
	.align 2, 0
	.global GetTileIndex
	.thumb_func
GetTileIndex:
	.incbin "baserom.gba", 0xF54, 0x20

