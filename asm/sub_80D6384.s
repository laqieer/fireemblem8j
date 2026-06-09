	.syntax unified
	.section .text.sub_80D6384, "ax", %progbits
@ sub_80D6384 @ JP 0x080D6384 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D6384
	.thumb_func
sub_80D6384:
	svc #7
	adds r0, r1, #0
	bx lr
	.align 2, 0

