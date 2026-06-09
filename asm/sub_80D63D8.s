	.syntax unified
	.section .text.sub_80D63D8, "ax", %progbits
@ sub_80D63D8 @ JP 0x080D63D8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D63D8
	.thumb_func
sub_80D63D8:
	movs r2, #0
	svc #5
	bx lr
	.align 2, 0

