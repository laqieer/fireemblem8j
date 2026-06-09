	.syntax unified
	.section .text.sub_8037BCC, "ax", %progbits
@ sub_8037BCC @ JP 0x08037BCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037BCC
	.thumb_func
sub_8037BCC:
	movs r1, #0
	strb r1, [r0, #5]
	bx lr
	.align 2, 0

