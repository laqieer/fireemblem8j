	.syntax unified
	.section .text.sub_8009948, "ax", %progbits
@ sub_8009948 @ JP 0x08009948 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8009948
	.thumb_func
sub_8009948:
	movs r1, #0x14
	strh r1, [r0, #0x2e]
	bx lr
	.align 2, 0

