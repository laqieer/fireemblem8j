	.syntax unified
	.section .text.sub_802CDF4, "ax", %progbits
@ sub_802CDF4 @ JP 0x0802CDF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CDF4
	.thumb_func
sub_802CDF4:
	ldr r1, _0802CDFC @ =0x0203A954
	str r0, [r1, #0x18]
	bx lr
	.align 2, 0
_0802CDFC: .4byte 0x0203A954

