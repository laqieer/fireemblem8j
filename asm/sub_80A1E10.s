	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set UnitRemoveInvalidItems, 0x0801772C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_809A4BC, 0x0809A4BC + 1
	.set sub_809A590, 0x0809A590 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_809F59C, 0x0809F59C + 1
	.set sub_80A1610, 0x080A1610 + 1
	.set sub_80B18C0, 0x080B18C0 + 1
	.section .text.sub_80A1E10, "ax", %progbits
@ sub_80A1E10 @ JP 0x080A1E10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1E10
	.thumb_func
sub_80A1E10:
	push {r4, r5, r6, r7, lr}
	adds r6, r0, #0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r1, [r7]
	lsls r1, r1, #1
	adds r0, #0x38
	adds r0, r0, r1
	ldrh r4, [r0]
	ldr r1, [r6, #0x2c]
	adds r0, r6, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r5, [r1]
	ldr r0, _080A1EAC @ =0x020122D4
	lsls r4, r4, #2
	adds r4, r4, r0
	ldrh r0, [r4, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	strh r5, [r4, #2]
	bl sub_809A590
	cmp r5, #0
	bne _080A1E56
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl sub_809A4BC
_080A1E56:
	adds r0, r6, #0
	bl sub_80A1610
	ldr r0, _080A1EB0 @ =0x02022EEC
	ldr r4, _080A1EB4 @ =0x02013668
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809DA14
	adds r4, #0x28
	ldr r1, _080A1EB8 @ =0x02023CC6
	ldrb r2, [r7]
	lsls r2, r2, #1
	adds r0, r6, #0
	adds r0, #0x4a
	adds r0, r0, r2
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809F59C
	ldr r0, _080A1EBC @ =sub_80A0ED8
	movs r1, #1
	adds r2, r6, #0
	bl sub_80B18C0
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _080A1EC0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1EA6
	movs r0, #0x6a
	bl m4aSongNumStart
_080A1EA6:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1EAC: .4byte 0x020122D4
_080A1EB0: .4byte 0x02022EEC
_080A1EB4: .4byte 0x02013668
_080A1EB8: .4byte 0x02023CC6
_080A1EBC: .4byte 0x080A0ED9  @ sub_80A0ED8
_080A1EC0: .4byte 0x0202BCEC

