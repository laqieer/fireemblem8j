	.syntax unified
	.section .text.sub_80D6370, "ax", %progbits
@ CpuSet @ JP 0x080D6370 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global CpuSet
	.thumb_func
CpuSet:
	svc #0xb
	bx lr

