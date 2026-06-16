	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemMight, 0x08017384 + 1
	.set IsItemEffectiveAgainst, 0x08016994 + 1
	.set IsUnitEffectiveAgainst, 0x08016A30 + 1
	.section .text.sub_802AA28, "ax", %progbits
@ ComputeBattleUnitAttack @ JP 0x0802AA28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ComputeBattleUnitAttack
	.thumb_func
ComputeBattleUnitAttack:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	mov r8, r1
	adds r7, r6, #0
	adds r7, #0x48
	ldrh r0, [r7]
	bl GetItemMight
	adds r1, r6, #0
	adds r1, #0x54
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r1, r1, r0
	adds r5, r6, #0
	adds r5, #0x5a
	strh r1, [r5]
	movs r0, #0
	ldrsh r4, [r5, r0]
	adds r0, r6, #0
	mov r1, r8
	bl IsUnitEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802AA6E
	movs r0, #0
	ldrsh r4, [r5, r0]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
_0802AA6E:
	ldrh r0, [r7]
	mov r1, r8
	bl IsItemEffectiveAgainst
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802AAB6
	movs r0, #0
	ldrsh r4, [r5, r0]
	ldrh r0, [r7]
	bl GetItemIndex
	cmp r0, #0x87
	beq _0802AAAA
	cmp r0, #0x87
	bgt _0802AA9A
	cmp r0, #0x3e
	beq _0802AAAA
	cmp r0, #0x85
	beq _0802AAAA
	b _0802AAAE
_0802AA9A:
	cmp r0, #0x8e
	beq _0802AAAA
	cmp r0, #0x8e
	blt _0802AAAE
	cmp r0, #0x94
	bgt _0802AAAE
	cmp r0, #0x91
	blt _0802AAAE
_0802AAAA:
	lsls r0, r4, #0x11
	b _0802AAB4
_0802AAAE:
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #0x10
_0802AAB4:
	asrs r4, r0, #0x10
_0802AAB6:
	adds r5, r6, #0
	adds r5, #0x5a
	lsls r0, r4, #0x10
	lsrs r0, r0, #0x10
	strh r0, [r5]
	movs r1, #0x14
	ldrsb r1, [r6, r1]
	adds r0, r0, r1
	strh r0, [r5]
	adds r0, r6, #0
	adds r0, #0x48
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802AADA
	movs r0, #0
	strh r0, [r5]
_0802AADA:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

