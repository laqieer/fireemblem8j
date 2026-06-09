	.syntax unified
	.set DifficultyMenu_StartCursorMove, 0x080B1120 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80AF010, 0x080AF010 + 1
	.set sub_80B0A94, 0x080B0A94 + 1
	.set sub_80B0AE8, 0x080B0AE8 + 1
	.section .text.sub_80B0D30, "ax", %progbits
@ sub_80B0D30 @ JP 0x080B0D30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0D30
	.thumb_func
sub_80B0D30:
	push {r4, lr}
	adds r4, r0, #0
	movs r2, #0
	ldr r0, _080B0D54 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080B0D5E
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #0
	bne _080B0D58
	movs r0, #2
	strb r0, [r1]
	b _080B0D7E
	.align 2, 0
_080B0D54: .4byte 0x085775CC
_080B0D58:
	subs r0, #1
	strb r0, [r1]
	b _080B0D7E
_080B0D5E:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080B0D7A
	adds r1, r4, #0
	adds r1, #0x30
	ldrb r0, [r1]
	cmp r0, #2
	bne _080B0D74
	strb r2, [r1]
	b _080B0D78
_080B0D74:
	adds r0, #1
	strb r0, [r1]
_080B0D78:
	movs r2, #1
_080B0D7A:
	cmp r2, #0
	beq _080B0DCC
_080B0D7E:
	ldr r0, _080B0DC4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B0D90
	movs r0, #0x66
	bl m4aSongNumStart
_080B0D90:
	ldr r0, [r4, #0x34]
	adds r2, r4, #0
	adds r2, #0x30
	ldrb r1, [r2]
	adds r0, #0x2b
	strb r1, [r0]
	ldr r0, [r4, #0x34]
	ldr r1, _080B0DC8 @ =0x08A9D964
	ldrb r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r1
	movs r1, #0
	ldrsb r1, [r2, r1]
	ldrb r2, [r2, #1]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	bl DifficultyMenu_StartCursorMove
	adds r0, r4, #0
	bl sub_80B0A94
	adds r0, r4, #0
	bl sub_80B0AE8
	b _080B0E74
	.align 2, 0
_080B0DC4: .4byte 0x0202BCEC
_080B0DC8: .4byte 0x08A9D964
_080B0DCC:
	ldr r0, [r4, #0x34]
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0
	bne _080B0E74
	ldr r0, _080B0E14 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	beq _080B0E40
	str r2, [r4, #0x2c]
	ldr r0, _080B0E18 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B0E00
	movs r0, #0x6a
	bl m4aSongNumStart
_080B0E00:
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	cmp r0, #1
	beq _080B0E26
	cmp r0, #1
	bgt _080B0E1C
	cmp r0, #0
	beq _080B0E22
	b _080B0E38
	.align 2, 0
_080B0E14: .4byte 0x085775CC
_080B0E18: .4byte 0x0202BCEC
_080B0E1C:
	cmp r0, #2
	beq _080B0E30
	b _080B0E38
_080B0E22:
	movs r0, #0
	b _080B0E28
_080B0E26:
	movs r0, #1
_080B0E28:
	movs r1, #0
	bl sub_80AF010
	b _080B0E38
_080B0E30:
	movs r0, #2
	movs r1, #0
	bl sub_80AF010
_080B0E38:
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
_080B0E40:
	ldr r0, _080B0E7C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B0E74
	movs r0, #0
	str r0, [r4, #0x2c]
	ldr r0, _080B0E80 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B0E64
	movs r0, #0x6b
	bl m4aSongNumStart
_080B0E64:
	movs r0, #3
	movs r1, #0
	bl sub_80AF010
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
_080B0E74:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080B0E7C: .4byte 0x085775CC
_080B0E80: .4byte 0x0202BCEC

