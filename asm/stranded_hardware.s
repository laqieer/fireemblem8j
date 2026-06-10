	.section .text.s_08000F54, "ax", %progbits
@ GetTileIndex region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08000F54..0x08000F74
	.thumb
	.align 2, 0
	.global GetTileIndex
	.thumb_func
GetTileIndex:
	.incbin "data/residual/GetTileIndex.bin"

	.section .text.s_08000FB4, "ax", %progbits
@ SetBackgroundMapDataOffset region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08000FB4..0x08000FFC
	.thumb
	.align 2, 0
	.global SetBackgroundMapDataOffset
	.thumb_func
SetBackgroundMapDataOffset:
	.incbin "data/residual/SetBackgroundMapDataOffset.bin"

	.section .text.s_0800101C, "ax", %progbits
@ BG_SetColorBpp region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0800101C..0x08001044
	.thumb
	.align 2, 0
	.global BG_SetColorBpp
	.thumb_func
BG_SetColorBpp:
	.incbin "data/residual/BG_SetColorBpp.bin"

	.section .text.s_080012B8, "ax", %progbits
@ SetNextVCount region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080012B8..0x080012CC
	.thumb
	.align 2, 0
	.global SetNextVCount
	.thumb_func
SetNextVCount:
	.incbin "data/residual/SetNextVCount.bin"

	.section .text.s_080012D8, "ax", %progbits
@ SetMainUpdateRoutine region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080012D8..0x080012E4
	.thumb
	.align 2, 0
	.global SetMainUpdateRoutine
	.thumb_func
SetMainUpdateRoutine:
	.incbin "data/residual/SetMainUpdateRoutine.bin"

	.section .text.s_080014EC, "ax", %progbits
@ CopyTilemapScreen region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080014EC..0x08001508
	.thumb
	.align 2, 0
	.global CopyTilemapScreen
	.thumb_func
CopyTilemapScreen:
	.incbin "data/residual/CopyTilemapScreen.bin"

	.section .text.s_0800169C, "ax", %progbits
@ MaybeResetSomePal region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x0800169C..0x080016B8
	.thumb
	.align 2, 0
	.global MaybeResetSomePal
	.thumb_func
MaybeResetSomePal:
	.incbin "data/residual/MaybeResetSomePal.bin"

	.section .text.s_080016B8, "ax", %progbits
@ MaybeSmoothChangeSomePal region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080016B8..0x08001740
	.thumb
	.align 2, 0
	.global MaybeSmoothChangeSomePal
	.thumb_func
MaybeSmoothChangeSomePal:
	.incbin "data/residual/MaybeSmoothChangeSomePal.bin"

	.section .text.s_08001740, "ax", %progbits
@ ColorFadeSetupRange region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08001740..0x080017C8
	.thumb
	.align 2, 0
	.global ColorFadeSetupRange
	.thumb_func
ColorFadeSetupRange:
	.incbin "data/residual/ColorFadeSetupRange.bin"

	.section .text.s_080017C8, "ax", %progbits
@ ColorFadeSetStepRange region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x080017C8..0x080017EC
	.thumb
	.align 2, 0
	.global ColorFadeSetStepRange
	.thumb_func
ColorFadeSetStepRange:
	.incbin "data/residual/ColorFadeSetStepRange.bin"

	.section .text.s_08001D50, "ax", %progbits
@ GetBackgroundFromBufferPointer region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08001D50..0x08001DBC
	.thumb
	.align 2, 0
	.global GetBackgroundFromBufferPointer
	.thumb_func
GetBackgroundFromBufferPointer:
	.incbin "data/residual/GetBackgroundFromBufferPointer.bin"

	.section .text.s_08001F30, "ax", %progbits
@ ClearTileRigistry region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08001F30..0x08001F64
	.thumb
	.align 2, 0
	.global ClearTileRigistry
	.thumb_func
ClearTileRigistry:
	.incbin "data/residual/ClearTileRigistry.bin"

	.section .text.s_08001F64, "ax", %progbits
@ RegisterDataMove region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08001F64..0x08001FA4
	.thumb
	.align 2, 0
	.global RegisterDataMove
	.thumb_func
RegisterDataMove:
	.incbin "data/residual/RegisterDataMove.bin"

	.section .text.s_08001FA4, "ax", %progbits
@ RegisterFillTile region-same Thumb (US shifted); descriptive incbin baserom.gba
@ JP 0x08001FA4..0x08001FD8
	.thumb
	.align 2, 0
	.global RegisterFillTile
	.thumb_func
RegisterFillTile:
	.incbin "data/residual/RegisterFillTile.bin"

