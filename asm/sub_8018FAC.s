	.syntax unified
	.set GetItemLckBonus, 0x080162B8 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_8018FAC, "ax", %progbits
@ sub_8018FAC @ JP 0x08018FAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018FAC
	.thumb_func
sub_8018FAC:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemLckBonus
	adds r1, r0, #0
	movs r0, #0x19
	ldrsb r0, [r4, r0]
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

