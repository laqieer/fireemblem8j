	.syntax unified
	.section .text.sub_8003240, "ax", %progbits
@ sub_8003240 @ JP 0x08003240 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8003240
	.thumb_func
sub_8003240:
	movs r0, #0
	bx lr

