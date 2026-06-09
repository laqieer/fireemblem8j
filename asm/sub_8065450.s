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
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_80655EC, 0x080655EC + 1
	.set sub_8065778, 0x08065778 + 1
	.set sub_8065808, 0x08065808 + 1
	.set sub_8065944, 0x08065944 + 1
	.set sub_8065A64, 0x08065A64 + 1
	.set sub_8065AF0, 0x08065AF0 + 1
	.set sub_8065C10, 0x08065C10 + 1
	.set sub_8065C9C, 0x08065C9C + 1
	.set sub_8065D34, 0x08065D34 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8065450, "ax", %progbits
@ sub_8065450 @ JP 0x08065450 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065450
	.thumb_func
sub_8065450:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	movs r2, #0
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08065480
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _08065528
_08065480:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _080654AC
	movs r0, #0x10
	str r0, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl sub_805C7CC
	adds r0, r4, #0
	bl sub_8065D34
	ldr r0, _080654A8 @ =0x000003B5
	b _080654F6
	.align 2, 0
_080654A8: .4byte 0x000003B5
_080654AC:
	adds r0, r6, #0
	adds r0, #0x29
	cmp r1, r0
	bne _080654C6
	str r2, [sp]
	str r2, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0x10
	bl sub_805C7CC
	b _08065528
_080654C6:
	adds r0, r6, #0
	adds r0, #0x3f
	cmp r1, r0
	bne _080654E0
	movs r0, #0xf
	bl sub_8065808
	adds r0, r4, #0
	movs r1, #0xf
	movs r2, #1
	bl NewEfxRestWINH_
	b _08065528
_080654E0:
	adds r0, r6, #0
	adds r0, #0x40
	cmp r1, r0
	bne _0806550C
	adds r0, r4, #0
	bl sub_80655EC
	adds r0, r4, #0
	bl sub_8065778
	ldr r0, _08065508 @ =0x000002BF
_080654F6:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl sub_8074E80
	b _08065528
	.align 2, 0
_08065508: .4byte 0x000002BF
_0806550C:
	adds r0, r6, #0
	adds r0, #0x6c
	cmp r1, r0
	bne _08065528
	movs r0, #0xb0
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
_08065528:
	adds r7, r5, #0
	adds r7, #0x29
	ldrb r0, [r7]
	cmp r0, #0
	bne _080655AE
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x71
	cmp r1, r0
	bne _08065550
	adds r0, r4, #0
	bl sub_8065C9C
	adds r0, r4, #0
	bl sub_8065944
	adds r0, r4, #0
	bl sub_8065A64
_08065550:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x92
	cmp r1, r0
	bne _0806557A
	adds r0, r4, #0
	movs r1, #5
	bl sub_8054BF8
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r4, #0
	bl sub_8074934
_0806557A:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x98
	cmp r1, r0
	bne _08065592
	adds r0, r4, #0
	bl sub_8065AF0
	adds r0, r4, #0
	bl sub_8065C10
_08065592:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0xa7
	cmp r1, r0
	bne _080655E4
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl sub_8002DE4
	b _080655E4
_080655AE:
	movs r0, #0x2c
	ldrsh r1, [r5, r0]
	adds r0, r6, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _080655CA
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	ldrb r1, [r7]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
_080655CA:
	movs r3, #0x2c
	ldrsh r1, [r5, r3]
	adds r0, r6, #0
	adds r0, #0x6f
	cmp r1, r0
	bne _080655E4
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r5, #0
	bl sub_8002DE4
_080655E4:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

