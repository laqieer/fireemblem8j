	.syntax unified
	.section .text.SetBattleUnitTerrainBonuses, "ax", %progbits
@ SetBattleUnitTerrainBonuses @ JP 0x0802A60C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SetBattleUnitTerrainBonuses
	.thumb_func
SetBattleUnitTerrainBonuses:
	adds r2, r0, #0
	adds r3, r2, #0
	adds r3, #0x55
	strb r1, [r3]
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

