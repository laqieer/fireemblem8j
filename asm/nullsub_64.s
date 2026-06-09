	.syntax unified
	.section .text.nullsub_64, "ax", %progbits
@ nullsub_64 @ JP 0x080793F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_64
	.thumb_func
nullsub_64:
	bx lr
	.align 2, 0

