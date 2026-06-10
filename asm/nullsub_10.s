	.syntax unified
	.section .text.nullsub_10, "ax", %progbits
@ nullsub_10 @ JP 0x08007BD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_10
	.thumb_func
nullsub_10:
	bx lr
	.align 2, 0

