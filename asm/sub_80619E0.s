	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805C1A4, 0x0805C1A4 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_8061B9C, 0x08061B9C + 1
	.set sub_8061C7C, 0x08061C7C + 1
	.set sub_8061D18, 0x08061D18 + 1
	.set sub_8061DAC, 0x08061DAC + 1
	.set sub_8061E3C, 0x08061E3C + 1
	.set sub_8061F90, 0x08061F90 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80619E0, "ax", %progbits
@ sub_80619E0 @ JP 0x080619E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80619E0
	.thumb_func
sub_80619E0:
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
	bne _08061A0E
	ldr r0, [r6, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_08061A0E:
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #1
	cmp r1, r0
	bne _08061A84
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_8061B9C
	adds r0, r5, #0
	movs r1, #0x64
	bl sub_8061C7C
	movs r4, #0x80
	lsls r4, r4, #1
	movs r0, #1
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x64
	movs r2, #2
	adds r3, r4, #0
	bl sub_805C1A4
	adds r0, r5, #0
	movs r1, #0x69
	movs r2, #0
	bl NewEfxRestWINH_
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0x10
	str r0, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0xf
	movs r3, #0
	bl sub_805C7CC
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x46
	movs r2, #0xf
	movs r3, #0x10
	bl sub_805C7CC
	movs r0, #0x98
	lsls r0, r0, #1
	adds r1, r4, #0
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
	b _08061B94
_08061A84:
	adds r0, r4, #0
	adds r0, #0x28
	cmp r1, r0
	bne _08061A9C
	adds r0, r5, #0
	movs r1, #0x4a
	bl sub_8061D18
	ldr r0, _08061A98 @ =0x00000131
	b _08061AF4
	.align 2, 0
_08061A98: .4byte 0x00000131
_08061A9C:
	adds r0, r4, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _08061AAC
	adds r0, r5, #0
	bl sub_8061DAC
	b _08061B94
_08061AAC:
	adds r0, r4, #0
	adds r0, #0x6f
	cmp r1, r0
	beq _08061AF0
	adds r0, r4, #0
	adds r0, #0x7d
	cmp r1, r0
	beq _08061AF0
	adds r0, r4, #0
	adds r0, #0x8b
	cmp r1, r0
	beq _08061AF0
	adds r0, r4, #0
	adds r0, #0x99
	cmp r1, r0
	beq _08061AF0
	adds r0, r4, #0
	adds r0, #0xa7
	cmp r1, r0
	beq _08061AF0
	adds r0, r4, #0
	adds r0, #0xb5
	cmp r1, r0
	beq _08061AF0
	adds r0, r4, #0
	adds r0, #0xc3
	cmp r1, r0
	beq _08061AF0
	movs r0, #0x2c
	ldrsh r1, [r6, r0]
	adds r0, r4, #0
	adds r0, #0xd1
	cmp r1, r0
	bne _08061B04
_08061AF0:
	movs r0, #0x99
	lsls r0, r0, #1
_08061AF4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	b _08061B94
_08061B04:
	adds r0, r4, #0
	adds r0, #0xee
	cmp r1, r0
	bne _08061B50
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_8054BF8
	adds r0, r5, #0
	bl sub_8061F90
	ldrh r1, [r5, #0x10]
	movs r0, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, r6, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimHitEffectsDefault
	ldr r0, _08061B4C @ =0x00000133
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	ldrb r0, [r4]
	cmp r0, #0
	bne _08061B94
	adds r0, r5, #0
	bl sub_8074934
	b _08061B94
	.align 2, 0
_08061B4C: .4byte 0x00000133
_08061B50:
	adds r0, r4, #0
	adds r0, #0xf8
	cmp r1, r0
	bne _08061B72
	adds r0, r5, #0
	bl sub_8061E3C
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x12
	movs r2, #8
	movs r3, #0x10
	bl sub_805C7CC
	b _08061B94
_08061B72:
	movs r2, #0x91
	lsls r2, r2, #1
	adds r0, r4, r2
	cmp r1, r0
	beq _08061B94
	movs r3, #0x96
	lsls r3, r3, #1
	adds r0, r4, r3
	cmp r1, r0
	bne _08061B94
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r6, #0
	bl sub_8002DE4
_08061B94:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

