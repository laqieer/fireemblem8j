	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set IsSoundRoomSongPlayable, 0x080B390C + 1
	.set MusicProc4Exists, 0x080029BC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SoundRoom_GetScrollDirection, 0x080B3F98 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80B3F58, 0x080B3F58 + 1
	.set sub_80B3F70, 0x080B3F70 + 1
	.set sub_80B3FE8, 0x080B3FE8 + 1
	.set sub_80B4414, 0x080B4414 + 1
	.set sub_80B4460, 0x080B4460 + 1
	.set sub_80B4498, 0x080B4498 + 1
	.section .text.sub_80B44C0, "ax", %progbits
@ SoundRoomUi_Loop_MainKeyHandler @ JP 0x080B44C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SoundRoomUi_Loop_MainKeyHandler
	.thumb_func
SoundRoomUi_Loop_MainKeyHandler:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080B45B4
	ldr r0, _080B459C @ =0x085775CC
	ldr r2, [r0]
	ldrh r3, [r2, #6]
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #4
	strb r0, [r5]
	ldrh r1, [r2, #4]
	movs r0, #0x80
	lsls r0, r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B44F2
	ldrh r3, [r2, #4]
	movs r0, #8
	strb r0, [r5]
_080B44F2:
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _080B44FE
	movs r6, #4
	rsbs r6, r6, #0
_080B44FE:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _080B4508
	movs r6, #4
_080B4508:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _080B4522
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #0
	beq _080B4522
	movs r6, #1
	rsbs r6, r6, #0
_080B4522:
	movs r0, #0x10
	ands r3, r0
	cmp r3, #0
	beq _080B453A
	adds r0, r4, #0
	adds r0, #0x35
	ldrb r0, [r0]
	movs r1, #3
	ands r0, r1
	cmp r0, #2
	bhi _080B453A
	movs r6, #1
_080B453A:
	cmp r6, #0
	beq _080B45A6
	adds r2, r4, #0
	adds r2, #0x35
	ldrb r0, [r2]
	adds r0, r0, r6
	cmp r0, #0
	bge _080B454C
	b _080B467C
_080B454C:
	adds r1, r4, #0
	adds r1, #0x36
	ldrb r1, [r1]
	cmp r0, r1
	blt _080B4558
	b _080B467C
_080B4558:
	strb r0, [r2]
	adds r0, r4, #0
	bl sub_80B4498
	adds r0, r4, #0
	bl SoundRoom_GetScrollDirection
	adds r5, r4, #0
	adds r5, #0x37
	strb r0, [r5]
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _080B45A0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080B4584
	adds r0, r4, #0
	movs r1, #0xa
	bl Proc_Goto
_080B4584:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #1
	bne _080B4594
	adds r0, r4, #0
	movs r1, #0xb
	bl Proc_Goto
_080B4594:
	adds r0, r4, #0
	bl sub_80B3FE8
	b _080B45A6
	.align 2, 0
_080B459C: .4byte 0x085775CC
_080B45A0:
	adds r0, r4, #0
	bl sub_80B3F70
_080B45A6:
	adds r0, r4, #0
	adds r0, #0x37
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080B45F4
_080B45B4:
	adds r5, r4, #0
	adds r5, #0x37
	movs r1, #0
	ldrsb r1, [r5, r1]
	adds r0, r4, #0
	adds r0, #0x38
	ldrb r0, [r0]
	adds r2, r1, #0
	muls r2, r0, r2
	ldrh r0, [r4, #0x2a]
	adds r2, r2, r0
	strh r2, [r4, #0x2a]
	ldr r1, _080B45F0 @ =0x0000FFFC
	movs r0, #0xff
	ands r2, r0
	movs r0, #2
	bl BG_SetPosition
	ldrh r0, [r4, #0x2a]
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	bne _080B45E6
	movs r0, #0
	strb r0, [r5]
_080B45E6:
	adds r0, r4, #0
	bl sub_80B3F58
	b _080B467C
	.align 2, 0
_080B45F0: .4byte 0x0000FFFC
_080B45F4:
	ldr r0, _080B460C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080B4610
	adds r0, r4, #0
	bl sub_80B4460
	b _080B467C
	.align 2, 0
_080B460C: .4byte 0x085775CC
_080B4610:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B4650
	adds r5, r4, #0
	adds r5, #0x35
	ldrb r1, [r5]
	adds r0, r4, #0
	bl IsSoundRoomSongPlayable
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B4636
	ldrb r1, [r5]
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_80B4414
	b _080B467C
_080B4636:
	ldr r0, _080B464C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B467C
	movs r0, #0x6c
	bl m4aSongNumStart
	b _080B467C
	.align 2, 0
_080B464C: .4byte 0x0202BCEC
_080B4650:
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080B466C
	bl MusicProc4Exists
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B467C
	adds r0, r4, #0
	movs r1, #2
	bl Proc_Goto
	b _080B467C
_080B466C:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080B467C
	adds r0, r4, #0
	movs r1, #3
	bl Proc_Goto
_080B467C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

