	.syntax unified
	.section .text.nullsub_99, "ax", %progbits
@ nullsub_99 @ JP 0x080C2224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_99
	.thumb_func
nullsub_99:
	bx lr
	.align 2, 0

