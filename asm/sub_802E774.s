	.syntax unified
	.set GenerateArrowTrapTargets, 0x0802E648 + 1
	.set GenerateFireTileTrapTargets, 0x0802E628 + 1
	.set GenerateGasTrapTargets, 0x0802E68C + 1
	.set InitTargets, 0x08050618 + 1
	.section .text.sub_802E774, "ax", %progbits
@ GenerateTrapDamageTargets @ JP 0x0802E774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GenerateTrapDamageTargets
	.thumb_func
GenerateTrapDamageTargets:
	push {r4, lr}
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r4, _0802E784 @ =0x0203A610
	b _0802E7D2
	.align 2, 0
_0802E784: .4byte 0x0203A610
_0802E788:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802E7D0
	ldrb r0, [r4, #2]
	cmp r0, #5
	beq _0802E7C2
	cmp r0, #5
	bgt _0802E7A0
	cmp r0, #4
	beq _0802E7A6
	b _0802E7D0
_0802E7A0:
	cmp r0, #7
	beq _0802E7B4
	b _0802E7D0
_0802E7A6:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateFireTileTrapTargets
	b _0802E7D0
_0802E7B4:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateArrowTrapTargets
	b _0802E7D0
_0802E7C2:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl GenerateGasTrapTargets
_0802E7D0:
	adds r4, #8
_0802E7D2:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E788
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0

