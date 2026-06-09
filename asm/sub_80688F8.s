	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set efxMaohFlash_RegisterSpritesGfx, 0x08069034 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805C28C, 0x0805C28C + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_8068A78, 0x08068A78 + 1
	.set sub_8068B84, 0x08068B84 + 1
	.set sub_8068CB4, 0x08068CB4 + 1
	.set sub_8068DAC, 0x08068DAC + 1
	.set sub_8068F70, 0x08068F70 + 1
	.set sub_8069054, 0x08069054 + 1
	.set sub_8069148, 0x08069148 + 1
	.set sub_8069574, 0x08069574 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80688F8, "ax", %progbits
@ sub_80688F8 @ JP 0x080688F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80688F8
	.thumb_func
sub_80688F8:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r7, r0, #0
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	cmp r1, #0xff
	beq _08068994
	cmp r1, #0xff
	bgt _08068928
	cmp r1, #0xb
	beq _0806893C
	cmp r1, #0xb1
	beq _0806898C
	b _080689DE
_08068928:
	ldr r0, _08068938 @ =0x00000109
	cmp r1, r0
	beq _080689B2
	adds r0, #0x24
	cmp r1, r0
	beq _080689CC
	b _080689DE
	.align 2, 0
_08068938: .4byte 0x00000109
_0806893C:
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x20
	movs r3, #0
	bl sub_805C7CC
	adds r0, r4, #0
	movs r1, #0xa6
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0xa6
	bl sub_805C28C
	adds r0, r4, #0
	bl sub_8068A78
	ldr r0, _08068988 @ =0x000003B2
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl sub_8074E80
	b _080689DE
	.align 2, 0
_08068988: .4byte 0x000003B2
_0806898C:
	adds r0, r4, #0
	bl sub_8068CB4
	b _080689DE
_08068994:
	bl efxMaohFlash_RegisterSpritesGfx
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0xad
	movs r3, #0x2c
	bl sub_8069054
	adds r0, r4, #0
	movs r1, #0xa
	movs r2, #0x9f
	movs r3, #0x30
	bl sub_8069148
	b _080689DE
_080689B2:
	adds r0, r4, #0
	movs r1, #0x22
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x22
	bl sub_805C28C
	adds r0, r4, #0
	bl sub_8068DAC
	b _080689DE
_080689CC:
	adds r0, r4, #0
	movs r1, #4
	bl sub_8054BF8
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_080689DE:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	ldr r2, _08068A3C @ =0x00000133
	adds r0, r7, r2
	cmp r1, r0
	bne _08068A4E
	ldrh r1, [r4, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r4, #0x10]
	adds r5, r6, #0
	adds r5, #0x29
	ldrb r1, [r5]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r5]
	cmp r0, #0
	bne _08068A44
	adds r0, r4, #0
	bl sub_8074934
	adds r0, r4, #0
	movs r1, #0x78
	movs r2, #0xa
	bl sub_805CA20
	adds r0, r4, #0
	bl sub_8068B84
	adds r0, r4, #0
	bl sub_8068F70
	adds r0, r4, #0
	movs r1, #0x4a
	bl sub_8069574
	ldr r0, _08068A40 @ =0x000003B3
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl sub_8074E80
	b _08068A6C
	.align 2, 0
_08068A3C: .4byte 0x00000133
_08068A40: .4byte 0x000003B3
_08068A44:
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r7, r1
	strh r0, [r6, #0x2c]
	b _08068A6C
_08068A4E:
	ldr r2, _08068A74 @ =0x000001C9
	adds r0, r7, r2
	cmp r1, r0
	bne _08068A6C
	ldrh r1, [r4, #0x10]
	movs r0, #2
	orrs r0, r1
	strh r0, [r4, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl sub_8002DE4
_08068A6C:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08068A74: .4byte 0x000001C9

