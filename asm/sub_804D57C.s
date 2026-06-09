	.syntax unified
	.section .text.sub_804D57C, "ax", %progbits
@ sub_804D57C @ JP 0x0804D57C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804D57C
	.thumb_func
sub_804D57C:
	strh r1, [r0, #0x2a]
	strh r2, [r0, #0x2c]
	bx lr
	.align 2, 0

