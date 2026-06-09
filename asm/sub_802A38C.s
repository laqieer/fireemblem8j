	.syntax unified
	.set EquipUnitItemSlot, 0x08016968 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemWeaponEffect, 0x080174CC + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802A69C, 0x0802A69C + 1
	.set sub_802A8C8, 0x0802A8C8 + 1
	.section .text.sub_802A38C, "ax", %progbits
@ sub_802A38C @ JP 0x0802A38C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A38C
	.thumb_func
sub_802A38C:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x48
	adds r7, r0, #0
	lsls r1, r1, #0x18
	ldr r2, _0802A3E8 @ =0x0203A4D0
	movs r4, #0
	movs r3, #0
	movs r0, #4
	strh r0, [r2]
	ldr r0, _0802A3EC @ =0x0203A568
	mov ip, r0
	adds r0, #0x48
	strh r3, [r0]
	mov r0, ip
	str r3, [r0, #0x4c]
	mov r2, ip
	adds r2, #0x50
	movs r0, #0xff
	strb r0, [r2]
	mov r0, ip
	str r3, [r0, #4]
	ldr r5, _0802A3F0 @ =0x0203A4E8
	adds r0, r5, #0
	adds r0, #0x53
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	asrs r6, r1, #0x18
	lsrs r1, r1, #0x18
	cmp r1, #4
	bhi _0802A3F4
	mov r0, sp
	adds r1, r7, #0
	movs r2, #0x48
	bl memcpy
	mov r0, sp
	adds r1, r6, #0
	bl EquipUnitItemSlot
	movs r6, #0
	adds r0, r5, #0
	mov r1, sp
	bl sub_802A4F0
	b _0802A3FC
	.align 2, 0
_0802A3E8: .4byte 0x0203A4D0
_0802A3EC: .4byte 0x0203A568
_0802A3F0: .4byte 0x0203A4E8
_0802A3F4:
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_802A4F0
_0802A3FC:
	ldr r4, _0802A488 @ =0x0203A4E8
	adds r0, r4, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r4, #0
	adds r1, r6, #0
	bl sub_802A69C
	ldr r1, _0802A48C @ =0x0203A568
	adds r0, r4, #0
	bl sub_802A8C8
	adds r5, r4, #0
	adds r5, #0x48
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0x11
	bne _0802A442
	adds r2, r4, #0
	adds r2, #0x5a
	movs r0, #0x14
	ldrsb r0, [r4, r0]
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r2]
	subs r1, r1, r0
	movs r0, #0
	strh r1, [r2]
	adds r1, r4, #0
	adds r1, #0x66
	strh r0, [r1]
	adds r1, #4
	strh r0, [r1]
_0802A442:
	ldrh r0, [r5]
	cmp r0, #0
	bne _0802A458
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
	adds r0, #6
	strh r1, [r0]
_0802A458:
	ldrh r0, [r5]
	bl GetItemWeaponEffect
	cmp r0, #3
	bne _0802A46A
	adds r1, r4, #0
	adds r1, #0x5a
	movs r0, #0xff
	strh r0, [r1]
_0802A46A:
	ldrh r0, [r5]
	bl GetItemIndex
	cmp r0, #0xb5
	bne _0802A480
	adds r0, r4, #0
	adds r0, #0x5a
	movs r1, #0xff
	strh r1, [r0]
	adds r0, #0xc
	strh r1, [r0]
_0802A480:
	add sp, #0x48
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802A488: .4byte 0x0203A4E8
_0802A48C: .4byte 0x0203A568

