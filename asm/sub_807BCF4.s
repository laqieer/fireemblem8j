	.syntax unified
	.section .text.sub_807BCF4, "ax", %progbits
@ sub_807BCF4 @ JP 0x0807BCF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BCF4
	.thumb_func
sub_807BCF4:
	movs r1, #0
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	bx lr

