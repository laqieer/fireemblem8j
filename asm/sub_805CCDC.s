	.syntax unified
	.set CheckRoundCrit, 0x0805B00C + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set NewEfxTeonoOBJ, 0x0805CD78 + 1
	.set sub_806EA40, 0x0806EA40 + 1
	.set sub_806EBA0, 0x0806EBA0 + 1
	.set sub_80748E4, 0x080748E4 + 1
	.set sub_8074934, 0x08074934 + 1
	.section .text.EfxTeonoMain, "ax", %progbits
@ EfxTeonoMain @ JP 0x0805CCDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EfxTeonoMain
	.thumb_func
EfxTeonoMain:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	ldrh r0, [r5, #0x2c]
	adds r0, #1
	strh r0, [r5, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805CD5C
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	ldr r0, [r5, #0x5c]
	bl NewEfxTeonoOBJ
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #1
	bne _0805CD5C
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r4, r5, #0
	adds r4, #0x29
	ldrb r1, [r4]
	adds r0, r6, #0
	bl StartBattleAnimHitEffectsDefault
	adds r0, r6, #0
	bl sub_80748E4
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #2
	beq _0805CD4E
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805CD42
	adds r0, r6, #0
	bl sub_806EA40
	b _0805CD4E
_0805CD42:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805CD72
	ldr r0, [r5, #0x5c]
	bl sub_806EBA0
_0805CD4E:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805CD72
	adds r0, r6, #0
	bl sub_8074934
	b _0805CD72
_0805CD5C:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x46
	beq _0805CD72
	cmp r0, #0x50
	bne _0805CD72
	bl SpellFx_Finish
	adds r0, r5, #0
	bl sub_8002DE4
_0805CD72:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

