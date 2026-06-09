	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set NewEfxRestWINH_, 0x0805C6EC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set StartBattleAnimHitEffectsDefault, 0x08056220 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_8054BF8, 0x08054BF8 + 1
	.set sub_8054D18, 0x08054D18 + 1
	.set sub_8054E1C, 0x08054E1C + 1
	.set sub_805C28C, 0x0805C28C + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_805CA20, 0x0805CA20 + 1
	.set sub_806A0F4, 0x0806A0F4 + 1
	.set sub_806A1C8, 0x0806A1C8 + 1
	.set sub_806A294, 0x0806A294 + 1
	.set sub_806A358, 0x0806A358 + 1
	.set sub_806A564, 0x0806A564 + 1
	.set sub_806A63C, 0x0806A63C + 1
	.set sub_806A93C, 0x0806A93C + 1
	.set sub_8074E80, 0x08074E80 + 1
	.section .text.sub_8069EE8, "ax", %progbits
@ sub_8069EE8 @ JP 0x08069EE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8069EE8
	.thumb_func
sub_8069EE8:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x5c]
	bl GetAnimAnotherSide
	adds r4, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r7, #0x2c]
	adds r0, #1
	movs r6, #0
	strh r0, [r7, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _08069F18
	ldr r0, [r7, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
	b _0806A0EC
_08069F18:
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	adds r0, r5, #0
	adds r0, #0x1a
	cmp r1, r0
	bne _08069F60
	adds r0, r4, #0
	movs r1, #0x3e
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x3e
	bl sub_805C28C
	adds r0, r4, #0
	bl sub_806A0F4
	movs r0, #0x10
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0
	bl sub_805C7CC
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl sub_806A564
	ldr r0, _08069F5C @ =0x000003AF
	b _0806A0A4
	.align 2, 0
_08069F5C: .4byte 0x000003AF
_08069F60:
	adds r0, r5, #0
	adds r0, #0x32
	cmp r1, r0
	beq _08069F92
	adds r0, r5, #0
	adds r0, #0x37
	cmp r1, r0
	beq _08069FAE
	adds r0, r5, #0
	adds r0, #0x38
	cmp r1, r0
	bne _08069F8A
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_805C7CC
	b _0806A0EC
_08069F8A:
	adds r0, r5, #0
	adds r0, #0x42
	cmp r1, r0
	bne _08069F9C
_08069F92:
	adds r0, r4, #0
	movs r1, #2
	bl sub_8054BF8
	b _0806A0EC
_08069F9C:
	adds r0, r5, #0
	adds r0, #0x46
	cmp r1, r0
	bne _08069FBA
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_806A93C
_08069FAE:
	adds r0, r4, #0
	movs r1, #4
	movs r2, #1
	bl sub_806A564
	b _0806A0EC
_08069FBA:
	adds r0, r5, #0
	adds r0, #0x6e
	cmp r1, r0
	bne _08069FDC
	adds r0, r4, #0
	movs r1, #0x68
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x68
	bl sub_805C28C
	adds r0, r4, #0
	bl sub_806A1C8
	b _0806A0EC
_08069FDC:
	adds r0, r5, #0
	adds r0, #0xa6
	cmp r1, r0
	bne _08069FF0
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x1e
	bl sub_8054D18
	b _0806A0EC
_08069FF0:
	adds r0, r5, #0
	adds r0, #0xc4
	cmp r1, r0
	bne _0806A024
	ldr r2, _0806A020 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	adds r0, r4, #0
	movs r1, #0x1e
	movs r2, #0
	bl sub_8054E1C
	b _0806A0EC
	.align 2, 0
_0806A020: .4byte 0x03003020
_0806A024:
	adds r0, r5, #0
	adds r0, #0xe2
	cmp r1, r0
	bne _0806A050
	adds r0, r4, #0
	movs r1, #0x4c
	movs r2, #0xa
	bl sub_805CA20
	adds r0, r4, #0
	bl sub_806A294
	adds r0, r4, #0
	movs r1, #0
	movs r2, #0x14
	bl sub_8054E1C
	adds r0, r4, #0
	movs r1, #0x4c
	bl sub_806A63C
	b _0806A0EC
_0806A050:
	movs r0, #0x2c
	ldrsh r1, [r7, r0]
	movs r2, #0x97
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _0806A0BE
	ldrh r0, [r4, #0x10]
	movs r1, #9
	orrs r1, r0
	strh r1, [r4, #0x10]
	adds r6, r7, #0
	adds r6, #0x29
	ldrb r1, [r6]
	adds r0, r4, #0
	bl StartBattleAnimHitEffectsDefault
	ldrb r6, [r6]
	cmp r6, #0
	bne _0806A0B4
	adds r0, r4, #0
	movs r1, #0x42
	movs r2, #1
	bl NewEfxRestWINH_
	adds r0, r4, #0
	movs r1, #0x42
	bl sub_805C28C
	adds r0, r4, #0
	bl sub_806A358
	str r6, [sp]
	str r6, [sp, #4]
	adds r0, r4, #0
	movs r1, #0xe
	movs r2, #0x20
	movs r3, #0x10
	bl sub_805C7CC
	movs r0, #0xec
	lsls r0, r0, #2
_0806A0A4:
	movs r1, #0x80
	lsls r1, r1, #1
	movs r3, #2
	ldrsh r2, [r4, r3]
	movs r3, #1
	bl sub_8074E80
	b _0806A0EC
_0806A0B4:
	movs r1, #0x9d
	lsls r1, r1, #1
	adds r0, r5, r1
	strh r0, [r7, #0x2c]
	b _0806A0EC
_0806A0BE:
	movs r2, #0x9d
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _0806A0D4
	adds r0, r4, #0
	movs r1, #5
	movs r2, #0
	bl sub_806A564
	b _0806A0EC
_0806A0D4:
	movs r3, #0xc0
	lsls r3, r3, #1
	adds r0, r5, r3
	cmp r1, r0
	bne _0806A0EC
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r7, #0
	bl sub_8002DE4
_0806A0EC:
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

