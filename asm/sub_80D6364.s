	.syntax unified
	.section .text.sub_80D6364, "ax", %progbits
@ sub_80D6364 @ JP 0x080D6364 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6364
	.thumb_func
sub_80D6364:
	svc #0xa
	bx lr

