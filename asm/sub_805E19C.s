	.syntax unified
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_805E24C, 0x0805E24C + 1
	.set sub_805E360, 0x0805E360 + 1
	.set sub_805E3EC, 0x0805E3EC + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_805E19C, "ax", %progbits
@ sub_805E19C @ JP 0x0805E19C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805E19C
	.thumb_func
sub_805E19C:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0805E1C4
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0805E1C4:
	movs r1, #0x2c
	ldrsh r0, [r4, r1]
	cmp r0, #1
	bne _0805E210
	ldr r0, [r4, #0x5c]
	movs r1, #0x5a
	movs r2, #0xa
	bl sub_805CA20
	adds r0, r5, #0
	bl sub_805E24C
	adds r0, r5, #0
	bl sub_805E360
	adds r0, r5, #0
	bl sub_805E3EC
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	movs r1, #0x28
	movs r2, #0xf
	movs r3, #0x10
	bl sub_805C7CC
	ldr r0, _0805E20C @ =0x0000011D
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r5, r3]
	movs r3, #1
	bl sub_8074E80
	b _0805E242
	.align 2, 0
_0805E20C: .4byte 0x0000011D
_0805E210:
	cmp r0, #0xf
	bne _0805E234
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
	bne _0805E242
	adds r0, r5, #0
	bl sub_8074934
	b _0805E242
_0805E234:
	cmp r0, #0x82
	bne _0805E242
	bl SpellFx_Finish
	adds r0, r4, #0
	bl sub_8002DE4
_0805E242:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

