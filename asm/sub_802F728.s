	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemStatBonuses, 0x08017490 + 1
	.set UnitCheckStatCaps, 0x08017EDC + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_80186A8, 0x080186A8 + 1
	.section .text.sub_802F728, "ax", %progbits
@ ApplyStatBoostItem @ JP 0x0802F728 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ApplyStatBoostItem
	.thumb_func
ApplyStatBoostItem:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r7, r1, #0
	movs r5, #0
	lsls r0, r7, #1
	adds r1, r4, #0
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r6, [r1]
	adds r0, r6, #0
	bl GetItemIndex
	cmp r0, #0x89
	bne _0802F760
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_80186A8
	ldr r0, _0802F75C @ =0x0000081A
	b _0802F858
	.align 2, 0
_0802F75C: .4byte 0x0000081A
_0802F760:
	adds r0, r6, #0
	bl GetItemStatBonuses
	ldrb r1, [r0]
	ldrb r2, [r4, #0x12]
	adds r1, r1, r2
	strb r1, [r4, #0x12]
	ldrb r1, [r0]
	ldrb r2, [r4, #0x13]
	adds r1, r1, r2
	strb r1, [r4, #0x13]
	ldrb r1, [r0, #1]
	ldrb r2, [r4, #0x14]
	adds r1, r1, r2
	strb r1, [r4, #0x14]
	ldrb r1, [r0, #2]
	ldrb r2, [r4, #0x15]
	adds r1, r1, r2
	strb r1, [r4, #0x15]
	ldrb r1, [r0, #3]
	ldrb r2, [r4, #0x16]
	adds r1, r1, r2
	strb r1, [r4, #0x16]
	ldrb r1, [r0, #4]
	ldrb r2, [r4, #0x17]
	adds r1, r1, r2
	strb r1, [r4, #0x17]
	ldrb r1, [r0, #5]
	ldrb r2, [r4, #0x18]
	adds r1, r1, r2
	strb r1, [r4, #0x18]
	ldrb r1, [r0, #6]
	ldrb r2, [r4, #0x19]
	adds r1, r1, r2
	strb r1, [r4, #0x19]
	ldrb r1, [r0, #7]
	ldrb r2, [r4, #0x1d]
	adds r1, r1, r2
	strb r1, [r4, #0x1d]
	ldrb r0, [r0, #8]
	ldrb r1, [r4, #0x1a]
	adds r0, r0, r1
	strb r0, [r4, #0x1a]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r4, #0
	adds r1, r7, #0
	bl sub_80186A8
	adds r0, r6, #0
	bl GetItemIndex
	subs r0, #0x5b
	cmp r0, #8
	bhi _0802F856
	lsls r0, r0, #2
	ldr r1, _0802F7DC @ =_0802F7E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802F7DC: .4byte _0802F7E0
_0802F7E0: @ jump table
	.4byte _0802F814 @ case 0
	.4byte _0802F844 @ case 1
	.4byte _0802F804 @ case 2
	.4byte _0802F824 @ case 3
	.4byte _0802F80C @ case 4
	.4byte _0802F81C @ case 5
	.4byte _0802F82C @ case 6
	.4byte _0802F834 @ case 7
	.4byte _0802F83C @ case 8
_0802F804:
	ldr r5, _0802F808 @ =0x00000812
	b _0802F856
	.align 2, 0
_0802F808: .4byte 0x00000812
_0802F80C:
	ldr r5, _0802F810 @ =0x00000814
	b _0802F856
	.align 2, 0
_0802F810: .4byte 0x00000814
_0802F814:
	ldr r5, _0802F818 @ =0x00000819
	b _0802F856
	.align 2, 0
_0802F818: .4byte 0x00000819
_0802F81C:
	ldr r5, _0802F820 @ =0x00000815
	b _0802F856
	.align 2, 0
_0802F820: .4byte 0x00000815
_0802F824:
	ldr r5, _0802F828 @ =0x00000813
	b _0802F856
	.align 2, 0
_0802F828: .4byte 0x00000813
_0802F82C:
	ldr r5, _0802F830 @ =0x00000816
	b _0802F856
	.align 2, 0
_0802F830: .4byte 0x00000816
_0802F834:
	ldr r5, _0802F838 @ =0x00000817
	b _0802F856
	.align 2, 0
_0802F838: .4byte 0x00000817
_0802F83C:
	ldr r5, _0802F840 @ =0x00000818
	b _0802F856
	.align 2, 0
_0802F840: .4byte 0x00000818
_0802F844:
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	movs r5, #0x81
	lsls r5, r5, #4
	cmp r0, #0
	beq _0802F856
	adds r5, #1
_0802F856:
	adds r0, r5, #0
_0802F858:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

