	.syntax unified
	.set SetUnitStatus, 0x08017680 + 1
	.set UnitCheckStatCaps, 0x08017EDC + 1
	.set UnitRemoveInvalidItems, 0x0801772C + 1
	.set sub_802BFFC, 0x0802BFFC + 1
	.set sub_80A92C0, 0x080A92C0 + 1
	.section .text.sub_802C134, "ax", %progbits
@ sub_802C134 @ JP 0x0802C134 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C134
	.thumb_func
sub_802C134:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	ldrb r0, [r5, #8]
	strb r0, [r4, #8]
	ldrb r0, [r5, #9]
	strb r0, [r4, #9]
	ldrb r0, [r5, #0x13]
	strb r0, [r4, #0x13]
	ldr r0, [r5, #0xc]
	str r0, [r4, #0xc]
	ldr r2, _0802C218 @ =0x03003008
	lsrs r0, r0, #0x11
	movs r1, #7
	ands r0, r1
	strb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x6f
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r0, #0
	blt _0802C168
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetUnitStatus
_0802C168:
	adds r0, r5, #0
	adds r0, #0x73
	ldrb r0, [r0]
	ldrb r1, [r4, #0x12]
	adds r0, r0, r1
	strb r0, [r4, #0x12]
	adds r0, r5, #0
	adds r0, #0x74
	ldrb r0, [r0]
	ldrb r1, [r4, #0x14]
	adds r0, r0, r1
	strb r0, [r4, #0x14]
	adds r0, r5, #0
	adds r0, #0x75
	ldrb r0, [r0]
	ldrb r1, [r4, #0x15]
	adds r0, r0, r1
	strb r0, [r4, #0x15]
	adds r0, r5, #0
	adds r0, #0x76
	ldrb r0, [r0]
	ldrb r1, [r4, #0x16]
	adds r0, r0, r1
	strb r0, [r4, #0x16]
	adds r0, r5, #0
	adds r0, #0x77
	ldrb r0, [r0]
	ldrb r1, [r4, #0x17]
	adds r0, r0, r1
	strb r0, [r4, #0x17]
	adds r0, r5, #0
	adds r0, #0x78
	ldrb r0, [r0]
	ldrb r1, [r4, #0x18]
	adds r0, r0, r1
	strb r0, [r4, #0x18]
	adds r0, r5, #0
	adds r0, #0x79
	ldrb r0, [r0]
	ldrb r1, [r4, #0x19]
	adds r0, r0, r1
	strb r0, [r4, #0x19]
	adds r0, r4, #0
	bl UnitCheckStatCaps
	adds r0, r5, #0
	bl sub_802BFFC
	adds r2, r0, #0
	cmp r2, #0
	ble _0802C1DC
	adds r1, r5, #0
	adds r1, #0x50
	adds r0, r4, #0
	adds r0, #0x28
	ldrb r1, [r1]
	adds r0, r0, r1
	strb r2, [r0]
_0802C1DC:
	adds r6, r5, #0
	adds r6, #0x6e
	adds r1, r5, #0
	adds r1, #0x1e
	adds r3, r4, #0
	adds r3, #0x1e
	movs r2, #4
_0802C1EA:
	ldrh r0, [r1]
	strh r0, [r3]
	adds r1, #2
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bge _0802C1EA
	adds r0, r4, #0
	bl UnitRemoveInvalidItems
	movs r0, #0
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _0802C212
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	movs r1, #0
	ldrsb r1, [r6, r1]
	bl sub_80A92C0
_0802C212:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C218: .4byte 0x03003008

