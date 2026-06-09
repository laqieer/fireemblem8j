	.syntax unified
	.set DidBattleUnitBreakWeapon, 0x0802CDD4 + 1
	.section .text.sub_807CB28, "ax", %progbits
@ sub_807CB28 @ JP 0x0807CB28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807CB28
	.thumb_func
sub_807CB28:
	push {lr}
	adds r2, r0, #0
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _0807CB3C
	movs r0, #0
	b _0807CB46
_0807CB3C:
	adds r0, r2, #0
	bl DidBattleUnitBreakWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
_0807CB46:
	pop {r1}
	bx r1
	.align 2, 0

