	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805C1A4, 0x0805C1A4 + 1
	.set sub_805C5D8, 0x0805C5D8 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_8064C6C, 0x08064C6C + 1
	.set sub_8064D20, 0x08064D20 + 1
	.set sub_8064E64, 0x08064E64 + 1
	.set sub_8064FA0, 0x08064FA0 + 1
	.set sub_806503C, 0x0806503C + 1
	.set sub_8065124, 0x08065124 + 1
	.set sub_8065398, 0x08065398 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8064AB0, "ax", %progbits
@ sub_8064AB0 @ JP 0x08064AB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8064AB0
	.thumb_func
sub_8064AB0:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08064ADE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08064ADE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r5, #1
	cmp r1, r0
	bne _08064B64
	adds r0, r6, #0
	bl sub_8064C6C
	ldr r4, _08064B5C @ =0x03003020
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl sub_805C7CC
	movs r5, #0x80
	lsls r5, r5, #1
	movs r0, #2
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x14
	movs r2, #0xf
	adds r3, r5, #0
	bl sub_805C1A4
	adds r1, r0, #0
	adds r0, r6, #0
	movs r2, #0x14
	bl sub_8065398
	movs r3, #0x20
	ldrsh r2, [r4, r3]
	adds r0, r6, #0
	movs r1, #0x14
	movs r3, #0
	bl sub_805C5D8
	ldr r0, _08064B60 @ =0x000002BD
	adds r1, r5, #0
	movs r2, #0x78
	movs r3, #1
	bl sub_8074E80
	b _08064C62
	.align 2, 0
_08064B5C: .4byte 0x03003020
_08064B60: .4byte 0x000002BD
_08064B64:
	adds r0, r5, #0
	adds r0, #0x29
	cmp r1, r0
	bne _08064B92
	bl sub_8064D20
	adds r0, r6, #0
	movs r1, #0x15
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r6, #0
	bl sub_8065124
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x19
	movs r3, #0x10
	bl sub_805C7CC
	b _08064C62
_08064B92:
	adds r0, r5, #0
	adds r0, #0x37
	cmp r1, r0
	bne _08064BB0
	ldr r0, _08064BAC @ =0x000002BE
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r6, r3]
	movs r3, #0
	bl sub_8074E80
	b _08064C62
	.align 2, 0
_08064BAC: .4byte 0x000002BE
_08064BB0:
	adds r0, r5, #0
	adds r0, #0x46
	cmp r1, r0
	bne _08064C02
	adds r0, r6, #0
	movs r1, #0x41
	bl sub_8064E64
	adds r0, r6, #0
	movs r1, #0x41
	bl sub_8064FA0
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0xa
	movs r3, #0
	bl sub_805C7CC
	movs r0, #1
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0x41
	movs r2, #2
	movs r3, #0x80
	bl sub_805C1A4
	adds r0, r6, #0
	movs r1, #0x44
	movs r2, #0
	bl NewEfxRestWINH_
	b _08064C62
_08064C02:
	adds r0, r5, #0
	adds r0, #0x87
	cmp r1, r0
	bne _08064C32
	adds r0, r6, #0
	movs r1, #5
	bl sub_8054BF8
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08064C62
	adds r0, r6, #0
	bl sub_8074934
	b _08064C62
_08064C32:
	adds r0, r5, #0
	adds r0, #0x8c
	cmp r1, r0
	bne _08064C4C
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, [r4, #0x5c]
	bl sub_806503C
	b _08064C62
_08064C4C:
	adds r0, r5, #0
	adds r0, #0xbe
	cmp r1, r0
	bne _08064C62
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_08064C62:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

