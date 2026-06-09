	.syntax unified
	.section .text.sub_80848F0, "ax", %progbits
@ sub_80848F0 @ JP 0x080848F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80848F0
	.thumb_func
sub_80848F0:
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

