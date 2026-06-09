	.syntax unified
	.section .text.nullsub_12, "ax", %progbits
@ nullsub_12 @ JP 0x08008E0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_12
	.thumb_func
nullsub_12:
	bx lr
	.align 2, 0

