	.syntax unified
	.set CanBattleUnitGainLevels, 0x0802B93C + 1
	.set CheckBattleUnitStatCaps, 0x0802BE6C + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_802B8E8, 0x0802B8E8 + 1
	.section .text.sub_802B970, "ax", %progbits
@ sub_802B970 @ JP 0x0802B970 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802B970
	.thumb_func
sub_802B970:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r7, r0, #0
	bl CanBattleUnitGainLevels
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802B98A
	b _0802BB36
_0802B98A:
	ldrb r0, [r7, #9]
	cmp r0, #0x63
	bhi _0802B992
	b _0802BB36
_0802B992:
	adds r3, r0, #0
	subs r3, #0x64
	strb r3, [r7, #9]
	ldrb r0, [r7, #8]
	adds r2, r0, #1
	strb r2, [r7, #8]
	ldr r0, [r7]
	ldr r1, [r7, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0xc
	ands r0, r1
	cmp r0, #0
	beq _0802B9BC
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0xa
	bne _0802B9D2
	b _0802B9C4
_0802B9BC:
	lsls r0, r2, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bne _0802B9D2
_0802B9C4:
	adds r1, r7, #0
	adds r1, #0x6e
	ldrb r0, [r1]
	subs r0, r0, r3
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r7, #9]
_0802B9D2:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r1, #0
	mov sl, r1
	cmp r0, #0
	beq _0802B9E6
	movs r0, #5
	mov sl, r0
_0802B9E6:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	add r0, sl
	bl sub_802B8E8
	adds r1, r7, #0
	adds r1, #0x73
	str r1, [sp]
	strb r0, [r1]
	movs r6, #0
	ldrsb r6, [r1, r6]
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	add r0, sl
	bl sub_802B8E8
	adds r1, r7, #0
	adds r1, #0x74
	str r1, [sp, #4]
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	add r0, sl
	bl sub_802B8E8
	movs r1, #0x75
	adds r1, r1, r7
	mov r8, r1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	add r0, sl
	bl sub_802B8E8
	movs r1, #0x76
	adds r1, r1, r7
	mov sb, r1
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	add r0, sl
	bl sub_802B8E8
	adds r5, r7, #0
	adds r5, #0x77
	strb r0, [r5]
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	add r0, sl
	bl sub_802B8E8
	adds r4, r7, #0
	adds r4, #0x78
	strb r0, [r4]
	movs r0, #0
	ldrsb r0, [r4, r0]
	adds r6, r6, r0
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	add r0, sl
	bl sub_802B8E8
	adds r1, r7, #0
	adds r1, #0x79
	strb r0, [r1]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r6, r6, r0
	ldr r0, [sp]
	str r0, [sp, #8]
	ldr r0, [sp, #4]
	str r0, [sp, #0xc]
	mov sl, r8
	mov r8, r5
	adds r5, r4, #0
	adds r4, r1, #0
	cmp r6, #0
	bne _0802BB28
	b _0802BB12
_0802BAA2:
	ldr r0, [r7]
	ldrb r0, [r0, #0x1d]
	bl sub_802B8E8
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BB28
	ldr r0, [r7]
	ldrb r0, [r0, #0x1e]
	bl sub_802B8E8
	mov r1, sl
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BB28
	ldr r0, [r7]
	ldrb r0, [r0, #0x1f]
	bl sub_802B8E8
	mov r1, sb
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BB28
	ldr r0, [r7]
	adds r0, #0x20
	ldrb r0, [r0]
	bl sub_802B8E8
	mov r1, r8
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BB28
	ldr r0, [r7]
	adds r0, #0x21
	ldrb r0, [r0]
	bl sub_802B8E8
	strb r0, [r5]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BB28
	ldr r0, [r7]
	adds r0, #0x22
	ldrb r0, [r0]
	bl sub_802B8E8
	strb r0, [r4]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802BB28
	adds r6, #1
_0802BB12:
	cmp r6, #1
	bgt _0802BB28
	ldr r0, [r7]
	ldrb r0, [r0, #0x1c]
	bl sub_802B8E8
	ldr r1, [sp, #8]
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802BAA2
_0802BB28:
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	bl GetUnit
	adds r1, r7, #0
	bl CheckBattleUnitStatCaps
_0802BB36:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

