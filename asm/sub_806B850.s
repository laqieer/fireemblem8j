	.syntax unified
	.section .text.sub_806B850, "ax", %progbits
@ sub_806B850 @ JP 0x0806B850 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806B850
	.thumb_func
sub_806B850:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

