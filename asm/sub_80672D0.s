	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_8055E64, 0x08055E64 + 1
	.set sub_8055E80, 0x08055E80 + 1
	.set sub_805C28C, 0x0805C28C + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_8066234, 0x08066234 + 1
	.set sub_8066318, 0x08066318 + 1
	.set sub_8067450, 0x08067450 + 1
	.set sub_806759C, 0x0806759C + 1
	.set sub_8067634, 0x08067634 + 1
	.set sub_8067708, 0x08067708 + 1
	.set sub_8067834, 0x08067834 + 1
	.set sub_8067914, 0x08067914 + 1
	.set sub_8067984, 0x08067984 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_80672D0, "ax", %progbits
@ sub_80672D0 @ JP 0x080672D0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80672D0
	.thumb_func
sub_80672D0:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _080672FE
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_080672FE:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r5, #0
	adds r0, #0x14
	cmp r1, r0
	bne _08067318
	adds r0, r6, #0
	bl sub_8067984
	ldr r0, _08067314 @ =0x000002FD
	b _080673B8
	.align 2, 0
_08067314: .4byte 0x000002FD
_08067318:
	adds r0, r5, #0
	adds r0, #0x28
	cmp r1, r0
	bne _08067338
	adds r0, r6, #0
	bl sub_8067634
	adds r0, r6, #0
	bl sub_8067450
	adds r0, r6, #0
	bl sub_806759C
	bl sub_8055E64
	b _08067444
_08067338:
	adds r0, r5, #0
	adds r0, #0x91
	cmp r1, r0
	bne _0806734C
	adds r0, r6, #0
	movs r1, #0x1e
	movs r2, #0x14
	bl sub_8067834
	b _08067444
_0806734C:
	adds r0, r5, #0
	adds r0, #0xaf
	cmp r1, r0
	bne _08067374
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r0, [r4]
	cmp r0, #0
	bne _08067444
	adds r0, r6, #0
	bl sub_8074934
	b _08067444
_08067374:
	adds r0, r5, #0
	adds r0, #0xb0
	cmp r1, r0
	bne _08067396
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _08067444
	bl SpellFx_Finish
	bl sub_8055E80
	adds r0, r4, #0
	bl sub_8002DE4
	b _08067444
_08067396:
	adds r0, r5, #0
	adds r0, #0xb1
	cmp r1, r0
	bne _080673CC
	ldr r0, [r4, #0x5c]
	movs r1, #0x50
	movs r2, #9
	bl sub_805CA20
	adds r0, r6, #0
	movs r1, #0x1e
	bl sub_8066234
	adds r0, r6, #0
	bl sub_8066318
	ldr r0, _080673C8 @ =0x000002FE
_080673B8:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x78
	movs r3, #0
	bl sub_8074E80
	b _08067444
	.align 2, 0
_080673C8: .4byte 0x000002FE
_080673CC:
	adds r0, r5, #0
	adds r0, #0xcd
	cmp r1, r0
	bne _080673DE
	ldr r0, [r4, #0x5c]
	movs r1, #0xa
	bl sub_8054BF8
	b _08067444
_080673DE:
	adds r0, r5, #0
	adds r0, #0xd7
	cmp r1, r0
	bne _08067410
	ldr r0, [r4, #0x5c]
	movs r1, #0x46
	movs r2, #1
	bl NewEfxRestWINH_
	ldr r0, [r4, #0x5c]
	movs r1, #0x32
	bl sub_805C28C
	ldr r0, [r4, #0x5c]
	bl sub_8067708
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x10
	movs r2, #0xa
	movs r3, #0x10
	bl sub_805C7CC
	b _08067444
_08067410:
	adds r0, r5, #0
	adds r0, #0xe1
	cmp r1, r0
	bne _08067420
	adds r0, r6, #0
	bl sub_8067914
	b _08067444
_08067420:
	adds r0, r5, #0
	adds r0, #0xf0
	cmp r1, r0
	bne _0806742E
	bl sub_8055E80
	b _08067444
_0806742E:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	ldr r2, _0806744C @ =0x0000010B
	adds r0, r5, r2
	cmp r1, r0
	bne _08067444
	bl SpellFx_Finish
	adds r0, r4, #0
	bl sub_8002DE4
_08067444:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0806744C: .4byte 0x0000010B

