	.syntax unified
	.section .text.sub_8085E50, "ax", %progbits
@ sub_8085E50 @ JP 0x08085E50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8085E50
	.thumb_func
sub_8085E50:
	movs r0, #0
	bx lr

