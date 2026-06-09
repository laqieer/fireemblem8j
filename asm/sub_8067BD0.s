	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_8067D6C, 0x08067D6C + 1
	.set sub_8067E38, 0x08067E38 + 1
	.set sub_8067F04, 0x08067F04 + 1
	.set sub_8067FE4, 0x08067FE4 + 1
	.set sub_806812C, 0x0806812C + 1
	.set sub_806814C, 0x0806814C + 1
	.set sub_80682B8, 0x080682B8 + 1
	.set sub_8068408, 0x08068408 + 1
	.set sub_8068818, 0x08068818 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8067BD0, "ax", %progbits
@ sub_8067BD0 @ JP 0x08067BD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8067BD0
	.thumb_func
sub_8067BD0:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, [r6, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r4, r0, #0
	movs r7, #0x3e
	ldrh r0, [r6, #0x2c]
	adds r0, #1
	strh r0, [r6, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08067BFE
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08067BFE:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _08067C0E
	bl sub_806812C
	b _08067D64
_08067C0E:
	adds r0, r4, #0
	adds r0, #0xb
	cmp r1, r0
	bne _08067C20
	adds r0, r5, #0
	movs r1, #0x1a
	bl sub_80682B8
	b _08067D64
_08067C20:
	adds r3, r4, #0
	adds r3, #0x14
	cmp r1, r3
	bne _08067C48
	ldr r0, _08067C44 @ =0x000003D3
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r5, #0
	bl sub_8067D6C
	b _08067D64
	.align 2, 0
_08067C44: .4byte 0x000003D3
_08067C48:
	adds r0, r4, #0
	adds r0, #0x49
	cmp r1, r0
	bne _08067C6C
	movs r0, #0xf5
	lsls r0, r0, #2
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r6, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	adds r0, r5, #0
	bl sub_8067E38
	b _08067D64
_08067C6C:
	adds r0, r4, #0
	adds r0, #0x76
	cmp r1, r0
	bne _08067C7C
	adds r0, r5, #0
	bl sub_8067F04
	b _08067D64
_08067C7C:
	adds r0, r4, #0
	adds r0, #0x7c
	cmp r1, r0
	bne _08067C8E
	adds r0, r5, #0
	movs r1, #0x46
	bl sub_806814C
	b _08067D64
_08067C8E:
	adds r0, r4, #0
	adds r0, #0xc6
	cmp r1, r0
	bne _08067CC2
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	adds r0, r5, #0
	movs r1, #0x3c
	movs r2, #0x1e
	bl sub_8068818
	b _08067D64
_08067CC2:
	adds r0, r7, #0
	adds r0, #0xc4
	adds r0, r4, r0
	cmp r1, r0
	bne _08067CEA
	adds r0, r5, #0
	movs r1, #0x78
	movs r2, #0xa
	bl sub_805CA20
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r0, r5, #0
	bl sub_8067FE4
	b _08067D64
_08067CEA:
	ldr r2, _08067D1C @ =0x00000107
	adds r0, r4, r2
	cmp r1, r0
	bne _08067D20
	adds r0, r5, #0
	movs r1, #0x5c
	bl sub_8068408
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
	bne _08067D64
	adds r0, r5, #0
	bl sub_8074934
	b _08067D64
	.align 2, 0
_08067D1C: .4byte 0x00000107
_08067D20:
	movs r0, #0xc4
	adds r2, r7, r0
	adds r0, r2, r3
	cmp r1, r0
	beq _08067D42
	movs r3, #0x2c
	ldrsh r1, [r6, r3]
	adds r0, r4, #0
	adds r0, #0x52
	adds r0, r2, r0
	cmp r1, r0
	beq _08067D42
	adds r0, r4, #0
	adds r0, #0x5e
	adds r0, r2, r0
	cmp r1, r0
	bne _08067D4C
_08067D42:
	adds r0, r5, #0
	movs r1, #2
	bl sub_8054BF8
	b _08067D64
_08067D4C:
	adds r0, r4, #0
	adds r0, #0x64
	adds r0, r2, r0
	cmp r1, r0
	bne _08067D64
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl sub_8002DE4
_08067D64:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

