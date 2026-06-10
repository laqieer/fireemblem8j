	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemPowBonus, 0x080161C8 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.section .text.sub_8018730, "ax", %progbits
@ sub_8018730 @ JP 0x08018730 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018730
	.thumb_func
sub_8018730:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	cmp r0, #0xbe
	bne _08018744
	movs r0, #0xa6
	bl GetItemMaxRange
	b _08018764
_08018744:
	adds r0, r4, #0
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl GetItemPowBonus
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	adds r1, r1, r0
	lsrs r0, r1, #0x1f
	adds r1, r1, r0
	asrs r0, r1, #1
	cmp r0, #4
	bgt _08018764
	movs r0, #5
_08018764:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

