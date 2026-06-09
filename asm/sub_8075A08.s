	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8003F98, 0x08003F98 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_8075A08, "ax", %progbits
@ sub_8075A08 @ JP 0x08075A08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8075A08
	.thumb_func
sub_8075A08:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r2, r0, #0
	ldr r0, [r2, #0x5c]
	cmp r0, #0
	bne _08075A30
	ldr r0, _08075A24 @ =0x0203E184
	ldr r4, [r0]
	ldr r0, _08075A28 @ =0x02020108
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08075A2C @ =0x0203E188
	b _08075A3C
	.align 2, 0
_08075A24: .4byte 0x0203E184
_08075A28: .4byte 0x02020108
_08075A2C: .4byte 0x0203E188
_08075A30:
	ldr r0, _08075B4C @ =0x0203E188
	ldr r4, [r0]
	ldr r0, _08075B50 @ =0x02020108
	adds r6, r4, #0
	str r6, [r0]
	ldr r0, _08075B54 @ =0x0203E184
_08075A3C:
	ldr r1, _08075B58 @ =0x0202010C
	ldr r3, [r0]
	str r3, [r1]
	adds r0, r2, #0
	adds r0, #0x2a
	ldrb r0, [r0]
	cmp r0, #0
	beq _08075A4E
	b _08075B6C
_08075A4E:
	movs r0, #0xb
	ldrsb r0, [r6, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r1, _08075B5C @ =0x02020110
	adds r3, r4, #0
	adds r3, #0x70
	movs r0, #0
	ldrsb r0, [r3, r0]
	strh r0, [r1]
	ldr r2, _08075B60 @ =0x02020114
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08075B64 @ =0x02020112
	movs r0, #0
	ldrsb r0, [r3, r0]
	adds r0, #1
	strh r0, [r1]
	ldr r2, _08075B68 @ =0x02020124
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x73
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x74
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x75
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x79
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x76
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x77
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	adds r1, r4, #0
	adds r1, #0x78
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	movs r1, #0x11
	ldrsb r1, [r0, r1]
	ldr r0, [r6]
	ldrb r0, [r0, #0x13]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	adds r0, r4, #0
	adds r0, #0x7a
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _08075BF6
	.align 2, 0
_08075B4C: .4byte 0x0203E188
_08075B50: .4byte 0x02020108
_08075B54: .4byte 0x0203E184
_08075B58: .4byte 0x0202010C
_08075B5C: .4byte 0x02020110
_08075B60: .4byte 0x02020114
_08075B64: .4byte 0x02020112
_08075B68: .4byte 0x02020124
_08075B6C:
	ldr r1, _08075C1C @ =0x02020110
	movs r0, #8
	ldrsb r0, [r6, r0]
	strh r0, [r1]
	ldr r2, _08075C20 @ =0x02020114
	movs r0, #0x12
	ldrsb r0, [r6, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r6, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r6, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r6, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r6, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r6, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r6, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r6]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r1, _08075C24 @ =0x02020112
	movs r0, #1
	strh r0, [r1]
	ldr r2, _08075C28 @ =0x02020124
	movs r0, #0x12
	ldrsb r0, [r3, r0]
	strh r0, [r2]
	movs r0, #0x14
	ldrsb r0, [r3, r0]
	strh r0, [r2, #2]
	movs r0, #0x15
	ldrsb r0, [r3, r0]
	strh r0, [r2, #4]
	movs r0, #0x19
	ldrsb r0, [r3, r0]
	strh r0, [r2, #8]
	movs r0, #0x16
	ldrsb r0, [r3, r0]
	strh r0, [r2, #6]
	movs r0, #0x17
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xa]
	movs r0, #0x18
	ldrsb r0, [r3, r0]
	strh r0, [r2, #0xc]
	ldr r0, [r3, #4]
	ldrb r0, [r0, #0x11]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r1, [r3]
	ldrb r1, [r1, #0x13]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
_08075BF6:
	adds r0, r0, r1
	strh r0, [r2, #0xe]
	ldr r0, _08075C2C @ =0x02017648
	ldr r1, _08075C30 @ =0x060028C0
	movs r2, #0xa3
	lsls r2, r2, #1
	movs r3, #0
	bl sub_8003BE8
	movs r7, #0
_08075C0A:
	adds r0, r6, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _08075C38
	ldr r1, _08075C34 @ =0x087A9820
	b _08075C3A
	.align 2, 0
_08075C1C: .4byte 0x02020110
_08075C20: .4byte 0x02020114
_08075C24: .4byte 0x02020112
_08075C28: .4byte 0x02020124
_08075C2C: .4byte 0x02017648
_08075C30: .4byte 0x060028C0
_08075C34: .4byte 0x087A9820
_08075C38:
	ldr r1, _08075D78 @ =0x087A9840
_08075C3A:
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	ldr r0, [r0]
	bl sub_8009FA8
	adds r5, r0, #0
	lsls r1, r7, #3
	ldr r0, _08075D7C @ =0x02017660
	adds r4, r1, r0
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl sub_8003E0C
	adds r1, r0, #0
	movs r0, #0x10
	subs r0, r0, r1
	asrs r1, r0, #1
	cmp r1, #0
	bge _08075C6A
	movs r1, #0
_08075C6A:
	adds r0, r4, #0
	bl sub_8003D84
	adds r0, r4, #0
	movs r1, #3
	bl sub_8003D90
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003F28
	ldr r1, _08075D80 @ =0x080E69AC
	lsls r0, r7, #1
	adds r0, r0, r1
	ldrh r1, [r0]
	lsls r1, r1, #1
	ldr r0, _08075D84 @ =0x02023CA8
	adds r1, r1, r0
	adds r0, r4, #0
	bl PutText
	adds r7, #1
	cmp r7, #7
	ble _08075C0A
	movs r7, #0
_08075C9C:
	lsls r5, r7, #3
	ldr r0, _08075D88 @ =0x020176A0
	mov r8, r0
	add r5, r8
	adds r0, r5, #0
	movs r1, #2
	bl InitText
	adds r0, r5, #0
	movs r1, #8
	bl sub_8003D84
	adds r0, r5, #0
	movs r1, #2
	bl sub_8003D90
	ldr r0, _08075D8C @ =0x02020114
	lsls r4, r7, #1
	adds r0, r4, r0
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8003F98
	ldr r0, _08075D80 @ =0x080E69AC
	adds r4, r4, r0
	ldrh r1, [r4]
	lsls r1, r1, #1
	ldr r6, _08075D90 @ =0x02023CAE
	adds r1, r1, r6
	adds r0, r5, #0
	bl PutText
	adds r7, #1
	cmp r7, #7
	ble _08075C9C
	mov r4, r8
	adds r4, #0x40
	adds r0, r4, #0
	movs r1, #8
	bl InitText
	ldr r0, _08075D94 @ =0x02020108
	ldr r0, [r0]
	ldr r0, [r0, #4]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	movs r0, #0xe0
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #3
	bl InitText
	adds r0, r4, #0
	movs r1, #3
	bl sub_8003D90
	ldr r0, _08075D98 @ =0x08A73210
	ldr r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	movs r0, #0xe7
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	adds r4, #8
	adds r0, r4, #0
	movs r1, #2
	bl InitText
	adds r0, r4, #0
	movs r1, #8
	bl sub_8003D84
	adds r0, r4, #0
	movs r1, #2
	bl sub_8003D90
	ldr r0, _08075D9C @ =0x02020110
	ldrh r1, [r0]
	adds r0, r4, #0
	bl sub_8003F98
	movs r0, #0xea
	lsls r0, r0, #1
	adds r1, r6, r0
	adds r0, r4, #0
	bl PutText
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08075D78: .4byte 0x087A9840
_08075D7C: .4byte 0x02017660
_08075D80: .4byte 0x080E69AC
_08075D84: .4byte 0x02023CA8
_08075D88: .4byte 0x020176A0
_08075D8C: .4byte 0x02020114
_08075D90: .4byte 0x02023CAE
_08075D94: .4byte 0x02020108
_08075D98: .4byte 0x08A73210
_08075D9C: .4byte 0x02020110

