	.syntax unified
	.section .text.nullsub_20, "ax", %progbits
@ nullsub_20 @ JP 0x0800D000 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_20
	.thumb_func
nullsub_20:
	bx lr
	.align 2, 0

