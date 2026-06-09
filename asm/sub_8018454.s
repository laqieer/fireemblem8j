	.syntax unified
	.set GetItemHpBonus, 0x08016198 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set sub_80181B0, 0x080181B0 + 1
	.set sub_80A9260, 0x080A9260 + 1
	.section .text.sub_8018454, "ax", %progbits
@ sub_8018454 @ JP 0x08018454 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018454
	.thumb_func
sub_8018454:
	push {r4, r5, r6, lr}
	ldr r6, _080184CC @ =0x03004DF0
	ldr r2, [r6]
	strb r0, [r2, #0x10]
	ldr r0, [r6]
	strb r1, [r0, #0x11]
	ldr r2, [r6]
	ldr r0, [r2, #0xc]
	movs r1, #2
	orrs r0, r1
	str r0, [r2, #0xc]
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	ldr r1, _080184D0 @ =0x0203A954
	ldrb r1, [r1, #0x10]
	bl sub_80A9260
	ldr r5, [r6]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _080184AA
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_080184AA:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _080184BE
	ldr r0, [r6]
	ldr r1, [r0, #0xc]
	movs r2, #2
	rsbs r2, r2, #0
	ands r1, r2
	str r1, [r0, #0xc]
_080184BE:
	ldr r0, [r6]
	bl sub_80181B0
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080184CC: .4byte 0x03004DF0
_080184D0: .4byte 0x0203A954

