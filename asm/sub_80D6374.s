	.syntax unified
	.section .text.sub_80D6374, "ax", %progbits
@ Div @ JP 0x080D6374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Div
	.thumb_func
Div:
	svc #6
	bx lr

