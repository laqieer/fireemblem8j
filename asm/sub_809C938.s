	.syntax unified
	.set CheckInLinkArena, 0x08042E1C + 1
	.set GetUnitFromPrepList, 0x08097634 + 1
	.set PrepGetUnitAmount, 0x08097654 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8026ED0, 0x08026ED0 + 1
	.set sub_8027AF4, 0x08027AF4 + 1
	.section .text.sub_809C938, "ax", %progbits
@ sub_809C938 @ JP 0x0809C938 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809C938
	.thumb_func
sub_809C938:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	movs r6, #0
	b _0809C97A
_0809C946:
	asrs r0, r6, #1
	lsls r0, r0, #4
	mov r2, r8
	ldrh r1, [r2, #0x30]
	subs r5, r0, r1
	adds r0, r5, #0
	adds r0, #0xf
	cmp r0, #0x5f
	bhi _0809C978
	movs r0, #1
	ands r0, r6
	lsls r4, r0, #3
	subs r4, r4, r0
	lsls r4, r4, #3
	adds r4, #0x70
	adds r5, #0x18
	adds r0, r6, #0
	bl GetUnitFromPrepList
	adds r3, r0, #0
	movs r0, #0
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_8027AF4
_0809C978:
	adds r6, #1
_0809C97A:
	bl PrepGetUnitAmount
	cmp r6, r0
	blt _0809C946
	mov r0, r8
	ldrh r1, [r0, #0x30]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0809CA24
	ldr r1, _0809CA20 @ =0x03003020
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r2, #0
	strb r2, [r0]
	adds r0, #4
	strb r2, [r0]
	subs r0, #5
	movs r3, #0xf0
	strb r3, [r0]
	mov r1, ip
	adds r1, #0x30
	movs r0, #0x1a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2f
	strb r2, [r0]
	adds r1, #3
	movs r0, #0x78
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r3, [r0]
	subs r1, #1
	movs r0, #0xa0
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x34
	ldrb r0, [r6]
	movs r5, #1
	orrs r0, r5
	movs r3, #2
	orrs r0, r3
	movs r4, #5
	rsbs r4, r4, #0
	ands r0, r4
	movs r2, #8
	orrs r0, r2
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r5
	orrs r0, r3
	ands r0, r4
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r1]
	mov r4, ip
	adds r4, #0x36
	ldrb r0, [r4]
	orrs r0, r5
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	orrs r0, r2
	orrs r0, r6
	strb r0, [r4]
	b _0809CA3A
	.align 2, 0
_0809CA20: .4byte 0x03003020
_0809CA24:
	ldr r2, _0809CA9C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
_0809CA3A:
	mov r0, r8
	adds r0, #0x37
	ldrb r1, [r0]
	adds r7, r0, #0
	cmp r1, #0
	beq _0809CA4A
	adds r0, r1, #1
	strb r0, [r7]
_0809CA4A:
	movs r5, #0x87
	lsls r5, r5, #8
	movs r4, #4
	movs r6, #2
_0809CA52:
	str r5, [sp]
	movs r0, #4
	adds r1, r4, #0
	movs r2, #0x81
	ldr r3, _0809CAA0 @ =0x085B8D24
	bl PutSpriteExt
	adds r5, #4
	adds r4, #0x20
	subs r6, #1
	cmp r6, #0
	bge _0809CA52
	ldrb r0, [r7]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _0809CAB8
	mov r0, r8
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #0
	beq _0809CAB8
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0809CAA8
	ldr r3, _0809CAA4 @ =0x08A94BA6
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
	b _0809CAB8
	.align 2, 0
_0809CA9C: .4byte 0x03003020
_0809CAA0: .4byte 0x085B8D24
_0809CAA4: .4byte 0x08A94BA6
_0809CAA8:
	ldr r3, _0809CAD8 @ =0x08A94B92
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x82
	bl PutSpriteExt
_0809CAB8:
	ldr r3, _0809CADC @ =0x08A94B78
	movs r0, #0x40
	str r0, [sp]
	movs r0, #4
	movs r1, #0x80
	movs r2, #0x8f
	bl PutSpriteExt
	bl sub_8026ED0
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809CAD8: .4byte 0x08A94B92
_0809CADC: .4byte 0x08A94B78

