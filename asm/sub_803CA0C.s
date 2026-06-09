	.syntax unified
	.section .text.sub_803CA0C, "ax", %progbits
@ sub_803CA0C @ JP 0x0803CA0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803CA0C
	.thumb_func
sub_803CA0C:
	ldrb r1, [r0]
	adds r1, #1
	strb r1, [r0]
	bx lr

