	.syntax unified
	.section .text.sub_80B33AC, "ax", %progbits
@ sub_80B33AC @ JP 0x080B33AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B33AC
	.thumb_func
sub_80B33AC:
	movs r1, #0
	str r1, [r0, #0x38]
	bx lr
	.align 2, 0

