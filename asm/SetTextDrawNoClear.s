	.syntax unified
	.section .text.SetTextDrawNoClear, "ax", %progbits
@ SetTextDrawNoClear @ JP 0x08004360 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetTextDrawNoClear
	.thumb_func
SetTextDrawNoClear:
	ldr r0, _0800436C @ =0x02028E70
	ldr r1, [r0]
	ldr r0, _08004370 @ =sub_80041A0
	str r0, [r1, #8]
	bx lr
	.align 2, 0
_0800436C: .4byte 0x02028E70
_08004370: .4byte 0x080041A1  @ sub_80041A0

