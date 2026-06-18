	.syntax unified
	.section .text.sub_80D63C4, "ax", %progbits
@ SoundBiasReset @ JP 0x080D63C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SoundBiasReset
	.thumb_func
SoundBiasReset:
	movs r0, #0
	svc #0x19
	bx lr
	.align 2, 0

