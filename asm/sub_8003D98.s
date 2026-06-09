	.syntax unified
	.section .text.sub_8003D98, "ax", %progbits
@ sub_8003D98 @ JP 0x08003D98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003D98
	.thumb_func
sub_8003D98:
	strb r1, [r0, #2]
	strb r2, [r0, #3]
	bx lr
	.align 2, 0

