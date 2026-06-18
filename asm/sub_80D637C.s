	.syntax unified
	.section .text.sub_80D637C, "ax", %progbits
@ DivRem @ JP 0x080D637C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DivRem
	.thumb_func
DivRem:
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0

