	.syntax unified
	.section .text.sub_8020D78, "ax", %progbits
@ sub_8020D78 @ JP 0x08020D78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020D78
	.thumb_func
sub_8020D78:
	adds r1, #0x50
	strh r0, [r1]
	bx lr
	.align 2, 0

