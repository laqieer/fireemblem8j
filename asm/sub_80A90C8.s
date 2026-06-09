	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_80A90C8, "ax", %progbits
@ sub_80A90C8 @ JP 0x080A90C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A90C8
	.thumb_func
sub_80A90C8:
	push {r4, r5, r6, lr}
	adds r5, r2, #0
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r0, #0
	lsls r1, r1, #0x18
	lsrs r6, r1, #0x18
	cmp r0, #0x45
	bhi _080A9178
	bl GetCharacterData
	ldrb r0, [r0, #9]
	cmp r0, #0
	beq _080A9178
	lsls r1, r4, #4
	ldr r0, _080A9120 @ =0x0203E880
	adds r4, r1, r0
	cmp r4, #0
	beq _080A9178
	bl sub_80C1E74
	cmp r0, #0
	blt _080A912C
	cmp r0, #1
	ble _080A912C
	cmp r0, #2
	bne _080A912C
	ldrb r0, [r4, #0xe]
	movs r1, #0x80
	orrs r0, r1
	strb r0, [r4, #0xe]
	ldr r0, _080A9124 @ =0x03005270
	ldrb r1, [r0, #0x11]
	movs r0, #0x3f
	ands r1, r0
	ldrb r2, [r4, #5]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
	ldr r3, _080A9128 @ =0x0202BCEC
	b _080A914A
	.align 2, 0
_080A9120: .4byte 0x0203E880
_080A9124: .4byte 0x03005270
_080A9128: .4byte 0x0202BCEC
_080A912C:
	ldrb r1, [r4, #0xe]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r4, #0xe]
	ldr r3, _080A9180 @ =0x0202BCEC
	movs r1, #0xe
	ldrsb r1, [r3, r1]
	movs r0, #0x3f
	ands r1, r0
	ldrb r2, [r4, #5]
	movs r0, #0x40
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #5]
_080A914A:
	ldrh r2, [r3, #0x10]
	ldr r0, _080A9184 @ =0x000003FF
	ands r2, r0
	lsls r2, r2, #0xe
	ldr r0, [r4, #4]
	ldr r1, _080A9188 @ =0xFF003FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #4]
	lsls r2, r6, #0xe
	ldr r0, [r4, #0xc]
	ldr r1, _080A918C @ =0xFF803FFF
	ands r0, r1
	orrs r0, r2
	str r0, [r4, #0xc]
	movs r0, #0xf
	ands r5, r0
	ldrb r1, [r4, #9]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r4, #9]
_080A9178:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A9180: .4byte 0x0202BCEC
_080A9184: .4byte 0x000003FF
_080A9188: .4byte 0xFF003FFF
_080A918C: .4byte 0xFF803FFF

