	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CanUnitSupportNow, 0x080282A4 + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set DrawIcon, 0x08003608 + 1
	.set GetCharacterData, 0x0801913C + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set GetUnitAffinityIcon, 0x08028650 + 1
	.set GetUnitAid, 0x080186CC + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set GetUnitSupporterCharacter, 0x08028170 + 1
	.set GetUnitSupporterCount, 0x0802815C + 1
	.set GetWeaponLevelFromExp, 0x08016B04 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutText, 0x08003DA0 + 1
	.set UnitList_RegisterEquippedIcon, 0x08092604 + 1
	.set __umodsi3, 0x080D6848 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.set sub_8018EE4, 0x08018EE4 + 1
	.set sub_8018F24, 0x08018F24 + 1
	.set sub_8018F64, 0x08018F64 + 1
	.set sub_8018F84, 0x08018F84 + 1
	.set sub_8018FAC, 0x08018FAC + 1
	.set sub_80190C0, 0x080190C0 + 1
	.set sub_80190EC, 0x080190EC + 1
	.set sub_8028188, 0x08028188 + 1
	.set sub_80976D0, 0x080976D0 + 1
	.section .text.sub_80945E8, "ax", %progbits
@ UnitList_PutRow @ JP 0x080945E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitList_PutRow
	.thumb_func
