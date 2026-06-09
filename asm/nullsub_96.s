	.syntax unified
	.section .text.nullsub_96, "ax", %progbits
@ nullsub_96 @ JP 0x080C08C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_96
	.thumb_func
nullsub_96:
	bx lr
	.align 2, 0

