	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_80610B0, 0x080610B0 + 1
	.set sub_8061134, 0x08061134 + 1
	.set sub_80611B8, 0x080611B8 + 1
	.set sub_80612E0, 0x080612E0 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8060FC0, "ax", %progbits
@ sub_8060FC0 @ JP 0x08060FC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060FC0
	.thumb_func
sub_8060FC0:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r3, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #1
	bne _08061004
	ldr r0, _08061000 @ =0x00000127
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r5, #0
	bl sub_80610B0
	ldr r0, [r4, #0x5c]
	bl sub_80612E0
	b _080610AA
	.align 2, 0
_08061000: .4byte 0x00000127
_08061004:
	cmp r2, #0x14
	bne _08061018
	movs r0, #0x94
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _08061044
_08061018:
	cmp r2, #0x32
	bne _08061028
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _080610AA
_08061028:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r3, #0
	adds r0, #0x46
	cmp r1, r0
	bne _08061050
	adds r0, r5, #0
	bl sub_8061134
	ldr r0, _0806104C @ =0x00000129
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_08061044:
	movs r3, #1
	bl sub_8074E80
	b _080610AA
	.align 2, 0
_0806104C: .4byte 0x00000129
_08061050:
	adds r0, r3, #0
	adds r0, #0x49
	cmp r1, r0
	bne _08061062
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_8054BF8
	b _080610AA
_08061062:
	adds r0, r3, #0
	adds r0, #0x4b
	cmp r1, r0
	bne _08061090
	adds r0, r5, #0
	bl sub_80611B8
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
	bne _080610AA
	adds r0, r5, #0
	bl sub_8074934
	b _080610AA
_08061090:
	adds r0, r3, #0
	adds r0, #0x5a
	cmp r1, r0
	beq _080610AA
	cmp r2, #0x64
	bne _080610AA
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_080610AA:
	pop {r4, r5}
	pop {r0}
	bx r0

