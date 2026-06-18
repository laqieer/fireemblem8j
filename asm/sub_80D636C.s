	.syntax unified
	.section .text.sub_80D636C, "ax", %progbits
@ CpuFastSet @ JP 0x080D636C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CpuFastSet
	.thumb_func
CpuFastSet:
	svc #0xc
	bx lr

