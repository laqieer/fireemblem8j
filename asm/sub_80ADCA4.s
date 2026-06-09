	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80A980C, 0x080A980C + 1
	.set sub_80A984C, 0x080A984C + 1
	.set sub_80A9A28, 0x080A9A28 + 1
	.set sub_80A9B40, 0x080A9B40 + 1
	.set sub_80AD244, 0x080AD244 + 1
	.set sub_80AD2F8, 0x080AD2F8 + 1
	.set sub_80ADC68, 0x080ADC68 + 1
	.set sub_80B02F8, 0x080B02F8 + 1
	.set sub_80B04B4, 0x080B04B4 + 1
	.section .text.sub_80ADCA4, "ax", %progbits
@ sub_80ADCA4 @ JP 0x080ADCA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ADCA4
	.thumb_func
sub_80ADCA4:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r5, r4, #0
	adds r5, #0x36
	ldrb r1, [r5]
	cmp r1, #0
	bne _080ADD50
	ldr r0, _080ADCDC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADCC4
	movs r0, #0x6a
	bl m4aSongNumStart
_080ADCC4:
	adds r0, r4, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080ADD26
	cmp r0, #8
	bgt _080ADCE0
	cmp r0, #2
	beq _080ADD38
	cmp r0, #4
	beq _080ADCF4
	b _080ADD48
	.align 2, 0
_080ADCDC: .4byte 0x0202BCEC
_080ADCE0:
	cmp r0, #0x20
	beq _080ADD38
	cmp r0, #0x20
	bgt _080ADCEE
	cmp r0, #0x10
	beq _080ADD38
	b _080ADD48
_080ADCEE:
	cmp r0, #0x40
	beq _080ADD2A
	b _080ADD48
_080ADCF4:
	adds r1, r4, #0
	adds r1, #0x2d
	ldrb r0, [r1]
	cmp r0, #0xff
	bne _080ADD10
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80B04B4
	b _080ADE9C
_080ADD10:
	ldrb r0, [r1]
	adds r1, r4, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	bl sub_80A984C
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	b _080ADE9C
_080ADD26:
	movs r0, #2
	b _080ADD2C
_080ADD2A:
	movs r0, #1
_080ADD2C:
	strb r0, [r5]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80B02F8
	b _080ADD48
_080ADD38:
	adds r1, r4, #0
	adds r1, #0x36
	movs r0, #2
	strb r0, [r1]
	adds r0, r4, #0
	movs r1, #1
	bl sub_80B02F8
_080ADD48:
	adds r0, r4, #0
	bl sub_80AD2F8
	b _080ADE9C
_080ADD50:
	adds r5, r4, #0
	adds r5, #0x42
	ldrh r0, [r5]
	cmp r0, #0x10
	beq _080ADDE4
	cmp r0, #0x10
	bgt _080ADD68
	cmp r0, #2
	beq _080ADDB8
	cmp r0, #8
	beq _080ADDF0
	b _080ADE8E
_080ADD68:
	cmp r0, #0x20
	beq _080ADD72
	cmp r0, #0x40
	beq _080ADE38
	b _080ADE8E
_080ADD72:
	cmp r1, #1
	bne _080ADE20
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_80A9B40
	ldr r0, _080ADDB4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADD9A
	movs r0, #0x6a
	bl m4aSongNumStart
_080ADD9A:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x10
	beq _080ADDD6
	cmp r0, #0x20
	bne _080ADE8E
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080ADE8E
	.align 2, 0
_080ADDB4: .4byte 0x0202BCEC
_080ADDB8:
	cmp r1, #1
	bne _080ADE20
	adds r1, r4, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
	ldr r0, _080ADDE0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADDD6
	movs r0, #0x6a
	bl m4aSongNumStart
_080ADDD6:
	adds r0, r4, #0
	bl sub_80AD244
	b _080ADE8E
	.align 2, 0
_080ADDE0: .4byte 0x0202BCEC
_080ADDE4:
	cmp r1, #1
	bne _080ADE20
	adds r0, r4, #0
	bl sub_80ADC68
	b _080ADE46
_080ADDF0:
	cmp r1, #1
	bne _080ADE20
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_80A980C
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080ADE1C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADE8E
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080ADE8E
	.align 2, 0
_080ADE1C: .4byte 0x0202BCEC
_080ADE20:
	ldr r0, _080ADE34 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADE8E
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080ADE8E
	.align 2, 0
_080ADE34: .4byte 0x0202BCEC
_080ADE38:
	cmp r1, #1
	bne _080ADE68
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	bl sub_80A9A28
_080ADE46:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080ADE64 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADE8E
	movs r0, #0x60
	bl m4aSongNumStart
	b _080ADE8E
	.align 2, 0
_080ADE64: .4byte 0x0202BCEC
_080ADE68:
	adds r0, r4, #0
	movs r1, #0x11
	bl Proc_Goto
	ldrh r1, [r5]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r5]
	ldr r0, _080ADEA4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADE8E
	movs r0, #0x6b
	bl m4aSongNumStart
_080ADE8E:
	adds r0, r4, #0
	movs r1, #0
	bl sub_80B02F8
	adds r0, r4, #0
	bl sub_80AD2F8
_080ADE9C:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ADEA4: .4byte 0x0202BCEC

