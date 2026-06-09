	.syntax unified
	.section .text.sub_8003D90, "ax", %progbits
@ sub_8003D90 @ JP 0x08003D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003D90
	.thumb_func
sub_8003D90:
	strb r1, [r0, #3]
	bx lr

