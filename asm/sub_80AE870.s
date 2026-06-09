	.syntax unified
	.set Proc_Goto, 0x08002E74 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80A9B40, 0x080A9B40 + 1
	.set sub_80AD244, 0x080AD244 + 1
	.set sub_80AD2F8, 0x080AD2F8 + 1
	.set sub_80ADCA4, 0x080ADCA4 + 1
	.set sub_80AE774, 0x080AE774 + 1
	.set sub_80AE850, 0x080AE850 + 1
	.set sub_80B02F8, 0x080B02F8 + 1
	.section .text.sub_80AE870, "ax", %progbits
@ sub_80AE870 @ JP 0x080AE870 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AE870
	.thumb_func
sub_80AE870:
	push {r4, r5, lr}
	adds r4, r0, #0
	adds r1, r4, #0
	adds r1, #0x2e
	movs r0, #5
	strb r0, [r1]
	adds r3, r4, #0
	adds r3, #0x36
	ldrb r1, [r3]
	cmp r1, #0
	bne _080AE8B6
	ldr r0, _080AE8A0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AE8A4
	movs r1, #1
	rsbs r1, r1, #0
	adds r0, r4, #0
	bl sub_80AE774
	b _080AE90A
	.align 2, 0
_080AE8A0: .4byte 0x085775CC
_080AE8A4:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AE90A
	adds r0, r4, #0
	movs r1, #1
	bl sub_80AE774
	b _080AE90A
_080AE8B6:
	ldr r0, _080AE8E0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r2, [r0, #8]
	movs r0, #0x20
	ands r0, r2
	cmp r0, #0
	beq _080AE8E8
	cmp r1, #1
	beq _080AE90A
	movs r0, #1
	strb r0, [r3]
	ldr r0, _080AE8E4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE90A
	movs r0, #0x67
	bl m4aSongNumStart
	b _080AE90A
	.align 2, 0
_080AE8E0: .4byte 0x085775CC
_080AE8E4: .4byte 0x0202BCEC
_080AE8E8:
	movs r0, #0x10
	ands r0, r2
	cmp r0, #0
	beq _080AE90A
	cmp r1, #2
	beq _080AE90A
	movs r0, #2
	strb r0, [r3]
	ldr r0, _080AE930 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AE90A
	movs r0, #0x67
	bl m4aSongNumStart
_080AE90A:
	ldr r0, _080AE934 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r3, #1
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080AE91C
	b _080AEA10
_080AE91C:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	cmp r0, #0x20
	beq _080AE978
	cmp r0, #0x20
	bgt _080AE938
	cmp r0, #0x10
	beq _080AE9B0
	b _080AEA5E
	.align 2, 0
_080AE930: .4byte 0x0202BCEC
_080AE934: .4byte 0x085775CC
_080AE938:
	cmp r0, #0x40
	beq _080AE93E
	b _080AEA5E
_080AE93E:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r1, [r0]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080AE96C
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080AE9F4
	adds r0, r2, #0
	bl sub_80A9B40
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080AE9DA
_080AE96C:
	ldr r2, _080AE974 @ =0x0000082F
	movs r0, #0x40
	movs r1, #0x30
	b _080AEA02
	.align 2, 0
_080AE974: .4byte 0x0000082F
_080AE978:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AE9A6
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080AE9F4
	adds r0, r2, #0
	bl sub_80A9B40
	adds r0, r4, #0
	movs r1, #0xe
	bl Proc_Goto
	b _080AE9DA
_080AE9A6:
	ldr r2, _080AE9AC @ =0x0000082E
	b _080AE9FE
	.align 2, 0
_080AE9AC: .4byte 0x0000082E
_080AE9B0:
	adds r0, r4, #0
	adds r0, #0x2c
	ldrb r2, [r0]
	adds r0, #0xe
	adds r0, r0, r2
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080AE9FC
	adds r0, r4, #0
	adds r0, #0x3f
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080AE9F4
	adds r0, r2, #0
	bl sub_80A9B40
	adds r0, r4, #0
	bl sub_80AD244
_080AE9DA:
	ldr r0, _080AE9F0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AEA5E
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080AEA5E
	.align 2, 0
_080AE9F0: .4byte 0x0202BCEC
_080AE9F4:
	adds r0, r4, #0
	bl sub_80ADCA4
	b _080AEA5E
_080AE9FC:
	ldr r2, _080AEA0C @ =0x00000835
_080AE9FE:
	movs r0, #0x2e
	movs r1, #0x38
_080AEA02:
	adds r3, r4, #0
	bl sub_80AE850
	b _080AEA5E
	.align 2, 0
_080AEA0C: .4byte 0x00000835
_080AEA10:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080AEA5E
	ldr r0, _080AEA44 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080AEA2A
	movs r0, #0x6b
	bl m4aSongNumStart
_080AEA2A:
	adds r0, r4, #0
	adds r0, #0x36
	ldrb r5, [r0]
	cmp r5, #0
	beq _080AEA48
	adds r0, r4, #0
	movs r1, #0
	bl sub_80B02F8
	adds r0, r4, #0
	bl sub_80AD2F8
	b _080AEA5E
	.align 2, 0
_080AEA44: .4byte 0x0202BCEC
_080AEA48:
	ldr r0, _080AEA64 @ =0x08AA59A0
	ldr r1, _080AEA68 @ =0x06014000
	bl sub_8013008
	adds r0, r4, #0
	adds r0, #0x29
	strb r5, [r0]
	adds r0, r4, #0
	movs r1, #0xd
	bl Proc_Goto
_080AEA5E:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080AEA64: .4byte 0x08AA59A0
_080AEA68: .4byte 0x06014000

