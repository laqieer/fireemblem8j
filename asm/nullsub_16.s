	.syntax unified
	.section .text.nullsub_16, "ax", %progbits
@ nullsub_16 @ JP 0x080BD0C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_16
	.thumb_func
nullsub_16:
	bx lr
	.align 2, 0

