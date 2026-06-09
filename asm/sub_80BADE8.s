	.syntax unified
	.set PidStatsGetTotalBattleAmt, 0x080A9348 + 1
	.set PidStatsGetTotalWinAmt, 0x080A936C + 1
	.set __divsi3, 0x080D65F8 + 1
	.section .text.sub_80BADE8, "ax", %progbits
@ sub_80BADE8 @ JP 0x080BADE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BADE8
	.thumb_func
sub_80BADE8:
	push {r4, lr}
	bl PidStatsGetTotalBattleAmt
	adds r4, r0, #0
	bl PidStatsGetTotalWinAmt
	movs r1, #0x64
	muls r0, r1, r0
	adds r1, r4, #0
	bl __divsi3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	pop {r4}
	pop {r1}
	bx r1

