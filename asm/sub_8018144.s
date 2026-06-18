	.syntax unified
	.set GetFreeUnit, 0x080175E0 + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_80175C4, 0x080175C4 + 1
	.section .text.sub_8018144, "ax", %progbits
@ UnitChangeFaction @ JP 0x08018144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitChangeFaction
	.thumb_func
UnitChangeFaction:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r0, r6, #0
	bl GetFreeUnit
	adds r4, r0, #0
	ldr r1, _08018180 @ =0x03004DF0
	ldr r0, [r1]
	cmp r0, r5
	bne _0801815C
	str r4, [r1]
_0801815C:
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_80175C4
	adds r0, r5, #0
	bl sub_801759C
	ldrb r0, [r4, #9]
	cmp r0, #0xff
	bne _08018188
	cmp r6, #0
	bne _08018184
	movs r0, #8
	ldrsb r0, [r4, r0]
	cmp r0, #0x14
	beq _08018184
	strb r6, [r4, #9]
	b _08018188
	.align 2, 0
_08018180: .4byte 0x03004DF0
_08018184:
	movs r0, #0xff
	strb r0, [r4, #9]
_08018188:
	ldr r0, [r4, #0xc]
	ldr r1, _080181A8 @ =0xFFFFEFFF
	ands r0, r1
	str r0, [r4, #0xc]
	ldrb r0, [r4, #0x1b]
	cmp r0, #0
	beq _080181A2
	ldr r1, _080181AC @ =0x085C2A50
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r1, [r0]
	ldrb r0, [r4, #0xb]
	strb r0, [r1, #0x1b]
_080181A2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080181A8: .4byte 0xFFFFEFFF
_080181AC: .4byte 0x085C2A50

