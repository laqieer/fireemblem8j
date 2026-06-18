	.syntax unified
	.set GenerateBattleUnitStatGainsComparatively, 0x0802BDE8 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set InitBattleUnitWithoutBonuses, 0x0802A5D4 + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set sub_80186A8, 0x080186A8 + 1
	.set sub_802BB48, 0x0802BB48 + 1
	.section .text.sub_802F4B8, "ax", %progbits
@ ExecUnitDefaultPromotion @ JP 0x0802F4B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ExecUnitDefaultPromotion
	.thumb_func
ExecUnitDefaultPromotion:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	adds r7, r1, #0
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov r8, r2
	movs r0, #1
	rsbs r0, r0, #0
	mov sb, r0
	cmp r7, sb
	beq _0802F4EA
	ldr r3, _0802F570 @ =0x0203A4E8
	ldr r1, _0802F574 @ =0x0203A568
	lsls r2, r7, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r2
	ldrh r0, [r0]
	adds r1, #0x4a
	strh r0, [r1]
	adds r3, #0x4a
	strh r0, [r3]
_0802F4EA:
	adds r0, r6, #0
	bl GetUnitEquippedWeapon
	ldr r4, _0802F570 @ =0x0203A4E8
	ldr r5, _0802F574 @ =0x0203A568
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
	bl sub_802BB48
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
	mov r0, r8
	cmp r0, #0
	beq _0802F538
	ldr r0, [r6, #0xc]
	movs r1, #0x40
	orrs r0, r1
	str r0, [r6, #0xc]
_0802F538:
	cmp r7, sb
	beq _0802F544
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_80186A8
_0802F544:
	ldr r2, _0802F578 @ =0x0203A5E8
	ldr r0, [r2]
	ldr r1, _0802F57C @ =0xFFF80000
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
	ldr r1, _0802F580 @ =0x0203A4D0
	movs r0, #0x10
	strh r0, [r1]
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F570: .4byte 0x0203A4E8
_0802F574: .4byte 0x0203A568
_0802F578: .4byte 0x0203A5E8
_0802F57C: .4byte 0xFFF80000
_0802F580: .4byte 0x0203A4D0

