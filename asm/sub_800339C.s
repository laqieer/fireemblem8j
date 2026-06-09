	.syntax unified
	.section .text.sub_800339C, "ax", %progbits
@ sub_800339C @ JP 0x0800339C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800339C
	.thumb_func
sub_800339C:
	str r1, [r0, #0xc]
	bx lr

