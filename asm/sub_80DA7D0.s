	.syntax unified
	.section .text.sub_80DA7D0, "ax", %progbits
@ sub_80DA7D0 @ JP 0x080DA7D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80DA7D0
	.thumb_func
sub_80DA7D0:
	movs r0, #1
	rsbs r0, r0, #0
	bx lr
	.align 2, 0

