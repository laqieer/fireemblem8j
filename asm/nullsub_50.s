	.syntax unified
	.section .text.nullsub_50, "ax", %progbits
@ nullsub_50 @ JP 0x08050CD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_50
	.thumb_func
nullsub_50:
	bx lr
	.align 2, 0

