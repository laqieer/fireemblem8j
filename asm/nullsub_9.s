	.syntax unified
	.section .text.nullsub_9, "ax", %progbits
@ nullsub_9 @ JP 0x080044A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_9
	.thumb_func
nullsub_9:
	bx lr
	.align 2, 0

