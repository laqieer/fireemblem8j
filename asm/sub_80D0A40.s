	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80D0A40, "ax", %progbits
@ sub_80D0A40 @ JP 0x080D0A40 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D0A40
	.thumb_func
sub_80D0A40:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x1c
	movs r3, #6
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D0BE0 @ =0x0000FFFF
	cmp r7, r0
	beq _080D0AC2
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D0AC2
	cmp r7, #0xc8
	bgt _080D0AC2
	adds r4, r7, #0
	subs r4, #0x30
	movs r6, #0xff
	ands r4, r6
	ldr r5, _080D0BE4 @ =0x08B3F690
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080D0BE8 @ =0x00001078
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
	ldr r3, _080D0BEC @ =0x08B3F750
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0x18
	bl PutSpriteExt
_080D0AC2:
	mov r1, sb
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x50
	movs r3, #6
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D0BE0 @ =0x0000FFFF
	cmp sl, r0
	beq _080D0B46
	cmp r7, r0
	beq _080D0B46
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D0B46
	cmp r7, #0xc8
	bgt _080D0B46
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080D0BF0 @ =0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080D0BE4 @ =0x08B3F690
	ldr r0, _080D0BF4 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080D0BF8 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080D0BEC @ =0x08B3F750
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080D0B46:
	mov r1, sb
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x84
	movs r3, #6
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D0BE0 @ =0x0000FFFF
	cmp sl, r0
	beq _080D0BCC
	cmp r7, r0
	beq _080D0BCC
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080D0BCC
	cmp r7, #0xc8
	bgt _080D0BCC
	mov r1, sl
	subs r1, #0x30
	ldr r5, _080D0BF0 @ =0x000001FF
	ands r1, r5
	adds r4, r7, #0
	subs r4, #0x30
	movs r0, #0xff
	mov r8, r0
	ands r4, r0
	ldr r6, _080D0BE4 @ =0x08B3F690
	ldr r0, _080D0BFC @ =0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r5
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080D0C00 @ =0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	adds r3, r6, #0
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x60
	ands r1, r5
	adds r2, r7, #0
	subs r2, #0x18
	mov r0, r8
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080D0BEC @ =0x08B3F750
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080D0BCC:
	mov r1, sb
	ldrh r0, [r1, #0x2a]
	cmp r0, #6
	bne _080D0C04
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sb
	bl sub_8002DE4
	b _080D0C0A
	.align 2, 0
_080D0BE0: .4byte 0x0000FFFF
_080D0BE4: .4byte 0x08B3F690
_080D0BE8: .4byte 0x00001078
_080D0BEC: .4byte 0x08B3F750
_080D0BF0: .4byte 0x000001FF
_080D0BF4: .4byte 0x000020F0
_080D0BF8: .4byte 0x00003168
_080D0BFC: .4byte 0x000041E0
_080D0C00: .4byte 0x00005258
_080D0C04:
	adds r0, #1
	mov r1, sb
	strh r0, [r1, #0x2a]
_080D0C0A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

