	.syntax unified
	.set BattleApplyWeaponTriangleEffect, 0x0802C6F8 + 1
	.set BattleInitTargetCanCounter, 0x0802C77C + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set sub_802A324, 0x0802A324 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802A69C, 0x0802A69C + 1
	.set sub_802A884, 0x0802A884 + 1
	.set sub_802EA48, 0x0802EA48 + 1
	.set sub_802EA88, 0x0802EA88 + 1
	.section .text.sub_802A0C8, "ax", %progbits
@ sub_802A0C8 @ JP 0x0802A0C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A0C8
	.thumb_func
sub_802A0C8:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	mov r8, r0
	mov sb, r1
	adds r4, r2, #0
	adds r5, r3, #0
	ldr r6, _0802A114 @ =0x0203A4E8
	adds r0, r6, #0
	mov r1, r8
	bl sub_802A4F0
	ldr r7, _0802A118 @ =0x0203A568
	adds r0, r7, #0
	mov r1, sb
	bl sub_802A4F0
	strb r4, [r6, #0x10]
	strb r5, [r6, #0x11]
	ldr r4, _0802A11C @ =0x0203A4D0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	movs r0, #0x10
	ldrsb r0, [r7, r0]
	subs r1, r2, r0
	cmp r1, #0
	bge _0802A102
	subs r1, r0, r2
_0802A102:
	movs r3, #0x11
	ldrsb r3, [r6, r3]
	movs r0, #0x11
	ldrsb r0, [r7, r0]
	subs r2, r3, r0
	cmp r2, #0
	blt _0802A120
	adds r0, r1, r2
	b _0802A124
	.align 2, 0
_0802A114: .4byte 0x0203A4E8
_0802A118: .4byte 0x0203A568
_0802A11C: .4byte 0x0203A4D0
_0802A120:
	subs r0, r0, r3
	adds r0, r1, r0
_0802A124:
	strb r0, [r4, #2]
	ldr r0, _0802A13C @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0802A144
	ldr r0, _0802A140 @ =0x0203A4E8
	bl sub_802A884
	b _0802A14C
	.align 2, 0
_0802A13C: .4byte 0x0203A4D0
_0802A140: .4byte 0x0203A4E8
_0802A144:
	ldr r0, _0802A190 @ =0x0203A4E8
	ldr r1, [sp, #0x1c]
	bl sub_802A69C
_0802A14C:
	ldr r4, _0802A194 @ =0x0203A568
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_802A69C
	bl BattleInitTargetCanCounter
	ldr r5, _0802A190 @ =0x0203A4E8
	adds r0, r5, #0
	adds r1, r4, #0
	bl BattleApplyWeaponTriangleEffect
	bl sub_802EA48
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	mov r0, r8
	mov r1, sb
	bl sub_802A324
	bl sub_802EA88
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A190: .4byte 0x0203A4E8
_0802A194: .4byte 0x0203A568

