	.syntax unified
	.section .text.nullsub_5, "ax", %progbits
@ nullsub_5 @ JP 0x08003328 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_5
	.thumb_func
nullsub_5:
	bx lr
	.align 2, 0

