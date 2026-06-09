	.syntax unified
	.section .text.sub_8063A34, "ax", %progbits
@ sub_8063A34 @ JP 0x08063A34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063A34
	.thumb_func
sub_8063A34:
	ldr r1, _08063A40 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08063A40: .4byte 0x0201774C

