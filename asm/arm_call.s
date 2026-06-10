	.section .text.arm_call, "ax", %progbits
@ arm_call region-same thumb code stranded out of src/ (US asm/arm_call.o):
@ JP 0x080DC0DC..0x080DC104; descriptive incbin baserom.gba
	.thumb
	.align 2, 0
	.global CallARM_FillTileRect
	.thumb_func
CallARM_FillTileRect:
	.incbin "data/residual/CallARM_FillTileRect.bin"
	.global TileMap_FillRect
	.thumb_func
TileMap_FillRect:
	.incbin "data/residual/TileMap_FillRect.bin"
	.global CALLARM_ColorFadeTick
	.thumb_func
CALLARM_ColorFadeTick:
	.incbin "data/residual/CALLARM_ColorFadeTick.bin"
	.global TileMap_CopyRect
	.thumb_func
TileMap_CopyRect:
	.incbin "data/residual/TileMap_CopyRect.bin"
	.global ComputeChecksum32
	.thumb_func
ComputeChecksum32:
	.incbin "data/residual/ComputeChecksum32.bin"
