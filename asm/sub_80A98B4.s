	.syntax unified
	.set ClearSupplyItems, 0x08031454 + 1
	.set GetGlobalCompletionCount, 0x080A95F4 + 1
	.set GetNewPlaythroughId, 0x080A95B0 + 1
	.set GetSaveWriteAddr, 0x080A7AA8 + 1
	.set InitUnits, 0x0801756C + 1
	.set InvalidateSuspendSave, 0x080AA438 + 1
	.set ResetPermanentFlags, 0x08086040 + 1
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set WriteLastGameSaveId, 0x080A97C4 + 1
	.set sub_8000CE4, 0x08000CE4 + 1
	.set sub_8030C44, 0x08030C44 + 1
	.set sub_80A79D8, 0x080A79D8 + 1
	.set sub_80A7B94, 0x080A7B94 + 1
	.set sub_80A7C28, 0x080A7C28 + 1
	.set sub_80A8B48, 0x080A8B48 + 1
	.set sub_80A9778, 0x080A9778 + 1
	.set sub_80A9784, 0x080A9784 + 1
	.set sub_80ABA8C, 0x080ABA8C + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A98B4, "ax", %progbits
@ WriteNewGameSave @ JP 0x080A98B4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global WriteNewGameSave
	.thumb_func
WriteNewGameSave:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #0x38
	mov sb, r0
	adds r5, r1, #0
	mov r8, r2
	adds r4, r3, #0
	bl GetSaveWriteAddr
	adds r7, r0, #0
	mov r0, r8
	cmp r0, #0
	bne _080A98D8
	ldr r0, _080A9A00 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	mov r8, r0
_080A98D8:
	cmp r4, #0
	bge _080A98E6
	ldr r0, _080A9A00 @ =0x0202BCEC
	adds r0, #0x42
	ldrb r0, [r0]
	lsls r0, r0, #0x1a
	lsrs r4, r0, #0x1f
_080A98E6:
	movs r0, #0
	bl sub_8000CE4
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	adds r0, r5, #0
	bl sub_8030C44
	bl InitUnits
	bl ClearSupplyItems
	bl ResetPermanentFlags
	movs r0, #3
	bl InvalidateSuspendSave
	ldr r6, _080A9A00 @ =0x0202BCEC
	adds r2, r6, #0
	adds r2, #0x2c
	ldrb r1, [r2]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r2]
	ldrh r1, [r6, #0x2c]
	ldr r0, _080A9A04 @ =0xFFFFE00F
	ands r0, r1
	strh r0, [r6, #0x2c]
	add r0, sp, #0x34
	movs r4, #0
	strh r4, [r0]
	adds r1, r6, #0
	adds r1, #0x30
	ldr r2, _080A9A08 @ =0x01000008
	bl sub_80D6370
	ldr r0, [r6, #0x2c]
	ldr r1, _080A9A0C @ =0xFF801FFF
	ands r0, r1
	str r0, [r6, #0x2c]
	movs r5, #0
	mov r1, r8
	strb r1, [r6, #0x1b]
	adds r2, r6, #0
	adds r2, #0x2b
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	strb r0, [r2]
	adds r0, r6, #0
	adds r0, #0x20
	strb r4, [r0]
	strb r4, [r6, #0xe]
	bl GetNewPlaythroughId
	strb r0, [r6, #0x18]
	mov r0, sb
	strb r0, [r6, #0xc]
	bl GetGlobalCompletionCount
	movs r1, #0x1f
	ands r0, r1
	lsls r0, r0, #7
	ldrh r2, [r6, #0x2e]
	ldr r1, _080A9A10 @ =0xFFFFF07F
	ands r1, r2
	orrs r1, r0
	strh r1, [r6, #0x2e]
	adds r0, r6, #0
	adds r1, r7, #0
	movs r2, #0x4c
	bl WriteAndVerifySramFast
	movs r0, #0
	bl sub_80A9778
	adds r0, r7, #0
	bl sub_80A9784
	mov r0, sp
	adds r0, #0x36
	strh r5, [r0]
	add r4, sp, #0x10
	ldr r2, _080A9A14 @ =0x01000012
	adds r1, r4, #0
	bl sub_80D6370
	adds r6, r4, #0
	adds r4, r7, #0
	adds r4, #0x4c
	movs r5, #0x32
_080A999E:
	adds r0, r6, #0
	adds r1, r4, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	adds r4, #0x24
	subs r5, #1
	cmp r5, #0
	bge _080A999E
	movs r4, #0
	movs r0, #0xef
	lsls r0, r0, #3
	adds r1, r7, r0
	adds r0, r6, #0
	movs r2, #0x24
	bl WriteAndVerifySramFast
	ldr r1, _080A9A18 @ =0x0000079C
	adds r0, r7, r1
	bl sub_80A7C28
	adds r0, r7, #0
	bl sub_80A8B48
	ldr r1, _080A9A1C @ =0x00000D6C
	adds r0, r7, r1
	bl sub_80A7B94
	ldr r1, _080A9A20 @ =0x00000D8C
	adds r0, r7, r1
	bl sub_80ABA8C
	ldr r0, _080A9A24 @ =0x00040624
	str r0, [sp]
	mov r0, sp
	strb r4, [r0, #6]
	mov r1, sb
	bl sub_80A79D8
	mov r0, sb
	bl WriteLastGameSaveId
	add sp, #0x38
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A9A00: .4byte 0x0202BCEC
_080A9A04: .4byte 0xFFFFE00F
_080A9A08: .4byte 0x01000008
_080A9A0C: .4byte 0xFF801FFF
_080A9A10: .4byte 0xFFFFF07F
_080A9A14: .4byte 0x01000012
_080A9A18: .4byte 0x0000079C
_080A9A1C: .4byte 0x00000D6C
_080A9A20: .4byte 0x00000D8C
_080A9A24: .4byte 0x00040624

