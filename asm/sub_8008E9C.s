	.syntax unified
	.section .text.sub_8008E9C, "ax", %progbits
@ sub_8008E9C @ JP 0x08008E9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8008E9C
	.thumb_func
sub_8008E9C:
	adds r0, #0x64
	movs r1, #0
	strh r1, [r0]
	bx lr

