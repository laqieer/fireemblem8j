	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80D007C, "ax", %progbits
@ sub_80D007C @ JP 0x080D007C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D007C
	.thumb_func
sub_80D007C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CF9D4
	adds r4, r0, #0
	ldr r0, _080D01BC @ =0x0000FFFF
	cmp r4, r0
	beq _080D00E6
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r4, r0
	blt _080D00E6
	cmp r4, #0xc8
	bgt _080D00E6
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D01C0 @ =0x08B3F690
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D01C4 @ =0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D01C8 @ =0x08B3F70A
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080D00E6:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CF9D4
	adds r4, r0, #0
	ldr r0, _080D01BC @ =0x0000FFFF
	cmp r4, r0
	beq _080D0148
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r4, r0
	blt _080D0148
	cmp r4, #0xc8
	bgt _080D0148
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D01C0 @ =0x08B3F690
	ldr r0, _080D01CC @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D01D0 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D01C8 @ =0x08B3F70A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080D0148:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r0, #0x50
	movs r1, #1
	movs r3, #0xd
	bl sub_80CF9D4
	adds r4, r0, #0
	ldr r0, _080D01BC @ =0x0000FFFF
	cmp r4, r0
	beq _080D01AA
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r4, r0
	blt _080D01AA
	cmp r4, #0xc8
	bgt _080D01AA
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D01C0 @ =0x08B3F690
	ldr r0, _080D01D4 @ =0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D01D8 @ =0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D01C8 @ =0x08B3F70A
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080D01AA:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xd
	bne _080D01DC
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	b _080D01E0
	.align 2, 0
_080D01BC: .4byte 0x0000FFFF
_080D01C0: .4byte 0x08B3F690
_080D01C4: .4byte 0x00001078
_080D01C8: .4byte 0x08B3F70A
_080D01CC: .4byte 0x000020F0
_080D01D0: .4byte 0x00003168
_080D01D4: .4byte 0x000041E0
_080D01D8: .4byte 0x00005258
_080D01DC:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080D01E0:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

