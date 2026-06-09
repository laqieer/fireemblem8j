	.syntax unified
	.section .text.nullsub_8, "ax", %progbits
@ nullsub_8 @ JP 0x080D9964 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_8
	.thumb_func
nullsub_8:
	bx lr
	.align 2, 0

