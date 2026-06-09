	.syntax unified
	.section .text.sub_80D63C4, "ax", %progbits
@ sub_80D63C4 @ JP 0x080D63C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D63C4
	.thumb_func
sub_80D63C4:
	movs r0, #0
	svc #0x19
	bx lr
	.align 2, 0

