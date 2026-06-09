	.syntax unified
	.section .text.sub_801FCC8, "ax", %progbits
@ sub_801FCC8 @ JP 0x0801FCC8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801FCC8
	.thumb_func
sub_801FCC8:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

