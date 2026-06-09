	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartHelpBox, 0x0808B06C + 1
	.set StartPrepErrorHelpbox, 0x0809A080 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_809A674, 0x0809A674 + 1
	.set sub_809B600, 0x0809B600 + 1
	.set sub_809C250, 0x0809C250 + 1
	.set sub_809C804, 0x0809C804 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_809B9C0, "ax", %progbits
@ sub_809B9C0 @ JP 0x0809B9C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809B9C0
	.thumb_func
sub_809B9C0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r6, r5, #0
	adds r6, #0x2e
	ldrb r0, [r6]
	mov r8, r0
	adds r4, r5, #0
	adds r4, #0x2d
	ldrb r0, [r4]
	cmp r0, #0xff
	beq _0809B9DC
	b _0809BC08
_0809B9DC:
	ldr r0, _0809BA0C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BA2C
	mov r1, r8
	strb r1, [r4]
	ldr r0, _0809BA10 @ =0x03005270
	ldrb r1, [r0]
	movs r2, #1
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BA14
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	b _0809BD2E
	.align 2, 0
_0809BA0C: .4byte 0x085775CC
_0809BA10: .4byte 0x03005270
_0809BA14:
	ldrb r1, [r6]
	adds r0, r2, #0
	ands r0, r1
	lsls r0, r0, #5
	adds r0, #0x88
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _0809BA28 @ =0x08A9463C
	b _0809BD36
	.align 2, 0
_0809BA28: .4byte 0x08A9463C
_0809BA2C:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _0809BA36
	b _0809BBC8
_0809BA36:
	mov r2, r8
	cmp r2, #5
	bls _0809BA3E
	b _0809BBAC
_0809BA3E:
	lsls r0, r2, #2
	ldr r1, _0809BA48 @ =_0809BA4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_0809BA48: .4byte _0809BA4C
_0809BA4C: @ jump table
	.4byte _0809BA64 @ case 0
	.4byte _0809BA74 @ case 1
	.4byte _0809BA84 @ case 2
	.4byte _0809BAA0 @ case 3
	.4byte _0809BB2C @ case 4
	.4byte _0809BB40 @ case 5
_0809BA64:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _0809BA6E
	b _0809BBAC
_0809BA6E:
	adds r0, r5, #0
	movs r1, #4
	b _0809BB8C
_0809BA74:
	bl PrepGetUnitAmount
	cmp r0, #1
	bgt _0809BA7E
	b _0809BBAC
_0809BA7E:
	adds r0, r5, #0
	movs r1, #8
	b _0809BB8C
_0809BA84:
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl sub_809A674
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0809BA9A
	b _0809BBAC
_0809BA9A:
	adds r0, r5, #0
	movs r1, #9
	b _0809BB8C
