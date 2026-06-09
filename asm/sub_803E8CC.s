	.syntax unified
	.set CanUnitUseStaff, 0x0801654C + 1
	.set CanUnitUseWeapon, 0x0801631C + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMaxUses, 0x08017358 + 1
	.set GetItemMight, 0x08017384 + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetItemUses, 0x0801732C + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_803EBA8, 0x0803EBA8 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_803E8CC, "ax", %progbits
@ sub_803E8CC @ JP 0x0803E8CC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803E8CC
	.thumb_func
sub_803E8CC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r5, _0803E8E8 @ =0x03004DF0
	ldr r0, [r5]
	bl GetUnitItemCount
	adds r1, r0, #0
	cmp r1, #0
	bne _0803E8EC
	movs r0, #0
	b _0803E9D8
	.align 2, 0
_0803E8E8: .4byte 0x03004DF0
_0803E8EC:
	movs r7, #0
	strh r7, [r4]
	ldr r1, [r5]
	ldrh r5, [r1, #0x1e]
	cmp r5, #0
	beq _0803E9D8
	adds r6, r4, #0
	movs r0, #0
	mov r8, r0
_0803E8FE:
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #5
	ands r1, r2
	cmp r1, #0
	beq _0803E9BA
	adds r0, r5, #0
	bl GetItemAttributes
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #3
	ands r1, r2
	cmp r1, #0
	bne _0803E9BA
	ldr r4, _0803E998 @ =0x03004DF0
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseWeapon
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0803E940
	ldr r0, [r4]
	adds r1, r5, #0
	bl CanUnitUseStaff
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	beq _0803E9BA
_0803E940:
	adds r0, r5, #0
	bl GetItemAttributes
	movs r1, #1
	ands r1, r0
	cmp r1, #0
	beq _0803E99C
	adds r0, r5, #0
	bl GetItemMinRange
	cmp r0, #1
	ble _0803E960
	ldrh r0, [r6]
	movs r1, #2
	orrs r0, r1
	strh r0, [r6]
_0803E960:
	adds r0, r5, #0
	bl GetItemMaxRange
	cmp r0, #1
	bne _0803E972
	ldrh r0, [r6]
	movs r1, #1
	orrs r0, r1
	strh r0, [r6]
_0803E972:
	adds r0, r5, #0
	bl GetItemUses
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl GetItemMaxUses
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80D6374
	adds r4, r0, #0
	cmp r4, #0xa
	bhi _0803E9AA
	ldrh r0, [r6]
	movs r1, #4
	b _0803E9A6
	.align 2, 0
_0803E998: .4byte 0x03004DF0
_0803E99C:
	adds r0, r5, #0
	bl sub_803EBA8
	ldrh r0, [r6]
	movs r1, #8
_0803E9A6:
	orrs r0, r1
	strh r0, [r6]
_0803E9AA:
	adds r0, r5, #0
	bl GetItemMight
	adds r1, r0, #0
	lsls r1, r1, #8
	ldrh r2, [r6]
	orrs r1, r2
	strh r1, [r6]
_0803E9BA:
	adds r6, #2
	movs r1, #2
	add r8, r1
	adds r7, #1
	cmp r7, #4
	bgt _0803E9D8
	movs r1, #0
	strh r1, [r6]
	ldr r1, _0803E9E4 @ =0x03004DF0
	ldr r1, [r1]
	adds r1, #0x1e
	add r1, r8
	ldrh r5, [r1]
	cmp r5, #0
	bne _0803E8FE
_0803E9D8:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803E9E4: .4byte 0x03004DF0

