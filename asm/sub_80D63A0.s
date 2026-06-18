	.syntax unified
	.section .text.sub_80D63A0, "ax", %progbits
@ ObjAffineSet @ JP 0x080D63A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ObjAffineSet
	.thumb_func
ObjAffineSet:
	svc #0xf
	bx lr

