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
	.set sub_8066CC0, 0x08066CC0 + 1
	.set sub_8066D7C, 0x08066D7C + 1
	.set sub_8066E88, 0x08066E88 + 1
	.set sub_8066F04, 0x08066F04 + 1
	.set sub_8066F9C, 0x08066F9C + 1
	.set sub_8067040, 0x08067040 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8066B7C, "ax", %progbits
@ sub_8066B7C @ JP 0x08066B7C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066B7C
	.thumb_func
sub_8066B7C:
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
	bne _08066BAA
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08066BAA:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _08066BBE
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_8054BF8
	b _08066CB6
_08066BBE:
	adds r0, r4, #0
	adds r0, #0xb
	cmp r1, r0
	bne _08066BD2
	adds r0, r5, #0
	bl sub_8066CC0
	movs r0, #0xb1
	lsls r0, r0, #2
	b _08066C8C
_08066BD2:
	adds r0, r4, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _08066C08
	adds r0, r5, #0
	movs r1, #0x72
	bl sub_8067040
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0xa
	movs r2, #0xa
	movs r3, #0
	bl sub_805C7CC
	ldr r0, _08066C04 @ =0x000002C5
	b _08066C8C
	.align 2, 0
_08066C04: .4byte 0x000002C5
_08066C08:
	adds r0, r4, #0
	adds r0, #0x4c
	cmp r1, r0
	bne _08066C22
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_8066E88
	adds r0, r5, #0
	movs r1, #0x3c
	bl sub_8066F04
	b _08066CB6
_08066C22:
	adds r0, r4, #0
	adds r0, #0x56
	cmp r1, r0
	bne _08066C36
	adds r0, r5, #0
	movs r1, #0x37
	movs r2, #0x2d
	bl sub_8066F9C
	b _08066CB6
_08066C36:
	adds r0, r4, #0
	adds r0, #0x8d
	cmp r1, r0
	bne _08066C60
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
	bne _08066CB6
	adds r0, r5, #0
	bl sub_8074934
	b _08066CB6
_08066C60:
	adds r0, r4, #0
	adds r0, #0x8e
	cmp r1, r0
	bne _08066CA0
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #0xa
	bl sub_805CA20
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_8066D7C
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x50
	movs r2, #0x14
	movs r3, #0x10
	bl sub_805C7CC
	ldr r0, _08066C9C @ =0x000002C6
_08066C8C:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
	b _08066CB6
	.align 2, 0
_08066C9C: .4byte 0x000002C6
_08066CA0:
	adds r0, r4, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _08066CB6
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl sub_8002DE4
_08066CB6:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

