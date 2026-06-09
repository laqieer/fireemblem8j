	.syntax unified
	.section .text.sub_80657BC, "ax", %progbits
@ sub_80657BC @ JP 0x080657BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80657BC
	.thumb_func
sub_80657BC:
	ldr r1, _080657C8 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080657C8: .4byte 0x0201774C

