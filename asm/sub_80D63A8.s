	.syntax unified
	.section .text.sub_80D63A8, "ax", %progbits
@ sub_80D63A8 @ JP 0x080D63A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D63A8
	.thumb_func
sub_80D63A8:
	svc #0x14
	bx lr

