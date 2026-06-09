	.syntax unified
	.section .text.sub_8088E30, "ax", %progbits
@ sub_8088E30 @ JP 0x08088E30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8088E30
	.thumb_func
sub_8088E30:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

