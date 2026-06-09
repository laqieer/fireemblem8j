	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_806C38C, 0x0806C38C + 1
	.set sub_806C6F0, 0x0806C6F0 + 1
	.set sub_806C718, 0x0806C718 + 1
	.set sub_806C7F0, 0x0806C7F0 + 1
	.set sub_806CEF0, 0x0806CEF0 + 1
	.set sub_806E92C, 0x0806E92C + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_806C224, "ax", %progbits
@ sub_806C224 @ JP 0x0806C224 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806C224
	.thumb_func
sub_806C224:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r5, r0, #0
	bl EfxGetCamMovDuration
	adds r2, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806C250
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _0806C322
_0806C250:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0806C278
	adds r0, r5, #0
	bl sub_806CEF0
	ldr r0, _0806C274 @ =0x000003C7
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	movs r3, #1
	bl sub_8074E80
	b _0806C322
	.align 2, 0
_0806C274: .4byte 0x000003C7
_0806C278:
	adds r0, r2, #0
	adds r0, #0x91
	cmp r1, r0
	bne _0806C288
	adds r0, r5, #0
	bl sub_806C7F0
	b _0806C322
_0806C288:
	adds r0, r2, #0
	adds r0, #0xd1
	cmp r1, r0
	bne _0806C29A
	adds r0, r5, #0
	movs r1, #0xa
	bl sub_8054BF8
	b _0806C322
_0806C29A:
	adds r0, r2, #0
	adds r0, #0xd9
	cmp r1, r0
	bne _0806C2BA
	adds r0, r5, #0
	bl sub_806C38C
	adds r0, r5, #0
	bl sub_806C6F0
	ldr r0, [r4, #0x5c]
	movs r1, #0x4a
	movs r2, #2
	bl sub_805CA20
	b _0806C322
_0806C2BA:
	ldr r3, _0806C2C8 @ =0x00000101
	adds r0, r2, r3
	cmp r1, r0
	bne _0806C2CC
	bl sub_806E92C
	b _0806C322
	.align 2, 0
_0806C2C8: .4byte 0x00000101
_0806C2CC:
	ldr r3, _0806C2DC @ =0x00000109
	adds r0, r2, r3
	cmp r1, r0
	bne _0806C2E0
	adds r0, r5, #0
	bl sub_806C718
	b _0806C322
	.align 2, 0
_0806C2DC: .4byte 0x00000109
_0806C2E0:
	ldr r3, _0806C308 @ =0x00000123
	adds r0, r2, r3
	cmp r1, r0
	bne _0806C30C
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
	bne _0806C322
	adds r0, r5, #0
	bl sub_8074934
	b _0806C322
	.align 2, 0
_0806C308: .4byte 0x00000123
_0806C30C:
	ldr r3, _0806C328 @ =0x00000137
	adds r0, r2, r3
	cmp r1, r0
	bne _0806C322
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_0806C322:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0806C328: .4byte 0x00000137

