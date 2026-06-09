	.syntax unified
	.section .text.sub_80B3E40, "ax", %progbits
@ sub_80B3E40 @ JP 0x080B3E40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3E40
	.thumb_func
sub_80B3E40:
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0

