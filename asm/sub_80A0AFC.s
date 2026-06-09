	.syntax unified
	.set AddItemToConvoy, 0x080314E0 + 1
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set UnitRemoveInvalidItems, 0x0801772C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8099FA0, 0x08099FA0 + 1
	.set sub_809A2EC, 0x0809A2EC + 1
	.set sub_809A4BC, 0x0809A4BC + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_809F59C, 0x0809F59C + 1
	.set sub_80A03A0, 0x080A03A0 + 1
	.set sub_80B18C0, 0x080B18C0 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A0AFC, "ax", %progbits
@ sub_80A0AFC @ JP 0x080A0AFC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0AFC
	.thumb_func
sub_80A0AFC:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldr r0, [r5, #0x2c]
	adds r7, r5, #0
	adds r7, #0x31
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r1, r0, #0
	adds r1, #0x1e
	adds r1, r1, r2
	ldrh r4, [r1]
	bl GetUnitItemCount
	ldr r1, [r5, #0x2c]
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r5, #0x2c]
	bl UnitRemoveInvalidItems
	adds r0, r4, #0
	bl sub_809A2EC
	adds r6, r5, #0
	adds r6, #0x35
	strb r0, [r6]
	adds r0, r4, #0
	bl AddItemToConvoy
	ldr r0, [r5, #0x2c]
	ldrb r1, [r6]
	movs r2, #1
	bl sub_809A4BC
	adds r0, r5, #0
	bl sub_80A03A0
	bl sub_80034C4
	ldr r0, _080A0BC4 @ =0x02022EEC
	ldr r4, _080A0BC8 @ =0x02013668
	ldr r2, [r5, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809DA14
	adds r4, #0x28
	ldr r1, _080A0BCC @ =0x02023CC6
	ldrb r2, [r6]
	lsls r2, r2, #1
	adds r0, r5, #0
	adds r0, #0x4c
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r5, #0x2c]
	adds r0, r4, #0
	bl sub_809F59C
	ldr r0, _080A0BD0 @ =sub_80A055C
	movs r1, #1
	adds r2, r5, #0
	bl sub_80B18C0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, [r5, #0x2c]
	bl GetUnitItemCount
	adds r4, r0, #0
	ldr r1, _080A0BD4 @ =0x0203A954
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	cmp r4, #0
	beq _080A0BA6
	bl sub_8099FA0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #0x64
	bne _080A0BDC
_080A0BA6:
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A0BD8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0C0A
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A0C0A
	.align 2, 0
_080A0BC4: .4byte 0x02022EEC
_080A0BC8: .4byte 0x02013668
_080A0BCC: .4byte 0x02023CC6
_080A0BD0: .4byte 0x080A055D  @ sub_80A055C
_080A0BD4: .4byte 0x0203A954
_080A0BD8: .4byte 0x0202BCEC
_080A0BDC:
	ldr r0, _080A0C10 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0BEE
	movs r0, #0x6a
	bl m4aSongNumStart
_080A0BEE:
	ldrb r0, [r7]
	cmp r4, r0
	bgt _080A0C0A
	subs r0, r4, #1
	strb r0, [r7]
	ldrb r1, [r7]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
_080A0C0A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A0C10: .4byte 0x0202BCEC

