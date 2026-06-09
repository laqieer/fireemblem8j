	.syntax unified
	.set CallChestOpeningEvent, 0x0800D594 + 1
	.set CallTileChangeEvent, 0x0800D568 + 1
	.set GetChapterEventDataPointer, 0x080345B8 + 1
	.set NextRN_100, 0x08000C3C + 1
	.set SetFlag, 0x080860A8 + 1
	.set StartArmoryScreenOrphaned, 0x080B8D58 + 1
	.set StartSecretShopScreenOrphaned, 0x080B8D98 + 1
	.set StartVendorScreenOrphaned, 0x080B8D78 + 1
	.set sub_802E468, 0x0802E468 + 1
	.set sub_80851B8, 0x080851B8 + 1
	.set sub_80851FC, 0x080851FC + 1
	.set sub_80862D4, 0x080862D4 + 1
	.set sub_8086870, 0x08086870 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_808639C, "ax", %progbits
@ sub_808639C @ JP 0x0808639C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808639C
	.thumb_func
sub_808639C:
	push {r4, r5, lr}
	sub sp, #0x1c
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	lsls r1, r1, #0x18
	asrs r4, r1, #0x18
	ldr r0, _080863DC @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetChapterEventDataPointer
	ldr r0, [r0, #8]
	str r0, [sp]
	mov r0, sp
	strb r5, [r0, #0x18]
	strb r4, [r0, #0x19]
	bl sub_80851FC
	cmp r0, #0
	bne _080863C8
	b _080865FA
_080863C8:
	ldr r0, [sp, #0xc]
	cmp r0, #0x20
	bls _080863D0
	b _080865FA
_080863D0:
	lsls r0, r0, #2
	ldr r1, _080863E0 @ =_080863E4
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080863DC: .4byte 0x0202BCEC
_080863E0: .4byte _080863E4
_080863E4: @ jump table
	.4byte _080865F8 @ case 0
	.4byte _080865FA @ case 1
	.4byte _080865FA @ case 2
	.4byte _080865FA @ case 3
	.4byte _080865FA @ case 4
	.4byte _080865FA @ case 5
	.4byte _080865FA @ case 6
	.4byte _080865FA @ case 7
	.4byte _080865FA @ case 8
	.4byte _080865FA @ case 9
	.4byte _080865FA @ case 10
	.4byte _080865FA @ case 11
	.4byte _080865FA @ case 12
	.4byte _080865FA @ case 13
	.4byte _080865FA @ case 14
	.4byte _080865FA @ case 15
	.4byte _08086468 @ case 16
	.4byte _0808647E @ case 17
	.4byte _080864D0 @ case 18
	.4byte _080864D0 @ case 19
	.4byte _0808650C @ case 20
	.4byte _080865FA @ case 21
	.4byte _080865AC @ case 22
	.4byte _080865C4 @ case 23
	.4byte _080865DC @ case 24
	.4byte _080865F4 @ case 25
	.4byte _080865FA @ case 26
	.4byte _080865FA @ case 27
	.4byte _080865FA @ case 28
	.4byte _080865FA @ case 29
	.4byte _080865FA @ case 30
	.4byte _080865FA @ case 31
	.4byte _080864A8 @ case 32
_08086468:
	ldr r0, _080864A0 @ =0x0202E4D4
	ldr r1, [r0]
	lsls r0, r4, #2
	adds r0, r0, r1
	ldr r1, [r0]
	adds r1, r1, r5
	ldr r0, _080864A4 @ =0x03004DF0
	ldr r0, [r0]
	ldr r0, [r0]
	ldrb r0, [r0, #4]
	strb r0, [r1]
_0808647E:
	bl sub_80C1E74
	cmp r0, #2
	bne _08086488
	b _080865FA
_08086488:
	bl sub_8086870
	mov r0, sp
	movs r1, #1
	bl sub_80851B8
	ldr r0, [sp, #0x10]
	cmp r0, #3
	beq _0808649C
	b _080865FA
_0808649C:
	b _080864B2
	.align 2, 0
_080864A0: .4byte 0x0202E4D4
_080864A4: .4byte 0x03004DF0
_080864A8:
	bl sub_80C1E74
	cmp r0, #2
	bne _080864B2
	b _080865FA
_080864B2:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_802E468
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CallTileChangeEvent
	b _080865FA
_080864D0:
	bl sub_80C1E74
	cmp r0, #2
	bne _080864DA
	b _080865FA
_080864DA:
	ldr r0, [sp, #4]
	cmp r0, #1
	bne _080864FE
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_802E468
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl CallTileChangeEvent
	b _080865A4
_080864FE:
	bl sub_8086870
	mov r0, sp
	movs r1, #1
	bl sub_80851B8
	b _080865FA
_0808650C:
	bl sub_80C1E74
	cmp r0, #2
	beq _080865FA
	ldr r0, [sp, #0x14]
	cmp r0, #0
	bne _0808654C
	bl NextRN_100
	lsls r0, r0, #0x18
	lsrs r3, r0, #0x18
	ldr r2, [sp, #4]
	ldrb r0, [r2]
	cmp r0, #0
	beq _08086548
	ldrb r1, [r2, #1]
	cmp r3, r1
	blo _08086546
_08086530:
	adds r2, #2
	ldrb r0, [r2]
	cmp r0, #0
	beq _08086548
	ldrb r0, [r2, #1]
	adds r0, r1, r0
	lsls r0, r0, #0x18
	lsrs r1, r0, #0x18
	cmp r3, r1
	bhs _08086530
	ldrb r0, [r2]
_08086546:
	str r0, [sp, #0x14]
_08086548:
	ldr r0, [sp, #0x14]
	b _08086550
_0808654C:
	cmp r0, #0x77
	beq _08086582
_08086550:
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	bl sub_80862D4
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	str r0, [sp, #0x14]
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_802E468
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x14]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl CallChestOpeningEvent
	b _080865A4
_08086582:
	mov r0, sp
	ldrb r0, [r0, #0x18]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov r1, sp
	ldrb r1, [r1, #0x19]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	bl sub_802E468
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	ldr r1, [sp, #0x10]
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	bl CallChestOpeningEvent
_080865A4:
	ldr r0, [sp, #8]
	bl SetFlag
	b _080865FA
_080865AC:
	bl sub_80C1E74
	cmp r0, #2
	beq _080865FA
	ldr r0, _080865C0 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl StartArmoryScreenOrphaned
	b _080865FA
	.align 2, 0
_080865C0: .4byte 0x03004DF0
_080865C4:
	bl sub_80C1E74
	cmp r0, #2
	beq _080865FA
	ldr r0, _080865D8 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl StartVendorScreenOrphaned
	b _080865FA
	.align 2, 0
_080865D8: .4byte 0x03004DF0
_080865DC:
	bl sub_80C1E74
	cmp r0, #2
	beq _080865FA
	ldr r0, _080865F0 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, [sp, #4]
	bl StartSecretShopScreenOrphaned
	b _080865FA
	.align 2, 0
_080865F0: .4byte 0x03004DF0
_080865F4:
	mov r8, r8
	b _080865FA
_080865F8:
	mov r8, r8
_080865FA:
	add sp, #0x1c
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

