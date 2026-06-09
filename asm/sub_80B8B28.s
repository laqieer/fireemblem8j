	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_80B8C9C, 0x080B8C9C + 1
	.section .text.sub_80B8B28, "ax", %progbits
@ sub_80B8B28 @ JP 0x080B8B28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B8B28
	.thumb_func
sub_80B8B28:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov sl, r0
	movs r0, #0
	mov sb, r0
_080B8B3A:
	mov r1, sl
	ldr r0, [r1, #0x30]
	adds r0, #0x40
	add r0, sb
	ldrb r5, [r0]
	cmp r5, #0x1d
	bls _080B8B4A
	movs r5, #0x1e
_080B8B4A:
	movs r2, #0
	mov r8, r2
	lsrs r0, r5, #2
	mov r3, sb
	adds r3, #1
	str r3, [sp, #4]
	mov r1, sl
	adds r1, #0x34
	str r1, [sp, #8]
	mov r2, sl
	adds r2, #0x35
	str r2, [sp, #0xc]
	cmp r8, r0
	bge _080B8B96
	adds r7, r0, #0
	movs r4, #0x30
	mov r3, sb
	lsls r6, r3, #4
	mov r8, r7
_080B8B70:
	ldr r0, _080B8BEC @ =0x08AAFEE4
	ldr r3, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	adds r1, r4, #0
	adds r2, r6, #0
	adds r2, #0x10
	bl PutSpriteExt
	adds r4, #8
	movs r1, #1
	rsbs r1, r1, #0
	add r8, r1
	mov r2, r8
	cmp r2, #0
	bne _080B8B70
	mov r8, r7
_080B8B96:
	movs r0, #3
	ands r0, r5
	cmp r0, #0
	beq _080B8BC0
	mov r3, r8
	lsls r1, r3, #3
	adds r1, #0x30
	mov r3, sb
	lsls r2, r3, #4
	adds r2, #0x10
	subs r0, #1
	lsls r0, r0, #2
	ldr r3, _080B8BEC @ =0x08AAFEE4
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #0xd
	bl PutSpriteExt
_080B8BC0:
	ldr r0, [sp, #4]
	mov sb, r0
	cmp r0, #5
	ble _080B8B3A
	ldr r2, [sp, #8]
	ldrb r1, [r2]
	movs r0, #0x78
	subs r0, r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	ldr r3, [sp, #0xc]
	ldrb r1, [r3]
	adds r1, r1, r0
	mov r8, r1
	movs r2, #0
	mov sb, r2
	mov r3, sl
	ldr r1, [r3, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	b _080B8C42
	.align 2, 0
_080B8BEC: .4byte 0x08AAFEE4
_080B8BF0:
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
	ldrb r0, [r0]
	bl sub_80B8C9C
	adds r4, r0, #0
	ldr r3, [r4]
	cmp r3, #0
	beq _080B8C2E
	movs r1, #4
	ldrsb r1, [r4, r1]
	mov r0, r8
	subs r1, r0, r1
	subs r1, #2
	movs r0, #6
	ldrsb r0, [r4, r0]
	movs r2, #5
	subs r2, r2, r0
	movs r0, #0x80
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	add r8, r0
_080B8C2E:
	movs r1, #1
	add sb, r1
	mov r2, sb
	cmp r2, #0xd
	bgt _080B8C48
	mov r3, sl
	ldr r1, [r3, #0x30]
	ldr r0, [r1, #0x34]
	ldr r0, [r0]
	add r0, sb
_080B8C42:
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B8BF0
_080B8C48:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xfe
	bhi _080B8C54
	adds r0, #1
	strh r0, [r1, #0x2a]
_080B8C54:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

