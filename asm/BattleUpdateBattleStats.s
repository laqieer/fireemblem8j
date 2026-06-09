	.syntax unified
	.section .text.BattleUpdateBattleStats, "ax", %progbits
@ BattleUpdateBattleStats @ JP 0x0802B134 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global BattleUpdateBattleStats
	.thumb_func
BattleUpdateBattleStats:
	adds r3, r0, #0
	ldr r2, _0802B160 @ =0x0203A4D0
	adds r0, #0x5a
	ldrh r0, [r0]
	strh r0, [r2, #6]
	adds r1, #0x5c
	ldrh r0, [r1]
	strh r0, [r2, #8]
	adds r0, r3, #0
	adds r0, #0x64
	ldrh r0, [r0]
	strh r0, [r2, #0xa]
	adds r0, r3, #0
	adds r0, #0x6a
	ldrh r0, [r0]
	strh r0, [r2, #0xc]
	adds r0, r3, #0
	adds r0, #0x6c
	ldrh r0, [r0]
	strh r0, [r2, #0xe]
	bx lr
	.align 2, 0
_0802B160: .4byte 0x0203A4D0

