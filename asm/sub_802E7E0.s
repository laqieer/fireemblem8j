	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GenerateArrowTrapTargets, 0x0802E648 + 1
	.set GenerateFireTileTrapTargets, 0x0802E628 + 1
	.set GenerateGasTrapTargets, 0x0802E68C + 1
	.set InitTargets, 0x08050618 + 1
	.set ShouldSkipGasTrapDisplay, 0x0802E70C + 1
	.section .text.sub_802E7E0, "ax", %progbits
@ sub_802E7E0 @ JP 0x0802E7E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802E7E0
	.thumb_func
sub_802E7E0:
	push {r4, r5, lr}
	movs r5, #0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	ldr r4, _0802E7F0 @ =0x0203A610
	b _0802E8D0
	.align 2, 0
_0802E7F0: .4byte 0x0203A610
_0802E7F4:
	movs r0, #6
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _0802E8CE
	ldrb r3, [r4, #2]
	cmp r3, #5
	beq _0802E84C
	cmp r3, #5
	bgt _0802E80C
	cmp r3, #4
	beq _0802E816
	b _0802E8CE
_0802E80C:
	cmp r3, #6
	beq _0802E8B6
	cmp r3, #7
	beq _0802E89C
	b _0802E8CE
_0802E816:
	ldrb r2, [r4, #1]
	ldr r0, _0802E848 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrb r1, [r4]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0
	beq _0802E8CE
	adds r0, r1, #0
	adds r1, r2, #0
	movs r2, #0
	movs r3, #4
	bl AddTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateFireTileTrapTargets
	b _0802E8CE
	.align 2, 0
_0802E848: .4byte 0x0202E4D4
_0802E84C:
	ldrb r2, [r4, #3]
	cmp r2, #1
	beq _0802E870
	cmp r2, #1
	bgt _0802E85C
	cmp r2, #0
	beq _0802E86C
	b _0802E872
_0802E85C:
	cmp r2, #2
	beq _0802E868
	cmp r2, #3
	bne _0802E872
	movs r5, #0x64
	b _0802E872
_0802E868:
	movs r5, #0x65
	b _0802E872
_0802E86C:
	movs r5, #0x66
	b _0802E872
_0802E870:
	movs r5, #0x67
_0802E872:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	bl ShouldSkipGasTrapDisplay
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802E8CE
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	adds r3, r5, #0
	bl AddTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	ldrb r3, [r4, #3]
	bl GenerateGasTrapTargets
	b _0802E8CE
_0802E89C:
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #0
	movs r3, #7
	bl AddTarget
	ldrb r0, [r4]
	ldrb r1, [r4, #1]
	movs r2, #7
	ldrsb r2, [r4, r2]
	bl GenerateArrowTrapTargets
	b _0802E8CE
_0802E8B6:
	ldrb r0, [r4, #3]
	cmp r0, #0
	beq _0802E8C0
	ldrb r0, [r4]
	b _0802E8C2
_0802E8C0:
	ldrb r0, [r4, #1]
_0802E8C2:
	ldr r1, _0802E8DC @ =0x0203A610
	subs r1, r4, r1
	asrs r1, r1, #3
	movs r2, #0
	bl AddTarget
_0802E8CE:
	adds r4, #8
_0802E8D0:
	ldrb r0, [r4, #2]
	cmp r0, #0
	bne _0802E7F4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802E8DC: .4byte 0x0203A610

