	.syntax unified
	.section .text.GetIconGfxTileIndex, "ax", %progbits
@ GetIconGfxTileIndex @ JP 0x0800355C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetIconGfxTileIndex
	.thumb_func
GetIconGfxTileIndex:
	adds r1, r0, #0
	lsls r1, r1, #2
	movs r2, #0xc0
	lsls r2, r2, #2
	adds r0, r2, #0
	subs r0, r0, r1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bx lr
	.align 2, 0

