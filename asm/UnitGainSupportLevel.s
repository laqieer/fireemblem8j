	.syntax unified
	.set GetUnitSupporterCharacter, 0x08028170 + 1
	.set SetSupportLevelGained, 0x080286D0 + 1
	.section .text.UnitGainSupportLevel, "ax", %progbits
@ UnitGainSupportLevel @ JP 0x08028270 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitGainSupportLevel
	.thumb_func
UnitGainSupportLevel:
	push {r4, lr}
	adds r3, r0, #0
	adds r3, #0x32
	adds r3, r3, r1
	ldrb r2, [r3]
	adds r2, #1
	strb r2, [r3]
	ldr r3, _080282A0 @ =0x0202BCEC
	ldrh r2, [r3, #0x16]
	adds r2, #1
	strh r2, [r3, #0x16]
	ldr r2, [r0]
	ldrb r4, [r2, #4]
	bl GetUnitSupporterCharacter
	adds r1, r0, #0
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	adds r0, r4, #0
	bl SetSupportLevelGained
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080282A0: .4byte 0x0202BCEC

