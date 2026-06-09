	.syntax unified
	.section .text.sub_80D637C, "ax", %progbits
@ sub_80D637C @ JP 0x080D637C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D637C
	.thumb_func
sub_80D637C:
	svc #6
	adds r0, r1, #0
	bx lr
	.align 2, 0

