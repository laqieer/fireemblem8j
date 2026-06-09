	.syntax unified
	.section .text.sub_8000CE4, "ax", %progbits
@ sub_8000CE4 @ JP 0x08000CE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8000CE4
	.thumb_func
sub_8000CE4:
	ldr r1, _08000CEC @ =0x03000010
	str r0, [r1]
	bx lr
	.align 2, 0
_08000CEC: .4byte 0x03000010

