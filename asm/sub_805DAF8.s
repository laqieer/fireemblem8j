	.syntax unified
	.set CheckRoundCrit, 0x0805B00C + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_805DBB8, 0x0805DBB8 + 1
	.set sub_806EA40, 0x0806EA40 + 1
	.set sub_806EBA0, 0x0806EBA0 + 1
	.set sub_80748E4, 0x080748E4 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805DAF8, "ax", %progbits
@ sub_805DAF8 @ JP 0x0805DAF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805DAF8
	.thumb_func
sub_805DAF8:
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
	cmp r0, #2
	bne _0805DB1E
	ldr r0, [r5, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _0805DBB0
_0805DB1E:
	movs r1, #0x2c
	ldrsh r0, [r5, r1]
	cmp r0, #0x22
	bne _0805DB40
	ldr r0, _0805DB3C @ =0x00000137
	movs r1, #0x80
	lsls r1, r1, #1
	ldr r2, [r5, #0x5c]
	movs r3, #2
	ldrsh r2, [r2, r3]
	movs r3, #1
	bl sub_8074E80
	b _0805DBB0
	.align 2, 0
_0805DB3C: .4byte 0x00000137
_0805DB40:
	cmp r0, #0x2a
	bne _0805DB4C
	adds r0, r6, #0
	bl sub_805DBB8
	b _0805DBB0
_0805DB4C:
	cmp r0, #0x2d
	bne _0805DB9E
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
	beq _0805DB90
	ldr r0, [r5, #0x5c]
	bl CheckRoundCrit
	cmp r0, #1
	bne _0805DB84
	adds r0, r6, #0
	bl sub_806EA40
	b _0805DB90
_0805DB84:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805DBB0
	ldr r0, [r5, #0x5c]
	bl sub_806EBA0
_0805DB90:
	ldrb r0, [r4]
	cmp r0, #0
	bne _0805DBB0
	adds r0, r6, #0
	bl sub_8074934
	b _0805DBB0
_0805DB9E:
	cmp r0, #0x3e
	beq _0805DBB0
	cmp r0, #0x40
	bne _0805DBB0
	bl SpellFx_Finish
	adds r0, r5, #0
	bl sub_8002DE4
_0805DBB0:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

