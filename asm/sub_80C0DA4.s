	.syntax unified
	.set BG_EnableSync, 0x08001F0C + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_80C0A98, 0x080C0A98 + 1
	.set sub_80C0B0C, 0x080C0B0C + 1
	.set sub_80C0BE8, 0x080C0BE8 + 1
	.section .text.sub_80C0DA4, "ax", %progbits
@ sub_80C0DA4 @ JP 0x080C0DA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C0DA4
	.thumb_func
sub_80C0DA4:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	adds r0, #0x31
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _080C0DBE
	b _080C0EEE
_080C0DBE:
	adds r6, r7, #0
	adds r6, #0x36
	ldrb r0, [r6]
	adds r5, r7, #0
	adds r5, #0x38
	strb r0, [r5]
	adds r4, r7, #0
	adds r4, #0x37
	ldrb r0, [r4]
	adds r3, r7, #0
	adds r3, #0x39
	strb r0, [r3]
	add r2, sp, #4
	ldr r1, [r7, #0x14]
	ldrh r0, [r1, #0x34]
	strh r0, [r2]
	adds r2, #2
	ldrh r0, [r1, #0x36]
	strh r0, [r2]
	add r0, sp, #4
	movs r1, #0
	ldrsh r0, [r0, r1]
	mov r8, r6
	mov ip, r5
	adds r6, r4, #0
	mov sb, r2
	cmp r0, #0
	bge _080C0DF8
	adds r0, #7
_080C0DF8:
	asrs r0, r0, #3
	mov r2, r8
	strb r0, [r2]
	mov r4, sb
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080C0E0A
	adds r0, #7
_080C0E0A:
	asrs r0, r0, #3
	strb r0, [r6]
	ldrh r0, [r7, #0x36]
	adds r5, r7, #0
	adds r5, #0x34
	ldrh r2, [r7, #0x38]
	cmp r0, r2
	beq _080C0E98
	mov r4, r8
	movs r2, #0
	ldrsb r2, [r4, r2]
	mov r1, ip
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080C0E32
	cmp r1, #1
	bgt _080C0E52
	b _080C0E38
_080C0E32:
	subs r0, r0, r2
	cmp r0, #1
	bgt _080C0E52
_080C0E38:
	movs r2, #0
	ldrsb r2, [r6, r2]
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r1, r2, r0
	cmp r1, #0
	blt _080C0E4C
	cmp r1, #1
	bgt _080C0E52
	b _080C0E70
_080C0E4C:
	subs r0, r0, r2
	cmp r0, #1
	ble _080C0E70
_080C0E52:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	adds r4, r7, #0
	adds r4, #0x34
	ldrb r2, [r4]
	bl sub_80C0B0C
	ldrb r0, [r4]
	bl BG_EnableSync
	adds r5, r4, #0
	b _080C0E98
_080C0E70:
	mov r4, r8
	movs r0, #0
	ldrsb r0, [r4, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	mov r4, ip
	movs r2, #0
	ldrsb r2, [r4, r2]
	ldrb r3, [r3]
	lsls r3, r3, #0x18
	asrs r3, r3, #0x18
	adds r5, r7, #0
	adds r5, #0x34
	ldrb r4, [r5]
	str r4, [sp]
	bl sub_80C0BE8
	ldrb r0, [r5]
	bl BG_EnableSync
_080C0E98:
	adds r4, r7, #0
	adds r4, #0x31
	ldrb r1, [r4]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C0EB4
	adds r0, r7, #0
	bl sub_80C0A98
	ldrb r1, [r4]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r4]
_080C0EB4:
	ldrb r1, [r4]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080C0EDC
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	movs r1, #0
	ldrsb r1, [r6, r1]
	ldrb r2, [r5]
	bl sub_80C0B0C
	ldrb r0, [r5]
	bl BG_EnableSync
	ldrb r1, [r4]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r4]
_080C0EDC:
	ldrb r0, [r5]
	add r1, sp, #4
	ldrh r2, [r1]
	ldr r1, _080C0EFC @ =0x000001FF
	ands r1, r2
	mov r3, sb
	ldrb r2, [r3]
	bl BG_SetPosition
_080C0EEE:
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C0EFC: .4byte 0x000001FF

