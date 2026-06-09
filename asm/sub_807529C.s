	.syntax unified
	.section .text.sub_807529C, "ax", %progbits
@ sub_807529C @ JP 0x0807529C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807529C
	.thumb_func
sub_807529C:
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	bx lr

