	.syntax unified
	.section .text._fstat, "ax", %progbits
@ _fstat @ JP 0x080DA7C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _fstat
	.thumb_func
_fstat:
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [r1, #4]
	movs r0, #0
	bx lr
	.align 2, 0

