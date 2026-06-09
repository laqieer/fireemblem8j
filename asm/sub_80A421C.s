	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set CheckFlag, 0x080860D0 + 1
	.set ClearFlag, 0x080860BC + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set InitText, 0x08003C8C + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetFlag, 0x080860A8 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_800783C, 0x0800783C + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_8097F30, 0x08097F30 + 1
	.set sub_80A2CB0, 0x080A2CB0 + 1
	.set sub_80A4188, 0x080A4188 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B261C, 0x080B261C + 1
	.set sub_80B269C, 0x080B269C + 1
	.section .text.sub_80A421C, "ax", %progbits
@ sub_80A421C @ JP 0x080A421C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A421C
	.thumb_func
sub_80A421C:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	bl sub_80A2CB0
	adds r6, r0, #0
	ldr r4, _080A4340 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	bl sub_8001ACC
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r1, [r4, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r4, #0xc]
	ldrb r1, [r4, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r2, r0
	strb r2, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl ResetFaces
	bl ResetText
	bl sub_80034C4
	bl sub_804F8E0
	bl sub_801569C
	ldr r2, _080A4344 @ =0x0000FFFC
	movs r0, #0
	movs r1, #4
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #4
	bl sub_8003508
	bl sub_8097CFC
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r0, r5, #0
	bl sub_80048B4
	ldr r0, _080A4348 @ =0x02013580
	movs r1, #8
	bl InitText
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r5, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80B261C
	movs r0, #0
	movs r1, #0x90
	movs r2, #0x10
	movs r3, #0
	bl sub_80B269C
	movs r0, #0xe0
	lsls r0, r0, #7
	movs r1, #1
	bl sub_80A4188
	ldr r4, _080A434C @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	bl GetROMChapterStruct
	adds r0, #0x80
	ldrb r0, [r0]
	str r0, [r5, #0x30]
	movs r0, #0xf0
	lsls r0, r0, #7
	movs r1, #2
	bl sub_8097F30
	ldr r0, _080A4350 @ =sub_80A4148
	adds r1, r5, #0
	bl sub_80B1D98
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #3
	movs r2, #1
	bl sub_8006710
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x7d
	bne _080A4354
	adds r0, r5, #0
	movs r1, #3
	bl Proc_Goto
	b _080A4384
	.align 2, 0
_080A4340: .4byte 0x03003020
_080A4344: .4byte 0x0000FFFC
_080A4348: .4byte 0x02013580
_080A434C: .4byte 0x0202BCEC
_080A4350: .4byte 0x080A4149  @ sub_80A4148
_080A4354:
	cmp r6, #0xae
	bne _080A4360
	movs r0, #0x85
	bl SetFlag
	b _080A4384
_080A4360:
	movs r0, #0x85
	bl CheckFlag
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A4384
	movs r0, #0xe
	ldrsb r0, [r4, r0]
	cmp r0, #0x79
	bgt _080A4384
	movs r6, #0xae
	movs r0, #0x85
	bl ClearFlag
	adds r0, r5, #0
	movs r1, #4
	bl Proc_Goto
_080A4384:
	ldr r3, _080A439C @ =0x00000202
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xd4
	movs r2, #0x52
	bl sub_800783C
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A439C: .4byte 0x00000202

