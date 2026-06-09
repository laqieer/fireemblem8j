	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805C28C, 0x0805C28C + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_80666B8, 0x080666B8 + 1
	.set sub_806674C, 0x0806674C + 1
	.set sub_80667E0, 0x080667E0 + 1
	.set sub_80668CC, 0x080668CC + 1
	.set sub_80669EC, 0x080669EC + 1
	.set sub_8066A7C, 0x08066A7C + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8066560, "ax", %progbits
@ sub_8066560 @ JP 0x08066560 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8066560
	.thumb_func
sub_8066560:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806659C
	adds r0, r5, #0
	bl sub_80666B8
	ldr r0, _08066598 @ =0x000002C1
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _080665FE
	.align 2, 0
_08066598: .4byte 0x000002C1
_0806659C:
	cmp r0, #0xe
	bne _080665A8
	adds r0, r5, #0
	bl sub_806674C
	b _080666AE
_080665A8:
	cmp r0, #0x2c
	bne _080665C0
	ldr r0, _080665BC @ =0x000002C2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r4, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	b _080665FE
	.align 2, 0
_080665BC: .4byte 0x000002C2
_080665C0:
	cmp r0, #0x53
	bne _080665D8
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_8054BF8
	b _080666AE
_080665D8:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0x5d
	cmp r1, r0
	bne _080665EC
	adds r0, r5, #0
	bl sub_80667E0
	b _080666AE
_080665EC:
	adds r0, r2, #0
	adds r0, #0x67
	cmp r1, r0
	bne _0806660C
	ldr r0, _08066608 @ =0x000002C3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
_080665FE:
	movs r3, #1
	bl sub_8074E80
	b _080666AE
	.align 2, 0
_08066608: .4byte 0x000002C3
_0806660C:
	adds r0, r2, #0
	adds r0, #0x7d
	cmp r1, r0
	bne _08066620
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xa
	b _08066690
_08066620:
	adds r0, r2, #0
	adds r0, #0x89
	cmp r1, r0
	bne _08066636
	adds r0, r5, #0
	bl sub_80668CC
	adds r0, r5, #0
	bl sub_80669EC
	b _080666AE
_08066636:
	adds r0, r2, #0
	adds r0, #0x90
	cmp r1, r0
	bne _08066666
	adds r0, r5, #0
	movs r1, #0xa
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
	bne _080666AE
	adds r0, r5, #0
	bl sub_8074934
	b _080666AE
_08066666:
	adds r0, r2, #0
	adds r0, #0x9a
	cmp r1, r0
	bne _08066698
	ldr r0, [r4, #0x5c]
	movs r1, #0x5f
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x42
	bl sub_805C28C
	adds r0, r5, #0
	bl sub_8066A7C
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x2c
	movs r2, #0xc
_08066690:
	movs r3, #0x10
	bl sub_805C7CC
	b _080666AE
_08066698:
	adds r0, r2, #0
	adds r0, #0xf5
	cmp r1, r0
	bne _080666AE
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_080666AE:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

