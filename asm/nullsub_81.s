	.syntax unified
	.section .text.nullsub_81, "ax", %progbits
@ nullsub_81 @ JP 0x080A29F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_81
	.thumb_func
nullsub_81:
	bx lr
	.align 2, 0

