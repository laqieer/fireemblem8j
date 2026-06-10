	.syntax unified
	.section .text.nullsub_22, "ax", %progbits
@ nullsub_22 @ JP 0x0800D0B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_22
	.thumb_func
nullsub_22:
	bx lr
	.align 2, 0

