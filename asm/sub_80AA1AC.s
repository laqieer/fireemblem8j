	.syntax unified
	.set GetCharacterData, 0x0801913C + 1
	.set GetClassData, 0x0801911C + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8019040, 0x08019040 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AA1AC, "ax", %progbits
@ sub_80AA1AC @ JP 0x080AA1AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AA1AC
	.thumb_func
sub_80AA1AC:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0x24
	adds r4, r1, #0
	ldr r1, _080AA3F0 @ =0x03006790
	ldr r3, [r1]
	mov r1, sp
	movs r2, #0x24
	bl sub_80D65C8
	mov r0, sp
	ldrb r0, [r0, #0x14]
	bl GetCharacterData
	str r0, [r4]
	mov r0, sp
	ldrb r0, [r0]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl GetClassData
	str r0, [r4, #4]
	mov r0, sp
	ldrh r0, [r0]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #8]
	ldr r0, [sp]
	lsls r0, r0, #0xd
	lsrs r3, r0, #0x19
	strb r3, [r4, #9]
	mov r0, sp
	ldrh r0, [r0, #2]
	lsls r0, r0, #0x17
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x10]
	mov r0, sp
	ldrb r0, [r0, #3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x11]
	ldr r0, [sp, #4]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x1a
	strb r0, [r4, #0x12]
	mov r0, sp
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x14]
	mov r0, sp
	ldrh r0, [r0, #6]
	lsls r0, r0, #0x14
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x15]
	mov r0, sp
	ldrb r1, [r0, #7]
	lsrs r1, r1, #4
	ldrb r0, [r0, #8]
	movs r5, #1
	ands r0, r5
	lsls r0, r0, #4
	orrs r0, r1
	strb r0, [r4, #0x16]
	mov r0, sp
	ldrb r0, [r0, #8]
	lsls r0, r0, #0x1a
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x17]
	mov r0, sp
	ldrh r0, [r0, #8]
	lsls r0, r0, #0x15
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x18]
	mov r0, sp
	ldrb r0, [r0, #9]
	lsrs r0, r0, #3
	strb r0, [r4, #0x19]
	mov r0, sp
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x1b
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1a]
	mov r0, sp
	ldrh r0, [r0, #0xa]
	lsls r0, r0, #0x16
	lsrs r0, r0, #0x1b
	strb r0, [r4, #0x1d]
	mov r0, sp
	ldrb r1, [r0, #0xb]
	lsrs r1, r1, #2
	ldrb r0, [r0, #0xc]
	lsls r0, r0, #6
	orrs r0, r1
	strh r0, [r4, #0x1e]
	ldr r0, [sp, #0xc]
	lsls r0, r0, #0xa
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x20]
	mov r0, sp
	ldrh r2, [r0, #0xe]
	lsrs r2, r2, #6
	ldrb r0, [r0, #0x10]
	movs r1, #0xf
	ands r0, r1
	lsls r0, r0, #0xa
	orrs r0, r2
	strh r0, [r4, #0x22]
	ldr r0, [sp, #0x10]
	lsls r0, r0, #0xe
	lsrs r0, r0, #0x12
	strh r0, [r4, #0x24]
	mov r0, sp
	ldrh r0, [r0, #0x12]
	lsrs r0, r0, #2
	strh r0, [r4, #0x26]
	cmp r3, #0x63
	bls _080AA29E
	movs r0, #0xff
	strb r0, [r4, #9]
_080AA29E:
	movs r0, #0
	str r0, [r4, #0xc]
	mov r0, sp
	ldrb r1, [r0, #3]
	lsrs r1, r1, #7
	ldrh r0, [r0, #4]
	ldr r2, _080AA3F4 @ =0x00000FFF
	ands r0, r2
	lsls r0, r0, #1
	orrs r0, r1
	ands r0, r5
	cmp r0, #0
	beq _080AA2BC
	movs r0, #5
	str r0, [r4, #0xc]
_080AA2BC:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080AA2D4
	ldr r0, [r4, #0xc]
	movs r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080AA2D4:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #4
	ands r0, r1
	cmp r0, #0
	beq _080AA2EE
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	orrs r0, r1
	str r0, [r4, #0xc]
_080AA2EE:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080AA308
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	orrs r0, r1
	str r0, [r4, #0xc]
_080AA308:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _080AA322
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	orrs r0, r1
	str r0, [r4, #0xc]
_080AA322:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x20
	ands r0, r1
	cmp r0, #0
	beq _080AA33C
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	orrs r0, r1
	str r0, [r4, #0xc]
_080AA33C:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	beq _080AA356
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	orrs r0, r1
	str r0, [r4, #0xc]
_080AA356:
	mov r0, sp
	ldrh r0, [r0, #4]
	ands r0, r2
	lsls r0, r0, #1
	movs r1, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080AA370
	ldr r0, [r4, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xe
	orrs r0, r1
	str r0, [r4, #0xc]
_080AA370:
	movs r2, #0
	adds r7, r4, #0
	adds r7, #0x32
	mov r6, sp
	adds r6, #0x1d
	movs r0, #0x39
	adds r0, r0, r4
	mov r8, r0
	adds r5, r4, #0
	adds r5, #0x28
	mov r3, sp
	adds r3, #0x15
_080AA388:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080AA388
	movs r2, #0
	adds r5, r7, #0
	adds r3, r6, #0
_080AA39C:
	adds r0, r5, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	ble _080AA39C
	adds r0, r4, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8019040
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	ldrb r0, [r4, #9]
	cmp r0, #0x7f
	bne _080AA3C8
	movs r0, #0xff
	strb r0, [r4, #9]
_080AA3C8:
	ldrb r1, [r4, #0x10]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	cmp r0, #0x3f
	bne _080AA3D6
	movs r0, #0xff
	strb r0, [r4, #0x10]
_080AA3D6:
	ldrb r1, [r4, #0x11]
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	cmp r0, #0x3f
	bne _080AA3E4
	movs r0, #0xff
	strb r0, [r4, #0x11]
_080AA3E4:
	add sp, #0x24
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AA3F0: .4byte 0x03006790
_080AA3F4: .4byte 0x00000FFF

