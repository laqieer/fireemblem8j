	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetItemType, 0x080172F0 + 1
	.set sub_80598BC, 0x080598BC + 1
	.section .text.GetBattleAnimationId_WithUnique, "ax", %progbits
@ GetBattleAnimationId_WithUnique @ JP 0x08058AF8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetBattleAnimationId_WithUnique
	.thumb_func
GetBattleAnimationId_WithUnique:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r5, r0, #0
	adds r4, r1, #0
	mov sb, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov r8, r2
	movs r0, #0
	mov sl, r0
	cmp r4, #0
	beq _08058B2E
	mov r0, r8
	bl GetItemType
	cmp r0, #9
	bne _08058B38
	mov r0, r8
	bl sub_80598BC
	lsls r0, r0, #0x10
	cmp r0, #0
	bne _08058B38
_08058B2E:
	ldr r0, _08058B34 @ =0x0000FFFF
	b _08058BE4
	.align 2, 0
_08058B34: .4byte 0x0000FFFF
_08058B38:
	mov r1, r8
	cmp r1, #0
	bne _08058B42
	movs r3, #9
	b _08058B4C
_08058B42:
	mov r0, r8
	bl GetItemType
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
_08058B4C:
	str r4, [sp]
	ldr r2, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r2, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	lsrs r0, r0, #8
	movs r1, #1
	ands r0, r1
	adds r2, #0x25
	adds r2, r2, r0
	ldrb r0, [r2]
	cmp r0, #0
	beq _08058B72
	ldr r1, _08058B84 @ =0x08903DC0
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	str r0, [sp]
_08058B72:
	movs r0, #0
	mov r2, sb
	str r0, [r2]
	movs r7, #0
	movs r1, #0
_08058B7C:
	ldr r5, [sp]
	movs r6, #0
	b _08058BCC
	.align 2, 0
_08058B84: .4byte 0x08903DC0
_08058B88:
	cmp r7, #0
	bne _08058B90
	cmp r0, #0xff
	bhi _08058BC8
_08058B90:
	cmp r7, #1
	bne _08058B9A
	ldrh r0, [r5]
	cmp r0, #0xff
	bls _08058BC8
_08058B9A:
	ldrh r4, [r5]
	mov r0, r8
	str r1, [sp, #4]
	str r3, [sp, #8]
	bl GetItemIndex
	ldr r1, [sp, #4]
	ldr r3, [sp, #8]
	cmp r4, r0
	beq _08058BB8
	ldrh r0, [r5]
	ldr r2, _08058BC4 @ =0xFFFFFF00
	adds r0, r0, r2
	cmp r0, r3
	bne _08058BC8
_08058BB8:
	ldrh r5, [r5, #2]
	mov sl, r5
	mov r0, sb
	str r6, [r0]
	movs r1, #1
	b _08058BD2
	.align 2, 0
_08058BC4: .4byte 0xFFFFFF00
_08058BC8:
	adds r5, #4
	adds r6, #1
_08058BCC:
	ldrh r0, [r5]
	cmp r0, #0
	bne _08058B88
_08058BD2:
	cmp r1, #1
	beq _08058BDC
	adds r7, #1
	cmp r7, #1
	ble _08058B7C
_08058BDC:
	mov r0, sl
	subs r0, #1
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
_08058BE4:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

