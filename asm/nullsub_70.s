	.syntax unified
	.section .text.nullsub_70, "ax", %progbits
@ nullsub_70 @ JP 0x0808359C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_70
	.thumb_func
nullsub_70:
	bx lr
	.align 2, 0

