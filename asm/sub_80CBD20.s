	.syntax unified
	.section .text.sub_80CBD20, "ax", %progbits
@ sub_80CBD20 @ JP 0x080CBD20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBD20
	.thumb_func
sub_80CBD20:
	movs r1, #0
	strh r1, [r0, #0x2a]
	bx lr
	.align 2, 0

