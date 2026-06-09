	.syntax unified
	.section .text.sub_8076F70, "ax", %progbits
@ sub_8076F70 @ JP 0x08076F70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8076F70
	.thumb_func
sub_8076F70:
	movs r1, #0
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

