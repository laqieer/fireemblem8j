	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_80A0ED8, 0x080A0ED8 + 1
	.set sub_80A14B8, 0x080A14B8 + 1
	.set sub_80A1564, 0x080A1564 + 1
	.set sub_80A1694, 0x080A1694 + 1
	.set sub_80B1474, 0x080B1474 + 1
	.set sub_80B1844, 0x080B1844 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A1928, "ax", %progbits
@ sub_80A1928 @ JP 0x080A1928 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1928
	.thumb_func
sub_80A1928:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x33
	ldrb r0, [r6]
	lsls r0, r0, #1
	movs r1, #0x38
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sb, r1
	adds r5, r4, #0
	adds r5, #0x4a
	adds r7, r5, r0
	ldrh r0, [r7]
	movs r2, #0xf
	mov sl, r2
	mov r1, sl
	ands r1, r0
	mov sl, r1
	cmp r1, #0
	beq _080A1960
	b _080A1BA8
_080A1960:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080A196C
	cmp r0, #0xff
	beq _080A196C
	b _080A1A60
_080A196C:
	ldr r1, _080A19A8 @ =0x085775CC
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080A19B4
	ldr r0, _080A19AC @ =0x02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A19C4
	ldr r1, _080A19B0 @ =0x020122D4
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, sb
	lsls r1, r0, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x36]
	b _080A1D1A
	.align 2, 0
_080A19A8: .4byte 0x085775CC
_080A19AC: .4byte 0x02012F56
_080A19B0: .4byte 0x020122D4
_080A19B4:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080A1A34
	ldr r0, _080A19DC @ =0x02012F56
	ldrh r0, [r0]
	cmp r0, #0
	bne _080A19E4
_080A19C4:
	ldr r0, _080A19E0 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A19D2
	b _080A1D1A
_080A19D2:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080A1D1A
	.align 2, 0
_080A19DC: .4byte 0x02012F56
_080A19E0: .4byte 0x0202BCEC
_080A19E4:
	ldr r0, _080A1A0C @ =0x020122D4
	mov r2, sb
	lsls r1, r2, #2
	adds r1, r1, r0
	ldrb r0, [r1]
	cmp r0, #0
	bne _080A1A10
	lsls r2, r2, #4
	ldrh r0, [r7]
	subs r0, #0x28
	subs r2, r2, r0
	movs r0, #0
	movs r1, #0x80
	movs r3, #2
	bl sub_80B1474
	adds r0, r4, #0
	movs r1, #7
	b _080A1A14
	.align 2, 0
_080A1A0C: .4byte 0x020122D4
_080A1A10:
	adds r0, r4, #0
	movs r1, #6
_080A1A14:
	bl Proc_Goto
	ldr r0, _080A1A30 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A1A26
	b _080A1D1A
_080A1A26:
	movs r0, #0x6a
	bl m4aSongNumStart
	b _080A1D1A
	.align 2, 0
_080A1A30: .4byte 0x0202BCEC
_080A1A34:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A1A80
	adds r0, r4, #0
	movs r1, #8
	bl Proc_Goto
	ldr r0, _080A1A5C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1A56
	movs r0, #0x6b
	bl m4aSongNumStart
_080A1A56:
	mov r0, sl
	strh r0, [r4, #0x36]
	b _080A1D1A
	.align 2, 0
_080A1A5C: .4byte 0x0202BCEC
_080A1A60:
	ldr r2, _080A1A7C @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _080A1A80
	bl sub_808B2A4
	mov r1, sl
	strh r1, [r4, #0x36]
	b _080A1D1A
	.align 2, 0
_080A1A7C: .4byte 0x085775CC
_080A1A80:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A1AC8
	movs r0, #0
	bl sub_80B1844
	ldr r0, _080A1AC4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1AAA
	movs r0, #0x67
	bl m4aSongNumStart
_080A1AAA:
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A14B8
	b _080A1D1A
	.align 2, 0
_080A1AC4: .4byte 0x0202BCEC
_080A1AC8:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A1B04
	movs r0, #1
	bl sub_80B1844
	ldr r0, _080A1B00 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1AE8
	movs r0, #0x67
	bl m4aSongNumStart
_080A1AE8:
	adds r0, r4, #0
	movs r1, #4
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x32
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_80A1564
	b _080A1D1A
	.align 2, 0
_080A1B00: .4byte 0x0202BCEC
_080A1B04:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A1B18
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #8
	b _080A1B1E
_080A1B18:
	adds r1, r4, #0
	adds r1, #0x31
	movs r0, #4
_080A1B1E:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080A1B4C
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x33
	adds r5, r4, #0
	adds r5, #0x38
	cmp r0, #0
	beq _080A1B68
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _080A1B68
_080A1B4C:
	adds r0, r4, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x38
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _080A1B68
	subs r0, r1, #1
	strh r0, [r3]
_080A1B68:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080A1B8A
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A1C06
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _080A1C06
_080A1B8A:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _080A1BA4 @ =0x02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A1C06
	adds r0, r1, #1
	strh r0, [r2]
	b _080A1C06
	.align 2, 0
_080A1BA4: .4byte 0x02012F56
_080A1BA8:
	mov r1, sb
	lsls r0, r1, #4
	ldrh r2, [r7]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _080A1BC6
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r7]
_080A1BC6:
	ldrb r0, [r6]
	lsls r0, r0, #1
	mov r2, r8
	adds r1, r2, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r3, r5, r0
	ldrh r2, [r3]
	adds r0, r2, #0
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _080A1BEE
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_080A1BEE:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	mov r5, r8
_080A1C06:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp sb, r0
	bne _080A1C14
	b _080A1D1A
_080A1C14:
	ldr r7, _080A1C90 @ =0x020122D4
	lsls r0, r0, #2
	adds r0, r0, r7
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _080A1C94 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1C30
	movs r0, #0x66
	bl m4aSongNumStart
_080A1C30:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r1, [r0]
	lsls r1, r1, #2
	adds r1, r1, r7
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r7
	ldrb r1, [r1]
	ldrb r0, [r0]
	cmp r1, r0
	beq _080A1C50
	adds r0, r4, #0
	bl sub_80A0ED8
_080A1C50:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4a
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _080A1C98
	cmp r3, #0
	beq _080A1C98
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080A1C82
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_080A1C82:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _080A1CD0
	.align 2, 0
_080A1C90: .4byte 0x020122D4
_080A1C94: .4byte 0x0202BCEC
_080A1C98:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r2, [r1]
	lsls r1, r2, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	cmp r1, #0x78
	ble _080A1CDC
	ldr r0, _080A1CD8 @ =0x02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _080A1CDC
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080A1CC8
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_080A1CC8:
	adds r0, r4, #0
	adds r0, #0x31
	movs r1, #0
	ldrsb r1, [r0, r1]
_080A1CD0:
	adds r0, r4, #0
	bl sub_80A1694
	b _080A1D1A
	.align 2, 0
_080A1CD8: .4byte 0x02012F56
_080A1CDC:
	ldrh r0, [r4, #0x36]
	cmp r0, #0
	beq _080A1CFC
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_080A1CFC:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r1, [r1]
	lsls r1, r1, #4
	adds r0, r7, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x80
	movs r2, #0xb
	bl sub_80B1FBC
_080A1D1A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

