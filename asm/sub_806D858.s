	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_8067914, 0x08067914 + 1
	.set sub_806D9A4, 0x0806D9A4 + 1
	.set sub_806DACC, 0x0806DACC + 1
	.set sub_806DBC0, 0x0806DBC0 + 1
	.set sub_806DF00, 0x0806DF00 + 1
	.set sub_806E210, 0x0806E210 + 1
	.set sub_806E3DC, 0x0806E3DC + 1
	.set sub_806E788, 0x0806E788 + 1
	.set sub_8074934, 0x08074934 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_806D858, "ax", %progbits
@ sub_806D858 @ JP 0x0806D858 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806D858
	.thumb_func
sub_806D858:
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
	bne _0806D884
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _0806D96A
_0806D884:
	movs r0, #0x2c
	ldrsh r1, [r4, r0]
	adds r0, r2, #0
	adds r0, #0xb
	cmp r1, r0
	bne _0806D8AC
	adds r0, r5, #0
	bl sub_806D9A4
	ldr r0, _0806D8A8 @ =0x000003B6
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0xc0
	movs r3, #1
	bl sub_8074E80
	b _0806D96A
	.align 2, 0
_0806D8A8: .4byte 0x000003B6
_0806D8AC:
	adds r0, r2, #0
	adds r0, #0x25
	cmp r1, r0
	bne _0806D8BC
	adds r0, r5, #0
	bl sub_806DACC
	b _0806D96A
_0806D8BC:
	adds r0, r2, #0
	adds r0, #0x54
	cmp r1, r0
	bne _0806D8CA
	bl sub_806DF00
	b _0806D96A
_0806D8CA:
	adds r0, r2, #0
	adds r0, #0x60
	cmp r1, r0
	bne _0806D8DA
	adds r0, r5, #0
	bl sub_8067914
	b _0806D96A
_0806D8DA:
	adds r0, r2, #0
	adds r0, #0x6f
	cmp r1, r0
	bne _0806D8F4
	ldr r0, [r4, #0x5c]
	movs r1, #0xc
	movs r2, #4
	bl sub_805CA20
	adds r0, r5, #0
	bl sub_806DBC0
	b _0806D96A
_0806D8F4:
	adds r0, r2, #0
	adds r0, #0x70
	cmp r1, r0
	bne _0806D904
	adds r0, r5, #0
	bl sub_806E210
	b _0806D96A
_0806D904:
	adds r0, r2, #0
	adds r0, #0x7a
	cmp r1, r0
	bne _0806D912
	bl sub_806E788
	b _0806D96A
_0806D912:
	adds r0, r2, #0
	adds r0, #0x7b
	cmp r1, r0
	bne _0806D92C
	adds r0, r5, #0
	bl sub_806E3DC
	ldr r0, [r4, #0x5c]
	movs r1, #0x1a
	movs r2, #2
	bl sub_805CA20
	b _0806D96A
_0806D92C:
	adds r0, r2, #0
	adds r0, #0x95
	cmp r1, r0
	bne _0806D954
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
	bne _0806D96A
	adds r0, r5, #0
	bl sub_8074934
	b _0806D96A
_0806D954:
	adds r0, r2, #0
	adds r0, #0xa9
	cmp r1, r0
	bne _0806D96A
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_0806D96A:
	pop {r4, r5}
	pop {r0}
	bx r0

