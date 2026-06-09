	.syntax unified
	.section .text.sub_805C328, "ax", %progbits
@ sub_805C328 @ JP 0x0805C328 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805C328
	.thumb_func
sub_805C328:
	ldr r1, _0805C334 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_0805C334: .4byte 0x0201774C