UnitList_PutRow:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x58
	str r0, [sp, #0x24]
	mov sl, r2
	ldr r4, [sp, #0x78]
	lsls r1, r1, #0x18
	lsrs r7, r1, #0x18
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	str r3, [sp, #0x28]
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	adds r0, r7, #0
	movs r1, #7
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x2c]
	lsls r0, r7, #1
	str r0, [sp, #0x30]
	movs r0, #0x1f
	ldr r1, [sp, #0x30]
	ands r1, r0
	str r1, [sp, #0x30]
	ldr r1, _08094684 @ =0x0200D6E0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	rsbs r0, r0, #0
	lsrs r0, r0, #0x1f
	mov sb, r0
	cmp r4, #0
	beq _080946C2
	ldr r2, [sp, #0x2c]
	lsls r4, r2, #3
	ldr r0, _08094688 @ =0x0200E060
	adds r5, r4, r0
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D84
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	mov r8, r4
	cmp r0, #0
	bne _0809468C
	ldr r0, [sp, #0x24]
	adds r0, #0x39
	ldrb r0, [r0]
	cmp r0, #1
	bne _0809468C
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	bl sub_80976D0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809468C
	adds r0, r5, #0
	movs r1, #4
	bl sub_8003D90
	b _08094696
	.align 2, 0
_08094684: .4byte 0x0200D6E0
_08094688: .4byte 0x0200E060
_0809468C:
	ldr r0, _0809470C @ =0x0200E060
	add r0, r8
	mov r1, sb
	bl sub_8003D90
_08094696:
	ldr r4, _0809470C @ =0x0200E060
	add r4, r8
	ldr r1, _08094710 @ =0x0200D6E0
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r3, [sp, #0x30]
	lsls r1, r3, #6
	add r1, sl
	adds r1, #6
	adds r0, r4, #0
	bl PutText
_080946C2:
	ldr r4, [sp, #0x2c]
	lsls r5, r4, #1
	adds r0, r5, r4
	lsls r0, r0, #3
	mov r8, r0
	ldr r6, _08094714 @ =0x0200E098
	adds r0, r0, r6
	bl sub_8003CF8
	adds r0, r6, #0
	adds r0, #8
	add r0, r8
	bl sub_8003CF8
	ldr r0, [sp, #0x30]
	lsls r4, r0, #6
	mov r1, sl
	adds r1, r1, r4
	str r1, [sp, #0x34]
	adds r0, r1, #0
	adds r0, #0x10
	movs r1, #0x18
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	str r4, [sp, #0x54]
	str r5, [sp, #0x50]
	ldr r2, [sp, #0x28]
	cmp r2, #5
	bls _08094702
	b _08094D38
_08094702:
	lsls r0, r2, #2
	ldr r1, _08094718 @ =_0809471C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809470C: .4byte 0x0200E060
_08094710: .4byte 0x0200D6E0
_08094714: .4byte 0x0200E098
_08094718: .4byte _0809471C
_0809471C: @ jump table
	.4byte _08094734 @ case 0
	.4byte _08094898 @ case 1
	.4byte _0809495C @ case 2
	.4byte _08094A92 @ case 3
	.4byte _08094BA8 @ case 4
	.4byte _08094CD8 @ case 5
_08094734:
	ldr r0, _080947A8 @ =0x0200D6E0
	lsls r6, r7, #2
	adds r0, r0, r6
	mov r8, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r2, r0, #0
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r5, r3, r4
	lsls r5, r5, #3
	ldr r4, _080947AC @ =0x0200E098
	adds r0, r5, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r1, r7, #0
	adds r1, #0x10
	movs r3, #0
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #0
	bl sub_8004374
	adds r4, #8
	adds r5, r5, r4
	mov r4, sb
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8003D90
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	str r6, [sp, #0x4c]
	cmp r0, #0
	bne _080947B4
	ldr r0, _080947B0 @ =0x000004C7
	bl sub_8009FA8
	adds r1, r7, #0
	adds r1, #0x22
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8004374
	b _08094812
	.align 2, 0
_080947A8: .4byte 0x0200D6E0
_080947AC: .4byte 0x0200E098
_080947B0: .4byte 0x000004C7
_080947B4:
	mov r3, r8
	ldr r0, [r3]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_801729C
	adds r1, r7, #0
	adds r1, #0x22
	movs r6, #0
	str r6, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	adds r2, r4, #0
	movs r3, #0
	bl sub_8004374
	adds r4, r7, #0
	adds r4, #0x1e
	mov r1, r8
	ldr r0, [r1]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	mov r2, r8
	ldr r0, [r2]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl UnitList_RegisterEquippedIcon
_08094812:
	ldr r3, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r3, r4
	lsls r0, r0, #3
	ldr r1, _08094848 @ =0x0200E0A8
	adds r5, r0, r1
	adds r0, r5, #0
	bl sub_8003CF8
	ldr r0, _0809484C @ =0x0200D6E0
	ldr r6, [sp, #0x4c]
	adds r0, r6, r0
	ldr r0, [r0]
	ldr r0, [r0]
	ldr r4, [r0, #0xc]
	movs r0, #0xc0
	lsls r0, r0, #8
	ands r4, r0
	movs r0, #0x80
	lsls r0, r0, #7
	cmp r4, r0
	beq _0809485A
	cmp r4, r0
	bhi _08094850
	cmp r4, #0
	beq _0809487C
	b _08094EA6
	.align 2, 0
_08094848: .4byte 0x0200E0A8
_0809484C: .4byte 0x0200D6E0
_08094850:
	movs r0, #0x80
	lsls r0, r0, #8
	cmp r4, r0
	beq _0809485E
	b _08094EA6
_0809485A:
	movs r0, #0x38
	b _08094860
_0809485E:
	movs r0, #0x39
_08094860:
	bl sub_8009FA8
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	movs r2, #0
	str r2, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #4
	movs r3, #8
	bl sub_8004374
	b _08094EA6
_0809487C:
	movs r0, #0x37
	bl sub_8009FA8
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x30
	str r4, [sp]
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #1
	movs r3, #4
	bl sub_8004374
	b _08094EA6
_08094898:
	ldr r1, _08094954 @ =0x0200D6E0
	lsls r0, r7, #2
	adds r6, r0, r1
	ldr r0, [r6]
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r1, [sp, #0x50]
	ldr r2, [sp, #0x2c]
	adds r0, r1, r2
	lsls r0, r0, #3
	ldr r1, _08094958 @ =0x0200E098
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x10
	mov r8, sb
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	mov r2, r8
	movs r3, #4
	bl sub_8004374
	adds r3, r4, #0
	adds r3, #0x22
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _080948DE
	movs r1, #1
_080948DE:
	ldr r0, [r6]
	ldr r0, [r0]
	movs r2, #8
	ldrsb r2, [r0, r2]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r4, #0
	adds r3, #0x28
	movs r1, #2
	mov r2, sb
	cmp r2, #0
	beq _080948FA
	movs r1, #1
_080948FA:
	ldr r0, [r6]
	ldr r0, [r0]
	ldrb r2, [r0, #9]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r5, r4, #0
	adds r5, #0x2e
	movs r7, #2
	mov r3, sb
	cmp r3, #0
	beq _08094914
	movs r7, #1
_08094914:
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018E64
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r7, #0
	bl PutNumberOrBlank
	adds r0, r4, #0
	adds r0, #0x30
	mov r1, r8
	movs r2, #0x16
	bl PutSpecialChar
	adds r4, #0x34
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _0809493E
	movs r5, #1
_0809493E:
	ldr r0, [r6]
	ldr r0, [r0]
	bl sub_8018EA4
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	b _08094EA6
	.align 2, 0
_08094954: .4byte 0x0200D6E0
_08094958: .4byte 0x0200E098
_0809495C:
	ldr r5, [sp, #0x54]
	add r5, sl
	movs r1, #0x12
	adds r1, r1, r5
	mov r8, r1
	ldr r1, _08094A80 @ =0x0200D6E0
	lsls r0, r7, #2
	adds r4, r0, r1
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x14
	ldrsb r1, [r0, r1]
	movs r0, #0x14
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _08094982
	movs r6, #4
_08094982:
	adds r0, r2, #0
	bl sub_8018EC4
	adds r2, r0, #0
	mov r0, r8
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x18
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x15
	ldrsb r1, [r0, r1]
	movs r0, #0x15
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _080949AC
	movs r6, #4
_080949AC:
	adds r0, r2, #0
	bl sub_8018EE4
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x1e
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _080949D6
	movs r6, #4
_080949D6:
	adds r0, r2, #0
	bl sub_8018F24
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x24
	ldr r0, [r4]
	ldr r1, [r0]
	movs r0, #0x19
	ldrsb r0, [r1, r0]
	movs r6, #2
	cmp r0, #0x1e
	bne _080949FA
	movs r6, #4
_080949FA:
	adds r0, r1, #0
	bl sub_8018FAC
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x2a
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x17
	ldrsb r1, [r0, r1]
	movs r0, #0x17
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _08094A24
	movs r6, #4
_08094A24:
	adds r0, r2, #0
	bl sub_8018F64
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	adds r7, r5, #0
	adds r7, #0x30
	ldr r0, [r4]
	ldr r2, [r0]
	ldr r0, [r2, #4]
	movs r1, #0x18
	ldrsb r1, [r0, r1]
	movs r0, #0x18
	ldrsb r0, [r2, r0]
	movs r6, #2
	cmp r1, r0
	bne _08094A4E
	movs r6, #4
_08094A4E:
	adds r0, r2, #0
	bl sub_8018F84
	adds r2, r0, #0
	adds r0, r7, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAffinityIcon
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _08094A84
	adds r0, r5, #0
	adds r0, #0x34
	movs r1, #2
	movs r2, #0x14
	bl PutSpecialChar
	b _08094EA6
	.align 2, 0
_08094A80: .4byte 0x0200D6E0
_08094A84:
	adds r0, r5, #0
	adds r0, #0x34
	movs r2, #0xa0
	lsls r2, r2, #7
	bl DrawIcon
	b _08094EA6
_08094A92:
	ldr r0, _08094AD4 @ =0x0200D6E0
	lsls r4, r7, #2
	adds r7, r4, r0
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	str r4, [sp, #0x4c]
	cmp r5, #0
	bne _08094AE0
	ldr r0, _08094AD8 @ =0x000004C7
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r2, [sp, #0x50]
	ldr r4, [sp, #0x2c]
	adds r0, r2, r4
	lsls r0, r0, #3
	ldr r1, _08094ADC @ =0x0200E098
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x14
	mov r2, sb
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl sub_8004374
	b _08094B44
	.align 2, 0
_08094AD4: .4byte 0x0200D6E0
_08094AD8: .4byte 0x000004C7
_08094ADC: .4byte 0x0200E098
_08094AE0:
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_801729C
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, _08094BA0 @ =0x0200E098
	adds r0, r0, r1
	ldr r4, [sp, #0x54]
	add r4, sl
	adds r1, r4, #0
	adds r1, #0x14
	mov r2, sb
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl sub_8004374
	adds r4, #0x10
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r0, [r7]
	ldr r0, [r0]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemIconId
	bl UnitList_RegisterEquippedIcon
_08094B44:
	ldr r5, [sp, #0x54]
	add r5, sl
	adds r3, r5, #0
	adds r3, #0x24
	movs r1, #2
	mov r2, sb
	cmp r2, #0
	beq _08094B56
	movs r1, #1
_08094B56:
	ldr r0, _08094BA4 @ =0x0200D6E0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	movs r6, #4
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r5, #0
	adds r3, #0x2c
	movs r1, #2
	mov r0, sb
	cmp r0, #0
	beq _08094B76
	movs r1, #1
_08094B76:
	ldr r0, [r4]
	movs r6, #6
	ldrsh r2, [r0, r6]
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r1, r5, #0
	adds r1, #0x34
	movs r3, #2
	mov r0, sb
	cmp r0, #0
	beq _08094B90
	movs r3, #1
_08094B90:
	ldr r0, [r4]
	movs r4, #8
	ldrsh r2, [r0, r4]
	adds r0, r1, #0
	adds r1, r3, #0
	bl PutNumberOrBlank
	b _08094EA6
	.align 2, 0
_08094BA0: .4byte 0x0200E098
_08094BA4: .4byte 0x0200D6E0
_08094BA8:
	ldr r0, _08094BE8 @ =0x0200D6E0
	lsls r1, r7, #2
	adds r0, r1, r0
	ldr r0, [r0]
	ldr r2, [r0]
	ldr r5, [r2, #0xc]
	movs r0, #0x10
	ands r5, r0
	str r1, [sp, #0x4c]
	cmp r5, #0
	beq _08094BF0
	adds r0, r2, #0
	bl sub_80190C0
	adds r5, r0, #0
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r0, r0, #3
	ldr r1, _08094BEC @ =0x0200E0A0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	movs r3, #0
	str r3, [sp]
	str r5, [sp, #4]
	bl sub_8004374
	b _08094C18
	.align 2, 0
_08094BE8: .4byte 0x0200D6E0
_08094BEC: .4byte 0x0200E0A0
_08094BF0:
	ldr r0, _08094CC8 @ =0x000004C6
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r4, [sp, #0x50]
	ldr r6, [sp, #0x2c]
	adds r0, r4, r6
	lsls r0, r0, #3
	ldr r1, _08094CCC @ =0x0200E0A0
	adds r0, r0, r1
	ldr r1, [sp, #0x54]
	add r1, sl
	adds r1, #0x24
	mov r2, sb
	rsbs r4, r2, #0
	str r5, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl sub_8004374
_08094C18:
	mov r8, r4
	ldr r7, [sp, #0x54]
	add r7, sl
	adds r3, r7, #0
	adds r3, #0x14
	movs r1, #2
	mov r4, sb
	cmp r4, #0
	beq _08094C2C
	movs r1, #1
_08094C2C:
	ldr r0, _08094CD0 @ =0x0200D6E0
	ldr r6, [sp, #0x4c]
	adds r4, r6, r0
	ldr r0, [r4]
	ldr r0, [r0]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	adds r0, r3, #0
	bl PutNumberOrBlank
	adds r3, r7, #0
	adds r3, #0x1a
	movs r5, #2
	mov r0, sb
	cmp r0, #0
	beq _08094C58
	movs r5, #1
_08094C58:
	ldr r0, [r4]
	ldr r1, [r0]
	ldr r0, [r1, #4]
	movs r2, #0x11
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r2, r2, r0
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	adds r2, r2, r0
	adds r0, r3, #0
	adds r1, r5, #0
	bl PutNumberOrBlank
	adds r5, r7, #0
	adds r5, #0x20
	movs r6, #2
	mov r1, sb
	cmp r1, #0
	beq _08094C88
	movs r6, #1
_08094C88:
	ldr r0, [r4]
	ldr r0, [r0]
	bl GetUnitAid
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl PutNumberOrBlank
	ldr r0, [r4]
	ldr r0, [r0]
	bl sub_80190EC
	adds r4, r0, #0
	ldr r2, [sp, #0x50]
	ldr r3, [sp, #0x2c]
	adds r0, r2, r3
	lsls r0, r0, #3
	ldr r1, _08094CD4 @ =0x0200E098
	adds r0, r0, r1
	adds r1, r7, #0
	adds r1, #0x2e
	mov r6, r8
	mov r2, sb
	orrs r6, r2
	lsrs r2, r6, #0x1f
	movs r3, #0
	str r3, [sp]
	str r4, [sp, #4]
	bl sub_8004374
	b _08094EA6
	.align 2, 0
_08094CC8: .4byte 0x000004C6
_08094CCC: .4byte 0x0200E0A0
_08094CD0: .4byte 0x0200D6E0
_08094CD4: .4byte 0x0200E098
_08094CD8:
	movs r6, #0
	lsls r3, r7, #2
	ldr r0, _08094D30 @ =0x0200D6E0
	adds r7, r3, r0
	ldr r5, [sp, #0x54]
	add r5, sl
_08094CE4:
	add r1, sp, #8
	ldr r0, _08094D34 @ =0x081F556C
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldr r0, [r0]
	str r0, [r1]
	ldr r0, [r7]
	ldr r0, [r0]
	adds r0, #0x28
	adds r0, r0, r6
	ldrb r0, [r0]
	bl GetWeaponLevelFromExp
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	lsls r0, r6, #2
	adds r0, #0x14
	adds r3, r5, r0
	movs r1, #2
	cmp r4, #6
	bne _08094D14
	movs r1, #4
_08094D14:
	lsls r0, r4, #2
	add r0, sp
	adds r0, #8
	ldr r2, [r0]
	adds r0, r3, #0
	bl PutSpecialChar
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	cmp r6, #7
	bls _08094CE4
	b _08094EA6
	.align 2, 0
_08094D30: .4byte 0x0200D6E0
_08094D34: .4byte 0x081F556C
_08094D38:
	ldr r1, [sp, #0x28]
	subs r1, #6
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x38]
	movs r4, #0
	str r4, [sp, #0x3c]
	ldr r1, _08094DF0 @ =0x0200D6E0
	lsls r0, r7, #2
	adds r5, r0, r1
	ldr r0, [r5]
	ldr r0, [r0]
	bl GetUnitSupporterCount
	str r0, [sp, #0x40]
	adds r0, r6, #0
	adds r0, #0x10
	add r0, r8
	bl sub_8003CF8
	movs r6, #0
	ldr r0, [sp, #0x40]
	cmp r4, r0
	bge _08094E5E
	adds r7, r5, #0
	mov r1, r8
	str r1, [sp, #0x44]
	ldr r2, [sp, #0x34]
	str r2, [sp, #0x48]
	mov r3, sb
	rsbs r3, r3, #0
	mov r0, sb
	orrs r3, r0
	mov r8, r3
_08094D80:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl CanUnitSupportNow
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08094E52
	ldr r1, [sp, #0x3c]
	ldr r2, [sp, #0x38]
	cmp r1, r2
	blo _08094E48
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl sub_8028188
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	bne _08094DF8
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupporterCharacter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r2, r0, #0
	lsls r0, r4, #3
	ldr r1, _08094DF4 @ =0x0200E098
	adds r0, r0, r1
	ldr r3, [sp, #0x44]
	adds r0, r3, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r3, [sp, #0x48]
	adds r1, r3, r1
	str r5, [sp]
	str r2, [sp, #4]
	mov r3, r8
	lsrs r2, r3, #0x1f
	movs r3, #0
	bl sub_8004374
	b _08094E36
	.align 2, 0
_08094DF0: .4byte 0x0200D6E0
_08094DF4: .4byte 0x0200E098
_08094DF8:
	ldr r0, [r7]
	ldr r0, [r0]
	adds r1, r6, #0
	bl GetUnitSupporterCharacter
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	bl GetCharacterData
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _08094E44 @ =0x0200E098
	adds r0, r0, r1
	ldr r1, [sp, #0x44]
	adds r0, r1, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	ldr r2, [sp, #0x48]
	adds r1, r2, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #1
	movs r3, #0
	bl sub_8004374
_08094E36:
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #3
	beq _08094E5E
	b _08094E52
	.align 2, 0
_08094E44: .4byte 0x0200E098
_08094E48:
	ldr r0, [sp, #0x3c]
	adds r0, #1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp, #0x3c]
_08094E52:
	adds r0, r6, #1
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
	ldr r3, [sp, #0x40]
	cmp r6, r3
	blt _08094D80
_08094E5E:
	cmp r4, #2
	bhi _08094EA6
	ldr r6, [sp, #0x50]
	ldr r1, [sp, #0x2c]
	adds r0, r6, r1
	lsls r5, r0, #3
	ldr r7, [sp, #0x54]
	add r7, sl
	mov r2, sb
	rsbs r6, r2, #0
	orrs r6, r2
_08094E74:
	ldr r0, _08094EBC @ =0x000004C6
	bl sub_8009FA8
	adds r3, r0, #0
	lsls r0, r4, #3
	ldr r1, _08094EC0 @ =0x0200E098
	adds r0, r0, r1
	adds r0, r5, r0
	lsls r1, r4, #1
	adds r1, r1, r4
	lsls r1, r1, #2
	adds r1, #0x12
	adds r1, r7, r1
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	lsrs r2, r6, #0x1f
	movs r3, #0
	bl sub_8004374
	adds r0, r4, #1
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, #2
	bls _08094E74
_08094EA6:
	movs r0, #1
	bl BG_EnableSyncByMask
	add sp, #0x58
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08094EBC: .4byte 0x000004C6
_08094EC0: .4byte 0x0200E098

