	.syntax unified
	.section .text.sub_80D63D4, "ax", %progbits
@ Sqrt @ JP 0x080D63D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Sqrt
	.thumb_func
Sqrt:
	svc #8
	bx lr

