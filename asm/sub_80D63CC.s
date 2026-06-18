	.syntax unified
	.section .text.sub_80D63CC, "ax", %progbits
@ SoundBiasSet @ JP 0x080D63CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SoundBiasSet
	.thumb_func
SoundBiasSet:
	movs r0, #1
	svc #0x19
	bx lr
	.align 2, 0

