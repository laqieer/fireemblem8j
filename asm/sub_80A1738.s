	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set UnitRemoveInvalidItems, 0x0801772C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_809A4BC, 0x0809A4BC + 1
	.set sub_809A590, 0x0809A590 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_809F59C, 0x0809F59C + 1
	.set sub_80A1610, 0x080A1610 + 1
	.set sub_80B18C0, 0x080B18C0 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A1738, "ax", %progbits
@ sub_80A1738 @ JP 0x080A1738 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1738
	.thumb_func
sub_80A1738:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r6, r0, #0
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _080A1756
	ldr r0, _080A176C @ =0x02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _080A1774
_080A1756:
	ldr r0, _080A1770 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A1764
	b _080A1882
_080A1764:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080A1882
	.align 2, 0
_080A176C: .4byte 0x02012F56
_080A1770: .4byte 0x0202BCEC
_080A1774:
	movs r4, #0
	strh r4, [r6, #0x36]
	ldr r1, [r6, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r0, _080A1858 @ =0x020122D4
	mov sb, r0
	adds r7, r6, #0
	adds r7, #0x33
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r5, r6, #0
	adds r5, #0x38
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r6, #0x2c]
	bl UnitRemoveInvalidItems
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	strh r4, [r0, #2]
	bl sub_809A590
	ldr r0, [r6, #0x2c]
	ldrb r1, [r7]
	movs r2, #3
	bl sub_809A4BC
	adds r0, r6, #0
	bl sub_80A1610
	bl sub_80034C4
	ldr r0, _080A185C @ =0x02022EEC
	ldr r4, _080A1860 @ =0x02013668
	ldr r2, [r6, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809DA14
	adds r4, #0x28
	ldr r1, _080A1864 @ =0x02023CC6
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r2, #0x4a
	adds r2, r2, r6
	mov r8, r2
	add r0, r8
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r6, #0x2c]
	adds r0, r4, #0
	bl sub_809F59C
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	add r0, sb
	ldrb r0, [r0]
	cmp r0, #0
	beq _080A180E
	ldr r0, _080A1868 @ =sub_80A0ED8
	movs r1, #1
	adds r2, r6, #0
	bl sub_80B18C0
_080A180E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	add r0, r8
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80B1FBC
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _080A1870
	adds r0, r6, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A186C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1882
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A1882
	.align 2, 0
_080A1858: .4byte 0x020122D4
_080A185C: .4byte 0x02022EEC
_080A1860: .4byte 0x02013668
_080A1864: .4byte 0x02023CC6
_080A1868: .4byte 0x080A0ED9  @ sub_80A0ED8
_080A186C: .4byte 0x0202BCEC
_080A1870:
	ldr r0, _080A1890 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1882
	movs r0, #0x6a
	bl m4aSongNumStart
_080A1882:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1890: .4byte 0x0202BCEC

