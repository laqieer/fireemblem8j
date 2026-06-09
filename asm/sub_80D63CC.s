	.syntax unified
	.section .text.sub_80D63CC, "ax", %progbits
@ sub_80D63CC @ JP 0x080D63CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D63CC
	.thumb_func
sub_80D63CC:
	movs r0, #1
	svc #0x19
	bx lr
	.align 2, 0

