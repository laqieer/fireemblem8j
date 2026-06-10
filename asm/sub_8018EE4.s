	.syntax unified
	.set GetItemSklBonus, 0x080161F8 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_8018EE4, "ax", %progbits
@ sub_8018EE4 @ JP 0x08018EE4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018EE4
	.thumb_func
sub_8018EE4:
	push {r4, lr}
	adds r4, r0, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	ldr r0, [r4, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	bne _08018F08
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	b _08018F1A
_08018F08:
	adds r0, r2, #0
	bl GetItemSklBonus
	adds r1, r0, #0
	movs r0, #0x15
	ldrsb r0, [r4, r0]
	lsrs r2, r0, #0x1f
	adds r0, r0, r2
	asrs r0, r0, #1
_08018F1A:
	adds r0, r0, r1
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

