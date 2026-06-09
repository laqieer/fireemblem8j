	.syntax unified
	.section .text.sub_80D6398, "ax", %progbits
@ sub_80D6398 @ JP 0x080D6398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6398
	.thumb_func
sub_80D6398:
	movs r1, #1
	svc #0x25
	bx lr
	.align 2, 0

