	.syntax unified
	.section .text.sub_80D638C, "ax", %progbits
@ sub_80D638C @ JP 0x080D638C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D638C
	.thumb_func
sub_80D638C:
	svc #0x13
	bx lr