_0809BAA0:
	bl CheckInLinkArena
	cmp r0, #0
	beq _0809BAD0
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	ldr r0, [r0, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _0809BAD0
	subs r1, #9
	ldr r2, _0809BACC @ =0x000006FC
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _0809BD72
	.align 2, 0
_0809BACC: .4byte 0x000006FC
_0809BAD0:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809BBAC
	adds r6, r5, #0
	adds r6, #0x2b
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	bl sub_809C804
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809BBAC
	ldr r4, _0809BB24 @ =0x02022F0E
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_809B600
	ldr r5, _0809BB28 @ =0x02013510
	subs r4, #0x22
	ldrb r0, [r6]
	bl GetUnitFromPrepList
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_809C250
	movs r0, #1
	bl BG_EnableSyncByMask
	b _0809BB90
	.align 2, 0
_0809BB24: .4byte 0x02022F0E
_0809BB28: .4byte 0x02013510
_0809BB2C:
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809BBAC
	adds r0, r5, #0
	movs r1, #0xa
	b _0809BB8C
_0809BB40:
	ldr r0, _0809BB7C @ =0x03005270
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BB80
	adds r0, r5, #0
	adds r0, #0x2c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0809BBAC
	adds r0, r5, #0
	adds r0, #0x2b
	ldrb r0, [r0]
	bl GetUnitFromPrepList
	bl GetUnitItemCount
	cmp r0, #0
	ble _0809BBAC
	bl CheckInLinkArena
	cmp r0, #0
	bne _0809BBAC
	adds r0, r5, #0
	movs r1, #0xb
	b _0809BB8C
	.align 2, 0
_0809BB7C: .4byte 0x03005270
_0809BB80:
	bl CheckInLinkArena
	cmp r0, #0
	bne _0809BBAC
	adds r0, r5, #0
	movs r1, #0xc
_0809BB8C:
	bl Proc_Goto
_0809BB90:
	ldr r0, _0809BBA8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809BB9E
	b _0809BD72
_0809BB9E:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _0809BD72
	.align 2, 0
_0809BBA8: .4byte 0x0202BCEC
_0809BBAC:
	ldr r0, _0809BBC4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _0809BBBA
	b _0809BD72
_0809BBBA:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _0809BD72
	.align 2, 0
_0809BBC4: .4byte 0x0202BCEC
_0809BBC8:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0809BC20
	adds r2, r5, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x2a
	strb r0, [r1]
	movs r0, #0xff
	strb r0, [r2]
	movs r0, #0
	bl sub_80B1524
	ldr r0, _0809BC04 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BBF8
	movs r0, #0x6b
	bl m4aSongNumStart
_0809BBF8:
	adds r0, r5, #0
	movs r1, #0
	bl Proc_Goto
	b _0809BD72
	.align 2, 0
_0809BC04: .4byte 0x0202BCEC
_0809BC08:
	ldr r0, _0809BC44 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0809BC20
	bl sub_808B2A4
	movs r0, #0xff
	strb r0, [r4]
_0809BC20:
	ldr r2, _0809BC44 @ =0x085775CC
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x20
	adds r0, r7, #0
	ands r0, r1
	adds r4, r5, #0
	adds r4, #0x2e
	cmp r0, #0
	beq _0809BC56
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _0809BC48
	subs r0, r3, #1
	b _0809BC54
	.align 2, 0
_0809BC44: .4byte 0x085775CC
_0809BC48:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BC56
	adds r0, r3, #1
_0809BC54:
	strb r0, [r4]
_0809BC56:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x10
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BC80
	ldrb r3, [r4]
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	bne _0809BC72
	adds r0, r3, #1
	b _0809BC7E
_0809BC72:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BC80
	subs r0, r3, #1
_0809BC7E:
	strb r0, [r4]
_0809BC80:
	ldr r6, [r2]
	ldrh r1, [r6, #6]
	movs r7, #0x40
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BCA6
	ldrb r3, [r4]
	cmp r3, #1
	bls _0809BC98
	subs r0, r3, #2
	b _0809BCA4
_0809BC98:
	ldrh r1, [r6, #8]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BCA6
	adds r0, r3, #4
_0809BCA4:
	strb r0, [r4]
_0809BCA6:
	ldr r2, [r2]
	ldrh r1, [r2, #6]
	movs r6, #0x80
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BCCC
	ldrb r3, [r4]
	cmp r3, #3
	bhi _0809BCBE
	adds r0, r3, #2
	b _0809BCCA
_0809BCBE:
	ldrh r1, [r2, #8]
	adds r0, r6, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BCCC
	subs r0, r3, #4
_0809BCCA:
	strb r0, [r4]
_0809BCCC:
	adds r6, r4, #0
	ldrb r0, [r6]
	cmp r8, r0
	beq _0809BD72
	ldr r0, _0809BD44 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0809BCE6
	movs r0, #0x65
	bl m4aSongNumStart
_0809BCE6:
	ldrb r1, [r6]
	movs r7, #1
	adds r0, r7, #0
	ands r0, r1
	movs r2, #0x26
	mov r8, r2
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	movs r3, #0x80
	lsls r3, r3, #3
	movs r2, #3
	bl sub_80B1FBC
	adds r0, r5, #0
	adds r0, #0x2d
	ldrb r0, [r0]
	cmp r0, #0xff
	beq _0809BD72
	ldr r0, _0809BD48 @ =0x03005270
	ldrb r1, [r0]
	adds r0, r7, #0
	ands r0, r1
	cmp r0, #0
	beq _0809BD50
	ldrb r1, [r6]
	adds r0, r7, #0
	ands r0, r1
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x90
_0809BD2E:
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _0809BD4C @ =0x08A94654
_0809BD36:
	ldrb r2, [r6]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
	b _0809BD72
	.align 2, 0
_0809BD44: .4byte 0x0202BCEC
_0809BD48: .4byte 0x03005270
_0809BD4C: .4byte 0x08A94654
_0809BD50:
	ldrb r1, [r4]
	adds r0, r7, #0
	ands r0, r1
	mov r2, r8
	muls r2, r0, r2
	adds r0, r2, #0
	adds r0, #0x90
	lsrs r1, r1, #1
	lsls r1, r1, #4
	adds r1, #0x54
	ldr r3, _0809BD7C @ =0x08A9463C
	ldrb r2, [r4]
	lsls r2, r2, #2
	adds r2, r2, r3
	ldr r2, [r2]
	bl StartHelpBox
_0809BD72:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809BD7C: .4byte 0x08A9463C

