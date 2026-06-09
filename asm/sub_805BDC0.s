	.syntax unified
	.section .text.sub_805BDC0, "ax", %progbits
@ sub_805BDC0 @ JP 0x0805BDC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805BDC0
	.thumb_func
sub_805BDC0:
	ldr r1, _0805BDC8 @ =0x0203E1E0
	str r0, [r1]
	bx lr
	.align 2, 0
_0805BDC8: .4byte 0x0203E1E0

