	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_8065FF0, 0x08065FF0 + 1
	.set sub_8066128, 0x08066128 + 1
	.set sub_8066234, 0x08066234 + 1
	.set sub_8066318, 0x08066318 + 1
	.set sub_80663A8, 0x080663A8 + 1
	.set sub_8066444, 0x08066444 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8065E44, "ax", %progbits
@ sub_8065E44 @ JP 0x08065E44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8065E44
	.thumb_func
sub_8065E44:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08065E72
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08065E72:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _08065EC8
	adds r0, r5, #0
	bl sub_8065FF0
	adds r0, r5, #0
	bl sub_8066444
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl sub_805C7CC
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x32
	movs r2, #0xa
	movs r3, #0x10
	bl sub_805C7CC
	ldr r0, _08065EC4 @ =0x000002C7
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	b _08065FAE
	.align 2, 0
_08065EC4: .4byte 0x000002C7
_08065EC8:
	adds r0, r4, #0
	adds r0, #0x45
	cmp r1, r0
	bne _08065F06
	ldr r0, [r6, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_805CA20
	adds r0, r5, #0
	movs r1, #0x54
	bl sub_8066128
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #0
	bl sub_805C7CC
	movs r0, #0xb2
	lsls r0, r0, #2
	b _08065FA8
_08065F06:
	adds r0, r4, #0
	adds r0, #0x58
	cmp r1, r0
	bne _08065F18
	adds r0, r5, #0
	movs r1, #0x32
	bl sub_80663A8
	b _08065FE6
_08065F18:
	adds r0, r4, #0
	adds r0, #0x5d
	cmp r1, r0
	beq _08065F28
	adds r0, r4, #0
	adds r0, #0x6c
	cmp r1, r0
	bne _08065F32
_08065F28:
	adds r0, r5, #0
	movs r1, #5
	bl sub_8054BF8
	b _08065FE6
_08065F32:
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	bne _08065F64
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_8054BF8
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08065FE6
	adds r0, r5, #0
	bl sub_8074934
	b _08065FE6
_08065F64:
	adds r0, r4, #0
	adds r0, #0x9f
	cmp r1, r0
	bne _08065F86
	adds r0, r6, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08065FE6
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl sub_8002DE4
	b _08065FE6
_08065F86:
	adds r0, r4, #0
	adds r0, #0xa3
	cmp r1, r0
	bne _08065FBC
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #9
	bl sub_805CA20
	adds r0, r5, #0
	movs r1, #0x1e
	bl sub_8066234
	adds r0, r5, #0
	bl sub_8066318
	ldr r0, _08065FB8 @ =0x000002C9
_08065FA8:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
_08065FAE:
	movs r3, #1
	bl sub_8074E80
	b _08065FE6
	.align 2, 0
_08065FB8: .4byte 0x000002C9
_08065FBC:
	adds r0, r4, #0
	adds r0, #0xb3
	cmp r1, r0
	bne _08065FD0
	ldr r0, [r6, #0x5c]
	movs r1, #0xf
	movs r2, #8
	bl sub_805CA20
	b _08065FE6
_08065FD0:
	adds r0, r4, #0
	adds r0, #0xcc
	cmp r1, r0
	bne _08065FE6
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl sub_8002DE4
_08065FE6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

