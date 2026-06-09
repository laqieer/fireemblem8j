	.syntax unified
	.section .text.sub_80013FC, "ax", %progbits
@ sub_80013FC @ JP 0x080013FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80013FC
	.thumb_func
sub_80013FC:
	ldr r1, _08001404 @ =0x0300000E
	strh r0, [r1]
	bx lr
	.align 2, 0
_08001404: .4byte 0x0300000E

