	.syntax unified
	.section .text.nullsub_1, "ax", %progbits
@ nullsub_1 @ JP 0x080405E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_1
	.thumb_func
nullsub_1:
	bx lr
	.align 2, 0

