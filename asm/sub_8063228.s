	.syntax unified
	.set EfxGetCamMovDuration, 0x08056920 + 1
	.set GetAnimAnotherSide, 0x0805B058 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetUnit, 0x08019108 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set RegisterEfxSpellCastEnd, 0x08055CD0 + 1
	.set SetUnitEfxDebuff, 0x0805587C + 1
	.set SpellFx_Finish, 0x08056114 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_80540C0, 0x080540C0 + 1
	.set sub_80554C4, 0x080554C4 + 1
	.set sub_80564B4, 0x080564B4 + 1
	.set sub_805C7CC, 0x0805C7CC + 1
	.set sub_80633A0, 0x080633A0 + 1
	.set sub_8063458, 0x08063458 + 1
	.set sub_8074E80, 0x08074E80 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_8063228, "ax", %progbits
@ sub_8063228 @ JP 0x08063228 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8063228
	.thumb_func
sub_8063228:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetAnimAnotherSide
	adds r6, r0, #0
	bl EfxGetCamMovDuration
	adds r5, r0, #0
	ldrh r0, [r4, #0x2c]
	adds r0, #1
	movs r1, #0
	mov r8, r1
	movs r7, #0
	strh r0, [r4, #0x2c]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #1
	bne _0806325E
	ldr r0, [r4, #0x5c]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80540C0
_0806325E:
	movs r2, #0x2c
	ldrsh r1, [r4, r2]
	adds r0, r5, #1
	cmp r1, r0
	bne _080632D4
	adds r0, r6, #0
	bl sub_80633A0
	movs r5, #8
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x28
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_805C7CC
	movs r4, #0x10
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x47
	movs r2, #0x1e
	movs r3, #8
	bl sub_805C7CC
	str r5, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x66
	movs r2, #0x1e
	movs r3, #0x10
	bl sub_805C7CC
	str r4, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0x85
	movs r2, #0x1e
	movs r3, #8
	bl sub_805C7CC
	str r7, [sp]
	str r7, [sp, #4]
	adds r0, r6, #0
	movs r1, #0xa4
	movs r2, #0x3c
	movs r3, #0x10
	bl sub_805C7CC
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #2
	ldrsh r2, [r6, r0]
	movs r0, #0xfd
	movs r3, #1
	bl sub_8074E80
	b _08063394
_080632D4:
	adds r0, r5, #0
	adds r0, #0x50
	cmp r1, r0
	bne _080632E4
	adds r0, r6, #0
	bl sub_8063458
	b _08063394
_080632E4:
	adds r0, r5, #0
	adds r0, #0xa4
	cmp r1, r0
	bne _080632FA
	adds r0, r6, #0
	movs r1, #1
	movs r2, #5
	movs r3, #0
	bl sub_80554C4
	b _08063394
_080632FA:
	adds r0, r5, #0
	adds r0, #0xc8
	cmp r1, r0
	bne _08063374
	ldrh r0, [r6, #0x10]
	movs r1, #9
	orrs r0, r1
	strh r0, [r6, #0x10]
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r1, [r0]
	adds r0, r6, #0
	bl sub_80564B4
	adds r0, r6, #0
	bl GetAnimPosition
	cmp r0, #0
	bne _08063328
	ldr r0, _08063324 @ =0x0203E184
	b _0806332A
	.align 2, 0
_08063324: .4byte 0x0203E184
_08063328:
	ldr r0, _0806336C @ =0x0203E188
_0806332A:
	ldr r4, [r0]
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xb
	bne _08063360
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitEfxDebuff
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, [r4, #0xc]
	ldr r1, _08063370 @ =0xFFFFFBBD
	ands r0, r1
	str r0, [r4, #0xc]
	bl RefreshEntityBmMaps
	bl sub_8027144
	bl sub_807B4B8
_08063360:
	adds r0, r6, #0
	movs r1, #0
	bl SetUnitEfxDebuff
	b _08063394
	.align 2, 0
_0806336C: .4byte 0x0203E188
_08063370: .4byte 0xFFFFFBBD
_08063374:
	movs r2, #0x96
	lsls r2, r2, #1
	adds r0, r5, r2
	cmp r1, r0
	bne _08063394
	ldrh r0, [r6, #0x10]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6, #0x10]
	bl SpellFx_Finish
	bl RegisterEfxSpellCastEnd
	adds r0, r4, #0
	bl sub_8002DE4
_08063394:
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

