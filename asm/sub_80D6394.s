	.syntax unified
	.section .text.sub_80D6394, "ax", %progbits
@ LZ77UnCompWram @ JP 0x080D6394 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global LZ77UnCompWram
	.thumb_func
LZ77UnCompWram:
	svc #0x11
	bx lr

