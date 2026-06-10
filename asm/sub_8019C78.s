	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFogViewRange, 0x08017650 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.section .text.sub_8019C78, "ax", %progbits
@ sub_8019C78 @ JP 0x08019C78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8019C78
	.thumb_func
sub_8019C78:
	push {r4, r5, r6, r7, lr}
	movs r7, #1
_08019C7C:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019CD0
	ldr r0, [r6]
	cmp r0, #0
	beq _08019CD0
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019CD0
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _08019D60 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
	ldr r0, _08019D64 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _08019CD0
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	adds r0, r6, #0
	bl GetUnitFogViewRange
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
_08019CD0:
	adds r7, #1
	cmp r7, #0x7f
	ble _08019C7C
	ldr r0, _08019D64 @ =0x0202BCEC
	ldrb r0, [r0, #0xf]
	cmp r0, #0x80
	beq _08019DA8
	movs r7, #0x81
_08019CE0:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019D96
	ldr r2, [r6]
	cmp r2, #0
	beq _08019D96
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019D96
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08019D20
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_08019D20:
	ldr r0, _08019D64 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019D70
	ldr r0, _08019D68 @ =0x0202E4E4
	ldr r0, [r0]
	lsls r1, r2, #2
	adds r0, r1, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019D70
	ldr r0, _08019D6C @ =0x0202E4E8
	ldr r0, [r0]
	adds r0, r1, r0
	ldr r2, [r0]
	adds r2, r2, r3
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	str r0, [r6, #0xc]
	b _08019D96
	.align 2, 0
_08019D60: .4byte 0x0202E4D4
_08019D64: .4byte 0x0202BCEC
_08019D68: .4byte 0x0202E4E4
_08019D6C: .4byte 0x0202E4E8
_08019D70:
	ldr r0, _08019DA0 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
	ldr r1, [r6, #0xc]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _08019D96
	ldr r0, _08019DA4 @ =0xFFFFFDFF
	ands r1, r0
	movs r0, #0x80
	lsls r0, r0, #1
	orrs r1, r0
	str r1, [r6, #0xc]
_08019D96:
	adds r7, #1
	cmp r7, #0xc5
	ble _08019CE0
	b _08019E3C
	.align 2, 0
_08019DA0: .4byte 0x0202E4D4
_08019DA4: .4byte 0xFFFFFDFF
_08019DA8:
	movs r7, #0x81
_08019DAA:
	adds r0, r7, #0
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	beq _08019E36
	ldr r2, [r6]
	cmp r2, #0
	beq _08019E36
	ldr r0, [r6, #0xc]
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08019E36
	ldr r0, [r6, #4]
	ldr r1, [r2, #0x28]
	ldr r0, [r0, #0x28]
	orrs r1, r0
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r1, r0
	cmp r1, #0
	beq _08019DEA
	movs r0, #0x10
	ldrsb r0, [r6, r0]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	movs r2, #0xa
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_08019DEA:
	ldr r0, _08019E18 @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	movs r2, #0x11
	ldrsb r2, [r6, r2]
	movs r3, #0x10
	ldrsb r3, [r6, r3]
	cmp r0, #0
	beq _08019E28
	ldr r0, _08019E1C @ =0x0202E4E4
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	cmp r0, #0
	bne _08019E20
	ldr r0, [r6, #0xc]
	movs r1, #0x80
	lsls r1, r1, #2
	orrs r0, r1
	b _08019E26
	.align 2, 0
_08019E18: .4byte 0x0202BCEC
_08019E1C: .4byte 0x0202E4E4
_08019E20:
	ldr r0, [r6, #0xc]
	ldr r1, _08019E44 @ =0xFFFFFDFF
	ands r0, r1
_08019E26:
	str r0, [r6, #0xc]
_08019E28:
	ldr r0, _08019E48 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r3
	strb r7, [r0]
_08019E36:
	adds r7, #1
	cmp r7, #0xc5
	ble _08019DAA
_08019E3C:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08019E44: .4byte 0xFFFFFDFF
_08019E48: .4byte 0x0202E4D4

