	.syntax unified
	.section .text.sub_8013048, "ax", %progbits
@ sub_8013048 @ JP 0x08013048 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013048
	.thumb_func
sub_8013048:
	ldr r0, [r0]
	lsrs r0, r0, #8
	bx lr
	.align 2, 0

