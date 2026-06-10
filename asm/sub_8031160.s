	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_801759C, 0x0801759C + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8019040, 0x08019040 + 1
	.section .text.sub_8031160, "ax", %progbits
@ sub_8031160 @ JP 0x08031160 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8031160
	.thumb_func
sub_8031160:
	push {r4, r5, r6, lr}
	movs r4, #1
_08031164:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _08031184
	ldr r0, [r1]
	cmp r0, #0
	beq _08031184
	ldr r0, [r1, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	bne _08031184
	adds r0, r1, #0
	bl sub_801759C
_08031184:
	adds r4, #1
	cmp r4, #0x3f
	ble _08031164
	movs r4, #0x41
_0803118C:
	adds r0, r4, #0
	bl GetUnit
	adds r1, r0, #0
	cmp r1, #0
	beq _080311A4
	ldr r0, [r1]
	cmp r0, #0
	beq _080311A4
	adds r0, r1, #0
	bl sub_801759C
_080311A4:
	adds r4, #1
	cmp r4, #0xbf
	ble _0803118C
	movs r5, #1
	movs r6, #0
_080311AE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08031228
	ldr r0, [r4]
	cmp r0, #0
	beq _08031228
	adds r0, r4, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8019040
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r0, r4, #0
	adds r0, #0x31
	strb r6, [r0]
	ldr r1, [r4, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080311EE
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _080311F2
_080311EE:
	ldr r0, _08031240 @ =0xFFDFFFFF
	ands r1, r0
_080311F2:
	str r1, [r4, #0xc]
	ldr r3, [r4, #0xc]
	ldr r0, _08031244 @ =0x0631E004
	ands r3, r0
	str r3, [r4, #0xc]
	ldr r0, [r4]
	ldr r2, [r4, #4]
	ldr r1, [r0, #0x28]
	ldr r0, [r2, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #2
	ands r1, r0
	cmp r1, #0
	beq _08031218
	movs r0, #5
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r4, #0xc]
_08031218:
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
	strb r6, [r4, #0x1b]
	adds r0, r4, #0
	adds r0, #0x39
	strb r6, [r0]
_08031228:
	adds r5, #1
	cmp r5, #0x3f
	ble _080311AE
	ldr r2, _08031248 @ =0x0202BCEC
	ldrb r1, [r2, #0x14]
	movs r0, #0xef
	ands r0, r1
	strb r0, [r2, #0x14]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08031240: .4byte 0xFFDFFFFF
_08031244: .4byte 0x0631E004
_08031248: .4byte 0x0202BCEC

