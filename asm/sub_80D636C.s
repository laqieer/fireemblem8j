	.syntax unified
	.section .text.sub_80D636C, "ax", %progbits
@ sub_80D636C @ JP 0x080D636C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D636C
	.thumb_func
sub_80D636C:
	svc #0xc
	bx lr

