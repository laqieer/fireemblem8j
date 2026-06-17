	.syntax unified
	.set CopyLinkArenaStruct2, 0x080ABD54 + 1
	.set CopySoundRoomSaveData, 0x080ABD64 + 1
	.set SaveBonusContentData, 0x080A8394 + 1
	.set SaveRankings, 0x080A83C8 + 1
	.set SetGlobalSaveInfoPtr, 0x080ABC54 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_80A77EC, 0x080A77EC + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80A88E8, 0x080A88E8 + 1
	.set sub_80A8A44, 0x080A8A44 + 1
	.set sub_80ABC24, 0x080ABC24 + 1
	.set sub_80ABCC8, 0x080ABCC8 + 1
	.set sub_80ABD04, 0x080ABD04 + 1
	.set sub_80ABD40, 0x080ABD40 + 1
	.set sub_80ABD78, 0x080ABD78 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80ABD8C, "ax", %progbits
@ sub_80ABD8C @ JP 0x080ABD8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EraseInvalidSaveData
	.thumb_func
EraseInvalidSaveData:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	ldr r4, _080ABF34 @ =0x02000000
	movs r0, #0xe0
	lsls r0, r0, #0x14
	mov sb, r0
	ldr r5, _080ABF38 @ =0x03006790
	ldr r3, [r5]
	adds r1, r4, #0
	movs r2, #0x64
	bl sub_80D65C8
	ldr r1, [r4, #8]
	ldr r0, _080ABF3C @ =0x00040624
	cmp r1, r0
	bne _080ABDB6
	b _080ABF24
_080ABDB6:
	mov r8, r4
	movs r2, #0x80
	lsls r2, r2, #8
	ldr r3, [r5]
	mov r0, sb
	mov r1, r8
	bl sub_80D65C8
	mov r0, r8
	ldr r1, [r0, #8]
	ldr r0, _080ABF40 @ =0x00040603
	cmp r1, r0
	beq _080ABDD2
	b _080ABF24
_080ABDD2:
	movs r0, #0
	str r0, [sp]
	movs r4, #0x80
	lsls r4, r4, #8
	add r4, r8
	ldr r2, _080ABF44 @ =0x01000019
	mov r0, sp
	adds r1, r4, #0
	bl sub_80D636C
	mov r0, r8
	adds r1, r4, #0
	bl sub_80ABC24
	adds r0, r4, #0
	bl sub_80A77EC
	movs r5, #0
	add r7, sp, #4
	add r1, sp, #8
	mov sl, r1
	mov r0, sp
	adds r0, #0xc
	str r0, [sp, #0x20]
	mov r1, sp
	adds r1, #0x10
	str r1, [sp, #0x24]
	adds r0, #8
	str r0, [sp, #0x28]
	adds r1, #8
	str r1, [sp, #0x2c]
	adds r0, #8
	str r0, [sp, #0x30]
	mov r6, sb
	adds r6, #0xd4
_080ABE18:
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r7, #0
	adds r1, r4, #0
	ldr r2, _080ABF48 @ =0x010007DE
	bl sub_80D636C
	ldr r0, _080ABF4C @ =0x00001F58
	muls r0, r5, r0
	adds r0, #0xd4
	add r0, r8
	adds r1, r4, #0
	bl sub_80ABCC8
	adds r0, r4, #0
	adds r1, r6, #0
	ldr r2, _080ABF50 @ =0x00001F78
	bl WriteAndVerifySramFast
	ldr r1, _080ABF50 @ =0x00001F78
	adds r6, r6, r1
	adds r5, #1
	cmp r5, #1
	ble _080ABE18
	movs r5, #0
	ldr r6, _080ABF54 @ =0x02008000
	ldr r0, _080ABF58 @ =0x00003FC4
	mov r1, sb
	adds r4, r1, r0
_080ABE52:
	movs r7, #0
	str r7, [sp, #8]
	mov r0, sl
	adds r1, r6, #0
	ldr r2, _080ABF5C @ =0x01000372
	bl sub_80D636C
	ldr r0, _080ABF60 @ =0x00000DA4
	muls r0, r5, r0
	ldr r1, _080ABF64 @ =0x00003F84
	adds r0, r0, r1
	add r0, r8
	adds r1, r6, #0
	bl sub_80ABD04
	adds r0, r6, #0
	adds r1, r4, #0
	ldr r2, _080ABF68 @ =0x00000DC8
	bl WriteAndVerifySramFast
	ldr r0, _080ABF68 @ =0x00000DC8
	adds r4, r4, r0
	adds r5, #1
	cmp r5, #2
	ble _080ABE52
	str r7, [sp, #0xc]
	ldr r4, _080ABF54 @ =0x02008000
	ldr r2, _080ABF6C @ =0x01000025
	ldr r0, [sp, #0x20]
	adds r1, r4, #0
	bl sub_80D636C
	ldr r0, _080ABF70 @ =0x000070E4
	add r0, r8
	adds r1, r4, #0
	bl sub_80ABD78
	adds r0, r4, #0
	bl SaveRankings
	str r7, [sp, #0x10]
	ldr r2, _080ABF74 @ =0x01000009
	ldr r0, [sp, #0x24]
	adds r1, r4, #0
	bl sub_80D636C
	ldr r0, _080ABF78 @ =0x00007178
	add r0, r8
	adds r1, r4, #0
	bl CopySoundRoomSaveData
	adds r0, r4, #0
	bl sub_80A88E8
	str r7, [sp, #0x14]
	ldr r2, _080ABF7C @ =0x01000005
	ldr r0, [sp, #0x28]
	adds r1, r4, #0
	bl sub_80D636C
	ldr r0, _080ABF80 @ =0x0000719C
	add r0, r8
	adds r1, r4, #0
	bl CopyLinkArenaStruct2
	adds r0, r4, #0
	bl sub_80A8A44
	str r7, [sp, #0x18]
	ldr r2, _080ABF84 @ =0x01000051
	ldr r0, [sp, #0x2c]
	adds r1, r4, #0
	bl sub_80D636C
	ldr r0, _080ABF88 @ =0x000071B0
	add r0, r8
	adds r1, r4, #0
	bl sub_80ABD40
	adds r0, r4, #0
	bl SaveBonusContentData
	movs r5, #0
	adds r6, r4, #0
	mov r4, r8
	adds r4, #0x64
_080ABEFE:
	movs r0, #0
	str r0, [sp, #0x1c]
	ldr r0, [sp, #0x30]
	adds r1, r6, #0
	ldr r2, _080ABF8C @ =0x01000004
	bl sub_80D636C
	adds r0, r4, #0
	adds r1, r6, #0
	bl SetGlobalSaveInfoPtr
	adds r0, r6, #0
	adds r1, r5, #0
	bl sub_80A79D8
	adds r4, #0x10
	adds r5, #1
	cmp r5, #6
	ble _080ABEFE
_080ABF24:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080ABF34: .4byte 0x02000000
_080ABF38: .4byte 0x03006790
_080ABF3C: .4byte 0x00040624
_080ABF40: .4byte 0x00040603
_080ABF44: .4byte 0x01000019
_080ABF48: .4byte 0x010007DE
_080ABF4C: .4byte 0x00001F58
_080ABF50: .4byte 0x00001F78
_080ABF54: .4byte 0x02008000
_080ABF58: .4byte 0x00003FC4
_080ABF5C: .4byte 0x01000372
_080ABF60: .4byte 0x00000DA4
_080ABF64: .4byte 0x00003F84
_080ABF68: .4byte 0x00000DC8
_080ABF6C: .4byte 0x01000025
_080ABF70: .4byte 0x000070E4
_080ABF74: .4byte 0x01000009
_080ABF78: .4byte 0x00007178
_080ABF7C: .4byte 0x01000005
_080ABF80: .4byte 0x0000719C
_080ABF84: .4byte 0x01000051
_080ABF88: .4byte 0x000071B0
_080ABF8C: .4byte 0x01000004

