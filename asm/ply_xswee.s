	.syntax unified
	.section .text.ply_xswee, "ax", %progbits
@ ply_xswee @ JP 0x080D634C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ply_xswee
	.thumb_func
ply_xswee:
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x27
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

