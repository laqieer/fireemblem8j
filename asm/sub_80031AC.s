	.syntax unified
	.section .text.sub_80031AC, "ax", %progbits
@ sub_80031AC @ JP 0x080031AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80031AC
	.thumb_func
sub_80031AC:
	ldr r1, [r0, #4]
	adds r1, #8
	str r1, [r0, #4]
	movs r0, #1
	bx lr
	.align 2, 0

