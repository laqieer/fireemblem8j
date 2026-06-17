	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EndFaceById, 0x08005660 + 1
	.set GetMenuCursorPosition, 0x08050174 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.set sub_804FC34, 0x0804FC34 + 1
	.set sub_8050008, 0x08050008 + 1
	.set sub_80500E8, 0x080500E8 + 1
	.set sub_8050418, 0x08050418 + 1
	.section .text.sub_804FED8, "ax", %progbits
@ sub_804FED8 @ JP 0x0804FED8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Menu_OnIdle
	.thumb_func
Menu_OnIdle:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r5, r0, #0
	adds r0, #0x63
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804FEFE
	add r2, sp, #4
	adds r0, r5, #0
	mov r1, sp
	bl GetMenuCursorPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_804F5D4
	b _0804FFFA
_0804FEFE:
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _0804FF0E
	adds r0, r5, #0
	bl sub_804FC34
	b _0804FFFA
_0804FF0E:
	adds r0, r5, #0
	bl sub_8050008
	adds r0, r5, #0
	bl sub_80500E8
	adds r6, r0, #0
	movs r0, #2
	ands r0, r6
	cmp r0, #0
	beq _0804FF2A
	adds r0, r5, #0
	bl sub_804FC34
_0804FF2A:
	movs r0, #4
	ands r0, r6
	cmp r0, #0
	beq _0804FF44
	ldr r0, _08050004 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804FF44
	movs r0, #0x6a
	bl m4aSongNumStart
_0804FF44:
	movs r0, #8
	ands r0, r6
	cmp r0, #0
	beq _0804FF5E
	ldr r0, _08050004 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0804FF5E
	movs r0, #0x6b
	bl m4aSongNumStart
_0804FF5E:
	movs r0, #0x10
	ands r0, r6
	cmp r0, #0
	beq _0804FFA2
	adds r4, r5, #0
	adds r4, #0x64
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r0, [r4]
	lsls r0, r0, #0x1e
	lsrs r0, r0, #0x1e
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	ldrb r3, [r4]
	lsls r1, r3, #0x1e
	lsrs r1, r1, #0x1e
	movs r2, #1
	adds r0, r2, #0
	lsls r0, r1
	lsls r3, r3, #0x1c
	lsrs r3, r3, #0x1e
	lsls r2, r3
	adds r0, r0, r2
	bl BG_EnableSyncByMask
_0804FFA2:
	movs r4, #0x20
	adds r0, r6, #0
	ands r0, r4
	cmp r0, #0
	beq _0804FFB2
	movs r0, #0
	bl EndFaceById
_0804FFB2:
	movs r0, #0x80
	ands r0, r6
	cmp r0, #0
	beq _0804FFC6
	adds r2, r5, #0
	adds r2, #0x63
	ldrb r1, [r2]
	movs r0, #0x80
	orrs r0, r1
	strb r0, [r2]
_0804FFC6:
	movs r0, #1
	ands r0, r6
	cmp r0, #0
	bne _0804FFFA
	adds r0, r5, #0
	adds r0, #0x63
	ldrb r1, [r0]
	adds r0, r4, #0
	ands r0, r1
	cmp r0, #0
	bne _0804FFFA
	add r4, sp, #4
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl GetMenuCursorPosition
	adds r0, r5, #0
	mov r1, sp
	adds r2, r4, #0
	bl sub_8050418
	ldr r0, [sp]
	ldr r1, [sp, #4]
	bl sub_804F528
_0804FFFA:
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08050004: .4byte 0x0202BCEC

