	.syntax unified
	.section .text.SetTextFontGlyphs, "ax", %progbits
@ SetTextFontGlyphs @ JP 0x08003C24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetTextFontGlyphs
	.thumb_func
SetTextFontGlyphs:
	push {lr}
	cmp r0, #0
	bne _08003C3C
	ldr r0, _08003C34 @ =0x02028E70
	ldr r1, [r0]
	ldr r0, _08003C38 @ =0x0857994C
	b _08003C42
	.align 2, 0
_08003C34: .4byte 0x02028E70
_08003C38: .4byte 0x0857994C
_08003C3C:
	ldr r0, _08003C48 @ =0x02028E70
	ldr r1, [r0]
	ldr r0, _08003C4C @ =0x08593F74
_08003C42:
	str r0, [r1, #4]
	pop {r0}
	bx r0
	.align 2, 0
_08003C48: .4byte 0x02028E70
_08003C4C: .4byte 0x08593F74

