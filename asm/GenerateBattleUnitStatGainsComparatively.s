	.syntax unified
	.section .text.GenerateBattleUnitStatGainsComparatively, "ax", %progbits
@ GenerateBattleUnitStatGainsComparatively @ JP 0x0802BDE8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GenerateBattleUnitStatGainsComparatively
	.thumb_func
GenerateBattleUnitStatGainsComparatively:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldrb r0, [r3, #0x12]
	ldrb r2, [r1, #0x12]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x73
	strb r0, [r2]
	ldrb r0, [r3, #0x14]
	ldrb r2, [r1, #0x14]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x74
	strb r0, [r2]
	ldrb r0, [r3, #0x15]
	ldrb r2, [r1, #0x15]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x75
	strb r0, [r2]
	ldrb r0, [r3, #0x16]
	ldrb r2, [r1, #0x16]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x76
	strb r0, [r2]
	ldrb r0, [r3, #0x17]
	ldrb r2, [r1, #0x17]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x77
	strb r0, [r2]
	ldrb r0, [r3, #0x18]
	ldrb r2, [r1, #0x18]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x78
	strb r0, [r2]
	ldrb r0, [r3, #0x19]
	ldrb r2, [r1, #0x19]
	subs r0, r0, r2
	adds r2, r3, #0
	adds r2, #0x79
	strb r0, [r2]
	ldrb r5, [r3, #0x1a]
	movs r2, #0x1a
	ldrsb r2, [r3, r2]
	ldrb r4, [r1, #0x1a]
	movs r0, #0x1a
	ldrsb r0, [r1, r0]
	cmp r2, r0
	beq _0802BE5A
	subs r1, r5, r4
	adds r0, r3, #0
	adds r0, #0x7a
	strb r1, [r0]
	b _0802BE64
_0802BE5A:
	adds r1, r3, #0
	adds r1, #0x7a
	movs r0, #0
	strb r0, [r1]
	strb r4, [r3, #0x1a]
_0802BE64:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

