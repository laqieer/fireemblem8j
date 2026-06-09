	.syntax unified
	.section .text.sub_8002EBC, "ax", %progbits
@ sub_8002EBC @ JP 0x08002EBC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002EBC
	.thumb_func
sub_8002EBC:
	str r1, [r0, #8]
	bx lr

