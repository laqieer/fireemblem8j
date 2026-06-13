	.syntax unified
	.section .text.SetGameTime, "ax", %progbits
@ SetGameTime @ JP 0x08000CE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetGameTime
	.thumb_func
SetGameTime:
	ldr r1, _08000CEC @ =0x03000010
	str r0, [r1]
	bx lr
	.align 2, 0
_08000CEC: .4byte 0x03000010

