	.syntax unified
	.section .text.sub_807BD7C, "ax", %progbits
@ sub_807BD7C @ JP 0x0807BD7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BD7C
	.thumb_func
sub_807BD7C:
	movs r1, #0
	strh r1, [r0, #0x18]
	strh r1, [r0, #0x1a]
	bx lr

