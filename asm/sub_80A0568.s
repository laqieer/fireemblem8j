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
	.set sub_80A03A0, 0x080A03A0 + 1
	.set sub_80B18C0, 0x080B18C0 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A0568, "ax", %progbits
@ sub_80A0568 @ JP 0x080A0568 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A0568
	.thumb_func
sub_80A0568:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	adds r2, r0, #0
	cmp r2, #5
	beq _080A0584
	ldr r0, _080A059C @ =0x02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _080A05A4
_080A0584:
	ldr r0, _080A05A0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A0592
	b _080A06B2
_080A0592:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080A06B2
	.align 2, 0
_080A059C: .4byte 0x02012F56
_080A05A0: .4byte 0x0202BCEC
_080A05A4:
	movs r5, #0
	strh r5, [r7, #0x38]
	ldr r1, [r7, #0x2c]
	lsls r0, r2, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldr r4, _080A0684 @ =0x020122D4
	movs r0, #0x35
	adds r0, r0, r7
	mov r8, r0
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r6, r7, #0
	adds r6, #0x3a
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	ldrh r0, [r0, #2]
	strh r0, [r1]
	ldr r0, [r7, #0x2c]
	bl UnitRemoveInvalidItems
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r0, [r0]
	lsls r0, r0, #2
	adds r0, r0, r4
	strh r5, [r0, #2]
	bl sub_809A590
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #1
	bl sub_809A4BC
	adds r0, r7, #0
	bl sub_80A03A0
	bl sub_80034C4
	ldr r0, _080A0688 @ =0x02022EEC
	ldr r4, _080A068C @ =0x02013668
	ldr r2, [r7, #0x2c]
	adds r1, r4, #0
	movs r3, #0
	bl sub_809DA14
	adds r4, #0x28
	ldr r1, _080A0690 @ =0x02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r5, r7, #0
	adds r5, #0x4c
	adds r0, r5, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809F59C
	ldr r0, _080A0694 @ =sub_80A055C
	movs r1, #1
	adds r2, r7, #0
	bl sub_80B18C0
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r6, r6, r0
	ldrh r1, [r6]
	lsls r1, r1, #4
	adds r5, r5, r0
	ldrh r0, [r5]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80B1FBC
	movs r0, #5
	bl BG_EnableSyncByMask
	ldr r1, _080A0698 @ =0x0203A954
	movs r0, #0x1c
	strb r0, [r1, #0x11]
	ldr r0, [r7, #0x2c]
	bl GetUnitItemCount
	cmp r0, #5
	bne _080A06A0
	adds r0, r7, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A069C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06B2
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A06B2
	.align 2, 0
_080A0684: .4byte 0x020122D4
_080A0688: .4byte 0x02022EEC
_080A068C: .4byte 0x02013668
_080A0690: .4byte 0x02023CC6
_080A0694: .4byte 0x080A055D  @ sub_80A055C
_080A0698: .4byte 0x0203A954
_080A069C: .4byte 0x0202BCEC
_080A06A0:
	ldr r0, _080A06BC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A06B2
	movs r0, #0x6a
	bl m4aSongNumStart
_080A06B2:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A06BC: .4byte 0x0202BCEC

