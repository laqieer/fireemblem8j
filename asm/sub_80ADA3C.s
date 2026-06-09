	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set ReadLastGameSaveId, 0x080A97E4 + 1
	.set SaveMenuGetBitfile, 0x080AD25C + 1
	.set StartBgmVolumeChange, 0x08002680 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80B0444, 0x080B0444 + 1
	.section .text.sub_80ADA3C, "ax", %progbits
@ sub_80ADA3C @ JP 0x080ADA3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ADA3C
	.thumb_func
sub_80ADA3C:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r1, r5, #0
	adds r1, #0x2e
	movs r0, #2
	strb r0, [r1]
	ldr r0, _080ADA6C @ =0x085775CC
	ldr r3, [r0]
	ldrh r1, [r3, #6]
	movs r6, #0x40
	adds r0, r6, #0
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080ADA84
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	cmp r0, #0
	beq _080ADA70
	subs r0, #1
	b _080ADAA2
	.align 2, 0
_080ADA6C: .4byte 0x085775CC
_080ADA70:
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080ADADA
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	b _080ADAA2
_080ADA84:
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080ADADA
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r1, [r2]
	adds r0, r5, #0
	adds r0, #0x31
	ldrb r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080ADABC
	adds r0, r1, #1
_080ADAA2:
	strb r0, [r2]
	ldr r0, _080ADAB8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADADA
	movs r0, #0x66
	bl m4aSongNumStart
	b _080ADADA
	.align 2, 0
_080ADAB8: .4byte 0x0202BCEC
_080ADABC:
	ldrh r1, [r3, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _080ADADA
	strb r4, [r2]
	ldr r0, _080ADB34 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADADA
	movs r0, #0x66
	bl m4aSongNumStart
_080ADADA:
	ldr r0, _080ADB38 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _080ADAEA
	b _080ADC32
_080ADAEA:
	adds r0, r5, #0
	adds r0, #0x30
	ldrb r0, [r0]
	adds r1, r5, #0
	adds r1, #0x2b
	ldrb r1, [r1]
	bl SaveMenuGetBitfile
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	adds r4, r5, #0
	adds r4, #0x42
	strh r0, [r4]
	ldr r0, _080ADB34 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADB16
	movs r0, #0x6a
	bl m4aSongNumStart
_080ADB16:
	adds r1, r5, #0
	adds r1, #0x29
	movs r0, #0
	strb r0, [r1]
	ldrh r0, [r4]
	subs r0, #1
	cmp r0, #0x1f
	bls _080ADB28
	b _080ADC5E
_080ADB28:
	lsls r0, r0, #2
	ldr r1, _080ADB3C @ =_080ADB40
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080ADB34: .4byte 0x0202BCEC
_080ADB38: .4byte 0x085775CC
_080ADB3C: .4byte _080ADB40
_080ADB40: @ jump table
	.4byte _080ADBC0 @ case 0
	.4byte _080ADBCC @ case 1
	.4byte _080ADC5E @ case 2
	.4byte _080ADBCC @ case 3
	.4byte _080ADC5E @ case 4
	.4byte _080ADC5E @ case 5
	.4byte _080ADC5E @ case 6
	.4byte _080ADBCC @ case 7
	.4byte _080ADC5E @ case 8
	.4byte _080ADC5E @ case 9
	.4byte _080ADC5E @ case 10
	.4byte _080ADC5E @ case 11
	.4byte _080ADC5E @ case 12
	.4byte _080ADC5E @ case 13
	.4byte _080ADC5E @ case 14
	.4byte _080ADBEC @ case 15
	.4byte _080ADC5E @ case 16
	.4byte _080ADC5E @ case 17
	.4byte _080ADC5E @ case 18
	.4byte _080ADC5E @ case 19
	.4byte _080ADC5E @ case 20
	.4byte _080ADC5E @ case 21
	.4byte _080ADC5E @ case 22
	.4byte _080ADC5E @ case 23
	.4byte _080ADC5E @ case 24
	.4byte _080ADC5E @ case 25
	.4byte _080ADC5E @ case 26
	.4byte _080ADC5E @ case 27
	.4byte _080ADC5E @ case 28
	.4byte _080ADC5E @ case 29
	.4byte _080ADC5E @ case 30
	.4byte _080ADC14 @ case 31
_080ADBC0:
	adds r0, r5, #0
	adds r0, #0x3f
	ldrb r1, [r0]
	subs r0, #0x13
	strb r1, [r0]
	b _080ADBE2
_080ADBCC:
	bl ReadLastGameSaveId
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r1, #1
	movs r2, #1
	bl sub_80B0444
	adds r1, r5, #0
	adds r1, #0x2c
	strb r0, [r1]
_080ADBE2:
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080ADC5E
_080ADBEC:
	adds r4, r5, #0
	adds r4, #0x2c
	ldrb r0, [r4]
	movs r1, #0
	movs r2, #1
	bl sub_80B0444
	strb r0, [r4]
	adds r0, r5, #0
	movs r1, #1
	bl Proc_Goto
	movs r1, #0x80
	lsls r1, r1, #1
	movs r0, #0xc0
	movs r2, #0x10
	movs r3, #0
	bl StartBgmVolumeChange
	b _080ADC5E
_080ADC14:
	adds r2, r5, #0
	adds r2, #0x34
	adds r1, r5, #0
	adds r1, #0x33
	ldrb r0, [r2]
	ldrb r1, [r1]
	cmp r0, r1
	blo _080ADC28
	movs r0, #0
	strb r0, [r2]
_080ADC28:
	adds r0, r5, #0
	movs r1, #8
	bl Proc_Goto
	b _080ADC5E
_080ADC32:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080ADC5E
	ldr r0, _080ADC64 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ADC4C
	movs r0, #0x6b
	bl m4aSongNumStart
_080ADC4C:
	adds r0, r5, #0
	movs r1, #0x12
	bl Proc_Goto
	adds r1, r5, #0
	adds r1, #0x42
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
_080ADC5E:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080ADC64: .4byte 0x0202BCEC

