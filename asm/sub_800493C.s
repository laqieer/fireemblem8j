	.syntax unified
	.set GetColorLut, 0x08004140 + 1
	.section .text.DrawSpecialCharGlyph, "ax", %progbits
@ DrawSpecialCharGlyph @ JP 0x0800493C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawSpecialCharGlyph
	.thumb_func
DrawSpecialCharGlyph:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	ldr r3, _08004994 @ =0x02028E70
	ldr r3, [r3]
	lsls r0, r0, #6
	ldr r3, [r3]
	adds r3, r3, r0
	mov r8, r3
	adds r7, r2, #0
	adds r7, #8
	adds r0, r1, #0
	bl GetColorLut
	adds r2, r0, #0
	movs r6, #0xff
	movs r3, #0xf
_0800495E:
	ldm r7!, {r0}
	adds r1, r0, #0
	ands r1, r6
	lsls r1, r1, #1
	adds r1, r1, r2
	ldrh r4, [r1]
	lsrs r0, r0, #8
	ands r0, r6
	lsls r0, r0, #1
	adds r0, r0, r2
	ldrh r5, [r0]
	lsls r0, r5, #0x10
	adds r0, r0, r4
	mov r1, r8
	adds r1, #4
	mov r8, r1
	subs r1, #4
	stm r1!, {r0}
	subs r3, #1
	cmp r3, #0
	bge _0800495E
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08004994: .4byte 0x02028E70

