	.syntax unified
	.set GetItemHpBonus, 0x08016198 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_8018E64, "ax", %progbits
@ sub_8018E64 @ JP 0x08018E64 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018E64
	.thumb_func
sub_8018E64:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	cmp r4, r1
	ble _08018E98
	adds r0, r5, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemHpBonus
	movs r1, #0x12
	ldrsb r1, [r5, r1]
	adds r1, r1, r0
	strb r1, [r5, #0x13]
_08018E98:
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

