	.syntax unified
	.section .text.sub_80679E4, "ax", %progbits
@ sub_80679E4 @ JP 0x080679E4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80679E4
	.thumb_func
sub_80679E4:
	ldr r1, _080679F0 @ =0x0201774C
	ldr r0, [r1]
	subs r0, #1
	str r0, [r1]
	bx lr
	.align 2, 0
_080679F0: .4byte 0x0201774C

