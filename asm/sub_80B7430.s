	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set ResetClassReelSpell, 0x08070EA4 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_805B764, 0x0805B764 + 1
	.section .text.sub_80B7430, "ax", %progbits
@ sub_80B7430 @ JP 0x080B7430 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7430
	.thumb_func
sub_80B7430:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _080B74B4 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl sub_8001ACC
	bl sub_805B764
	bl ResetClassReelSpell
	movs r5, #0
	str r5, [r6, #0x38]
	str r5, [r6, #0x3c]
	ldrb r1, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r6, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r1, r6, #0
	adds r1, #0x2c
	movs r0, #2
	strb r0, [r1]
	adds r0, r6, #0
	adds r0, #0x32
	strb r5, [r0]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B74B4: .4byte 0x03003020

