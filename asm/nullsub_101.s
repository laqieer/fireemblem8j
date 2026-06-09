	.syntax unified
	.section .text.nullsub_101, "ax", %progbits
@ nullsub_101 @ JP 0x080C43A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_101
	.thumb_func
nullsub_101:
	bx lr
	.align 2, 0

