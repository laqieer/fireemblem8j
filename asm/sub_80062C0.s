	.syntax unified
	.section .text.sub_80062C0, "ax", %progbits
@ sub_80062C0 @ JP 0x080062C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80062C0
	.thumb_func
sub_80062C0:
	movs r1, #0
	strh r1, [r0, #0x34]
	bx lr
	.align 2, 0

