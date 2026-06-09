	.syntax unified
	.section .text.nullsub_40, "ax", %progbits
@ nullsub_40 @ JP 0x08024BA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_40
	.thumb_func
nullsub_40:
	bx lr
	.align 2, 0

