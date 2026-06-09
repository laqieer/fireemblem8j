	.syntax unified
	.section .text.nullsub_32, "ax", %progbits
@ nullsub_32 @ JP 0x08015260 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_32
	.thumb_func
nullsub_32:
	bx lr
	.align 2, 0

