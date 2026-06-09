	.syntax unified
	.section .text.nullsub_21, "ax", %progbits
@ nullsub_21 @ JP 0x0800D0AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_21
	.thumb_func
nullsub_21:
	bx lr
	.align 2, 0

