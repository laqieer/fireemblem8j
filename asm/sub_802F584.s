	.syntax unified
	.set GenerateBattleUnitStatGainsComparatively, 0x0802BDE8 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set InitBattleUnitWithoutBonuses, 0x0802A5D4 + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set sub_80186A8, 0x080186A8 + 1
	.set sub_802BC98, 0x0802BC98 + 1
	.section .text.sub_802F584, "ax", %progbits
@ ExecUnitPromotion @ JP 0x0802F584 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ExecUnitPromotion
	.thumb_func
ExecUnitPromotion:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	adds r7, r2, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov r8, r1
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	mov sb, r3
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	cmp r7, sl
	beq _0802F5BE
	ldr r3, _0802F648 @ =0x0203A4E8
	ldr r1, _0802F64C @ =0x0203A568
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
_0802F5BE:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, _0802F648 @ =0x0203A4E8
	ldr r5, _0802F64C @ =0x0203A568
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r1, r4, #0
	adds r1, #0x48
	strh r0, [r1]
	adds r0, r5, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r6, #0
	mov r1, r8
	bl sub_802BC98
	adds r0, r4, #0
	adds r1, r6, #0
	bl InitBattleUnitWithoutBonuses
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, sb
	cmp r0, #0
	beq _0802F60E
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
_0802F60E:
	cmp r7, sl
	beq _0802F61A
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_80186A8
_0802F61A:
	ldr r2, _0802F650 @ =0x0203A5E8
	ldr r0, [r2]
	ldr r1, _0802F654 @ =0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	movs r0, #0
	strb r0, [r2, #3]
	ldr r1, _0802F658 @ =0x0203A4D0
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F648: .4byte 0x0203A4E8
_0802F64C: .4byte 0x0203A568
_0802F650: .4byte 0x0203A5E8
_0802F654: .4byte 0xFFF80000
_0802F658: .4byte 0x0203A4D0

