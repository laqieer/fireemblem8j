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

