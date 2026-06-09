	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_8060C24, 0x08060C24 + 1
	.set sub_8060D90, 0x08060D90 + 1
	.set sub_8060E5C, 0x08060E5C + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8060C60, "ax", %progbits
@ sub_8060C60 @ JP 0x08060C60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8060C60
	.thumb_func
sub_8060C60:
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
	bne _08060C8E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08060C8E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _08060CB0
	adds r0, r5, #0
	movs r1, #4
	bl sub_8054BF8
	adds r0, r5, #0
	bl sub_8060D90
	adds r0, r5, #0
	bl sub_8060E5C
	movs r0, #0x30
	b _08060CD6
_08060CB0:
	adds r0, r4, #0
	adds r0, #0x15
	cmp r1, r0
	bne _08060CC4
	adds r0, r5, #0
	movs r1, #4
	bl sub_8054BF8
	movs r0, #0xa0
	b _08060CD6
_08060CC4:
	adds r0, r4, #0
	adds r0, #0x29
	cmp r1, r0
	bne _08060CDE
	adds r0, r5, #0
	movs r1, #4
	bl sub_8054BF8
	movs r0, #0x70
_08060CD6:
	movs r1, #0
	bl sub_8060C24
	b _08060D88
_08060CDE:
	adds r0, r4, #0
	adds r0, #0x3d
	cmp r1, r0
	bne _08060D12
	adds r0, r5, #0
	movs r1, #4
	bl sub_8054BF8
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #3
	movs r2, #0xa
	movs r3, #0
	bl sub_805C7CC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	adds r0, r1, #0
	movs r3, #1
	bl sub_8074E80
	b _08060D88
_08060D12:
	adds r0, r4, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _08060D58
	adds r0, r5, #0
	movs r1, #4
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
	ldr r0, _08060D54 @ =0x00000101
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	ldrb r0, [r4]
	cmp r0, #0
	bne _08060D88
	adds r0, r5, #0
	bl sub_8074934
	b _08060D88
	.align 2, 0
_08060D54: .4byte 0x00000101
_08060D58:
	adds r0, r4, #0
	adds r0, #0x69
	cmp r1, r0
	bne _08060D72
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0x14
	movs r3, #8
	bl sub_805C7CC
	b _08060D88
_08060D72:
	adds r0, r4, #0
	adds r0, #0x71
	cmp r1, r0
	bne _08060D88
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl sub_8002DE4
_08060D88:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

