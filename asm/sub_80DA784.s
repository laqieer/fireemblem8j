	.syntax unified
	.section .text.sub_80DA784, "ax", %progbits
@ sub_80DA784 @ JP 0x080DA784 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80DA784
	.thumb_func
sub_80DA784:
	movs r0, #1
	bx lr

