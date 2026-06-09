	.syntax unified
	.section .text.sub_80D63D4, "ax", %progbits
@ sub_80D63D4 @ JP 0x080D63D4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D63D4
	.thumb_func
sub_80D63D4:
	svc #8
	bx lr

