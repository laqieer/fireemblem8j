	.syntax unified
	.section .text.ply_xrele, "ax", %progbits
@ ply_xrele @ JP 0x080D630C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ply_xrele
	.thumb_func
ply_xrele:
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2f
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

