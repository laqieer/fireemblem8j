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

	.section .text.s_080012B8, "ax", %progbits
@ SetNextVCount region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080012B8..0x080012CC
	.thumb
	.align 2, 0
	.global SetNextVCount
	.thumb_func
SetNextVCount:
	.incbin "baserom.gba", 0x12B8, 0x14

	.section .text.s_080012D8, "ax", %progbits
@ SetMainUpdateRoutine region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080012D8..0x080012E4
	.thumb
	.align 2, 0
	.global SetMainUpdateRoutine
	.thumb_func
SetMainUpdateRoutine:
	.incbin "baserom.gba", 0x12D8, 0xC

	.section .text.s_080014EC, "ax", %progbits
@ CopyTilemapScreen region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080014EC..0x08001508
	.thumb
	.align 2, 0
	.global CopyTilemapScreen
	.thumb_func
CopyTilemapScreen:
	.incbin "baserom.gba", 0x14EC, 0x1C

	.section .text.s_0800169C, "ax", %progbits
@ MaybeResetSomePal region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0800169C..0x080016B8
	.thumb
	.align 2, 0
	.global MaybeResetSomePal
	.thumb_func
MaybeResetSomePal:
	.incbin "baserom.gba", 0x169C, 0x1C

