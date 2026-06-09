	.syntax unified
	.section .text.sub_80634D0, "ax", %progbits
@ sub_80634D0 @ JP 0x080634D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80634D0
	.thumb_func
sub_80634D0:
	ldr r1, _080634DC @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080634DC: .4byte 0x0201774C

