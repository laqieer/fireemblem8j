	.syntax unified
	.section .text.sub_80D6364, "ax", %progbits
@ ArcTan2 @ JP 0x080D6364 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ArcTan2
	.thumb_func
ArcTan2:
	svc #0xa
	bx lr

