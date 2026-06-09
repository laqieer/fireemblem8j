	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_8060AA8, 0x08060AA8 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80609F0, "ax", %progbits
@ sub_80609F0 @ JP 0x080609F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80609F0
	.thumb_func
sub_80609F0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08060A1A
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08060A1A:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08060A3E
	movs r0, #0x90
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r5, #0
	bl sub_8060AA8
	b _08060AA0
_08060A3E:
	adds r0, r6, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _08060A84
	ldr r0, _08060A80 @ =0x00000121
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	ldr r0, [r4, #0x5c]
	movs r1, #4
	bl sub_8054BF8
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
	bne _08060AA0
	adds r0, r5, #0
	bl sub_8074934
	b _08060AA0
	.align 2, 0
_08060A80: .4byte 0x00000121
_08060A84:
	adds r0, r6, #0
	adds r0, #0x2f
	cmp r1, r0
	beq _08060AA0
	adds r0, #1
	cmp r1, r0
	bne _08060AA0
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_08060AA0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

