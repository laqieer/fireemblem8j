	.syntax unified
	.section .text.nullsub_86, "ax", %progbits
@ nullsub_86 @ JP 0x080B0E84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global nullsub_86
	.thumb_func
nullsub_86:
	bx lr
	.align 2, 0

