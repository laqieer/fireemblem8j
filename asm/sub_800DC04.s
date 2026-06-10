	.syntax unified
	.section .text.sub_800DC04, "ax", %progbits
@ sub_800DC04 @ JP 0x0800DC04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800DC04
	.thumb_func
sub_800DC04:
	movs r0, #0
	bx lr

