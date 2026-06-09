	.syntax unified
	.section .text.sub_8086AC4, "ax", %progbits
@ sub_8086AC4 @ JP 0x08086AC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8086AC4
	.thumb_func
sub_8086AC4:
	ldr r0, _08086AC8 @ =0x08A5F230
	bx lr
	.align 2, 0
_08086AC8: .4byte 0x08A5F230

