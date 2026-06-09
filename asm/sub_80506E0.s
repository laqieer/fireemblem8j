	.syntax unified
	.set EndFaceById, 0x08005660 + 1
	.set TargetSelection_GetRealCursorPosition, 0x080506CC + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8015AB4, 0x08015AB4 + 1
	.set sub_8015E18, 0x08015E18 + 1
	.set sub_804F610, 0x0804F610 + 1
	.set sub_805082C, 0x0805082C + 1
	.set sub_8050860, 0x08050860 + 1
	.set sub_80508D8, 0x080508D8 + 1
	.section .text.sub_80506E0, "ax", %progbits
@ sub_80506E0 @ JP 0x080506E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80506E0
	.thumb_func
sub_80506E0:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	adds r0, #0x34
	ldrb r1, [r0]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _08050708
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #4
	bl sub_8015AB4
	b _080507A4
_08050708:
	adds r0, r4, #0
	bl sub_8050860
	adds r0, r4, #0
	bl sub_80508D8
	adds r5, r0, #0
	movs r0, #2
	ands r0, r5
	cmp r0, #0
	beq _08050724
	adds r0, r4, #0
	bl sub_805082C
_08050724:
	movs r0, #4
	ands r0, r5
	cmp r0, #0
	beq _0805073E
	ldr r0, _080507AC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0805073E
	movs r0, #0x6a
	bl m4aSongNumStart
_0805073E:
	movs r0, #8
	ands r0, r5
	cmp r0, #0
	beq _08050758
	ldr r0, _080507AC @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _08050758
	movs r0, #0x6b
	bl m4aSongNumStart
_08050758:
	movs r0, #0x10
	ands r0, r5
	cmp r0, #0
	beq _08050764
	bl sub_804F610
_08050764:
	movs r0, #0x20
	ands r0, r5
	cmp r0, #0
	beq _08050772
	movs r0, #0
	bl EndFaceById
_08050772:
	movs r0, #1
	ands r0, r5
	cmp r0, #0
	bne _080507A4
	add r2, sp, #4
	adds r0, r4, #0
	mov r1, sp
	bl TargetSelection_GetRealCursorPosition
	ldr r1, [sp]
	asrs r1, r1, #4
	ldr r2, [sp, #4]
	asrs r2, r2, #4
	adds r0, r4, #0
	bl sub_8015E18
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _080507A4
	ldr r0, [sp]
	ldr r1, [sp, #4]
	movs r2, #2
	bl sub_8015AB4
_080507A4:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080507AC: .4byte 0x0202BCEC

