	.syntax unified
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_804FE54, 0x0804FE54 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.ProcessMenuDpadInput, "ax", %progbits
@ ProcessMenuDpadInput @ JP 0x08050008 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ProcessMenuDpadInput
	.thumb_func
ProcessMenuDpadInput:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r2, r5, #0
	adds r2, #0x61
	ldrb r0, [r2]
	adds r1, r5, #0
	adds r1, #0x62
	strb r0, [r1]
	ldr r1, _080500E0 @ =0x085775CC
	ldr r3, [r1]
	ldrh r4, [r3, #6]
	movs r0, #0x40
	ands r0, r4
	cmp r0, #0
	beq _08050040
	ldrb r0, [r2]
	cmp r0, #0
	bne _0805003A
	ldrh r3, [r3, #8]
	cmp r4, r3
	bne _080500DA
	adds r0, r5, #0
	adds r0, #0x60
	ldrb r0, [r0]
	strb r0, [r2]
_0805003A:
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
_08050040:
	ldr r1, [r1]
	ldrh r3, [r1, #6]
	movs r0, #0x80
	ands r0, r3
	adds r4, r5, #0
	adds r4, #0x61
	cmp r0, #0
	beq _0805006E
	ldrb r2, [r4]
	adds r0, r5, #0
	adds r0, #0x60
	ldrb r0, [r0]
	subs r0, #1
	cmp r2, r0
	bne _08050068
	ldrh r1, [r1, #8]
	cmp r3, r1
	bne _080500DA
	movs r0, #0xff
	strb r0, [r4]
_08050068:
	ldrb r0, [r4]
	adds r0, #1
	strb r0, [r4]
_0805006E:
	adds r0, r5, #0
	adds r0, #0x62
	ldrb r1, [r0]
	adds r6, r0, #0
	ldrb r0, [r4]
	cmp r1, r0
	beq _080500A2
	ldrb r1, [r6]
	adds r0, r5, #0
	movs r2, #0
	bl sub_804FE54
	ldrb r1, [r4]
	adds r0, r5, #0
	movs r2, #1
	bl sub_804FE54
	ldr r0, _080500E4 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080500A2
	movs r0, #0x66
	bl m4aSongNumStart
_080500A2:
	ldrb r0, [r4]
	ldrb r1, [r6]
	cmp r0, r1
	beq _080500DA
	ldrb r0, [r6]
	lsls r0, r0, #2
	adds r6, r5, #0
	adds r6, #0x34
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x20]
	cmp r2, #0
	beq _080500C4
	adds r0, r5, #0
	bl sub_80D65C4
_080500C4:
	ldrb r0, [r4]
	lsls r0, r0, #2
	adds r0, r6, r0
	ldr r1, [r0]
	ldr r0, [r1, #0x30]
	ldr r2, [r0, #0x1c]
	cmp r2, #0
	beq _080500DA
	adds r0, r5, #0
	bl sub_80D65C4
_080500DA:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080500E0: .4byte 0x085775CC
_080500E4: .4byte 0x0202BCEC

