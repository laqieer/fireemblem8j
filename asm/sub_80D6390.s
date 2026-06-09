	.syntax unified
	.section .text.sub_80D6390, "ax", %progbits
@ sub_80D6390 @ JP 0x080D6390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6390
	.thumb_func
sub_80D6390:
	svc #0x12
	bx lr

