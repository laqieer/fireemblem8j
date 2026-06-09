	.syntax unified
	.section .text.nullsub_111, "ax", %progbits
@ nullsub_111 @ JP 0x080D65F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_111
	.thumb_func
nullsub_111:
	bx lr
	nop

