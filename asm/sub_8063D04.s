	.syntax unified
	.section .text.sub_8063D04, "ax", %progbits
@ sub_8063D04 @ JP 0x08063D04 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063D04
	.thumb_func
sub_8063D04:
	ldr r1, _08063D10 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08063D10: .4byte 0x0201774C

