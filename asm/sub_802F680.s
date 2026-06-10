	.syntax unified
	.set GenerateBattleUnitStatGainsComparatively, 0x0802BDE8 + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802BB48, 0x0802BB48 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.section .text.sub_802F680, "ax", %progbits
@ sub_802F680 @ JP 0x0802F680 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F680
	.thumb_func
sub_802F680:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	adds r6, r0, #0
	ldr r4, _0802F710 @ =0x0203A4E8
	ldr r5, _0802F714 @ =0x0203A568
	adds r0, r5, #0
	adds r0, #0x4a
	movs r2, #0
	mov r8, r2
	strh r1, [r0]
	ldr r2, _0802F718 @ =0x0000FFFF
	adds r0, r2, #0
	adds r2, r1, #0
	ands r2, r0
	adds r0, r4, #0
	adds r0, #0x4a
	strh r2, [r0]
	adds r0, r5, #0
	adds r0, #0x48
	strh r1, [r0]
	adds r0, r4, #0
	adds r0, #0x48
	strh r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_802A4F0
	adds r0, r6, #0
	bl sub_802BB48
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_802A4F0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateBattleUnitStatGainsComparatively
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	ldr r2, _0802F71C @ =0x0203A5E8
	ldr r0, [r2]
	ldr r1, _0802F720 @ =0xFFF80000
	ands r0, r1
	str r0, [r2]
	ldrb r1, [r2, #2]
	movs r0, #7
	ands r0, r1
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r2, #2]
	mov r0, r8
	strb r0, [r2, #3]
	ldr r1, _0802F724 @ =0x0203A4D0
	movs r0, #0x10
	strh r0, [r1]
	bl sub_802C94C
	ldr r0, [r6, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r6, #0xc]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F710: .4byte 0x0203A4E8
_0802F714: .4byte 0x0203A568
_0802F718: .4byte 0x0000FFFF
_0802F71C: .4byte 0x0203A5E8
_0802F720: .4byte 0xFFF80000
_0802F724: .4byte 0x0203A4D0

