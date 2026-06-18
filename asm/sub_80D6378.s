	.syntax unified
	.section .text.sub_80D6378, "ax", %progbits
@ DivArm @ JP 0x080D6378 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DivArm
	.thumb_func
DivArm:
	svc #7
	bx lr

