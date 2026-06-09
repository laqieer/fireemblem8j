	.syntax unified
	.section .text.sub_80D63A4, "ax", %progbits
@ sub_80D63A4 @ JP 0x080D63A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D63A4
	.thumb_func
sub_80D63A4:
	svc #0x15
	bx lr

