	.syntax unified
	.section .text.sub_8003D94, "ax", %progbits
@ sub_8003D94 @ JP 0x08003D94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003D94
	.thumb_func
sub_8003D94:
	ldrb r0, [r0, #3]
	bx lr

