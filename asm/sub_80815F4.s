	.syntax unified
	.section .text.sub_80815F4, "ax", %progbits
@ sub_80815F4 @ JP 0x080815F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80815F4
	.thumb_func
sub_80815F4:
	movs r1, #0
	str r1, [r0, #0x54]
	bx lr
	.align 2, 0

