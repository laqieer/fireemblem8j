	.syntax unified
	.section .text.nullsub_60, "ax", %progbits
@ nullsub_60 @ JP 0x08076A48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_60
	.thumb_func
nullsub_60:
	bx lr
	.align 2, 0

