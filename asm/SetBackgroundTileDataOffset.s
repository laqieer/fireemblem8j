	.syntax unified
	.set BG_GetControlBuffer, 0x08000EF4 + 1
	.section .text.SetBackgroundTileDataOffset, "ax", %progbits
@ SetBackgroundTileDataOffset @ JP 0x08000F8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBackgroundTileDataOffset
	.thumb_func
SetBackgroundTileDataOffset:
	push {r4, lr}
	adds r4, r1, #0
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl BG_GetControlBuffer
	asrs r4, r4, #0xe
	movs r1, #3
	ands r4, r1
	lsls r4, r4, #2
	ldrb r2, [r0]
	movs r1, #0xd
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r4
	strb r1, [r0]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

