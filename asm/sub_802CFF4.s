	.syntax unified
	.set sub_802B8E8, 0x0802B8E8 + 1
	.section .text.sub_802CFF4, "ax", %progbits
@ sub_802CFF4 @ JP 0x0802CFF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802CFF4
	.thumb_func
sub_802CFF4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldrb r1, [r4, #8]
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0x14
	bne _0802D00E
	b _0802D1DC
_0802D00E:
	movs r0, #0
	strb r0, [r4, #9]
	adds r0, r1, #1
	strb r0, [r4, #8]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x14
	bne _0802D022
	movs r0, #0xff
	strb r0, [r4, #9]
_0802D022:
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	movs r6, #0
	cmp r0, #0
	beq _0802D032
	movs r6, #5
_0802D032:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	adds r0, r6, r0
	bl sub_802B8E8
	mov r8, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	adds r0, r6, r0
	bl sub_802B8E8
	str r0, [sp]
	adds r5, r0, #0
	add r5, r8
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	adds r0, r6, r0
	bl sub_802B8E8
	str r0, [sp, #4]
	adds r5, r5, r0
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	adds r0, r6, r0
	bl sub_802B8E8
	mov sl, r0
	add r5, sl
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	adds r0, r6, r0
	bl sub_802B8E8
	mov sb, r0
	add r5, sb
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	adds r0, r6, r0
	bl sub_802B8E8
	adds r7, r0, #0
	adds r5, r5, r7
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	adds r0, r6, r0
	bl sub_802B8E8
	adds r6, r0, #0
	adds r5, r5, r6
	cmp r5, #0
	bne _0802D10E
	b _0802D0E0
_0802D0A0:
	ldr r0, [r4]
	ldrb r0, [r0, #0x1f]
	bl sub_802B8E8
	mov sl, r0
	cmp r0, #0
	bne _0802D10E
	ldr r0, [r4]
	adds r0, #0x20
	ldrb r0, [r0]
	bl sub_802B8E8
	mov sb, r0
	cmp r0, #0
	bne _0802D10E
	ldr r0, [r4]
	adds r0, #0x21
	ldrb r0, [r0]
	bl sub_802B8E8
	adds r7, r0, #0
	cmp r7, #0
	bne _0802D10E
	ldr r0, [r4]
	adds r0, #0x22
	ldrb r0, [r0]
	bl sub_802B8E8
	adds r6, r0, #0
	cmp r6, #0
	bne _0802D10E
	adds r5, #1
_0802D0E0:
	cmp r5, #1
	bgt _0802D10E
	ldr r0, [r4]
	ldrb r0, [r0, #0x1c]
	bl sub_802B8E8
	mov r8, r0
	cmp r0, #0
	bne _0802D10E
	ldr r0, [r4]
	ldrb r0, [r0, #0x1d]
	bl sub_802B8E8
	str r0, [sp]
	cmp r0, #0
	bne _0802D10E
	ldr r0, [r4]
	ldrb r0, [r0, #0x1e]
	bl sub_802B8E8
	str r0, [sp, #4]
	cmp r0, #0
	beq _0802D0A0
_0802D10E:
	movs r2, #0x12
	ldrsb r2, [r4, r2]
	mov r0, r8
	adds r3, r2, r0
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802D128
	cmp r3, #0x78
	bgt _0802D12C
	b _0802D13E
_0802D128:
	cmp r3, #0x3c
	ble _0802D13E
_0802D12C:
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802D138
	movs r0, #0x78
	b _0802D13A
_0802D138:
	movs r0, #0x3c
_0802D13A:
	subs r0, r0, r2
	mov r8, r0
_0802D13E:
	movs r2, #0x14
	ldrsb r2, [r4, r2]
	ldr r1, [sp]
	adds r0, r2, r1
	ldr r3, [r4, #4]
	movs r1, #0x14
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D154
	subs r1, r1, r2
	str r1, [sp]
_0802D154:
	movs r2, #0x15
	ldrsb r2, [r4, r2]
	ldr r1, [sp, #4]
	adds r0, r2, r1
	movs r1, #0x15
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D168
	subs r1, r1, r2
	str r1, [sp, #4]
_0802D168:
	movs r2, #0x16
	ldrsb r2, [r4, r2]
	mov r1, sl
	adds r0, r2, r1
	movs r1, #0x16
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D17C
	subs r1, r1, r2
	mov sl, r1
_0802D17C:
	movs r2, #0x17
	ldrsb r2, [r4, r2]
	mov r1, sb
	adds r0, r2, r1
	movs r1, #0x17
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D190
	subs r1, r1, r2
	mov sb, r1
_0802D190:
	movs r2, #0x18
	ldrsb r2, [r4, r2]
	adds r0, r2, r7
	movs r1, #0x18
	ldrsb r1, [r3, r1]
	cmp r0, r1
	ble _0802D1A0
	subs r7, r1, r2
_0802D1A0:
	movs r1, #0x19
	ldrsb r1, [r4, r1]
	adds r0, r1, r6
	cmp r0, #0x1e
	ble _0802D1AE
	movs r0, #0x1e
	subs r6, r0, r1
_0802D1AE:
	ldrb r0, [r4, #0x12]
	add r0, r8
	strb r0, [r4, #0x12]
	ldrb r0, [r4, #0x14]
	ldr r1, [sp]
	adds r0, r0, r1
	strb r0, [r4, #0x14]
	ldrb r0, [r4, #0x15]
	ldr r1, [sp, #4]
	adds r0, r0, r1
	strb r0, [r4, #0x15]
	ldrb r0, [r4, #0x16]
	add r0, sl
	strb r0, [r4, #0x16]
	ldrb r0, [r4, #0x17]
	add r0, sb
	strb r0, [r4, #0x17]
	ldrb r0, [r4, #0x18]
	adds r0, r0, r7
	strb r0, [r4, #0x18]
	ldrb r0, [r4, #0x19]
	adds r0, r0, r6
	strb r0, [r4, #0x19]
_0802D1DC:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

