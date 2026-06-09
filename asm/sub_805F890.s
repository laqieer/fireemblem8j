	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_805F950, 0x0805F950 + 1
	.set sub_805FA00, 0x0805FA00 + 1
	.set sub_805FA8C, 0x0805FA8C + 1
	.set sub_805FBAC, 0x0805FBAC + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805F890, "ax", %progbits
@ sub_805F890 @ JP 0x0805F890 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805F890
	.thumb_func
sub_805F890:
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
	bne _0805F8BA
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0805F8BA:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _0805F8E0
	ldr r0, _0805F928 @ =0x00000119
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r5, #0
	bl sub_805F950
	adds r0, r5, #0
	bl sub_805FA8C
_0805F8E0:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #0
	adds r0, #0x59
	cmp r1, r0
	bne _0805F8F6
	adds r0, r5, #0
	movs r1, #2
	movs r2, #3
	bl sub_805FBAC
_0805F8F6:
	movs r3, #0x2c
	ldrsh r1, [r4, r3]
	adds r0, r6, #0
	adds r0, #0x5e
	cmp r1, r0
	bne _0805F92C
	adds r0, r5, #0
	bl sub_805FA00
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
	bne _0805F948
	adds r0, r5, #0
	bl sub_8074934
	b _0805F948
	.align 2, 0
_0805F928: .4byte 0x00000119
_0805F92C:
	adds r0, r6, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _0805F948
	adds r0, #5
	cmp r1, r0
	bne _0805F948
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_0805F948:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

