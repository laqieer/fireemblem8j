	.syntax unified
	.section .text.ply_xdeca, "ax", %progbits
@ ply_xdeca @ JP 0x080D62E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ply_xdeca
	.thumb_func
ply_xdeca:
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x2d
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

