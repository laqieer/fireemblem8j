	.syntax unified
	.section .text.nullsub_90, "ax", %progbits
@ nullsub_90 @ JP 0x080B51D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_90
	.thumb_func
nullsub_90:
	bx lr
	.align 2, 0

