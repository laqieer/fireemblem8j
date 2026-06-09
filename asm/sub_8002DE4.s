	.syntax unified
	.section .text.sub_8002DE4, "ax", %progbits
@ sub_8002DE4 @ JP 0x08002DE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8002DE4
	.thumb_func
sub_8002DE4:
	movs r1, #0
	str r1, [r0, #0xc]
	bx lr
	.align 2, 0

