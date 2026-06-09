	.syntax unified
	.set GetItemIndex, 0x08017294 + 1
	.set GetUnit, 0x08019108 + 1
	.set Roll1RN, 0x08000C78 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.set sub_802CC14, 0x0802CC14 + 1
	.section .text.sub_802EF48, "ax", %progbits
@ sub_802EF48 @ JP 0x0802EF48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EF48
	.thumb_func
sub_802EF48:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802EFA4 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_802CC14
	ldr r4, _0802EFA8 @ =0x0203A4E8
	adds r1, r4, #0
	adds r1, #0x64
	strh r0, [r1]
	bl Roll1RN
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802EFB4
	ldr r0, _0802EFAC @ =0x0203A604
	ldr r3, [r0]
	ldr r2, [r3]
	lsls r1, r2, #0xd
	lsrs r1, r1, #0xd
	movs r0, #2
	orrs r1, r0
	ldr r0, _0802EFB0 @ =0xFFF80000
	ands r0, r2
	orrs r0, r1
	str r0, [r3]
	b _0802F07C
	.align 2, 0
_0802EFA4: .4byte 0x0203A954
_0802EFA8: .4byte 0x0203A4E8
_0802EFAC: .4byte 0x0203A604
_0802EFB0: .4byte 0xFFF80000
_0802EFB4:
	adds r0, r4, #0
	adds r0, #0x4a
	ldrh r0, [r0]
	bl GetItemIndex
	cmp r0, #0x52
	beq _0802EFF4
	cmp r0, #0x52
	bgt _0802EFCC
	cmp r0, #0x51
	beq _0802EFE4
	b _0802F07C
_0802EFCC:
	cmp r0, #0x53
	beq _0802EFD6
	cmp r0, #0xb5
	beq _0802F004
	b _0802F07C
_0802EFD6:
	ldr r0, _0802EFE0 @ =0x0203A568
	adds r0, #0x6f
	movs r1, #4
	strb r1, [r0]
	b _0802F07C
	.align 2, 0
_0802EFE0: .4byte 0x0203A568
_0802EFE4:
	ldr r0, _0802EFF0 @ =0x0203A568
	adds r0, #0x6f
	movs r1, #3
	strb r1, [r0]
	b _0802F07C
	.align 2, 0
_0802EFF0: .4byte 0x0203A568
_0802EFF4:
	ldr r0, _0802F000 @ =0x0203A568
	adds r0, #0x6f
	movs r1, #2
	strb r1, [r0]
	b _0802F07C
	.align 2, 0
_0802F000: .4byte 0x0203A568
_0802F004:
	ldr r0, _0802F018 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0x40
	beq _0802F058
	cmp r0, #0x40
	bgt _0802F01C
	cmp r0, #0
	beq _0802F022
	b _0802F07C
	.align 2, 0
_0802F018: .4byte 0x0202BCEC
_0802F01C:
	cmp r0, #0x80
	beq _0802F03C
	b _0802F07C
_0802F022:
	ldr r2, _0802F038 @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0
	bne _0802F074
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802F07A
	.align 2, 0
_0802F038: .4byte 0x0203A568
_0802F03C:
	ldr r2, _0802F054 @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x80
	bne _0802F074
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802F07A
	.align 2, 0
_0802F054: .4byte 0x0203A568
_0802F058:
	ldr r2, _0802F070 @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	cmp r0, #0x40
	bne _0802F074
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xd
	b _0802F07A
	.align 2, 0
_0802F070: .4byte 0x0203A568
_0802F074:
	adds r1, r2, #0
	adds r1, #0x6f
	movs r0, #0xb
_0802F07A:
	strb r0, [r1]
_0802F07C:
	adds r0, r6, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5, r6}
	pop {r0}
	bx r0

