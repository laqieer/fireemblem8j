	.syntax unified
	.set CanClassWieldWeaponType, 0x08017834 + 1
	.set FixROMUnitStructPtr, 0x08017BDC + 1
	.set GenerateMonsterClass, 0x0807A748 + 1
	.set GenerateMonsterItems, 0x0807A774 + 1
	.set GetFreeUnit, 0x080175E0 + 1
	.set GetItemHpBonus, 0x08016198 + 1
	.set GetItemWeaponEffect, 0x080174CC + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set UnitCheckStatCaps, 0x08017EDC + 1
	.set UnitHideIfUnderRoof, 0x0802E598 + 1
	.set UnitLoadStatsFromChracter, 0x08017B54 + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8017618, 0x08017618 + 1
	.set sub_8017A5C, 0x08017A5C + 1
	.set sub_8017C14, 0x08017C14 + 1
	.set sub_8017C40, 0x08017C40 + 1
	.set sub_8017E3C, 0x08017E3C + 1
	.set sub_8017E7C, 0x08017E7C + 1
	.set sub_807A710, 0x0807A710 + 1
	.section .text.sub_801786C, "ax", %progbits
@ sub_801786C @ JP 0x0801786C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801786C
	.thumb_func
sub_801786C:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x14
	adds r4, r0, #0
	movs r5, #0
	ldrb r1, [r4, #5]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _0801791C
	ldrb r0, [r4, #1]
	bl GenerateMonsterClass
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x10
	mov r1, sp
	adds r0, r4, #0
	ldm r0!, {r2, r3, r7}
	stm r1!, {r2, r3, r7}
	ldm r0!, {r2, r3}
	stm r1!, {r2, r3}
	mov r2, sp
	ldrb r0, [r2, #3]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2, #3]
	mov r0, sp
	strb r6, [r0, #1]
	ldrb r0, [r4, #3]
	lsrs r0, r0, #3
	bl sub_807A710
	mov r3, sp
	lsls r0, r0, #3
	ldrb r2, [r3, #3]
	movs r1, #7
	ands r1, r2
	orrs r1, r0
	strb r1, [r3, #3]
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	bl GenerateMonsterItems
	lsrs r1, r0, #0x10
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mov r0, sp
	strb r1, [r0, #0xc]
	strb r4, [r0, #0xd]
	strb r5, [r0, #0xe]
	strb r5, [r0, #0xf]
	adds r0, r1, #0
	bl GetItemWeaponEffect
	cmp r0, #1
	beq _080178DE
	cmp r4, #0
	bne _080178EC
_080178DE:
	mov r2, sp
	ldrb r1, [r2, #5]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2, #5]
	b _080178F6
_080178EC:
	mov r0, sp
	ldrb r1, [r0, #5]
	movs r2, #0x20
	orrs r1, r2
	strb r1, [r0, #5]
_080178F6:
	lsls r0, r6, #0x18
	lsrs r0, r0, #0x18
	movs r1, #3
	bl CanClassWieldWeaponType
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801791A
	mov r2, sp
	mov r0, sp
	ldrb r1, [r0, #0x12]
	movs r0, #7
	ands r0, r1
	strb r0, [r2, #0x12]
	movs r1, #0x28
	orrs r0, r1
	strb r0, [r2, #0x12]
_0801791A:
	mov r4, sp
_0801791C:
	ldrb r0, [r4, #3]
	lsls r0, r0, #0x1d
	lsrs r0, r0, #0x1e
	cmp r0, #1
	beq _08017942
	cmp r0, #1
	bgt _08017930
	cmp r0, #0
	beq _08017936
	b _0801794A
_08017930:
	cmp r0, #2
	beq _0801793E
	b _0801794A
_08017936:
	adds r0, r4, #0
	bl sub_8017618
	b _08017948
_0801793E:
	movs r0, #0x80
	b _08017944
_08017942:
	movs r0, #0x40
_08017944:
	bl GetFreeUnit
_08017948:
	adds r5, r0, #0
_0801794A:
	cmp r5, #0
	bne _08017952
	movs r0, #0
	b _08017A52
_08017952:
	adds r0, r5, #0
	bl sub_801759C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8017A5C
	ldr r1, [r5]
	adds r0, r5, #0
	bl UnitLoadStatsFromChracter
	adds r0, r5, #0
	bl UnitHideIfUnderRoof
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _0801797A
	cmp r0, #0x34
	bne _08017982
_0801797A:
	adds r0, r5, #0
	movs r1, #0xa
	bl SetUnitStatus
_08017982:
	ldrb r1, [r4, #3]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080179D6
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _080179A8
	adds r0, r5, #0
	bl sub_8017E7C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8017C40
	b _080179BE
_080179A8:
	adds r0, r5, #0
	bl sub_8017E3C
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8017C40
	ldrb r1, [r4, #2]
	adds r0, r5, #0
	adds r0, #0x38
	strb r1, [r0]
_080179BE:
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _080179CA
	cmp r0, #0x34
	bne _080179D6
_080179CA:
	movs r1, #8
	ldrsb r1, [r5, r1]
	adds r1, #1
	lsls r0, r1, #2
	adds r0, r0, r1
	strb r0, [r5, #0x12]
_080179D6:
	adds r0, r5, #0
	bl FixROMUnitStructPtr
	adds r0, r5, #0
	bl sub_8017C14
	ldrb r1, [r4, #5]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080179F6
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #5
	orrs r0, r1
	str r0, [r5, #0xc]
_080179F6:
	adds r0, r5, #0
	bl UnitCheckStatCaps
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x62
	beq _08017A1E
	cmp r0, #0x34
	bne _08017A50
_08017A1E:
	movs r4, #5
	strb r4, [r5, #0x13]
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08017A50
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08017A50:
	adds r0, r5, #0
_08017A52:
	add sp, #0x14
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

