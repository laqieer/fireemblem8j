	.syntax unified
	.set BattleApplyWeaponTriangleEffect, 0x0802C6F8 + 1
	.set SetBattleUnitTerrainBonuses, 0x0802A60C + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set UpdateUnitDuringBattle, 0x0802C21C + 1
	.set WriteSuspendSave, 0x080AA460 + 1
	.set nullsub_42, 0x0802CA30 + 1
	.set sub_802A324, 0x0802A324 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802A69C, 0x0802A69C + 1
	.set sub_802B874, 0x0802B874 + 1
	.set sub_80A94E8, 0x080A94E8 + 1
	.section .text.sub_802CC9C, "ax", %progbits
@ sub_802CC9C @ JP 0x0802CC9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CC9C
	.thumb_func
sub_802CC9C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r0, _0802CD6C @ =0x0203A8EC
	mov sb, r0
	ldr r1, [r0, #4]
	mov r8, r1
	ldr r0, _0802CD70 @ =0x0202BCAC
	adds r0, #0x3c
	ldrb r0, [r0]
	str r0, [sp]
	ldr r7, _0802CD74 @ =0x0203A4D0
	movs r0, #0x21
	strh r0, [r7]
	ldr r5, _0802CD78 @ =0x0203A4E8
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_802A4F0
	ldr r4, _0802CD7C @ =0x0203A568
	adds r0, r4, #0
	mov r1, r8
	bl sub_802A4F0
	ldr r0, _0802CD80 @ =0x0203A954
	mov sl, r0
	ldrb r0, [r0, #0x15]
	cmp r0, #0
	beq _0802CCE6
	strb r0, [r4, #0x13]
	adds r1, r4, #0
	adds r1, #0x72
	strb r0, [r1]
_0802CCE6:
	mov r1, sb
	ldrb r0, [r1, #0xc]
	strb r0, [r7, #2]
	ldrb r1, [r5, #0x10]
	adds r0, r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r5, #0x11]
	strb r0, [r4, #0x11]
	adds r0, r5, #0
	movs r1, #6
	bl sub_802A69C
	adds r0, r4, #0
	movs r1, #7
	bl sub_802A69C
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	movs r0, #4
	mov r1, sl
	strb r0, [r1, #0x16]
	movs r0, #3
	bl WriteSuspendSave
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	movs r1, #8
	bl SetBattleUnitTerrainBonuses
	adds r0, r6, #0
	mov r1, r8
	bl sub_802A324
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802CD3C
	bl sub_802B874
_0802CD3C:
	adds r0, r6, #0
	adds r1, r5, #0
	bl UpdateUnitDuringBattle
	ldr r0, [sp]
	cmp r0, #0
	beq _0802CD52
	movs r0, #0x13
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802CD9A
_0802CD52:
	bl sub_80A94E8
	ldr r0, [r6, #0xc]
	ldr r2, _0802CD84 @ =0xFFF1FFFF
	ands r2, r0
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	adds r0, #1
	cmp r0, #7
	bhi _0802CD88
	lsls r0, r0, #0x11
	b _0802CD8C
	.align 2, 0
_0802CD6C: .4byte 0x0203A8EC
_0802CD70: .4byte 0x0202BCAC
_0802CD74: .4byte 0x0203A4D0
_0802CD78: .4byte 0x0203A4E8
_0802CD7C: .4byte 0x0203A568
_0802CD80: .4byte 0x0203A954
_0802CD84: .4byte 0xFFF1FFFF
_0802CD88:
	movs r0, #0xe0
	lsls r0, r0, #0xc
_0802CD8C:
	adds r1, r2, r0
	str r1, [r6, #0xc]
	ldr r0, _0802CDB4 @ =0x03003008
	lsrs r1, r1, #0x11
	movs r2, #7
	ands r1, r2
	strb r1, [r0]
_0802CD9A:
	ldr r0, _0802CDB8 @ =0x0203A4E8
	ldr r1, _0802CDBC @ =0x0203A568
	bl nullsub_42
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CDB4: .4byte 0x03003008
_0802CDB8: .4byte 0x0203A4E8
_0802CDBC: .4byte 0x0203A568

