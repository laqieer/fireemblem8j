	.syntax unified
	.set GetEfxHp, 0x08059890 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_8073BA4, 0x08073BA4 + 1
	.section .text.sub_8059034, "ax", %progbits
@ ParseBattleHitToBanimCmd @ JP 0x08059034 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ParseBattleHitToBanimCmd
	.thumb_func
ParseBattleHitToBanimCmd:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
	ldr r7, _0805908C @ =0x0203A5E8
	movs r2, #0
	ldr r4, _08059090 @ =0x0203E126
	ldr r5, _08059094 @ =0x0203E190
	ldr r6, _08059098 @ =0x0203E11C
	ldr r0, _0805909C @ =0x0000FFFF
	adds r3, r0, #0
	adds r1, r4, #0
_08059050:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08059050
	movs r2, #0
	ldr r0, _080590A0 @ =0x0203E152
	ldr r1, _0805909C @ =0x0000FFFF
	adds r3, r1, #0
	adds r1, r0, #4
_08059068:
	ldrh r0, [r1]
	orrs r0, r3
	strh r0, [r1]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x13
	bls _08059068
	movs r2, #0
	str r2, [r5, #4]
	str r2, [r5]
	movs r3, #0
	ldrsh r0, [r6, r3]
	cmp r0, #4
	bne _080590A4
	strh r0, [r4]
	strh r0, [r4, #2]
	b _08059664
	.align 2, 0
_0805908C: .4byte 0x0203A5E8
_08059090: .4byte 0x0203E126
_08059094: .4byte 0x0203E190
_08059098: .4byte 0x0203E11C
_0805909C: .4byte 0x0000FFFF
_080590A0: .4byte 0x0203E152
_080590A4:
	ldr r0, _080590B8 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080590BC
	movs r0, #6
	strh r0, [r4]
	strh r2, [r4, #2]
	b _08059664
	.align 2, 0
_080590B8: .4byte 0x0203A4D0
_080590BC:
	movs r1, #0
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	str r0, [sp, #0x14]
	ldr r0, _08059194 @ =0x0203E184
	ldr r0, [r0]
	str r0, [sp, #4]
	ldr r0, _08059198 @ =0x0203E188
	ldr r0, [r0]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x11
	bne _080590E8
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _080590E8
	movs r3, #1
	str r3, [sp, #0x14]
_080590E8:
	ldr r4, [sp, #8]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	adds r5, r4, #0
	cmp r0, #0x11
	bne _08059102
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _08059102
	movs r1, #1
	str r1, [sp, #0x18]
_08059102:
	ldr r4, [sp, #4]
	adds r4, #0x4a
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x28
	bne _0805911A
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _0805911A
	movs r3, #1
	str r3, [sp, #0x14]
_0805911A:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x28
	bne _0805912E
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0805912E
	movs r1, #1
	str r1, [sp, #0x18]
_0805912E:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x29
	bne _08059142
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _08059142
	movs r3, #1
	str r3, [sp, #0x14]
_08059142:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x29
	bne _08059156
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _08059156
	movs r1, #1
	str r1, [sp, #0x18]
_08059156:
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x2c
	bne _0805916A
	ldr r2, [sp, #0x14]
	cmp r2, #0
	bne _0805916A
	movs r3, #1
	str r3, [sp, #0x14]
_0805916A:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x2c
	bne _0805917E
	ldr r0, [sp, #0x18]
	cmp r0, #0
	bne _0805917E
	movs r1, #1
	str r1, [sp, #0x18]
_0805917E:
	ldr r3, _0805919C @ =0x0203E152
	ldr r1, _080591A0 @ =0x0203E1A8
	ldrh r0, [r1]
	strh r0, [r3]
	ldrh r0, [r1, #2]
	strh r0, [r3, #2]
	movs r2, #0
	str r2, [sp, #0xc]
	mov sl, r2
	mov sb, r2
	b _08059654
	.align 2, 0
_08059194: .4byte 0x0203E184
_08059198: .4byte 0x0203E188
_0805919C: .4byte 0x0203E152
_080591A0: .4byte 0x0203E1A8
_080591A4:
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #8
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	str r0, [sp, #0x10]
	ldr r0, _080591E0 @ =0x0203E104
	movs r3, #0
	ldrsh r0, [r0, r3]
	ldr r1, [sp, #0x10]
	cmp r0, r1
	bne _080591E8
	mov r4, sp
	movs r2, #2
	add r2, sp
	mov r8, r2
	ldr r5, [sp, #0x14]
	ldr r3, [sp, #0x18]
	str r3, [sp, #0x1c]
	ldr r6, [sp, #4]
	movs r3, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _08059204
	ldr r0, _080591E4 @ =0x0203E0FC
	ldrh r1, [r4, #0xc]
	strh r1, [r0]
	b _08059204
	.align 2, 0
_080591E0: .4byte 0x0203E104
_080591E4: .4byte 0x0203E0FC
_080591E8:
	mov r4, sp
	adds r4, #2
	mov r8, sp
	ldr r5, [sp, #0x18]
	ldr r2, [sp, #0x14]
	str r2, [sp, #0x1c]
	ldr r6, [sp, #8]
	movs r3, #0
	ldr r0, [sp, #0xc]
	cmp r0, #0
	bne _08059204
	ldr r1, _08059240 @ =0x0203E0FC
	movs r0, #1
	strh r0, [r1]
_08059204:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #3
	ands r0, r1
	cmp r0, #0
	beq _08059220
	ldr r2, _08059244 @ =0x0203E190
	ldr r1, _08059248 @ =0x0203A4D0
	ldr r0, [r1, #0x10]
	str r0, [r2]
	ldr r0, [r1, #0x14]
	str r0, [r2, #4]
_08059220:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _08059258
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059250
	ldr r0, _0805924C @ =0x080DFEB0
	b _080592CE
	.align 2, 0
_08059240: .4byte 0x0203E0FC
_08059244: .4byte 0x0203E190
_08059248: .4byte 0x0203A4D0
_0805924C: .4byte 0x080DFEB0
_08059250:
	ldr r0, _08059254 @ =0x080DFED8
	b _080592CE
	.align 2, 0
_08059254: .4byte 0x080DFED8
_08059258:
	movs r0, #0x80
	lsls r0, r0, #4
	ands r1, r0
	cmp r1, #0
	beq _08059280
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059278
	ldr r0, _08059274 @ =0x080DFEB0
	b _080592CE
	.align 2, 0
_08059274: .4byte 0x080DFEB0
_08059278:
	ldr r0, _0805927C @ =0x080DFED8
	b _080592CE
	.align 2, 0
_0805927C: .4byte 0x080DFED8
_08059280:
	cmp r3, #0
	bne _080592A0
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08059298
	ldr r0, _08059294 @ =0x080DFE9C
	b _080592CE
	.align 2, 0
_08059294: .4byte 0x080DFE9C
_08059298:
	ldr r0, _0805929C @ =0x080DFECE
	b _080592CE
	.align 2, 0
_0805929C: .4byte 0x080DFECE
_080592A0:
	movs r0, #2
	bl sub_8073BA4
	cmp r0, #1
	beq _080592C4
	cmp r0, #1
	bgt _080592B4
	cmp r0, #0
	beq _080592BA
	b _080592D6
_080592B4:
	cmp r0, #2
	beq _080592CC
	b _080592D6
_080592BA:
	ldr r0, _080592C0 @ =0x080DFEE2
	b _080592CE
	.align 2, 0
_080592C0: .4byte 0x080DFEE2
_080592C4:
	ldr r0, _080592C8 @ =0x080DFEEC
	b _080592CE
	.align 2, 0
_080592C8: .4byte 0x080DFEEC
_080592CC:
	ldr r0, _080592F4 @ =0x080DFEF6
_080592CE:
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r4]
_080592D6:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _08059314
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080592FC
	ldr r0, _080592F8 @ =0x080DFEA6
	b _080592FE
	.align 2, 0
_080592F4: .4byte 0x080DFEF6
_080592F8: .4byte 0x080DFEA6
_080592FC:
	ldr r0, _0805930C @ =0x080DFECE
_080592FE:
	lsls r1, r5, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	strh r0, [r4]
	ldr r0, _08059310 @ =0x080DFEBA
	b _08059316
	.align 2, 0
_0805930C: .4byte 0x080DFECE
_08059310: .4byte 0x080DFEBA
_08059314:
	ldr r0, _08059394 @ =0x080DFEC4
_08059316:
	ldr r2, [sp, #0x1c]
	lsls r1, r2, #1
	adds r1, r1, r0
	ldrh r0, [r1]
	mov r3, r8
	strh r0, [r3]
	ldr r1, _08059398 @ =0x0203E126
	ldr r2, [sp, #0xc]
	lsls r0, r2, #2
	adds r5, r0, r1
	mov r0, sp
	ldrh r0, [r0]
	movs r6, #0
	strh r0, [r5]
	lsls r0, r2, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r4, r0, r1
	mov r3, sp
	ldrh r0, [r3, #2]
	strh r0, [r4]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r1, r0, #0xd
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08059350
	b _0805964C
_08059350:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080593E8
	ldr r0, _0805939C @ =0x0203E104
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _080593A8
	mov r3, sb
	lsls r0, r3, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _0805937C
	movs r1, #0
_0805937C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r0, #2
	ldr r2, _080593A0 @ =0x0203E152
	adds r0, r0, r2
	strh r1, [r0]
	ldrh r0, [r5]
	ldr r3, _080593A4 @ =0xFFFF8000
	b _0805958C
	.align 2, 0
_08059394: .4byte 0x080DFEC4
_08059398: .4byte 0x0203E126
_0805939C: .4byte 0x0203E104
_080593A0: .4byte 0x0203E152
_080593A4: .4byte 0xFFFF8000
_080593A8:
	mov r1, sl
	lsls r0, r1, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _080593C2
	movs r1, #0
_080593C2:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r2, _080593E0 @ =0x0203E152
	adds r0, r0, r2
	strh r1, [r0]
	ldrh r0, [r4]
	ldr r3, _080593E4 @ =0xFFFF8000
	b _08059646
	.align 2, 0
_080593E0: .4byte 0x0203E152
_080593E4: .4byte 0xFFFF8000
_080593E8:
	movs r0, #0x80
	lsls r0, r0, #1
	ands r1, r0
	cmp r1, #0
	beq _080594D0
	ldr r0, _0805945C @ =0x0203E104
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _08059468
	mov r3, sl
	lsls r0, r3, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _08059418
	movs r1, #0
_08059418:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r4, _08059460 @ =0x0203E152
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	adds r0, r0, r4
	strh r1, [r0]
	mov r1, sb
	lsls r0, r1, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r2, _08059464 @ =0x0203E1AC
	movs r3, #0
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _0805944C
	adds r1, r0, #0
_0805944C:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r0, #2
	b _080594C2
	.align 2, 0
_0805945C: .4byte 0x0203E104
_08059460: .4byte 0x0203E152
_08059464: .4byte 0x0203E1AC
_08059468:
	mov r1, sb
	lsls r0, r1, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _08059480
	movs r1, #0
_08059480:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	ldr r4, _080594C8 @ =0x0203E152
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r1, [r0]
	mov r2, sl
	lsls r0, r2, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	ldr r2, _080594CC @ =0x0203E1AC
	movs r3, #2
	ldrsh r0, [r2, r3]
	cmp r1, r0
	ble _080594B2
	adds r1, r0, #0
_080594B2:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
_080594C2:
	adds r0, r0, r4
	strh r1, [r0]
	b _0805964C
	.align 2, 0
_080594C8: .4byte 0x0203E152
_080594CC: .4byte 0x0203E1AC
_080594D0:
	ldr r0, _08059594 @ =0x0203E104
	movs r1, #0
	ldrsh r0, [r0, r1]
	ldr r2, [sp, #0x10]
	cmp r0, r2
	bne _0805959C
	mov r3, sl
	lsls r0, r3, #1
	adds r0, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _080594F6
	movs r1, #0
_080594F6:
	mov r0, sl
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #1
	ldr r2, _08059598 @ =0x0203E152
	adds r0, r0, r2
	strh r1, [r0]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08059526
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
_08059526:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq _08059542
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
_08059542:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _0805955A
	ldrh r1, [r5]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
_0805955A:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _08059576
	ldrh r0, [r5]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r5]
_08059576:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805964C
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #3
_0805958C:
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
	b _0805964C
	.align 2, 0
_08059594: .4byte 0x0203E104
_08059598: .4byte 0x0203E152
_0805959C:
	mov r1, sb
	lsls r0, r1, #1
	bl GetEfxHp
	movs r1, #3
	ldrsb r1, [r7, r1]
	subs r0, r0, r1
	lsls r0, r0, #0x10
	asrs r1, r0, #0x10
	cmp r1, #0
	bge _080595B4
	movs r1, #0
_080595B4:
	mov r0, sb
	adds r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sb, r0
	lsls r0, r0, #2
	ldr r2, _08059674 @ =0x0203E152
	adds r0, r0, r2
	strh r1, [r0]
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080595E0
	ldrh r0, [r5]
	movs r3, #0x80
	lsls r3, r3, #6
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r5]
_080595E0:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r2, #0x80
	lsls r2, r2, #4
	ands r0, r2
	cmp r0, #0
	beq _080595FC
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #5
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
_080595FC:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _08059614
	ldrh r1, [r4]
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
_08059614:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _08059630
	ldrh r0, [r4]
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r2, #0
	orrs r0, r1
	strh r0, [r4]
_08059630:
	ldr r0, [r7]
	lsls r0, r0, #0xd
	lsrs r0, r0, #0xd
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _0805964C
	ldrh r0, [r4]
	movs r3, #0x80
	lsls r3, r3, #3
_08059646:
	adds r1, r3, #0
	orrs r0, r1
	strh r0, [r4]
_0805964C:
	adds r7, #4
	ldr r0, [sp, #0xc]
	adds r0, #1
	str r0, [sp, #0xc]
_08059654:
	ldr r2, [r7]
	lsls r0, r2, #8
	lsrs r0, r0, #0x1b
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08059664
	b _080591A4
_08059664:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08059674: .4byte 0x0203E152

