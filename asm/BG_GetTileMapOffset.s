	.syntax unified
	.set BG_GetControlBuffer, 0x08000EF4 + 1
	.section .text.BG_GetTileMapOffset, "ax", %progbits
@ BG_GetTileMapOffset @ JP 0x08000F74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BG_GetTileMapOffset
	.thumb_func
BG_GetTileMapOffset:
	push {lr}
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl BG_GetControlBuffer
	ldr r0, [r0]
	lsls r0, r0, #0x13
	lsrs r0, r0, #0x1b
	lsls r0, r0, #0xb
	pop {r1}
	bx r1
	.align 2, 0

