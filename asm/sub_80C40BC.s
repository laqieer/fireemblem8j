	.syntax unified
	.section .text.sub_80C40BC, "ax", %progbits
@ sub_80C40BC @ JP 0x080C40BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C40BC
	.thumb_func
sub_80C40BC:
	movs r1, #0
	str r1, [r0, #0x44]
	bx lr
	.align 2, 0

