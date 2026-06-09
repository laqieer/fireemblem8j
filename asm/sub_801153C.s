	.syntax unified
	.section .text.sub_801153C, "ax", %progbits
@ sub_801153C @ JP 0x0801153C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801153C
	.thumb_func
sub_801153C:
	ldr r1, _08011544 @ =0x030005E8
	str r0, [r1]
	bx lr
	.align 2, 0
_08011544: .4byte 0x030005E8

