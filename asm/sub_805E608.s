	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set StartSubSpell_efxDarkbreathOBJ, 0x0805E7CC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_805E69C, 0x0805E69C + 1
	.set sub_805E744, 0x0805E744 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805E608, "ax", %progbits
@ sub_805E608 @ JP 0x0805E608 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E608
	.thumb_func
sub_805E608:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E658
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_805CA20
	ldr r0, [r4, #0x5c]
	bl sub_805E69C
	ldr r0, [r4, #0x5c]
	bl sub_805E744
	ldr r0, [r4, #0x5c]
	bl StartSubSpell_efxDarkbreathOBJ
	ldr r0, _0805E680 @ =0x0000011F
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
_0805E658:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #4
	bne _0805E684
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
	bne _0805E696
	adds r0, r5, #0
	bl sub_8074934
	b _0805E696
	.align 2, 0
_0805E680: .4byte 0x0000011F
_0805E684:
	cmp r0, #0x20
	beq _0805E696
	cmp r0, #0x30
	bne _0805E696
	bl SpellFx_Finish
	adds r0, r4, #0
	bl sub_8002DE4
_0805E696:
	pop {r4, r5}
	pop {r0}
	bx r0

