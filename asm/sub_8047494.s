	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_804DFE4, 0x0804DFE4 + 1
	.section .text.sub_8047494, "ax", %progbits
@ sub_8047494 @ JP 0x08047494 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047494
	.thumb_func
sub_8047494:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	ldr r0, [r4, #0x2c]
	mov r8, r0
	ldr r0, [r4, #0x40]
	adds r0, #1
	str r0, [r4, #0x40]
	cmp r0, #0x3b
	ble _08047546
	adds r7, r4, #0
	adds r7, #0x35
	ldrb r0, [r7]
	cmp r0, #5
	bne _080474BA
	adds r0, r4, #0
	bl sub_8002DE4
_080474BA:
	adds r5, r4, #0
	adds r5, #0x38
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	ble _080474F4
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r5]
	subs r0, #1
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804DFE4
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
	b _08047546
_080474F4:
	adds r6, r4, #0
	adds r6, #0x34
	ldrb r0, [r7]
	ldrb r1, [r6]
	cmp r0, r1
	beq _08047530
	ldrh r0, [r4, #0x36]
	subs r0, #2
	strh r0, [r4, #0x36]
	ldrb r0, [r6]
	subs r0, #1
	strb r0, [r6]
	movs r0, #7
	strb r0, [r5]
	ldrh r2, [r4, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldrh r1, [r4, #0x36]
	adds r1, #0x38
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r0, #0xa
	bl sub_804DFE4
	mov r1, r8
	ldr r0, [r1, #0x30]
	adds r0, #2
	str r0, [r1, #0x30]
_08047530:
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047546
	ldrb r0, [r6]
	ldrb r7, [r7]
	cmp r0, r7
	bne _08047546
	adds r0, r4, #0
	bl sub_8002DE4
_08047546:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

