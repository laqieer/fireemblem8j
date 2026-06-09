	.syntax unified
	.section .text.sub_80D6394, "ax", %progbits
@ sub_80D6394 @ JP 0x080D6394 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6394
	.thumb_func
sub_80D6394:
	svc #0x11
	bx lr

