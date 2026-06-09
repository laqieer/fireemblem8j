	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_80A0250, 0x080A0250 + 1
	.set sub_80A02F4, 0x080A02F4 + 1
	.set sub_80A04B8, 0x080A04B8 + 1
	.set sub_80A0568, 0x080A0568 + 1
	.set sub_80B1844, 0x080B1844 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A06C0, "ax", %progbits
@ sub_80A06C0 @ JP 0x080A06C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A06C0
	.thumb_func
sub_80A06C0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	lsls r0, r0, #1
	movs r1, #0x3a
	adds r1, r1, r4
	mov r8, r1
	adds r1, r1, r0
	ldrh r1, [r1]
	mov sl, r1
	adds r5, r4, #0
	adds r5, #0x4c
	adds r6, r5, r0
	ldrh r0, [r6]
	movs r2, #0xf
	mov sb, r2
	mov r1, sb
	ands r1, r0
	mov sb, r1
	cmp r1, #0
	beq _080A06F8
	b _080A08E8
_080A06F8:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080A0702
	cmp r0, #0xff
	bne _080A07A0
_080A0702:
	ldr r1, _080A073C @ =0x085775CC
	ldr r0, [r1]
	ldrh r3, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r3
	mov r8, r1
	cmp r0, #0
	beq _080A0764
	ldr r0, _080A0740 @ =0x02012F56
	ldrh r0, [r0]
	cmp r0, #0
	beq _080A0748
	ldr r1, _080A0744 @ =0x020122D4
	mov r2, sl
	lsls r0, r2, #2
	adds r0, r0, r1
	ldrh r2, [r0, #2]
	mov r0, sl
	lsls r1, r0, #4
	ldrh r0, [r6]
	subs r0, #0x28
	subs r1, r1, r0
	movs r0, #0x80
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r4, #0x38]
	b _080A0A3A
	.align 2, 0
_080A073C: .4byte 0x085775CC
_080A0740: .4byte 0x02012F56
_080A0744: .4byte 0x020122D4
_080A0748:
	ldr r0, _080A0760 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	bge _080A0756
	b _080A0A3A
_080A0756:
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080A0A3A
	.align 2, 0
_080A0760: .4byte 0x0202BCEC
_080A0764:
	movs r0, #1
	ands r0, r3
	cmp r0, #0
	beq _080A0774
	adds r0, r4, #0
	bl sub_80A0568
	b _080A0A3A
_080A0774:
	movs r0, #2
	ands r0, r3
	cmp r0, #0
	beq _080A07C0
	adds r0, r4, #0
	movs r1, #1
	bl Proc_Goto
	ldr r0, _080A079C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0796
	movs r0, #0x6b
	bl m4aSongNumStart
_080A0796:
	mov r1, sb
	strh r1, [r4, #0x38]
	b _080A0A3A
	.align 2, 0
_080A079C: .4byte 0x0202BCEC
_080A07A0:
	ldr r2, _080A07BC @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	mov r8, r2
	cmp r0, #0
	beq _080A07C0
	bl sub_808B2A4
	mov r2, sb
	strh r2, [r4, #0x38]
	b _080A0A3A
	.align 2, 0
_080A07BC: .4byte 0x085775CC
_080A07C0:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x20
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	cmp r5, #0
	beq _080A0808
	movs r0, #0
	bl sub_80B1844
	ldr r0, _080A0804 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A07EA
	movs r0, #0x67
	bl m4aSongNumStart
_080A07EA:
	adds r0, r4, #0
	movs r1, #5
	bl Proc_Goto
	adds r1, r4, #0
	adds r1, #0x34
	movs r0, #0
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A0250
	b _080A0A3A
	.align 2, 0
_080A0804: .4byte 0x0202BCEC
_080A0808:
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080A0844
	movs r0, #1
	bl sub_80B1844
	ldr r0, _080A0840 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0828
	movs r0, #0x67
	bl m4aSongNumStart
_080A0828:
	adds r0, r4, #0
	movs r1, #6
	bl Proc_Goto
	adds r0, r4, #0
	adds r0, #0x34
	strb r5, [r0]
	adds r0, r4, #0
	bl sub_80A02F4
	b _080A0A3A
	.align 2, 0
_080A0840: .4byte 0x0202BCEC
_080A0844:
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A0858
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #8
	b _080A085E
_080A0858:
	adds r1, r4, #0
	adds r1, #0x32
	movs r0, #4
_080A085E:
	strb r0, [r1]
	adds r7, r1, #0
	mov r1, r8
	ldr r2, [r1]
	ldrh r1, [r2, #6]
	movs r3, #0x40
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080A088C
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	adds r6, r4, #0
	adds r6, #0x35
	adds r5, r4, #0
	adds r5, #0x3a
	cmp r0, #0
	beq _080A08A8
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _080A08A8
_080A088C:
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r2, r4, #0
	adds r2, #0x3a
	adds r3, r2, r1
	ldrh r1, [r3]
	adds r6, r0, #0
	adds r5, r2, #0
	cmp r1, #0
	beq _080A08A8
	subs r0, r1, #1
	strh r0, [r3]
_080A08A8:
	mov r0, r8
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r3, #0x80
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	bne _080A08CA
	ldrh r1, [r2, #4]
	adds r0, r3, #0
	ands r0, r1
	cmp r0, #0
	beq _080A0948
	movs r0, #0
	ldrsb r0, [r7, r0]
	cmp r0, #8
	bne _080A0948
_080A08CA:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r2, r5, r0
	ldrh r1, [r2]
	ldr r0, _080A08E4 @ =0x02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r1, r0
	bge _080A0948
	adds r0, r1, #1
	strh r0, [r2]
	b _080A0948
	.align 2, 0
_080A08E4: .4byte 0x02012F56
_080A08E8:
	mov r1, sl
	lsls r0, r1, #4
	ldrh r2, [r6]
	adds r1, r2, #0
	subs r1, #0x28
	subs r0, r0, r1
	cmp r0, #0x37
	bgt _080A0906
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, r2, r0
	strh r0, [r6]
_080A0906:
	ldrb r0, [r7]
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
	ble _080A092E
	adds r0, r4, #0
	adds r0, #0x32
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, r2, r0
	strh r0, [r3]
_080A092E:
	ldrb r0, [r7]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	adds r6, r7, #0
	mov r5, r8
_080A0948:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r0, r5, r0
	ldrh r0, [r0]
	cmp sl, r0
	beq _080A0A3A
	ldr r1, _080A09B0 @ =0x020122D4
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrh r0, [r0, #2]
	mov r8, r0
	ldr r0, _080A09B4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A0970
	movs r0, #0x66
	bl m4aSongNumStart
_080A0970:
	ldrb r0, [r6]
	lsls r0, r0, #1
	adds r1, r5, r0
	ldrh r3, [r1]
	lsls r2, r3, #4
	adds r1, r4, #0
	adds r1, #0x4c
	adds r0, r1, r0
	ldrh r0, [r0]
	subs r0, #0x28
	subs r2, r2, r0
	adds r7, r1, #0
	cmp r2, #0x37
	bgt _080A09B8
	cmp r3, #0
	beq _080A09B8
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080A09A2
	adds r1, r2, #0
	adds r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_080A09A2:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
	rsbs r1, r1, #0
	b _080A09F0
	.align 2, 0
_080A09B0: .4byte 0x020122D4
_080A09B4: .4byte 0x0202BCEC
_080A09B8:
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
	ble _080A09FC
	ldr r0, _080A09F8 @ =0x02012F56
	ldrh r0, [r0]
	subs r0, #1
	cmp r2, r0
	beq _080A09FC
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080A09E8
	subs r1, #0x10
	movs r0, #0x80
	mov r2, r8
	bl StartItemHelpBox
_080A09E8:
	adds r0, r4, #0
	adds r0, #0x32
	movs r1, #0
	ldrsb r1, [r0, r1]
_080A09F0:
	adds r0, r4, #0
	bl sub_80A04B8
	b _080A0A3A
	.align 2, 0
_080A09F8: .4byte 0x02012F56
_080A09FC:
	ldrh r0, [r4, #0x38]
	cmp r0, #0
	beq _080A0A1C
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
_080A0A1C:
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
_080A0A3A:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

