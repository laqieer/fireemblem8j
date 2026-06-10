	.syntax unified
	.section .text.sub_803CC20, "ax", %progbits
@ sub_803CC20 @ JP 0x0803CC20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CC20
	.thumb_func
sub_803CC20:
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

