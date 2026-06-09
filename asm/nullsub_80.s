	.syntax unified
	.section .text.nullsub_80, "ax", %progbits
@ nullsub_80 @ JP 0x080A29F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_80
	.thumb_func
nullsub_80:
	bx lr
	.align 2, 0

