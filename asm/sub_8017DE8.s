	.syntax unified
	.set GetItemHpBonus, 0x08016198 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set UnitCheckStatCaps, 0x08017EDC + 1
	.set sub_8017CE4, 0x08017CE4 + 1
	.set sub_8017D84, 0x08017D84 + 1
	.section .text.sub_8017DE8, "ax", %progbits
@ UnitApplyBonusLevels @ JP 0x08017DE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitApplyBonusLevels
	.thumb_func
UnitApplyBonusLevels:
	push {r4, lr}
	adds r4, r0, #0
	adds r2, r1, #0
	cmp r2, #0
	beq _08017E36
	ldr r1, [r4, #4]
	ldrb r0, [r1, #4]
	cmp r0, #0x62
	beq _08017E36
	cmp r0, #0x34
	beq _08017E36
	cmp r2, #0
	ble _08017E0C
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8017CE4
	b _08017E1A
_08017E0C:
	cmp r2, #0
	bge _08017E1A
	ldrb r1, [r1, #4]
	rsbs r2, r2, #0
	adds r0, r4, #0
	bl sub_8017D84
_08017E1A:
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	strb r1, [r4, #0x13]
_08017E36:
	pop {r4}
	pop {r0}
	bx r0

