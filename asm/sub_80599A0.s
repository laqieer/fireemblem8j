	.syntax unified
	.section .text.sub_80599A0, "ax", %progbits
@ sub_80599A0 @ JP 0x080599A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80599A0
	.thumb_func
sub_80599A0:
	ldr r1, _080599A8 @ =0x0203E1DC
	movs r0, #0
	str r0, [r1]
	bx lr
	.align 2, 0
_080599A8: .4byte 0x0203E1DC

