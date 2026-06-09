	.syntax unified
	.section .text.sub_80D6378, "ax", %progbits
@ sub_80D6378 @ JP 0x080D6378 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6378
	.thumb_func
sub_80D6378:
	svc #7
	bx lr

