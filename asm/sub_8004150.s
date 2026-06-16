	.syntax unified
	.set DrawGlyphRam, 0x08002AE0 + 1
	.set GetColorLut, 0x08004140 + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.DrawTextGlyph, "ax", %progbits
@ DrawTextGlyph @ JP 0x08004150 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawTextGlyph
	.thumb_func
DrawTextGlyph:
	push {r4, r5, r6, lr}
	mov r6, sb
	mov r5, r8
	push {r5, r6}
	adds r5, r0, #0
	mov sb, r1
	ldr r0, _0800419C @ =0x02028E70
	ldr r0, [r0]
	ldr r1, [r0, #0xc]
	adds r0, r5, #0
	bl sub_80D65C0
	mov r8, r0
	ldrb r0, [r5, #2]
	movs r4, #7
	ands r4, r0
	mov r6, sb
	adds r6, #8
	ldrb r0, [r5, #3]
	bl GetColorLut
	mov r1, r8
	adds r2, r6, #0
	adds r3, r4, #0
	bl DrawGlyphRam
	mov r1, sb
	ldrb r0, [r1, #5]
	ldrb r1, [r5, #2]
	adds r0, r0, r1
	strb r0, [r5, #2]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800419C: .4byte 0x02028E70

