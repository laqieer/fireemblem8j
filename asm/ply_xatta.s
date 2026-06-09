	.syntax unified
	.section .text.ply_xatta, "ax", %progbits
@ ply_xatta @ JP 0x080D62D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ply_xatta
	.thumb_func
ply_xatta:
	ldr r0, [r1, #0x40]
	ldrb r2, [r0]
	adds r0, r1, #0
	adds r0, #0x2c
	strb r2, [r0]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

