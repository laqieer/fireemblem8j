	.syntax unified
	.section .text.nullsub_2, "ax", %progbits
@ nullsub_2 @ JP 0x0804D148 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_2
	.thumb_func
nullsub_2:
	bx lr
	.align 2, 0

