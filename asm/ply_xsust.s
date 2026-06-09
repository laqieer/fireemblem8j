	.syntax unified
	.section .text.ply_xsust, "ax", %progbits
@ ply_xsust @ JP 0x080D62F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ply_xsust
	.thumb_func
ply_xsust:
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2e
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

