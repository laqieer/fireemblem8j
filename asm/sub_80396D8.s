	.syntax unified
	.section .text.sub_80396D8, "ax", %progbits
@ sub_80396D8 @ JP 0x080396D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80396D8
	.thumb_func
sub_80396D8:
	movs r1, #1
	str r1, [r0, #0x2c]
	bx lr
	.align 2, 0

