	.syntax unified
	.section .text.sub_805CFA8, "ax", %progbits
@ sub_805CFA8 @ JP 0x0805CFA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805CFA8
	.thumb_func
sub_805CFA8:
	ldr r1, _0805CFB4 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805CFB4: .4byte 0x0201774C

