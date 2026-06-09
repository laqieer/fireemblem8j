	.syntax unified
	.section .text.sub_8020D80, "ax", %progbits
@ sub_8020D80 @ JP 0x08020D80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8020D80
	.thumb_func
sub_8020D80:
	adds r1, #0x4c
	strh r0, [r1]
	bx lr
	.align 2, 0

