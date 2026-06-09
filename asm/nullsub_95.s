	.syntax unified
	.section .text.nullsub_95, "ax", %progbits
@ nullsub_95 @ JP 0x080BDE98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_95
	.thumb_func
nullsub_95:
	bx lr
	.align 2, 0

