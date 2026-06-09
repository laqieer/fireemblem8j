	.syntax unified
	.section .text.SetBattleUnitTerrainBonusesAuto, "ax", %progbits
@ SetBattleUnitTerrainBonusesAuto @ JP 0x0802A648 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBattleUnitTerrainBonusesAuto
	.thumb_func
SetBattleUnitTerrainBonusesAuto:
	adds r2, r0, #0
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0802A698 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r3, r2, #0
	adds r3, #0x55
	strb r0, [r3]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x44]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x57
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x48]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r1, r2, #0
	adds r1, #0x56
	strb r0, [r1]
	ldr r0, [r2, #4]
	ldrb r1, [r3]
	ldr r0, [r0, #0x4c]
	adds r0, r0, r1
	ldrb r1, [r0]
	adds r0, r2, #0
	adds r0, #0x58
	strb r1, [r0]
	bx lr
	.align 2, 0
_0802A698: .4byte 0x0202E4D8

