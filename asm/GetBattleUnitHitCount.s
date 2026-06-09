	.syntax unified
	.set BattleCheckBraveEffect, 0x0802B004 + 1
	.section .text.GetBattleUnitHitCount, "ax", %progbits
@ GetBattleUnitHitCount @ JP 0x0802AFF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetBattleUnitHitCount
	.thumb_func
GetBattleUnitHitCount:
	push {r4, lr}
	movs r4, #1
	bl BattleCheckBraveEffect
	lsls r4, r0
	adds r0, r4, #0
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

