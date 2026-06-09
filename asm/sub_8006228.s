	.syntax unified
	.section .text.sub_8006228, "ax", %progbits
@ sub_8006228 @ JP 0x08006228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006228
	.thumb_func
sub_8006228:
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

