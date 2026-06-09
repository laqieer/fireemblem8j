	.syntax unified
	.section .text.ResetTextFont, "ax", %progbits
@ ResetTextFont @ JP 0x08003C50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ResetTextFont
	.thumb_func
ResetTextFont:
	ldr r0, _08003C60 @ =0x02028E70
	ldr r1, [r0]
	movs r0, #0
	strh r0, [r1, #0x12]
	ldr r1, _08003C64 @ =0x02028E74
	movs r0, #0xff
	strb r0, [r1]
	bx lr
	.align 2, 0
_08003C60: .4byte 0x02028E70
_08003C64: .4byte 0x02028E74

