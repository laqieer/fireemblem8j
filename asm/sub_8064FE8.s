	.syntax unified
	.section .text.sub_8064FE8, "ax", %progbits
@ sub_8064FE8 @ JP 0x08064FE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064FE8
	.thumb_func
sub_8064FE8:
	ldr r1, _08064FF4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08064FF4: .4byte 0x0201774C

