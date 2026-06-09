	.syntax unified
	.section .text.sub_80921F0, "ax", %progbits
@ sub_80921F0 @ JP 0x080921F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80921F0
	.thumb_func
sub_80921F0:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

