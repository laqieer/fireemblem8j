	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805C28C, 0x0805C28C + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_8067708, 0x08067708 + 1
	.set sub_806D458, 0x0806D458 + 1
	.set sub_806D50C, 0x0806D50C + 1
	.set sub_806D5E4, 0x0806D5E4 + 1
	.set sub_806D808, 0x0806D808 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_806D254, "ax", %progbits
@ sub_806D254 @ JP 0x0806D254 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D254
	.thumb_func
sub_806D254:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806D284
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _0806D39E
_0806D284:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0806D2A4
	adds r0, r5, #0
	bl sub_806D5E4
	ldr r0, _0806D2A0 @ =0x000003D5
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x10
	b _0806D370
	.align 2, 0
_0806D2A0: .4byte 0x000003D5
_0806D2A4:
	adds r0, r2, #0
	adds r0, #0x2b
	cmp r1, r0
	bne _0806D2B4
	adds r0, r5, #0
	bl sub_806D50C
	b _0806D39E
_0806D2B4:
	adds r0, r2, #0
	adds r0, #0x97
	cmp r1, r0
	bne _0806D2C2
	bl sub_806D808
	b _0806D39E
_0806D2C2:
	adds r0, r2, #0
	adds r0, #0xa7
	cmp r1, r0
	bne _0806D2D2
	adds r0, r5, #0
	bl sub_806D458
	b _0806D39E
_0806D2D2:
	adds r0, r2, #0
	adds r0, #0xeb
	cmp r1, r0
	bne _0806D2FA
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806D39E
	adds r0, r5, #0
	bl sub_8074934
	b _0806D39E
_0806D2FA:
	adds r0, r2, #0
	adds r0, #0xec
	cmp r1, r0
	bne _0806D31C
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806D39E
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
	b _0806D39E
_0806D31C:
	adds r0, r2, #0
	adds r0, #0xed
	cmp r1, r0
	bne _0806D338
	ldr r0, [r4, #0x5c]
	movs r1, #0x3e
	movs r2, #9
	bl sub_805CA20
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_8054BF8
	b _0806D39E
_0806D338:
	adds r0, r2, #0
	adds r0, #0xf7
	cmp r1, r0
	bne _0806D37C
	ldr r0, [r4, #0x5c]
	movs r1, #0x46
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x32
	bl sub_805C28C
	ldr r0, [r4, #0x5c]
	bl sub_8067708
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl sub_805C7CC
	ldr r0, _0806D378 @ =0x000003D6
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
_0806D370:
	movs r3, #1
	bl sub_8074E80
	b _0806D39E
	.align 2, 0
_0806D378: .4byte 0x000003D6
_0806D37C:
	movs r3, #0x88
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _0806D38C
	bl RegisterEfxSpellCastEnd
	b _0806D39E
_0806D38C:
	ldr r3, _0806D3A8 @ =0x0000012B
	adds r0, r2, r3
	cmp r1, r0
	bne _0806D39E
	bl SpellFx_Finish
	adds r0, r4, #0
	bl sub_8002DE4
_0806D39E:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0806D3A8: .4byte 0x0000012B

