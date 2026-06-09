	.syntax unified
	.section .text.sub_8003D84, "ax", %progbits
@ sub_8003D84 @ JP 0x08003D84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003D84
	.thumb_func
sub_8003D84:
	strb r1, [r0, #2]
	bx lr

