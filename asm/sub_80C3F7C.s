	.syntax unified
	.section .text.sub_80C3F7C, "ax", %progbits
@ sub_80C3F7C @ JP 0x080C3F7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C3F7C
	.thumb_func
sub_80C3F7C:
	movs r1, #0
	strh r1, [r0, #0x2c]
	bx lr
	.align 2, 0

