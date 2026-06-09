	.syntax unified
	.section .text.sub_806403C, "ax", %progbits
@ sub_806403C @ JP 0x0806403C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806403C
	.thumb_func
sub_806403C:
	ldr r1, _08064048 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_08064048: .4byte 0x0201774C

