	.syntax unified
	.section .text.nullsub_19, "ax", %progbits
@ nullsub_19 @ JP 0x0800CFFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_19
	.thumb_func
nullsub_19:
	bx lr
	.align 2, 0

