	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80D02FC, "ax", %progbits
@ sub_80D02FC @ JP 0x080D02FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D02FC
	.thumb_func
sub_80D02FC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sl, r0
	ldrh r7, [r0, #0x2a]
	cmp r7, #0
	bne _080D0382
	ldr r0, _080D0528 @ =0x03003020
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r2, #0x20
	orrs r0, r2
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x80
	orrs r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	orrs r0, r2
	movs r1, #2
	rsbs r1, r1, #0
	mov r8, r1
	ands r0, r1
	movs r6, #3
	rsbs r6, r6, #0
	ands r0, r6
	movs r4, #5
	rsbs r4, r4, #0
	ands r0, r4
	movs r3, #8
	orrs r0, r3
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r5]
	adds r5, #1
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, r8
	ands r0, r2
	ands r0, r6
	ands r0, r4
	orrs r0, r3
	orrs r0, r1
	strb r0, [r5]
	mov r0, ip
	adds r0, #0x2d
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #1
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
	subs r0, #5
	strb r7, [r0]
	adds r0, #4
	strb r7, [r0]
_080D0382:
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	adds r0, #2
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x1c
	mov r2, sb
	movs r3, #0xa
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D052C @ =0x0000FFFF
	cmp r7, r0
	beq _080D03F8
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D03F8
	cmp r7, #0xc8
	bgt _080D03F8
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080D0530 @ =0x08B3F690
	movs r2, #0
	mov r8, r2
	str r2, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080D0534 @ =0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x18
	ands r2, r6
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080D0538 @ =0x08B3F6DE
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x40
	bl PutSpriteExt
_080D03F8:
	movs r0, #0x84
	movs r1, #1
	mov r2, sb
	movs r3, #0xa
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D052C @ =0x0000FFFF
	movs r1, #0x78
	cmp r1, r0
	beq _080D0476
	cmp r7, r0
	beq _080D0476
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D0476
	cmp r7, #0xc8
	bgt _080D0476
	subs r1, #0x30
	ldr r5, _080D053C @ =0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r2, #0xff
	mov r8, r2
	ands r4, r2
	ldr r6, _080D0530 @ =0x08B3F690
	ldr r0, _080D0540 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080D0544 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	movs r1, #0x78
	subs r1, #0x38
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080D0538 @ =0x08B3F6DE
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080D0476:
	mov r3, sb
	subs r3, #2
	cmp r3, #7
	bhi _080D04CE
	movs r0, #8
	str r0, [sp]
	movs r0, #4
	movs r1, #0
	movs r2, #0x18
	bl sub_8012E84
	adds r7, r0, #0
	ldr r3, _080D0528 @ =0x03003020
	adds r1, r3, #0
	adds r1, #0x2d
	movs r0, #6
	strb r0, [r1]
	movs r2, #0x50
	subs r2, r2, r7
	adds r0, r3, #0
	adds r0, #0x31
	strb r2, [r0]
	subs r1, #1
	movs r0, #0x76
	strb r0, [r1]
	adds r1, r7, #0
	adds r1, #0x50
	adds r0, r3, #0
	adds r0, #0x30
	strb r1, [r0]
	adds r5, r3, #0
	adds r5, #0x2f
	movs r0, #0x7a
	strb r0, [r5]
	adds r0, r3, #0
	adds r0, #0x33
	strb r2, [r0]
	adds r2, r3, #0
	adds r2, #0x2e
	movs r0, #0xea
	strb r0, [r2]
	adds r0, r3, #0
	adds r0, #0x32
	strb r1, [r0]
_080D04CE:
	ldr r4, _080D0530 @ =0x08B3F690
	ldr r0, _080D0548 @ =0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xe
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	movs r5, #0x84
	lsls r5, r5, #3
	ldr r0, _080D054C @ =0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x12
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080D0550 @ =0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x82
	movs r2, #0x20
	adds r3, r4, #0
	bl PutSpriteExt
	ldr r0, _080D0554 @ =0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0x86
	adds r2, r5, #0
	adds r3, r4, #0
	bl PutSpriteExt
	mov r1, sl
	ldrh r0, [r1, #0x2a]
	cmp r0, #0xa
	bne _080D0558
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sl
	bl sub_8002DE4
	b _080D055E
	.align 2, 0
_080D0528: .4byte 0x03003020
_080D052C: .4byte 0x0000FFFF
_080D0530: .4byte 0x08B3F690
_080D0534: .4byte 0x00001078
_080D0538: .4byte 0x08B3F6DE
_080D053C: .4byte 0x000001FF
_080D0540: .4byte 0x000020F0
_080D0544: .4byte 0x00003168
_080D0548: .4byte 0x000041E0
_080D054C: .4byte 0x00005258
_080D0550: .4byte 0x000062D0
_080D0554: .4byte 0x00007348
_080D0558:
	adds r0, #1
	mov r2, sl
	strh r0, [r2, #0x2a]
_080D055E:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

