	.syntax unified
	.section .text.sub_8013844, "ax", %progbits
@ sub_8013844 @ JP 0x08013844 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013844
	.thumb_func
sub_8013844:
	movs r1, #0
	str r1, [r0, #0x44]
	bx lr
	.align 2, 0

