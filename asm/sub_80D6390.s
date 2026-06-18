	.syntax unified
	.section .text.sub_80D6390, "ax", %progbits
@ LZ77UnCompVram @ JP 0x080D6390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global LZ77UnCompVram
	.thumb_func
LZ77UnCompVram:
	svc #0x12
	bx lr

