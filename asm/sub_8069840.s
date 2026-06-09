	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetUnitEfxDebuff, 0x080558AC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetUnitEfxDebuff, 0x0805587C + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8069904, 0x08069904 + 1
	.set sub_8069A14, 0x08069A14 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8069840, "ax", %progbits
@ sub_8069840 @ JP 0x08069840 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069840
	.thumb_func
sub_8069840:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806986C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _080698FE
_0806986C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xa
	cmp r1, r0
	bne _08069894
	movs r0, #0xee
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r5, #0
	movs r1, #0xc8
	bl sub_8069A14
	b _080698FE
_08069894:
	adds r0, r2, #0
	adds r0, #0x48
	cmp r1, r0
	bne _080698E8
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080698D8
	ldr r0, _080698E4 @ =0x000003B9
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r5, #0
	bl sub_8069904
	adds r0, r5, #0
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _080698D8
	adds r0, r5, #0
	movs r1, #0xb
	bl SetUnitEfxDebuff
_080698D8:
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	b _080698FE
	.align 2, 0
_080698E4: .4byte 0x000003B9
_080698E8:
	adds r0, r2, #0
	adds r0, #0xec
	cmp r1, r0
	bne _080698FE
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_080698FE:
	pop {r4, r5}
	pop {r0}
	bx r0

