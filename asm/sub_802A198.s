	.syntax unified
	.set BattleApplyWeaponTriangleEffect, 0x0802C6F8 + 1
	.set BattleInitTargetCanCounter, 0x0802C77C + 1
	.set BattleUnitTargetCheckCanCounter, 0x0802C678 + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set sub_802A324, 0x0802A324 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802A69C, 0x0802A69C + 1
	.set sub_802A884, 0x0802A884 + 1
	.set sub_802B874, 0x0802B874 + 1
	.set sub_802C624, 0x0802C624 + 1
	.set sub_802EA48, 0x0802EA48 + 1
	.set sub_802EA88, 0x0802EA88 + 1
	.set sub_80A8F0C, 0x080A8F0C + 1
	.set sub_80A94E8, 0x080A94E8 + 1
	.section .text.sub_802A198, "ax", %progbits
@ sub_802A198 @ JP 0x0802A198 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A198
	.thumb_func
sub_802A198:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r1, #0
	ldr r5, _0802A1D8 @ =0x0203A4E8
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_802A4F0
	ldr r4, _0802A1DC @ =0x0203A568
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_802A4F0
	ldr r0, _0802A1E0 @ =0x0203A4D0
	mov ip, r0
	movs r2, #0x10
	ldrsb r2, [r5, r2]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802A1C6
	subs r1, r0, r2
_0802A1C6:
	movs r3, #0x11
	ldrsb r3, [r5, r3]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _0802A1E4
	adds r0, r1, r2
	b _0802A1E8
	.align 2, 0
_0802A1D8: .4byte 0x0203A4E8
_0802A1DC: .4byte 0x0203A568
_0802A1E0: .4byte 0x0203A4D0
_0802A1E4:
	subs r0, r0, r3
	adds r0, r1, r0
_0802A1E8:
	mov r1, ip
	strb r0, [r1, #2]
	ldr r0, _0802A200 @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802A208
	ldr r0, _0802A204 @ =0x0203A4E8
	bl sub_802A884
	b _0802A212
	.align 2, 0
_0802A200: .4byte 0x0203A4D0
_0802A204: .4byte 0x0203A4E8
_0802A208:
	ldr r0, _0802A278 @ =0x0203A4E8
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_802A69C
_0802A212:
	ldr r4, _0802A27C @ =0x0203A568
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_802A69C
	bl BattleInitTargetCanCounter
	ldr r5, _0802A278 @ =0x0203A4E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	bl sub_802EA48
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r6, #0
	adds r1, r7, #0
	bl sub_802A324
	bl sub_802EA88
	adds r0, r4, #0
	bl BattleUnitTargetCheckCanCounter
	adds r0, r4, #0
	bl sub_802C624
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0802A270
	bl sub_802B874
	bl sub_80A94E8
	adds r0, r6, #0
	bl sub_80A8F0C
	adds r0, r7, #0
	bl sub_80A8F0C
_0802A270:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A278: .4byte 0x0203A4E8
_0802A27C: .4byte 0x0203A568

