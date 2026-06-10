	.syntax unified
	.set GetClassData, 0x0801911C + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.section .text.sub_802BC98, "ax", %progbits
@ sub_802BC98 @ JP 0x0802BC98 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802BC98
	.thumb_func
sub_802BC98:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	lsls r0, r1, #0x18
	lsrs r0, r0, #0x18
	bl GetClassData
	adds r4, r0, #0
	ldr r0, [r5, #4]
	ldrb r0, [r0, #4]
	mov r8, r0
	ldrb r0, [r4, #4]
	mov sb, r0
	adds r6, r4, #0
	adds r6, #0x22
	ldrb r0, [r6]
	ldrb r1, [r5, #0x12]
	adds r0, r0, r1
	strb r0, [r5, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x13]
	movs r1, #0x13
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BCD2
	strb r2, [r5, #0x12]
_0802BCD2:
	adds r0, r4, #0
	adds r0, #0x23
	ldrb r0, [r0]
	ldrb r1, [r5, #0x14]
	adds r0, r0, r1
	strb r0, [r5, #0x14]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x14]
	movs r1, #0x14
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BCEE
	strb r2, [r5, #0x14]
_0802BCEE:
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	ldrb r1, [r5, #0x15]
	adds r0, r0, r1
	strb r0, [r5, #0x15]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x15]
	movs r1, #0x15
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BD0A
	strb r2, [r5, #0x15]
_0802BD0A:
	adds r0, r4, #0
	adds r0, #0x25
	ldrb r0, [r0]
	ldrb r1, [r5, #0x16]
	adds r0, r0, r1
	strb r0, [r5, #0x16]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x16]
	movs r1, #0x16
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BD26
	strb r2, [r5, #0x16]
_0802BD26:
	adds r0, r4, #0
	adds r0, #0x26
	ldrb r0, [r0]
	ldrb r1, [r5, #0x17]
	adds r0, r0, r1
	strb r0, [r5, #0x17]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x17]
	movs r1, #0x17
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BD42
	strb r2, [r5, #0x17]
_0802BD42:
	adds r0, r4, #0
	adds r0, #0x27
	ldrb r0, [r0]
	ldrb r1, [r5, #0x18]
	adds r0, r0, r1
	strb r0, [r5, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r2, [r4, #0x18]
	movs r1, #0x18
	ldrsb r1, [r4, r1]
	cmp r0, r1
	ble _0802BD5E
	strb r2, [r5, #0x18]
_0802BD5E:
	movs r3, #0
	mov ip, r6
	adds r7, r5, #0
	adds r7, #0x28
	adds r6, r7, #0
_0802BD68:
	adds r2, r6, r3
	ldr r0, [r5, #4]
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r1, [r2]
	ldrb r0, [r0]
	subs r1, r1, r0
	strb r1, [r2]
	adds r3, #1
	cmp r3, #7
	ble _0802BD68
	str r4, [r5, #4]
	movs r3, #0
	adds r4, r7, #0
_0802BD84:
	adds r2, r4, r3
	ldrb r1, [r2]
	ldr r0, [r5, #4]
	adds r0, #0x2c
	adds r0, r0, r3
	ldrb r0, [r0]
	adds r1, r1, r0
	cmp r1, #0xfb
	ble _0802BD98
	movs r1, #0xfb
_0802BD98:
	strb r1, [r2]
	adds r3, #1
	cmp r3, #7
	ble _0802BD84
	mov r0, r8
	cmp r0, #0x3e
	bne _0802BDB4
	mov r1, sb
	cmp r1, #0x2d
	bne _0802BDB4
	adds r1, r5, #0
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
_0802BDB4:
	movs r1, #0
	movs r0, #1
	strb r0, [r5, #8]
	strb r1, [r5, #9]
	mov r1, ip
	ldrb r0, [r1]
	ldrb r1, [r5, #0x13]
	adds r0, r0, r1
	strb r0, [r5, #0x13]
	movs r4, #0x13
	ldrsb r4, [r5, r4]
	adds r0, r5, #0
	bl sub_8018EA4
	cmp r4, r0
	ble _0802BDDC
	adds r0, r5, #0
	bl sub_8018EA4
	strb r0, [r5, #0x13]
_0802BDDC:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

