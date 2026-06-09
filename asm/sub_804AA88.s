	.syntax unified
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.section .text.sub_804AA88, "ax", %progbits
@ sub_804AA88 @ JP 0x0804AA88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804AA88
	.thumb_func
sub_804AA88:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	movs r5, #0
_0804AA8E:
	lsls r1, r5, #1
	adds r0, r6, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0804AABA
	adds r0, r6, #0
	adds r1, r4, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0804AABA
	movs r0, #1
	b _0804AAC2
_0804AABA:
	adds r5, #1
	cmp r5, #4
	ble _0804AA8E
	movs r0, #0
_0804AAC2:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

