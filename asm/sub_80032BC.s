	.syntax unified
	.section .text.sub_80032BC, "ax", %progbits
@ sub_80032BC @ JP 0x080032BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80032BC
	.thumb_func
sub_80032BC:
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

