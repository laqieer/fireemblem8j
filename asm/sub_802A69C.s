	.syntax unified
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemType, 0x080172F0 + 1
	.set GetUnitEquippedWeaponSlot, 0x08016900 + 1
	.set IsItemCoveringRange, 0x08016934 + 1
	.set sub_8037A24, 0x08037A24 + 1
	.section .text.sub_802A69C, "ax", %progbits
@ sub_802A69C @ JP 0x0802A69C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802A69C
	.thumb_func
sub_802A69C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	adds r3, r1, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r3, r0
	bne _0802A6B8
	adds r0, r5, #0
	bl GetUnitEquippedWeaponSlot
	adds r3, r0, #0
_0802A6B8:
	ldr r0, [r5, #0xc]
	movs r1, #0x80
	lsls r1, r1, #4
	ands r0, r1
	cmp r0, #0
	beq _0802A6C6
	movs r3, #8
_0802A6C6:
	adds r1, r5, #0
	adds r1, #0x52
	movs r0, #1
	strb r0, [r1]
	mov sb, r1
	cmp r3, #8
	bhi _0802A79C
	lsls r0, r3, #2
	ldr r1, _0802A6E0 @ =_0802A6E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0802A6E0: .4byte _0802A6E4
_0802A6E4: @ jump table
	.4byte _0802A708 @ case 0
	.4byte _0802A708 @ case 1
	.4byte _0802A708 @ case 2
	.4byte _0802A708 @ case 3
	.4byte _0802A708 @ case 4
	.4byte _0802A71C @ case 5
	.4byte _0802A738 @ case 6
	.4byte _0802A758 @ case 7
	.4byte _0802A778 @ case 8
_0802A708:
	adds r2, r5, #0
	adds r2, #0x51
	strb r3, [r2]
	ldrb r1, [r2]
	lsls r1, r1, #1
	adds r0, r5, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	b _0802A728
_0802A71C:
	adds r2, r5, #0
	adds r2, #0x51
	movs r0, #0xff
	strb r0, [r2]
	ldr r0, _0802A734 @ =0x0202BCAC
	ldrh r0, [r0, #0x2c]
_0802A728:
	adds r1, r5, #0
	adds r1, #0x48
	strh r0, [r1]
	mov r8, r2
	adds r4, r1, #0
	b _0802A7B6
	.align 2, 0
_0802A734: .4byte 0x0202BCAC
_0802A738:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802A754 @ =0x0203A8EC
	ldrh r1, [r0, #0x1a]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _0802A7B2
	.align 2, 0
_0802A754: .4byte 0x0203A8EC
_0802A758:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0
	strb r0, [r3]
	ldr r0, _0802A774 @ =0x0203A8EC
	ldrh r1, [r0, #0x1c]
	adds r2, r5, #0
	adds r2, #0x48
	movs r0, #0
	strh r1, [r2]
	mov r1, sb
	strb r0, [r1]
	b _0802A7B2
	.align 2, 0
_0802A774: .4byte 0x0203A8EC
_0802A778:
	adds r4, r5, #0
	adds r4, #0x51
	movs r0, #0xff
	strb r0, [r4]
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	bl sub_8037A24
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
	mov r8, r4
	b _0802A7B4
_0802A79C:
	adds r3, r5, #0
	adds r3, #0x51
	movs r0, #0xff
	strb r0, [r3]
	adds r2, r5, #0
	adds r2, #0x48
	movs r1, #0
	movs r0, #0
	strh r0, [r2]
	mov r0, sb
	strb r1, [r0]
_0802A7B2:
	mov r8, r3
_0802A7B4:
	adds r4, r2, #0
_0802A7B6:
	ldrh r0, [r4]
	adds r1, r5, #0
	adds r1, #0x4a
	strh r0, [r1]
	ldrh r0, [r4]
	bl GetItemAttributes
	str r0, [r5, #0x4c]
	ldrh r0, [r4]
	bl GetItemType
	adds r6, r5, #0
	adds r6, #0x50
	strb r0, [r6]
	ldr r7, _0802A7FC @ =0x0203A4D0
	ldrh r1, [r7]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0802A876
	ldr r0, [r5, #0x4c]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0802A828
	ldrh r0, [r4]
	bl GetItemIndex
	cmp r0, #0x11
	beq _0802A824
	cmp r0, #0x11
	bgt _0802A800
	cmp r0, #0x10
	beq _0802A80E
	b _0802A828
	.align 2, 0
_0802A7FC: .4byte 0x0203A4D0
_0802A800:
	cmp r0, #0xa1
	bne _0802A828
	ldrb r0, [r7, #2]
	cmp r0, #2
	bne _0802A818
	movs r0, #5
	b _0802A826
_0802A80E:
	ldrb r0, [r7, #2]
	cmp r0, #2
	bne _0802A818
	movs r0, #6
	b _0802A826
_0802A818:
	ldr r0, [r5, #0x4c]
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0x4c]
	b _0802A828
_0802A824:
	movs r0, #7
_0802A826:
	strb r0, [r6]
_0802A828:
	ldrh r0, [r4]
	ldr r1, _0802A864 @ =0x0203A4D0
	ldrb r1, [r1, #2]
	bl IsItemCoveringRange
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802A840
	mov r1, r8
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _0802A84A
_0802A840:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_0802A84A:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1c
	cmp r0, #0xb
	beq _0802A86C
	cmp r0, #0xb
	bgt _0802A868
	cmp r0, #2
	beq _0802A86C
	b _0802A876
	.align 2, 0
_0802A864: .4byte 0x0203A4D0
_0802A868:
	cmp r0, #0xd
	bne _0802A876
_0802A86C:
	movs r1, #0
	movs r0, #0
	strh r0, [r4]
	mov r0, sb
	strb r1, [r0]
_0802A876:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

