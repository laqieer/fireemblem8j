	.syntax unified
	.section .text.sub_80B4F34, "ax", %progbits
@ sub_80B4F34 @ JP 0x080B4F34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B4F34
	.thumb_func
sub_80B4F34:
	movs r1, #0
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0

