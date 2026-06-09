	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80AD244, 0x080AD244 + 1
	.set sub_80AD2F8, 0x080AD2F8 + 1
	.set sub_80AD3FC, 0x080AD3FC + 1
	.set sub_80ADC68, 0x080ADC68 + 1
	.set sub_80ADCA4, 0x080ADCA4 + 1
	.set sub_80B02F8, 0x080B02F8 + 1
	.set sub_80B04B4, 0x080B04B4 + 1
	.section .text.sub_80ADEA8, "ax", %progbits
@ sub_80ADEA8 @ JP 0x080ADEA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ADEA8
	.thumb_func
sub_80ADEA8:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r0, r5, #0
	bl sub_80AD3FC
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ADEC2
	b _080AE0DC
_080ADEC2:
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r1, [r0]
	adds r4, r0, #0
	cmp r1, #0
	bne _080ADF18
	ldr r0, _080ADEE4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080ADEE8
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r5, #0
	b _080ADEF4
	.align 2, 0
_080ADEE4: .4byte 0x085775CC
_080ADEE8:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080ADF78
	adds r0, r5, #0
	movs r1, #1
_080ADEF4:
	bl sub_80B04B4
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080ADF78
	ldr r0, _080ADF14 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADF78
	movs r0, #0x66
	bl m4aSongNumStart
	b _080ADF78
	.align 2, 0
_080ADF14: .4byte 0x0202BCEC
_080ADF18:
	ldr r0, _080ADF48 @ =0x085775CC
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080ADF50
	cmp r1, #1
	beq _080ADF78
	movs r0, #1
	strb r0, [r4]
	ldr r0, _080ADF4C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADF40
	movs r0, #0x67
	bl m4aSongNumStart
_080ADF40:
	adds r0, r5, #0
	bl sub_80AD2F8
	b _080ADF78
	.align 2, 0
_080ADF48: .4byte 0x085775CC
_080ADF4C: .4byte 0x0202BCEC
_080ADF50:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080ADF78
	cmp r1, #2
	beq _080ADF78
	movs r0, #2
	strb r0, [r4]
	ldr r0, _080ADFAC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADF72
	movs r0, #0x67
	bl m4aSongNumStart
_080ADF72:
	adds r0, r5, #0
	bl sub_80AD2F8
_080ADF78:
	ldr r0, _080ADFB0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r1, #1
	ands r1, r2
	cmp r1, #0
	beq _080AE05C
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r0, [r0]
	cmp r0, #8
	beq _080AE028
	cmp r0, #8
	bgt _080ADFBA
	cmp r0, #2
	beq _080ADFCE
	cmp r0, #2
	bgt _080ADFB4
	cmp r0, #1
	beq _080ADFEC
	b _080AE0DC
	.align 2, 0
_080ADFAC: .4byte 0x0202BCEC
_080ADFB0: .4byte 0x085775CC
_080ADFB4:
	cmp r0, #4
	beq _080AE028
	b _080AE0DC
_080ADFBA:
	cmp r0, #0x40
	beq _080AE028
	cmp r0, #0x40
	bgt _080ADFC8
	cmp r0, #0x10
	beq _080AE00C
	b _080AE0DC
_080ADFC8:
	cmp r0, #0x80
	beq _080ADFDA
	b _080AE0DC
_080ADFCE:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080AE028
	b _080ADFEC
_080ADFDA:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080ADFEC
	adds r1, r5, #0
	adds r1, #0x44
	movs r0, #0xf0
	strh r0, [r1]
_080ADFEC:
	ldr r0, _080AE008 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADFFE
	movs r0, #0x6a
	bl m4aSongNumStart
_080ADFFE:
	adds r0, r5, #0
	bl sub_80AD244
	b _080AE0DC
	.align 2, 0
_080AE008: .4byte 0x0202BCEC
_080AE00C:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _080AE034
	ldr r0, _080AE030 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE028
	movs r0, #0x6a
	bl m4aSongNumStart
_080AE028:
	adds r0, r5, #0
	bl sub_80ADCA4
	b _080AE0DC
	.align 2, 0
_080AE030: .4byte 0x0202BCEC
_080AE034:
	adds r0, r5, #0
	bl sub_80ADC68
	adds r0, r5, #0
	movs r1, #6
	bl Proc_Goto
	ldr r0, _080AE058 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE0DC
	movs r0, #0x60
	bl m4aSongNumStart
	b _080AE0DC
	.align 2, 0
_080AE058: .4byte 0x0202BCEC
_080AE05C:
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _080AE0DC
	adds r0, r5, #0
	adds r0, #0x29
	strb r1, [r0]
	ldr r0, _080AE094 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE07C
	movs r0, #0x6b
	bl m4aSongNumStart
_080AE07C:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AE098
	adds r0, r5, #0
	movs r1, #0
	bl sub_80B02F8
	adds r0, r5, #0
	bl sub_80AD2F8
	b _080AE0DC
	.align 2, 0
_080AE094: .4byte 0x0202BCEC
_080AE098:
	adds r2, r5, #0
	adds r2, #0x2d
	ldrb r1, [r2]
	adds r0, r1, #0
	cmp r0, #0xff
	beq _080AE0B0
	adds r0, r5, #0
	adds r0, #0x2c
	strb r1, [r0]
	movs r0, #0xff
	strb r0, [r2]
	b _080AE0DC
_080AE0B0:
	adds r4, r5, #0
	adds r4, #0x42
	ldrh r1, [r4]
	movs r0, #0xc0
	ands r0, r1
	cmp r0, #0
	beq _080AE0D4
	adds r0, r5, #0
	movs r1, #0x11
	bl Proc_Goto
	ldrh r1, [r4]
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r2, #0
	orrs r0, r1
	strh r0, [r4]
	b _080AE0DC
_080AE0D4:
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080AE0DC:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

