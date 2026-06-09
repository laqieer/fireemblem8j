	.syntax unified
	.set CanUnitBeDeployedLinkArena, 0x0809A14C + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set StartPrepErrorHelpbox, 0x0809A080 + 1
	.set sub_809A110, 0x0809A110 + 1
	.set sub_809CE9C, 0x0809CE9C + 1
	.set sub_809CF0C, 0x0809CF0C + 1
	.section .text.sub_809CF80, "ax", %progbits
@ sub_809CF80 @ JP 0x0809CF80 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809CF80
	.thumb_func
sub_809CF80:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldrh r0, [r4, #0x2e]
	bl GetUnitFromPrepList
	adds r5, r0, #0
	ldr r1, [r5, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r1
	cmp r0, #0
	beq _0809CFBC
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	movs r2, #0xe0
	lsls r2, r2, #3
_0809CFB4:
	adds r3, r4, #0
	bl StartPrepErrorHelpbox
	b _0809D050
_0809CFBC:
	movs r0, #8
	ands r1, r0
	cmp r1, #0
	beq _0809D03E
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CFFC
	adds r0, r5, #0
	bl CanUnitBeDeployedLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809CFFC
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809CFF8 @ =0x000006FD
	b _0809CFB4
	.align 2, 0
_0809CFF8: .4byte 0x000006FD
_0809CFFC:
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D034
	adds r0, r5, #0
	bl sub_809A110
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809D034
	ldrh r1, [r4, #0x2e]
	movs r2, #1
	ands r2, r1
	lsls r0, r2, #3
	subs r0, r0, r2
	lsls r0, r0, #3
	adds r0, #0x70
	lsrs r1, r1, #1
	lsls r1, r1, #4
	ldrh r2, [r4, #0x30]
	subs r1, r1, r2
	adds r1, #0x18
	ldr r2, _0809D030 @ =0x000006FB
	b _0809CFB4
	.align 2, 0
_0809D030: .4byte 0x000006FB
_0809D034:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809CE9C
	b _0809D046
_0809D03E:
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_809CF0C
_0809D046:
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809D050
	movs r0, #1
	b _0809D052
_0809D050:
	movs r0, #0
_0809D052:
	pop {r4, r5}
	pop {r1}
	bx r1

