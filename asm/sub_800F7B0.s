	.syntax unified
	.set sub_800F720, 0x0800F720 + 1
	.set sub_800F86C, 0x0800F86C + 1
	.set LoadUnit_0, 0x0800F8D4 + 1
	.set sub_800FE0C, 0x0800FE0C + 1
	.set sub_800FE54, 0x0800FE54 + 1
	.section .text.sub_800F7B0, "ax", %progbits
@ sub_800F7B0 @ JP 0x0800F7B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F7B0
	.thumb_func
sub_800F7B0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r6, r0, #0
	ldr r4, [r6, #0x48]
	adds r7, r6, #0
	adds r7, #0x4c
	movs r0, #0
	ldrsh r5, [r7, r0]
	adds r0, r6, #0
	adds r0, #0x4f
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r8, r0
	adds r0, r6, #0
	movs r1, #1
	bl sub_800FE54
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	movs r3, #0
	mov r0, r8
	cmp r0, #2
	bne _0800F7EA
	movs r3, #1
_0800F7EA:
	mov sb, r3
	ldrh r0, [r6, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _0800F846
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, r8
	bl sub_800F86C
	b _0800F850
_0800F804:
	str r4, [r6, #0x48]
	strh r5, [r7]
	b _0800F85E
_0800F80A:
	adds r0, r4, #0
	mov r1, r8
	bl sub_800F720
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0800F844
	ldrb r1, [r4, #4]
	lsls r1, r1, #0x1a
	lsrs r1, r1, #0x1a
	ldrh r2, [r4, #4]
	lsls r2, r2, #0x14
	lsrs r2, r2, #0x1a
	adds r0, r6, #0
	bl sub_800FE0C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0800F804
	adds r0, r4, #0
	mov r1, sl
	movs r2, #0
	mov r3, sb
	bl LoadUnit_0
	subs r0, r5, #1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
_0800F844:
	adds r4, #0x14
_0800F846:
	ldrb r0, [r4]
	cmp r0, #0
	beq _0800F850
	cmp r5, #0
	bgt _0800F80A
_0800F850:
	movs r1, #0
	movs r0, #0
	strh r0, [r7]
	adds r2, r6, #0
	adds r2, #0x4e
	strb r1, [r2]
	str r0, [r6, #0x2c]
_0800F85E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

