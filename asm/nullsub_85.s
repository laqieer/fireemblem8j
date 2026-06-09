	.syntax unified
	.section .text.nullsub_85, "ax", %progbits
@ nullsub_85 @ JP 0x080A82B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_85
	.thumb_func
nullsub_85:
	bx lr
	.align 2, 0

