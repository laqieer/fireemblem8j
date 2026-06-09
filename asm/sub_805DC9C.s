	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805DD38, 0x0805DD38 + 1
	.set sub_805DE30, 0x0805DE30 + 1
	.set sub_805DF40, 0x0805DF40 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805DC9C, "ax", %progbits
@ sub_805DC9C @ JP 0x0805DC9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805DC9C
	.thumb_func
sub_805DC9C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805DCC0
	ldr r0, [r4, #0x5c]
	movs r1, #6
	bl sub_8054BF8
	b _0805DD32
_0805DCC0:
	cmp r0, #6
	bne _0805DCF8
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	adds r0, r5, #0
	movs r1, #9
	bl sub_805DD38
	adds r0, r5, #0
	movs r1, #9
	bl sub_805DE30
	adds r0, r5, #0
	bl sub_805DF40
	movs r0, #0x86
	lsls r0, r0, #1
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	b _0805DD32
_0805DCF8:
	cmp r0, #0xa
	bne _0805DD1C
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
	bne _0805DD32
	adds r0, r5, #0
	bl sub_8074934
	b _0805DD32
_0805DD1C:
	cmp r0, #0x19
	beq _0805DD32
	cmp r0, #0x1e
	bne _0805DD32
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_0805DD32:
	pop {r4, r5}
	pop {r0}
	bx r0

