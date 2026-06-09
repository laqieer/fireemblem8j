	.syntax unified
	.section .text.ply_xleng, "ax", %progbits
@ ply_xleng @ JP 0x080D6338 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ply_xleng
	.thumb_func
ply_xleng:
	ldr r0, [r1, #0x40]
	ldrb r0, [r0]
	adds r2, r1, #0
	adds r2, #0x26
	strb r0, [r2]
	ldr r0, [r1, #0x40]
	adds r0, #1
	str r0, [r1, #0x40]
	bx lr
	.align 2, 0

