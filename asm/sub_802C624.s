	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.section .text.sub_802C624, "ax", %progbits
@ sub_802C624 @ JP 0x0802C624 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C624
	.thumb_func
sub_802C624:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	cmp r0, #0
	bne _0802C672
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	strh r0, [r4]
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _0802C672
	adds r0, r5, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802C672
	movs r6, #0
	subs r4, #0x2c
_0802C650:
	ldrh r1, [r4]
	adds r0, r5, #0
	bl CanUnitUseStaff
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802C66A
	ldrh r1, [r4]
	adds r0, r5, #0
	adds r0, #0x4a
	strh r1, [r0]
	b _0802C672
_0802C66A:
	adds r4, #2
	adds r6, #1
	cmp r6, #4
	ble _0802C650
_0802C672:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

