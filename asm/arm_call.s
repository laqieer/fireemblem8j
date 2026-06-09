	.section .text.arm_call, "ax", %progbits
@ arm_call region-same thumb code stranded out of src/ (US asm/arm_call.o):
@ JP 0x080DC0DC..0x080DC104; descriptive incbin baserom.gba
	.thumb
	.align 2, 0
	.global CallARM_FillTileRect
	.thumb_func
CallARM_FillTileRect:
	.incbin "baserom.gba", 0xDC0DC, 0x8
	.global TileMap_FillRect
	.thumb_func
TileMap_FillRect:
	.incbin "baserom.gba", 0xDC0E4, 0x8
	.global CALLARM_ColorFadeTick
	.thumb_func
CALLARM_ColorFadeTick:
	.incbin "baserom.gba", 0xDC0EC, 0x8
	.global TileMap_CopyRect
	.thumb_func
TileMap_CopyRect:
	.incbin "baserom.gba", 0xDC0F4, 0x8
	.global ComputeChecksum32
	.thumb_func
ComputeChecksum32:
	.incbin "baserom.gba", 0xDC0FC, 0x8
