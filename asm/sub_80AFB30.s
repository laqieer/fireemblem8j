	.syntax unified
	.set APProc_SetParameters, 0x08009688 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set SaveDraw_SetCursorSlotMark, 0x080AFFD0 + 1
	.set sub_80096A4, 0x080096A4 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_80AF2CC, 0x080AF2CC + 1
	.set sub_80AF8B4, 0x080AF8B4 + 1
	.set sub_80AFFB0, 0x080AFFB0 + 1
	.section .text.sub_80AFB30, "ax", %progbits
@ sub_80AFB30 @ JP 0x080AFB30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AFB30
	.thumb_func
sub_80AFB30:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldr r0, [r0, #0x14]
	adds r0, #0x2f
	ldrb r0, [r0]
	cmp r0, #0
	bne _080AFB4A
	b _080AFCAE
_080AFB4A:
	mov r0, r8
	bl sub_80AF2CC
	mov r0, r8
	bl sub_80AF8B4
	movs r7, #0
	movs r0, #0xf
	mov sl, r0
	movs r1, #0xa
	mov sb, r1
_080AFB60:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	movs r2, #0
	cmp r0, #6
	bne _080AFB7E
	adds r0, r1, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	cmp r0, r7
	bne _080AFB7E
	movs r2, #0x80
	lsls r2, r2, #1
_080AFB7E:
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r0, #0xf8
	subs r1, r0, r1
	ldr r0, _080AFC3C @ =0x000001FF
	ands r1, r0
	lsls r5, r7, #5
	adds r5, #0x20
	adds r5, r2, r5
	ldr r0, _080AFC40 @ =0x08A9D958
	lsls r6, r7, #2
	adds r0, r6, r0
	ldr r3, [r0]
	lsls r4, r7, #1
	mov r0, sb
	mov r2, sl
	ands r0, r2
	lsls r0, r0, #0xc
	str r0, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x2f
	ldrb r1, [r0]
	movs r2, #0xf8
	subs r1, r2, r1
	ldr r0, _080AFC3C @ =0x000001FF
	ands r1, r0
	adds r5, #8
	ldr r0, _080AFC44 @ =0x08A9D94C
	adds r6, r6, r0
	ldr r3, [r6]
	adds r4, #0xb
	mov r2, sl
	ands r4, r2
	lsls r4, r4, #0xc
	str r4, [sp]
	movs r0, #4
	adds r2, r5, #0
	bl PutSpriteExt
	movs r0, #2
	add sb, r0
	adds r7, #1
	cmp r7, #2
	ble _080AFB60
	mov r1, r8
	ldr r2, [r1, #0x14]
	adds r3, r2, #0
	adds r3, #0x3f
	ldrb r0, [r3]
	cmp r0, #0xff
	beq _080AFCAE
	adds r0, r2, #0
	adds r0, #0x44
	ldrh r1, [r0]
	movs r0, #0x80
	lsls r0, r0, #1
	cmp r1, r0
	beq _080AFC4C
	ldr r0, [r2, #0x60]
	cmp r0, #0
	beq _080AFC12
	bl sub_80096A4
	mov r2, r8
	ldr r1, [r2, #0x14]
	movs r0, #0
	str r0, [r1, #0x60]
_080AFC12:
	mov r0, r8
	ldr r2, [r0, #0x14]
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r1, [r0]
	movs r0, #1
	ands r0, r1
	adds r0, r2, #0
	adds r0, #0x3f
	ldrb r2, [r0]
	lsls r2, r2, #5
	adds r2, #0x1e
	ldr r3, _080AFC48 @ =0x08A9D4B4
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0xca
	bl PutSpriteExt
	b _080AFCAE
	.align 2, 0
_080AFC3C: .4byte 0x000001FF
_080AFC40: .4byte 0x08A9D958
_080AFC44: .4byte 0x08A9D94C
_080AFC48: .4byte 0x08A9D4B4
_080AFC4C:
	adds r0, r2, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #1
	bne _080AFC74
	ldr r0, [r2, #0x60]
	adds r1, r2, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r1, #0xda
	lsls r1, r1, #1
	subs r1, r1, r2
	ldrb r2, [r3]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	bl APProc_SetParameters
	b _080AFCAE
_080AFC74:
	ldr r0, [r2, #0x60]
	movs r1, #0xa0
	lsls r1, r1, #1
	ldrb r2, [r3]
	lsls r2, r2, #5
	adds r2, #0x30
	movs r3, #0xc5
	lsls r3, r3, #6
	bl APProc_SetParameters
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r1, r0, #0
	adds r1, #0x2f
	ldrb r2, [r1]
	movs r1, #0xd3
	lsls r1, r1, #1
	subs r1, r1, r2
	adds r0, #0x3f
	ldrb r2, [r0]
	lsls r2, r2, #5
	adds r2, #0x1e
	ldr r3, _080AFD1C @ =0x08A9D4B4
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
_080AFCAE:
	mov r2, r8
	ldr r1, [r2, #0x14]
	adds r0, r1, #0
	adds r0, #0x2e
	ldrb r0, [r0]
	subs r0, #5
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bhi _080AFD62
	adds r0, r1, #0
	adds r0, #0x36
	ldrb r0, [r0]
	cmp r0, #0
	beq _080AFD24
	ldr r3, _080AFD20 @ =0x08A9D462
	movs r0, #0x80
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #0x2c
	movs r2, #0x80
	bl PutSpriteExt
	mov r1, r8
	ldr r0, [r1, #0x14]
	adds r0, #0x36
	ldrb r1, [r0]
	subs r1, #1
	lsrs r0, r1, #0x1f
	adds r0, r1, r0
	asrs r0, r0, #1
	lsls r0, r0, #1
	subs r1, r1, r0
	movs r0, #0x2c
	muls r0, r1, r0
	adds r0, #0x34
	movs r1, #0x88
	bl sub_804F528
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r0, #0x2c
	ldrb r2, [r0]
	lsls r2, r2, #0x15
	movs r0, #0x80
	lsls r0, r0, #0xe
	adds r2, r2, r0
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80AFFB0
	b _080AFD42
	.align 2, 0
_080AFD1C: .4byte 0x08A9D4B4
_080AFD20: .4byte 0x08A9D462
_080AFD24:
	adds r1, #0x2c
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080AFD42
	adds r2, r0, #0
	lsls r2, r2, #0x15
	movs r1, #0x80
	lsls r1, r1, #0xe
	adds r2, r2, r1
	asrs r2, r2, #0x10
	movs r0, #1
	movs r1, #0xc
	mov r3, r8
	bl sub_80AFFB0
_080AFD42:
	mov r2, r8
	ldr r0, [r2, #0x14]
	adds r1, r0, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	beq _080AFD62
	adds r1, r0, #0
	lsls r1, r1, #0x1d
	movs r0, #0x80
	lsls r0, r0, #0x16
	adds r1, r1, r0
	lsrs r1, r1, #0x18
	movs r0, #1
	bl SaveDraw_SetCursorSlotMark
_080AFD62:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

