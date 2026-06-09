	.syntax unified
	.section .text.sub_8002EB4, "ax", %progbits
@ sub_8002EB4 @ JP 0x08002EB4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002EB4
	.thumb_func
sub_8002EB4:
	adds r0, #0x26
	strb r1, [r0]
	bx lr
	.align 2, 0

