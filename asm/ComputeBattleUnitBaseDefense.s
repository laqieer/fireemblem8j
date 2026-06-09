	.syntax unified
	.section .text.ComputeBattleUnitBaseDefense, "ax", %progbits
@ ComputeBattleUnitBaseDefense @ JP 0x0802AA10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ComputeBattleUnitBaseDefense
	.thumb_func
ComputeBattleUnitBaseDefense:
	adds r1, r0, #0
	adds r1, #0x56
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	movs r2, #0x17
	ldrsb r2, [r0, r2]
	adds r1, r1, r2
	adds r0, #0x5c
	strh r1, [r0]
	bx lr
	.align 2, 0

