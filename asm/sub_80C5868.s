	.syntax unified
	.set GetNextUnclearedNode, 0x080C1E20 + 1
	.set GetUnitEquippedWeaponSlot, 0x08016900 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutNumberOrBlank, 0x08004A9C + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set PutTwoSpecialChar, 0x08004C64 + 1
	.set Text_Skip, 0x08003D88 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_802A38C, 0x0802A38C + 1
	.set sub_80C086C, 0x080C086C + 1
	.set sub_80C5830, 0x080C5830 + 1
	.section .text.sub_80C5868, "ax", %progbits
@ sub_80C5868 @ JP 0x080C5868 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5868
	.thumb_func
sub_80C5868:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r5, r0, #0
	movs r0, #0x40
	adds r1, r5, #0
	bl sub_8003EAC
	mov r8, r0
	ldr r4, [r7, #0x2c]
	adds r0, r4, #0
	bl GetUnitEquippedWeaponSlot
	adds r1, r0, #0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_802A38C
	adds r0, r7, #0
	adds r0, #0x34
	ldr r4, _080C594C @ =0x02022F4E
	movs r1, #0
	str r1, [sp]
	str r5, [sp, #4]
	adds r1, r4, #0
	movs r2, #0
	mov r3, r8
	bl sub_8004374
	ldr r0, [r7, #0x2c]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r4, #0
	adds r1, #0xbc
	movs r2, #7
	str r2, [sp]
	str r0, [sp, #4]
	movs r0, #0
	movs r2, #0
	movs r3, #0
	bl sub_8004374
	movs r1, #0x9e
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x24
	movs r3, #0x25
	bl PutTwoSpecialChar
	movs r1, #0xa2
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x1f
	bl PutSpecialChar
	movs r1, #0xde
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x22
	movs r3, #0x23
	bl PutTwoSpecialChar
	movs r1, #0xe2
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #3
	movs r2, #0x16
	bl PutSpecialChar
	movs r1, #0xa1
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r7, #0x2c]
	movs r2, #8
	ldrsb r2, [r1, r2]
	movs r1, #2
	bl PutNumberOrBlank
	movs r1, #0xa4
	lsls r1, r1, #1
	adds r0, r4, r1
	ldr r1, [r7, #0x2c]
	ldrb r2, [r1, #9]
	movs r1, #2
	bl PutNumberOrBlank
	ldr r0, [r7, #0x2c]
	bl sub_8018E64
	cmp r0, #0x63
	ble _080C5950
	movs r1, #0xe0
	lsls r1, r1, #1
	adds r0, r4, r1
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080C5966
	.align 2, 0
_080C594C: .4byte 0x02022F4E
_080C5950:
	movs r0, #0xe1
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r0, [r7, #0x2c]
	bl sub_8018E64
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_080C5966:
	ldr r0, [r7, #0x2c]
	bl sub_8018EA4
	cmp r0, #0x63
	ble _080C5984
	ldr r0, _080C5980 @ =0x02023114
	movs r1, #2
	movs r2, #0x14
	movs r3, #0x14
	bl PutTwoSpecialChar
	b _080C5996
	.align 2, 0
_080C5980: .4byte 0x02023114
_080C5984:
	ldr r4, _080C59E8 @ =0x02023116
	ldr r0, [r7, #0x2c]
	bl sub_8018EA4
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumberOrBlank
_080C5996:
	ldr r0, _080C59EC @ =0x03005270
	bl GetNextUnclearedNode
	bl sub_80C086C
	adds r6, r0, #0
	movs r0, #0x48
	adds r1, r6, #0
	bl sub_8003EAC
	mov r8, r0
	adds r5, r7, #0
	adds r5, #0x3c
	adds r0, r5, #0
	movs r1, #5
	bl Text_Skip
	ldr r4, _080C59F0 @ =0x02022E2E
	movs r0, #0
	str r0, [sp]
	str r6, [sp, #4]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #0
	mov r3, r8
	bl sub_8004374
	adds r4, #0xd2
	bl sub_80C5830
	adds r2, r0, #0
	adds r0, r4, #0
	movs r1, #2
	bl PutNumber
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C59E8: .4byte 0x02023116
_080C59EC: .4byte 0x03005270
_080C59F0: .4byte 0x02022E2E

