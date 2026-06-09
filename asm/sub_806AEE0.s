	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetBanimDragonStatusType, 0x08072060 + 1
	.set NewEfxSpellCast, 0x08055C78 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set efxDarkGradoRestoreMapBg, 0x0806B0C4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_8066234, 0x08066234 + 1
	.set sub_8066318, 0x08066318 + 1
	.set sub_806B0A0, 0x0806B0A0 + 1
	.set sub_806B5D8, 0x0806B5D8 + 1
	.set sub_806B7B0, 0x0806B7B0 + 1
	.set sub_806BDE8, 0x0806BDE8 + 1
	.set sub_806C1AC, 0x0806C1AC + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_806AEE0, "ax", %progbits
@ sub_806AEE0 @ JP 0x0806AEE0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806AEE0
	.thumb_func
sub_806AEE0:
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
	bne _0806AF0C
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _0806B03C
_0806AF0C:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #2
	cmp r1, r0
	bne _0806AF30
	bl GetBanimDragonStatusType
	cmp r0, #1
	bne _0806AF20
	b _0806B03C
_0806AF20:
	bl GetBanimDragonStatusType
	cmp r0, #2
	bne _0806AF2A
	b _0806B03C
_0806AF2A:
	bl sub_806B0A0
	b _0806B03C
_0806AF30:
	adds r0, r2, #0
	adds r0, #0x22
	cmp r1, r0
	bne _0806AF44
	adds r0, r5, #0
	bl sub_806B5D8
	movs r0, #0xeb
	lsls r0, r0, #2
	b _0806AFFC
_0806AF44:
	adds r0, r2, #0
	adds r0, #0x60
	cmp r1, r0
	bne _0806AF5A
	adds r0, r5, #0
	bl sub_806B7B0
	adds r0, r5, #0
	bl sub_806BDE8
	b _0806B03C
_0806AF5A:
	adds r0, r2, #0
	adds r0, #0xce
	cmp r1, r0
	bne _0806AF6A
	adds r0, r5, #0
	bl sub_806C1AC
	b _0806B03C
_0806AF6A:
	movs r3, #0x97
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _0806AFB4
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_8054BF8
	bl GetBanimDragonStatusType
	cmp r0, #1
	beq _0806AF90
	bl GetBanimDragonStatusType
	cmp r0, #2
	beq _0806AF90
	bl efxDarkGradoRestoreMapBg
_0806AF90:
	bl NewEfxSpellCast
	ldrh r1, [r5, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _0806B03C
	adds r0, r5, #0
	bl sub_8074934
	b _0806B03C
_0806AFB4:
	movs r3, #0x9a
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _0806AFD8
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0806B03C
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
	b _0806B03C
_0806AFD8:
	movs r3, #0x9c
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _0806B010
	ldr r0, [r4, #0x5c]
	movs r1, #0xf
	movs r2, #9
	bl sub_805CA20
	adds r0, r5, #0
	movs r1, #0x1e
	bl sub_8066234
	adds r0, r5, #0
	bl sub_8066318
	ldr r0, _0806B00C @ =0x000003AD
_0806AFFC:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #1
	bl sub_8074E80
	b _0806B03C
	.align 2, 0
_0806B00C: .4byte 0x000003AD
_0806B010:
	movs r3, #0xa4
	lsls r3, r3, #1
	adds r0, r2, r3
	cmp r1, r0
	bne _0806B026
	ldr r0, [r4, #0x5c]
	movs r1, #0xf
	movs r2, #8
	bl sub_805CA20
	b _0806B03C
_0806B026:
	ldr r3, _0806B044 @ =0x00000161
	adds r0, r2, r3
	cmp r1, r0
	bne _0806B03C
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_0806B03C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806B044: .4byte 0x00000161

