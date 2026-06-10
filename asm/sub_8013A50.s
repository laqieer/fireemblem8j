	.syntax unified
	.section .text.sub_8013A50, "ax", %progbits
@ sub_8013A50 @ JP 0x08013A50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013A50
	.thumb_func
sub_8013A50:
	strh r1, [r0, #0x2c]
	bx lr

