	.syntax unified
	.section .text.sub_80B8C78, "ax", %progbits
@ sub_80B8C78 @ JP 0x080B8C78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8C78
	.thumb_func
sub_80B8C78:
	adds r0, #0x35
	strb r1, [r0]
	bx lr
	.align 2, 0

