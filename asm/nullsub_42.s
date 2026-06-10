	.syntax unified
	.section .text.nullsub_42, "ax", %progbits
@ nullsub_42 @ JP 0x0802CA30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_42
	.thumb_func
nullsub_42:
	bx lr
	.align 2, 0

