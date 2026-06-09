	.syntax unified
	.section .text.sub_806E470, "ax", %progbits
@ sub_806E470 @ JP 0x0806E470 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806E470
	.thumb_func
sub_806E470:
	adds r0, #0x4c
	movs r1, #0
	strh r1, [r0]
	bx lr

