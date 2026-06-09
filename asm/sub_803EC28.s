	.syntax unified
	.set GetItemMight, 0x08017384 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set sub_8018EC4, 0x08018EC4 + 1
	.section .text.sub_803EC28, "ax", %progbits
@ sub_803EC28 @ JP 0x0803EC28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803EC28
	.thumb_func
sub_803EC28:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	bl GetUnitEquippedWeapon
	adds r4, r0, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	strh r4, [r6]
	adds r0, r5, #0
	bl sub_8018EC4
	adds r5, r0, #0
	adds r0, r4, #0
	bl GetItemMight
	adds r5, r5, r0
	adds r0, r5, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

