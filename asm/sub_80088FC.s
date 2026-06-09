	.syntax unified
	.section .text.sub_80088FC, "ax", %progbits
@ sub_80088FC @ JP 0x080088FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80088FC
	.thumb_func
sub_80088FC:
	ldr r0, _08008904 @ =0x030000E0
	ldr r0, [r0]
	bx lr
	.align 2, 0
_08008904: .4byte 0x030000E0

