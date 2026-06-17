	.syntax unified
	.set CheckFlag, 0x080860D0 + 1
	.set CountUnitsInState, 0x08024D00 + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_8015FD4, "ax", %progbits
@ GetCurrentMapMusicIndex @ JP 0x08015FD4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetCurrentMapMusicIndex
	.thumb_func
GetCurrentMapMusicIndex:
	push {r4, r5, r6, r7, lr}
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r1, #6
	cmp r0, #0
	bne _08015FE6
	movs r1, #0
_08015FE6:
	adds r7, r1, #0
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	movs r1, #7
	cmp r0, #0
	bne _08015FF8
	movs r1, #1
_08015FF8:
	adds r6, r1, #0
	movs r0, #4
	bl CheckFlag
	adds r1, r0, #0
	lsls r1, r1, #0x18
	cmp r1, #0
	bne _0801600C
	movs r4, #2
	b _0801600E
_0801600C:
	movs r4, #6
_0801600E:
	ldr r5, _08016020 @ =0x0202BCEC
	ldrb r1, [r5, #0xf]
	cmp r1, #0x40
	beq _0801603A
	cmp r1, #0x40
	bgt _08016024
	cmp r1, #0
	beq _0801604C
	b _080160D0
	.align 2, 0
_08016020: .4byte 0x0202BCEC
_08016024:
	cmp r1, #0x80
	bne _080160D0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r6, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080160D0
_0801603A:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r4, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080160D0
_0801604C:
	movs r0, #4
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801606A
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
	b _080160D0
_0801606A:
	bl sub_80C1E74
	cmp r0, #2
	beq _08016086
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080160BC
_08016086:
	ldr r1, _080160B0 @ =0x0001000C
	movs r0, #0x80
	bl CountUnitsInState
	adds r4, r0, #0
	bl sub_80C1E74
	cmp r0, #2
	beq _080160B4
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x86
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r4, r0
	ble _080160B8
	b _080160BC
	.align 2, 0
_080160B0: .4byte 0x0001000C
_080160B4:
	cmp r4, #1
	bgt _080160BC
_080160B8:
	movs r0, #0x10
	b _080160D0
_080160BC:
	ldr r0, _080160D8 @ =0x0202BCEC
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetROMChapterStruct
	lsls r1, r7, #1
	adds r0, #0x16
	adds r0, r0, r1
	ldrh r0, [r0]
_080160D0:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080160D8: .4byte 0x0202BCEC

