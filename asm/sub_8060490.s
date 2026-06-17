	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set StartBattleAnimResireHitEffects, 0x080563C0 + 1
	.set sub_805C1A4, 0x0805C1A4 + 1
	.set sub_805C5D8, 0x0805C5D8 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_80605B0, 0x080605B0 + 1
	.set sub_806063C, 0x0806063C + 1
	.set sub_8060938, 0x08060938 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8060490, "ax", %progbits
@ sub_8060490 @ JP 0x08060490 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global efxResire_Loop_Main
	.thumb_func
efxResire_Loop_Main:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r6, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080604BE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_080604BE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r6, #1
	cmp r1, r0
	bne _08060502
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
	movs r2, #0xa
	movs r3, #0
	bl sub_805C7CC
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x23
	movs r2, #0x14
	movs r3, #0x10
	bl sub_805C7CC
	adds r0, r5, #0
	bl sub_806063C
	movs r0, #0x92
	lsls r0, r0, #1
	b _08060552
_08060502:
	adds r0, r6, #0
	adds r0, #0xf
	cmp r1, r0
	bne _0806053C
	movs r0, #2
	str r0, [sp]
	adds r0, r5, #0
	movs r1, #0x2a
	movs r2, #0xf
	movs r3, #0
	bl sub_805C1A4
	adds r1, r0, #0
	adds r0, r5, #0
	movs r2, #0x1e
	bl sub_8060938
	ldr r0, _08060538 @ =0x03003020
	movs r1, #0x20
	ldrsh r2, [r0, r1]
	adds r0, r5, #0
	movs r1, #0x2b
	movs r3, #0
	bl sub_805C5D8
	b _080605A8
	.align 2, 0
_08060538: .4byte 0x03003020
_0806053C:
	adds r0, r6, #0
	adds r0, #0x3c
	cmp r1, r0
	bne _08060568
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r5, #0
	bl sub_80605B0
	ldr r0, _08060564 @ =0x00000125
_08060552:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	b _080605A8
	.align 2, 0
_08060564: .4byte 0x00000125
_08060568:
	adds r0, r6, #0
	adds r0, #0x41
	cmp r1, r0
	bne _08060590
	ldrh r0, [r5, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r5, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r5, #0
	bl StartBattleAnimResireHitEffects
	ldrb r0, [r4]
	cmp r0, #0
	bne _080605A8
	adds r0, r5, #0
	bl sub_8074934
	b _080605A8
_08060590:
	adds r0, r6, #0
	adds r0, #0x6e
	cmp r1, r0
	beq _080605A8
	adds r0, #0x14
	cmp r1, r0
	bne _080605A8
	bl SpellFx_Finish
	adds r0, r4, #0
	bl sub_8002DE4
_080605A8:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

