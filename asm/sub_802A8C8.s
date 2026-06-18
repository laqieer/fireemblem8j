	.syntax unified
	.set ComputeBattleUnitAvoidRate, 0x0802AB54 + 1
	.set ComputeBattleUnitDodgeRate, 0x0802ABC4 + 1
	.set ComputeBattleUnitStatusBonuses, 0x0802AD00 + 1
	.set sub_802A93C, 0x0802A93C + 1
	.set sub_802A9B0, 0x0802A9B0 + 1
	.set ComputeBattleUnitAttack, 0x0802AA28 + 1
	.set sub_802AAE4, 0x0802AAE4 + 1
	.set sub_802AB1C, 0x0802AB1C + 1
	.set sub_802AB88, 0x0802AB88 + 1
	.set sub_802ACC4, 0x0802ACC4 + 1
	.section .text.sub_802A8C8, "ax", %progbits
@ ComputeBattleUnitStats @ JP 0x0802A8C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ComputeBattleUnitStats
	.thumb_func
ComputeBattleUnitStats:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	bl sub_802A9B0
	adds r0, r4, #0
	adds r1, r5, #0
	bl ComputeBattleUnitAttack
	adds r0, r4, #0
	bl sub_802AAE4
	adds r0, r4, #0
	bl sub_802AB1C
	adds r0, r4, #0
	bl ComputeBattleUnitAvoidRate
	adds r0, r4, #0
	bl sub_802AB88
	adds r0, r4, #0
	bl ComputeBattleUnitDodgeRate
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_802A93C
	adds r0, r4, #0
	bl sub_802ACC4
	adds r0, r4, #0
	bl ComputeBattleUnitStatusBonuses
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

