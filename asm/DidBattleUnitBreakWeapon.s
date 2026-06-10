	.syntax unified
	.section .text.DidBattleUnitBreakWeapon, "ax", %progbits
@ DidBattleUnitBreakWeapon @ JP 0x0802CDD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DidBattleUnitBreakWeapon
	.thumb_func
DidBattleUnitBreakWeapon:
	push {lr}
	adds r1, r0, #0
	movs r0, #0x13
	ldrsb r0, [r1, r0]
	cmp r0, #0
	beq _0802CDEC
	adds r0, r1, #0
	adds r0, #0x7d
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0802CDEE
_0802CDEC:
	movs r0, #0
_0802CDEE:
	pop {r1}
	bx r1
	.align 2, 0

