	.syntax unified
	.section .text.sub_80B1890, "ax", %progbits
@ sub_80B1890 @ JP 0x080B1890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B1890
	.thumb_func
sub_80B1890:
	movs r1, #0
	str r1, [r0, #0x30]
	bx lr
	.align 2, 0

