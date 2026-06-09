	.syntax unified
	.section .text.sub_80A2DF0, "ax", %progbits
@ sub_80A2DF0 @ JP 0x080A2DF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2DF0
	.thumb_func
sub_80A2DF0:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

