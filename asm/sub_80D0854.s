	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80D0854, "ax", %progbits
@ sub_80D0854 @ JP 0x080D0854 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D0854
	.thumb_func
sub_80D0854:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	mov sb, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	str r0, [sp, #4]
	movs r0, #0x1e
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x50
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D09FC @ =0x0000FFFF
	cmp r7, r0
	beq _080D08DE
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D08DE
	cmp r7, #0xc8
	bgt _080D08DE
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080D0A00 @ =0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r6, _080D0A04 @ =0x08B3F690
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D0A08 @ =0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D0A0C @ =0x08B3F71E
	mov r1, r8
	str r1, [sp]
	movs r0, #0
	movs r1, #2
	adds r2, r4, #0
	bl PutSpriteExt
_080D08DE:
	ldr r0, _080D09FC @ =0x0000FFFF
	cmp r7, r0
	beq _080D0932
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D0932
	cmp r7, #0xc8
	bgt _080D0932
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D0A04 @ =0x08B3F690
	ldr r0, _080D0A10 @ =0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x66
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D0A14 @ =0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x6a
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D0A0C @ =0x08B3F71E
	movs r0, #0
	str r0, [sp]
	movs r1, #0x7a
	adds r2, r4, #0
	bl PutSpriteExt
_080D0932:
	movs r0, #0x50
	movs r1, #1
	ldr r2, [sp, #4]
	movs r3, #7
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D09FC @ =0x0000FFFF
	cmp r7, r0
	beq _080D0994
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D0994
	cmp r7, #0xc8
	bgt _080D0994
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D0A04 @ =0x08B3F690
	ldr r0, _080D0A18 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x2a
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D0A1C @ =0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x2e
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D0A0C @ =0x08B3F71E
	movs r0, #0
	str r0, [sp]
	movs r1, #0x3e
	adds r2, r4, #0
	bl PutSpriteExt
_080D0994:
	ldr r0, _080D09FC @ =0x0000FFFF
	cmp r7, r0
	beq _080D09E8
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D09E8
	cmp r7, #0xc8
	bgt _080D09E8
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D0A04 @ =0x08B3F690
	ldr r0, _080D0A20 @ =0x000062D0
	str r0, [sp]
	movs r0, #1
	movs r1, #0xa2
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D0A24 @ =0x00007348
	str r0, [sp]
	movs r0, #2
	movs r1, #0xa6
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D0A0C @ =0x08B3F71E
	movs r0, #0
	str r0, [sp]
	movs r1, #0xb6
	adds r2, r4, #0
	bl PutSpriteExt
_080D09E8:
	mov r1, sb
	ldrh r0, [r1, #0x2a]
	cmp r0, #7
	bne _080D0A28
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sb
	bl sub_8002DE4
	b _080D0A2E
	.align 2, 0
_080D09FC: .4byte 0x0000FFFF
_080D0A00: .4byte 0x000001FF
_080D0A04: .4byte 0x08B3F690
_080D0A08: .4byte 0x00001078
_080D0A0C: .4byte 0x08B3F71E
_080D0A10: .4byte 0x000041E0
_080D0A14: .4byte 0x00005258
_080D0A18: .4byte 0x000020F0
_080D0A1C: .4byte 0x00003168
_080D0A20: .4byte 0x000062D0
_080D0A24: .4byte 0x00007348
_080D0A28:
	adds r0, #1
	mov r1, sb
	strh r0, [r1, #0x2a]
_080D0A2E:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

