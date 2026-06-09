	.syntax unified
	.set BG_GetControlBuffer, 0x08000EF4 + 1
	.section .text.GetBackgroundTileDataOffset, "ax", %progbits
@ GetBackgroundTileDataOffset @ JP 0x08000F3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetBackgroundTileDataOffset
	.thumb_func
GetBackgroundTileDataOffset:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl BG_GetControlBuffer
	ldr r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	lsls r0, r0, #0xe
	pop {r1}
	bx r1
	.align 2, 0

