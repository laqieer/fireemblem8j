	.syntax unified
	.set CanUnitBeDeployedLinkArena, 0x0809A14C + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set StartPrepErrorHelpbox, 0x0809A080 + 1
	.set sub_80934BC, 0x080934BC + 1
	.set sub_8093560, 0x08093560 + 1
	.set sub_809A110, 0x0809A110 + 1
	.section .text.sub_8093604, "ax", %progbits
@ UnitList_TogglePrepDeployState @ JP 0x08093604 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitList_TogglePrepDeployState
	.thumb_func
UnitList_TogglePrepDeployState:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r0, #0x30
	ldrb r0, [r0]
	ldr r1, _08093634 @ =0x0200D6E0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r5, [r0]
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _08093638
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	movs r2, #0xe0
	lsls r2, r2, #3
	b _0809368A
	.align 2, 0
_08093634: .4byte 0x0200D6E0
_08093638:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _080936A2
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093668
	adds r0, r5, #0
	bl CanUnitBeDeployedLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093668
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, _08093664 @ =0x000006FD
	b _0809368A
	.align 2, 0
_08093664: .4byte 0x000006FD
_08093668:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08093698
	adds r0, r5, #0
	bl sub_809A110
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08093698
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r1, [r0]
	lsls r1, r1, #4
	adds r1, #0x38
	ldr r2, _08093694 @ =0x000006FB
_0809368A:
	movs r0, #0
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _080936AA
	.align 2, 0
_08093694: .4byte 0x000006FB
_08093698:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80934BC
	b _080936AA
_080936A2:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_8093560
_080936AA:
	pop {r4, r5}
	pop {r0}
	bx r0

