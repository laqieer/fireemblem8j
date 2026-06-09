	.syntax unified
	.section .text.sub_80D6374, "ax", %progbits
@ sub_80D6374 @ JP 0x080D6374 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6374
	.thumb_func
sub_80D6374:
	svc #6
	bx lr

