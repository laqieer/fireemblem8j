	.syntax unified
	.section .text.ComputeBattleUnitAvoidRate, "ax", %progbits
@ ComputeBattleUnitAvoidRate @ JP 0x0802AB54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ComputeBattleUnitAvoidRate
	.thumb_func
ComputeBattleUnitAvoidRate:
	push {lr}
	adds r2, r0, #0
	adds r0, #0x5e
	movs r1, #0
	ldrsh r0, [r0, r1]
	lsls r0, r0, #1
	adds r1, r2, #0
	adds r1, #0x57
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	movs r0, #0x19
	ldrsb r0, [r2, r0]
	adds r0, r0, r1
	adds r1, r2, #0
	adds r1, #0x62
	strh r0, [r1]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0802AB82
	movs r0, #0
	strh r0, [r1]
_0802AB82:
	pop {r0}
	bx r0
	.align 2, 0

