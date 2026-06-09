	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80D01E8, "ax", %progbits
@ sub_80D01E8 @ JP 0x080D01E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D01E8
	.thumb_func
sub_80D01E8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D02BC @ =0x0000FFFF
	mov sb, r0
	cmp r7, sb
	beq _080D0256
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080D02C0 @ =0x000001FF
	ands r1, r4
	ldr r5, _080D02C4 @ =0x08B3F690
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080D02C8 @ =0x00000406
	ldr r0, _080D02CC @ =0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080D02D0 @ =0x0000081E
	ldr r3, _080D02D4 @ =0x08B3F6DE
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080D0256:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0x3c
	mov r1, sl
	movs r3, #0xb
	bl sub_80CF9D4
	adds r7, r0, #0
	cmp r7, sb
	beq _080D02A8
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080D02C0 @ =0x000001FF
	ands r1, r4
	ldr r5, _080D02C4 @ =0x08B3F690
	ldr r0, _080D02D8 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080D02DC @ =0x0000043A
	ldr r0, _080D02E0 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080D02E4 @ =0x00000852
	ldr r3, _080D02D4 @ =0x08B3F6DE
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080D02A8:
	ldrh r0, [r6, #0x2a]
	cmp r0, #0xb
	bne _080D02E8
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_8002DE4
	b _080D02EC
	.align 2, 0
_080D02BC: .4byte 0x0000FFFF
_080D02C0: .4byte 0x000001FF
_080D02C4: .4byte 0x08B3F690
_080D02C8: .4byte 0x00000406
_080D02CC: .4byte 0x00001078
_080D02D0: .4byte 0x0000081E
_080D02D4: .4byte 0x08B3F6DE
_080D02D8: .4byte 0x000020F0
_080D02DC: .4byte 0x0000043A
_080D02E0: .4byte 0x00003168
_080D02E4: .4byte 0x00000852
_080D02E8:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080D02EC:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

