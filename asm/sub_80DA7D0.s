	.syntax unified
	.section .text.sub_80DA7D0, "ax", %progbits
@ _unlink @ JP 0x080DA7D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global _unlink
	.thumb_func
_unlink:
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.align 2, 0

