	.syntax unified
	.section .text.sub_8028094, "ax", %progbits
@ sub_8028094 @ JP 0x08028094 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8028094
	.thumb_func
sub_8028094:
	ldr r1, _0802809C @ =0x0203A014
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_0802809C: .4byte 0x0203A014

