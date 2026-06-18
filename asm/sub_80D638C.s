	.syntax unified
	.section .text.sub_80D638C, "ax", %progbits
@ HuffUnComp @ JP 0x080D638C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HuffUnComp
	.thumb_func
HuffUnComp:
	svc #0x13
	bx lr

