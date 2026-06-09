	.syntax unified
	.section .text.nullsub_110, "ax", %progbits
@ nullsub_110 @ JP 0x080D4E30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_110
	.thumb_func
nullsub_110:
	bx lr
	.align 2, 0

