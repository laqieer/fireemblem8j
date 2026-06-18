	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set memcpy, 0x080D6908 + 1
	.section .text.sub_80AFE14, "ax", %progbits
@ SaveDrawCursor_Loop @ JP 0x080AFE14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SaveDrawCursor_Loop
	.thumb_func
SaveDrawCursor_Loop:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	adds r7, r0, #0
	ldr r1, _080AFEA8 @ =0x081F57F1
	add r0, sp, #4
	movs r2, #8
	bl memcpy
	ldr r0, [r7, #0x14]
	adds r0, #0x29
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _080AFE3C
	b _080AFF9C
_080AFE3C:
	ldrh r0, [r7, #0x2a]
	adds r0, #1
	strh r0, [r7, #0x2a]
	adds r2, r7, #0
	adds r2, #0x2c
	ldrb r0, [r2]
	str r2, [sp, #0xc]
	cmp r0, #3
	bhi _080AFE52
	adds r0, #1
	strb r0, [r2]
_080AFE52:
	adds r0, r7, #0
	adds r0, #0x36
	ldrb r1, [r0]
	str r0, [sp, #0x10]
	cmp r1, #0
	bne _080AFE60
	b _080AFF58
_080AFE60:
	movs r0, #0x32
	ldrsh r5, [r7, r0]
	movs r1, #0x2e
	ldrsh r3, [r7, r1]
	ldrb r0, [r2]
	cmp r0, #3
	bhi _080AFE96
	movs r2, #0x34
	ldrsh r0, [r7, r2]
	subs r0, r5, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r7, #0x34]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	movs r2, #0x30
	ldrsh r0, [r7, r2]
	subs r0, r3, r0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldrh r1, [r7, #0x30]
	adds r0, r0, r1
	lsls r0, r0, #0x10
	asrs r3, r0, #0x10
_080AFE96:
	adds r0, r7, #0
	adds r0, #0x3a
	ldrb r1, [r0]
	adds r2, r0, #0
	cmp r1, #0
	bne _080AFEAC
	adds r0, r3, #0
	adds r0, #0x9c
	b _080AFEB0
	.align 2, 0
_080AFEA8: .4byte 0x081F57F1
_080AFEAC:
	adds r0, r3, #0
	adds r0, #0xb0
_080AFEB0:
	lsls r0, r0, #0x10
	asrs r6, r0, #0x10
	ldrh r0, [r7, #0x32]
	strh r0, [r7, #0x34]
	ldrh r0, [r7, #0x2e]
	strh r0, [r7, #0x30]
	ldrb r0, [r2]
	cmp r0, #0
	bne _080AFF28
	ldr r2, _080AFF20 @ =0x000001FF
	mov sl, r2
	ands r3, r2
	ldrh r0, [r7, #0x2a]
	lsrs r0, r0, #3
	movs r1, #7
	mov r8, r1
	mov r2, r8
	ands r0, r2
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	adds r2, r5, r2
	movs r0, #0xff
	mov sb, r0
	ands r2, r0
	movs r4, #0xc0
	lsls r4, r4, #6
	str r4, [sp]
	movs r0, #4
	adds r1, r3, #0
	ldr r3, _080AFF24 @ =0x08A9D49C
	bl PutSpriteExt
	mov r1, sl
	ands r6, r1
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r6, r0
	ldrh r0, [r7, #0x2a]
	lsrs r0, r0, #3
	mov r1, r8
	ands r0, r1
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	adds r2, r5, r2
	mov r0, sb
	ands r2, r0
	str r4, [sp]
	movs r0, #4
	adds r1, r6, #0
	ldr r3, _080AFF24 @ =0x08A9D49C
	bl PutSpriteExt
	b _080AFF4C
	.align 2, 0
_080AFF20: .4byte 0x000001FF
_080AFF24: .4byte 0x08A9D49C
_080AFF28:
	ldrh r0, [r7, #0x2a]
	lsrs r0, r0, #3
	movs r1, #7
	ands r0, r1
	add r0, sp
	adds r0, #4
	ldrb r2, [r0]
	adds r2, r5, r2
	movs r0, #0xff
	ands r2, r0
	ldr r3, _080AFF54 @ =0x08A9D49C
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #4
	bl PutSpriteExt
_080AFF4C:
	movs r0, #0
	ldr r1, [sp, #0xc]
	strb r0, [r1]
	b _080AFF64
	.align 2, 0
_080AFF54: .4byte 0x08A9D49C
_080AFF58:
	ldrb r0, [r2]
	cmp r0, #4
	bne _080AFF64
	movs r0, #0
	ldr r2, [sp, #0x10]
	strb r0, [r2]
_080AFF64:
	adds r4, r7, #0
	adds r4, #0x38
	ldrb r0, [r4]
	cmp r0, #0
	beq _080AFF84
	adds r0, r7, #0
	adds r0, #0x37
	ldrb r2, [r0]
	ldr r3, _080AFFAC @ =0x08A9D49C
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #4
	movs r1, #6
	bl PutSpriteExt
_080AFF84:
	adds r1, r7, #0
	adds r1, #0x39
	ldrb r0, [r1]
	cmp r0, #0
	beq _080AFF92
	movs r0, #0
	strb r0, [r4]
_080AFF92:
	movs r0, #0
	ldr r2, [sp, #0x10]
	strb r0, [r2]
	movs r0, #1
	strb r0, [r1]
_080AFF9C:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AFFAC: .4byte 0x08A9D49C

