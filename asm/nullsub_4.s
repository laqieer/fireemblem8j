	.syntax unified
	.section .text.nullsub_4, "ax", %progbits
@ nullsub_4 @ JP 0x080D6360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_4
	.thumb_func
nullsub_4:
	bx lr
	.align 2, 0

