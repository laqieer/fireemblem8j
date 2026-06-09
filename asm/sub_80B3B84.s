	.syntax unified
	.set __modsi3, 0x080D6690 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80B3B44, 0x080B3B44 + 1
	.section .text.sub_80B3B84, "ax", %progbits
@ sub_80B3B84 @ JP 0x080B3B84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B3B84
	.thumb_func
sub_80B3B84:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	movs r6, #0
	ldr r2, _080B3CCC @ =0x08A9E248
	movs r0, #1
	rsbs r0, r0, #0
	adds r1, r0, #0
_080B3B9C:
	ldr r0, [r2]
	adds r0, r0, r6
	strb r1, [r0]
	adds r6, #1
	cmp r6, #0x7f
	ble _080B3B9C
	bl sub_8000CD8
	adds r3, r0, #0
	movs r0, #0x7f
	ands r3, r0
	adds r2, r3, #0
	movs r6, #0
	mov r7, sb
	adds r7, #0x31
	mov r1, sb
	adds r1, #0x35
	str r1, [sp, #4]
	mov r5, sb
	adds r5, #0x30
	str r5, [sp]
_080B3BC6:
	asrs r0, r2, #5
	lsls r0, r0, #2
	add r0, sb
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B3BE6
	ldr r0, _080B3CCC @ =0x08A9E248
	ldr r0, [r0]
	adds r0, r0, r6
	strb r2, [r0]
	adds r6, #1
_080B3BE6:
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080B3BF2
	adds r0, r2, #0
	adds r0, #0x80
_080B3BF2:
	asrs r2, r0, #7
	lsls r0, r2, #7
	subs r2, r1, r0
	cmp r2, r3
	bne _080B3BC6
	mov r8, r6
	bl sub_8000CD8
	adds r4, r0, #0
	adds r4, #0x7b
	ldr r0, _080B3CCC @ =0x08A9E248
	mov sl, r0
	movs r6, #0xff
_080B3C0C:
	movs r1, #0xd
	adds r2, r4, #0
	muls r2, r1, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080B3C20
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080B3C20:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r5, r0, #0
	movs r0, #0xd
	adds r2, r4, #0
	muls r2, r0, r2
	adds r1, r2, #1
	adds r0, r1, #0
	cmp r1, #0
	bge _080B3C44
	movs r3, #0x80
	lsls r3, r3, #8
	adds r0, r2, r3
_080B3C44:
	asrs r4, r0, #0xf
	lsls r0, r4, #0xf
	subs r4, r1, r0
	asrs r0, r4, #8
	mov r1, r8
	bl __modsi3
	adds r3, r0, #0
	cmp r5, r3
	beq _080B3C88
	mov r1, sl
	ldr r0, [r1]
	adds r1, r0, r5
	adds r0, r0, r3
	ldrb r0, [r0]
	ldrb r2, [r1]
	adds r0, r0, r2
	strb r0, [r1]
	mov r1, sl
	ldr r0, [r1]
	adds r2, r0, r3
	adds r0, r0, r5
	ldrb r0, [r0]
	ldrb r1, [r2]
	subs r0, r0, r1
	strb r0, [r2]
	mov r2, sl
	ldr r1, [r2]
	adds r2, r1, r5
	adds r1, r1, r3
	ldrb r0, [r2]
	ldrb r1, [r1]
	subs r0, r0, r1
	strb r0, [r2]
_080B3C88:
	subs r6, #1
	cmp r6, #0
	bge _080B3C0C
	movs r0, #0
	strb r0, [r7]
	ldr r3, [sp, #4]
	ldrb r2, [r3]
	lsrs r0, r2, #5
	lsls r0, r0, #2
	add r0, sb
	movs r1, #0x1f
	ands r1, r2
	ldr r0, [r0, #0x40]
	lsrs r0, r1
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	beq _080B3CE4
	ldr r0, _080B3CCC @ =0x08A9E248
	ldr r1, [r0]
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r5, r2, #0
	cmp r0, r5
	beq _080B3CE4
	adds r3, r7, #0
	movs r4, #0
	ldr r2, [sp, #4]
_080B3CC0:
	ldrb r0, [r3]
	cmp r0, #0x80
	bne _080B3CD0
	strb r4, [r7]
	b _080B3CE4
	.align 2, 0
_080B3CCC: .4byte 0x08A9E248
_080B3CD0:
	adds r0, #1
	strb r0, [r7]
	ldrb r0, [r7]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldrb r5, [r2]
	cmp r0, r5
	bne _080B3CC0
_080B3CE4:
	movs r0, #1
	ldr r1, [sp]
	strb r0, [r1]
	mov r0, sb
	bl sub_80B3B44
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

