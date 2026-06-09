	.syntax unified
	.section .text.sub_8003234, "ax", %progbits
@ sub_8003234 @ JP 0x08003234 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003234
	.thumb_func
sub_8003234:
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

