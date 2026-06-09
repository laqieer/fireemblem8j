	.syntax unified
	.set AddPartyGoldAmount, 0x08024DD0 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set UnitRemoveInvalidItems, 0x0801772C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_80A22D0, 0x080A22D0 + 1
	.set sub_80B9DEC, 0x080B9DEC + 1
	.section .text.sub_80A2858, "ax", %progbits
@ sub_80A2858 @ JP 0x080A2858 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2858
	.thumb_func
sub_80A2858:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, [r4, #0x2c]
	adds r5, r4, #0
	adds r5, #0x30
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80B9DEC
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl AddPartyGoldAmount
	ldr r1, [r4, #0x2c]
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	movs r0, #0
	strh r0, [r1]
	ldr r0, [r4, #0x2c]
	bl UnitRemoveInvalidItems
	ldr r0, _080A28C4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A289E
	movs r0, #0xb9
	bl m4aSongNumStart
_080A289E:
	bl sub_80A22D0
	ldr r0, [r4, #0x2c]
	bl GetUnitItemCount
	cmp r0, #0
	bne _080A28D0
	ldr r0, _080A28C8 @ =0x02022EEC
	ldr r1, _080A28CC @ =0x02013668
	ldr r2, [r4, #0x2c]
	movs r3, #0
	bl sub_809DA14
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	b _080A28E2
	.align 2, 0
_080A28C4: .4byte 0x0202BCEC
_080A28C8: .4byte 0x02022EEC
_080A28CC: .4byte 0x02013668
_080A28D0:
	ldrb r1, [r5]
	cmp r0, r1
	bne _080A28DA
	subs r0, #1
	strb r0, [r5]
_080A28DA:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080A28E2:
	pop {r4, r5}
	pop {r0}
	bx r0

