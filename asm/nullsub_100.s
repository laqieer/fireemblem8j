	.syntax unified
	.section .text.nullsub_100, "ax", %progbits
@ nullsub_100 @ JP 0x080C29E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_100
	.thumb_func
nullsub_100:
	bx lr
	.align 2, 0

