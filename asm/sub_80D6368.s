	.syntax unified
	.section .text.sub_80D6368, "ax", %progbits
@ BgAffineSet @ JP 0x080D6368 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BgAffineSet
	.thumb_func
BgAffineSet:
	svc #0xe
	bx lr

