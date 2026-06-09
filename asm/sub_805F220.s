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
	.set sub_805F330, 0x0805F330 + 1
	.set sub_805F418, 0x0805F418 + 1
	.set sub_805F530, 0x0805F530 + 1
	.set sub_805F5C4, 0x0805F5C4 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805F220, "ax", %progbits
@ sub_805F220 @ JP 0x0805F220 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F220
	.thumb_func
sub_805F220:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805F24E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0805F24E:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805F294
	adds r0, r5, #0
	bl sub_805F330
	adds r0, r5, #0
	bl sub_805F5C4
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
	movs r2, #0x10
	movs r3, #0
	bl sub_805C7CC
	movs r0, #0x91
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
_0805F294:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x52
	cmp r1, r0
	bne _0805F2AA
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_8054BF8
	b _0805F328
_0805F2AA:
	adds r0, r6, #0
	adds r0, #0x55
	cmp r1, r0
	bne _0805F2E4
	adds r0, r5, #0
	bl sub_805F418
	adds r0, r5, #0
	bl sub_805F530
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x18
	movs r2, #0x10
	movs r3, #0x10
	bl sub_805C7CC
	ldr r0, _0805F2E0 @ =0x00000123
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	b _0805F328
	.align 2, 0
_0805F2E0: .4byte 0x00000123
_0805F2E4:
	adds r0, r6, #0
	adds r0, #0x58
	cmp r1, r0
	bne _0805F30C
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
	bne _0805F328
	adds r0, r5, #0
	bl sub_8074934
	b _0805F328
_0805F30C:
	adds r0, r6, #0
	adds r0, #0x88
	cmp r1, r0
	beq _0805F328
	adds r0, #0x19
	cmp r1, r0
	bne _0805F328
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_0805F328:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

