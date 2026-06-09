	.syntax unified
	.section .text.sub_8037BD4, "ax", %progbits
@ sub_8037BD4 @ JP 0x08037BD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037BD4
	.thumb_func
sub_8037BD4:
	movs r1, #1
	strb r1, [r0, #5]
	bx lr
	.align 2, 0

