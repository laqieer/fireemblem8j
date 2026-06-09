	.syntax unified
	.set GetItemResBonus, 0x08016288 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_8018F84, "ax", %progbits
@ sub_8018F84 @ JP 0x08018F84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018F84
	.thumb_func
sub_8018F84:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemResBonus
	adds r1, r0, #0
	movs r0, #0x18
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	adds r4, #0x31
	ldrb r1, [r4]
	lsrs r1, r1, #4
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

