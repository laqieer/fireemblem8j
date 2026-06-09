	.syntax unified
	.section .text.sub_80D63A0, "ax", %progbits
@ sub_80D63A0 @ JP 0x080D63A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D63A0
	.thumb_func
sub_80D63A0:
	svc #0xf
	bx lr

