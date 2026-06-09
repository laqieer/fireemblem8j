	.syntax unified
	.section .text.sub_80D6368, "ax", %progbits
@ sub_80D6368 @ JP 0x080D6368 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6368
	.thumb_func
sub_80D6368:
	svc #0xe
	bx lr

