	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetGMapBaseMenuKind, 0x080C8E28 + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set PutText, 0x08003DA0 + 1
	.set UnitHasItem, 0x080177A0 + 1
	.set __modsi3, 0x080D6690 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_809C3E8, "ax", %progbits
@ PrepItem_DrawUnitNameRow @ JP 0x0809C3E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItem_DrawUnitNameRow
	.thumb_func
PrepItem_DrawUnitNameRow:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	mov sl, r1
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	mov sb, r2
	lsls r0, r1, #1
	add r0, sl
	str r0, [sp]
	movs r1, #0xf
	bl __modsi3
	lsls r0, r0, #3
	ldr r1, _0809C490 @ =0x02013498
	adds r4, r0, r1
	ldr r0, _0809C494 @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809C42A
	bl GetGMapBaseMenuKind
	movs r1, #1
	str r1, [sp, #4]
	cmp r0, #2
	beq _0809C42E
_0809C42A:
	movs r0, #0
	str r0, [sp, #4]
_0809C42E:
	movs r7, #0
_0809C430:
	mov r1, sb
	cmp r1, #0
	bne _0809C43C
	adds r0, r4, #0
	bl sub_8003CF8
_0809C43C:
	ldr r0, [sp]
	adds r5, r0, r7
	bl PrepGetUnitAmount
	cmp r5, r0
	bge _0809C4CA
	adds r0, r7, #0
	movs r1, #3
	bl __modsi3
	lsls r0, r0, #3
	mov r8, r0
	mov r1, sl
	lsls r6, r1, #1
	movs r0, #0x1f
	ands r6, r0
	mov r0, sb
	cmp r0, #0
	bne _0809C4BA
	adds r0, r5, #0
	bl GetUnitFromPrepList
	adds r5, r0, #0
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D84
	ldr r1, [sp, #4]
	cmp r1, #0
	beq _0809C4A2
	adds r0, r5, #0
	movs r1, #0x72
	bl UnitHasItem
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809C498
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	b _0809C4AA
	.align 2, 0
_0809C490: .4byte 0x02013498
_0809C494: .4byte 0x03005270
_0809C498:
	adds r0, r4, #0
	movs r1, #1
	bl sub_8003D90
	b _0809C4AA
_0809C4A2:
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
_0809C4AA:
	ldr r0, [r5]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
_0809C4BA:
	lsls r1, r6, #5
	add r1, r8
	lsls r1, r1, #1
	ldr r0, _0809C4E8 @ =0x02023CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
_0809C4CA:
	adds r4, #8
	adds r7, #1
	cmp r7, #2
	ble _0809C430
	movs r0, #4
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809C4E8: .4byte 0x02023CA8

