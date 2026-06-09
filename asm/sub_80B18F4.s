	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80B18F4, "ax", %progbits
@ sub_80B18F4 @ JP 0x080B18F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B18F4
	.thumb_func
sub_80B18F4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	str r0, [sp, #4]
	movs r0, #0
	str r0, [sp, #8]
	ldr r1, [sp, #4]
	adds r1, #0x4e
	str r1, [sp, #0x14]
_080B190C:
	ldr r0, [sp, #4]
	adds r0, #0x4a
	ldr r2, [sp, #8]
	adds r0, r0, r2
	ldrb r0, [r0]
	adds r2, #1
	str r2, [sp, #0x1c]
	cmp r0, #0
	bne _080B1920
	b _080B1C28
_080B1920:
	ldr r0, [sp, #4]
	adds r0, #0x3e
	ldr r3, [sp, #8]
	adds r3, r3, r0
	mov sb, r3
	movs r1, #0
	ldrsb r1, [r3, r1]
	str r0, [sp, #0x30]
	cmp r1, #1
	bgt _080B1936
	b _080B1C28
_080B1936:
	ldr r0, [sp, #4]
	adds r0, #0x3a
	ldr r1, [sp, #8]
	adds r7, r0, r1
	movs r1, #0
	ldrsb r1, [r7, r1]
	str r0, [sp, #0x2c]
	cmp r1, #1
	bgt _080B194A
	b _080B1C28
_080B194A:
	ldr r2, [sp, #8]
	lsls r2, r2, #1
	mov r8, r2
	ldr r3, [sp, #4]
	adds r3, #0x2a
	str r3, [sp, #0xc]
	adds r6, r3, #0
	add r6, r8
	ldrh r1, [r6]
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	ldr r3, [sp, #4]
	adds r3, #0x32
	str r3, [sp, #0x10]
	adds r5, r3, #0
	add r5, r8
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r0, [sp, #0x14]
	ldrh r3, [r0]
	ldr r0, [sp, #4]
	adds r0, #0x42
	str r0, [sp, #0x18]
	adds r4, r0, #0
	add r4, r8
	ldrh r0, [r4]
	adds r3, r3, r0
	adds r3, #4
	str r3, [sp]
	movs r0, #0xd
	ldr r3, _080B1A74 @ =0x085B8CDC
	bl PutSpriteExt
	movs r2, #0
	ldrsh r1, [r6, r2]
	mov r3, sb
	movs r0, #0
	ldrsb r0, [r3, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0
	ldrsh r2, [r5, r0]
	ldr r3, [sp, #0x14]
	ldrh r0, [r3]
	ldrh r3, [r4]
	adds r0, r0, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080B1A74 @ =0x085B8CDC
	bl PutSpriteExt
	ldrh r1, [r6]
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r0, r2, #0
	orrs r1, r0
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, [sp, #0x14]
	ldrh r0, [r3]
	ldrh r3, [r4]
	adds r0, r0, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080B1A74 @ =0x085B8CDC
	bl PutSpriteExt
	movs r0, #0
	ldrsh r1, [r6, r0]
	mov r2, sb
	movs r0, #0
	ldrsb r0, [r2, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r1, r1, r0
	movs r0, #0x80
	lsls r0, r0, #6
	orrs r1, r0
	movs r3, #0
	ldrsh r2, [r5, r3]
	movs r0, #0
	ldrsb r0, [r7, r0]
	subs r0, #1
	lsls r0, r0, #3
	adds r2, r2, r0
	ldr r3, [sp, #0x14]
	ldrh r0, [r3]
	ldrh r3, [r4]
	adds r0, r0, r3
	adds r0, #4
	str r0, [sp]
	movs r0, #0xd
	ldr r3, _080B1A74 @ =0x085B8CDC
	bl PutSpriteExt
	mov r1, sb
	movs r0, #0
	ldrsb r0, [r1, r0]
	subs r4, r0, #2
	movs r2, #0
	ldrsh r7, [r5, r2]
	movs r3, #0
	ldrsh r0, [r6, r3]
	adds r5, r0, #0
	adds r5, #8
	mov sl, r8
	ldr r0, [sp, #0xc]
	str r0, [sp, #0x24]
	ldr r1, [sp, #0x10]
	str r1, [sp, #0x28]
	ldr r2, [sp, #4]
	adds r2, #0x4e
	mov r8, r2
	ldr r6, [sp, #0x18]
	cmp r4, #3
	ble _080B1A9A
_080B1A4E:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1A78 @ =0x085B8D34
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080B1A4E
	b _080B1A9A
	.align 2, 0
_080B1A74: .4byte 0x085B8CDC
_080B1A78: .4byte 0x085B8D34
_080B1A7C:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1B20 @ =0x085B8D14
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080B1A9A:
	cmp r4, #1
	bgt _080B1A7C
	cmp r4, #0
	ble _080B1AC4
_080B1AA2:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1B24 @ =0x085B8CDC
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080B1AA2
_080B1AC4:
	ldr r3, [sp, #0x30]
	ldr r1, [sp, #8]
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r4, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r2, #0
	ldrsh r1, [r0, r2]
	ldr r3, [sp, #0x2c]
	ldr r2, [sp, #8]
	adds r0, r3, r2
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r0, #1
	lsls r0, r0, #3
	adds r7, r1, r0
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r3, #0
	ldrsh r0, [r0, r3]
	adds r5, r0, #0
	adds r5, #8
	cmp r4, #3
	ble _080B1B4A
_080B1AFC:
	mov r1, r8
	ldrh r0, [r1]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1B28 @ =0x085B8D34
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080B1AFC
	b _080B1B4A
	.align 2, 0
_080B1B20: .4byte 0x085B8D14
_080B1B24: .4byte 0x085B8CDC
_080B1B28: .4byte 0x085B8D34
_080B1B2C:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1BD4 @ =0x085B8D14
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080B1B4A:
	cmp r4, #1
	bgt _080B1B2C
	cmp r4, #0
	ble _080B1B74
_080B1B52:
	mov r3, r8
	ldrh r0, [r3]
	mov r2, sl
	adds r1, r6, r2
	ldrh r1, [r1]
	adds r0, r0, r1
	str r0, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1BD8 @ =0x085B8CDC
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080B1B52
_080B1B74:
	ldr r3, [sp, #0x2c]
	ldr r1, [sp, #8]
	adds r0, r3, r1
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	subs r1, r0, #2
	ldr r0, [sp, #0x28]
	add r0, sl
	movs r2, #0
	ldrsh r0, [r0, r2]
	adds r7, r0, #0
	adds r7, #8
	cmp r1, #0
	ble _080B1C28
	add r6, sl
_080B1B94:
	ldr r3, [sp, #0x30]
	ldr r2, [sp, #8]
	adds r0, r3, r2
	movs r4, #0
	ldrsb r4, [r0, r4]
	ldr r0, [sp, #0x24]
	add r0, sl
	movs r3, #0
	ldrsh r5, [r0, r3]
	adds r0, r7, #0
	adds r0, #8
	str r0, [sp, #0x20]
	subs r1, #1
	mov sb, r1
	cmp r4, #3
	ble _080B1BFA
_080B1BB4:
	mov r2, r8
	ldrh r1, [r2]
	ldrh r0, [r6]
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1BDC @ =0x085B8D34
	bl PutSpriteExt
	adds r5, #0x20
	subs r4, #4
	cmp r4, #3
	bgt _080B1BB4
	b _080B1BFA
	.align 2, 0
_080B1BD4: .4byte 0x085B8D14
_080B1BD8: .4byte 0x085B8CDC
_080B1BDC: .4byte 0x085B8D34
_080B1BE0:
	mov r3, r8
	ldrh r1, [r3]
	ldrh r0, [r6]
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1C44 @ =0x085B8D14
	bl PutSpriteExt
	adds r5, #0x10
	subs r4, #2
_080B1BFA:
	cmp r4, #1
	bgt _080B1BE0
	cmp r4, #0
	ble _080B1C20
_080B1C02:
	mov r0, r8
	ldrh r1, [r0]
	ldrh r0, [r6]
	adds r1, r1, r0
	str r1, [sp]
	movs r0, #0xd
	adds r1, r5, #0
	adds r2, r7, #0
	ldr r3, _080B1C48 @ =0x085B8CDC
	bl PutSpriteExt
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bgt _080B1C02
_080B1C20:
	ldr r7, [sp, #0x20]
	mov r1, sb
	cmp r1, #0
	bgt _080B1B94
_080B1C28:
	ldr r1, [sp, #0x1c]
	str r1, [sp, #8]
	cmp r1, #3
	bgt _080B1C32
	b _080B190C
_080B1C32:
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B1C44: .4byte 0x085B8D14
_080B1C48: .4byte 0x085B8CDC

