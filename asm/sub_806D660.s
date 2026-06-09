	.syntax unified
	.section .text.sub_806D660, "ax", %progbits
@ sub_806D660 @ JP 0x0806D660 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D660
	.thumb_func
sub_806D660:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

