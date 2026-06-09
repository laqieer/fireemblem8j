	.syntax unified
	.set ClearBattleHits, 0x0802AE00 + 1
	.set ComputeBattleUnitBaseDefense, 0x0802AA10 + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemType, 0x080172F0 + 1
	.set SetBattleUnitTerrainBonusesAuto, 0x0802A648 + 1
	.set sub_802A4F0, 0x0802A4F0 + 1
	.set sub_802A93C, 0x0802A93C + 1
	.section .text.sub_802CA5C, "ax", %progbits
@ sub_802CA5C @ JP 0x0802CA5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CA5C
	.thumb_func
sub_802CA5C:
	push {r4, r5, r6, r7, lr}
	adds r2, r0, #0
	adds r7, r1, #0
	lsls r1, r7, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r6, [r0]
	cmp r7, #0
	bge _0802CA70
	movs r6, #0
_0802CA70:
	ldr r1, _0802CAF4 @ =0x0203A4D0
	movs r4, #0
	movs r0, #0
	strh r0, [r1]
	ldr r5, _0802CAF8 @ =0x0203A4E8
	adds r0, r5, #0
	adds r1, r2, #0
	bl sub_802A4F0
	adds r0, r5, #0
	bl SetBattleUnitTerrainBonusesAuto
	adds r0, r5, #0
	bl ComputeBattleUnitBaseDefense
	adds r0, r5, #0
	movs r1, #0
	bl sub_802A93C
	adds r0, r5, #0
	adds r0, #0x5a
	movs r2, #0xff
	strh r2, [r0]
	adds r1, r5, #0
	adds r1, #0x64
	movs r0, #0x64
	strh r0, [r1]
	adds r0, r5, #0
	adds r0, #0x6a
	strh r2, [r0]
	subs r0, #0x22
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #7
	strb r7, [r0]
	adds r0, r6, #0
	bl GetItemType
	adds r1, r5, #0
	adds r1, #0x50
	strb r0, [r1]
	adds r0, r6, #0
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x7e
	strb r4, [r0]
	adds r1, #0x1d
	movs r0, #0xff
	strb r0, [r1]
	ldr r0, _0802CAFC @ =0x0203A568
	adds r0, #0x6f
	movs r1, #1
	rsbs r1, r1, #0
	strb r1, [r0]
	bl ClearBattleHits
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802CAF4: .4byte 0x0203A4D0
_0802CAF8: .4byte 0x0203A4E8
_0802CAFC: .4byte 0x0203A568

