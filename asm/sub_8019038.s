	.syntax unified
	.section .text.sub_8019038, "ax", %progbits
@ sub_8019038 @ JP 0x08019038 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019038
	.thumb_func
sub_8019038:
	adds r0, #0x38
	strb r1, [r0]
	bx lr
	.align 2, 0

