	.syntax unified
	.section .text.sub_8003D80, "ax", %progbits
@ sub_8003D80 @ JP 0x08003D80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003D80
	.thumb_func
sub_8003D80:
	ldrb r0, [r0, #2]
	bx lr

