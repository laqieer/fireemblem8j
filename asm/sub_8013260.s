	.syntax unified
	.section .text.sub_8013260, "ax", %progbits
@ sub_8013260 @ JP 0x08013260 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8013260
	.thumb_func
sub_8013260:
	adds r0, #0x4c
	strh r1, [r0]
	bx lr
	.align 2, 0

