	.syntax unified
	.section .text.nullsub_25, "ax", %progbits
@ nullsub_25 @ JP 0x0800D4C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_25
	.thumb_func
nullsub_25:
	bx lr
	.align 2, 0

