	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80CFB8C, "ax", %progbits
@ sub_80CFB8C @ JP 0x080CFB8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CFB8C
	.thumb_func
sub_80CFB8C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	ldrh r4, [r0, #0x2a]
	adds r4, #2
	movs r5, #1
	rsbs r5, r5, #0
	movs r0, #0x42
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CF9D4
	mov sl, r0
	movs r0, #0x2a
	adds r1, r5, #0
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CF9D4
	adds r7, r0, #0
	movs r0, #0xae
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CF9D4
	str r0, [sp, #8]
	movs r0, #0x76
	movs r1, #1
	adds r2, r4, #0
	movs r3, #0x12
	bl sub_80CF9D4
	str r0, [sp, #0xc]
	ldr r0, _080CFDB8 @ =0x0000FFFF
	cmp sl, r0
	beq _080CFCBC
	cmp r7, r0
	beq _080CFC4A
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080CFC4A
	cmp r7, #0xc8
	bgt _080CFC4A
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CFDBC @ =0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov sb, r0
	ands r4, r0
	ldr r1, _080CFDC0 @ =0x08B3F690
	mov r8, r1
	movs r0, #0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CFDC4 @ =0x00001078
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r1, sb
	ands r2, r1
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CFDC8 @ =0x08B3F6D0
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CFC4A:
	ldr r0, _080CFDB8 @ =0x0000FFFF
	cmp sl, r0
	beq _080CFCBC
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CFCBC
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080CFCBC
	cmp r1, #0xc8
	bgt _080CFCBC
	mov r5, sl
	subs r5, #0x30
	ldr r6, _080CFDBC @ =0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov sb, r0
	ands r4, r0
	ldr r1, _080CFDC0 @ =0x08B3F690
	mov r8, r1
	ldr r0, _080CFDCC @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	mov r1, sl
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CFDD0 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, sb
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CFDC8 @ =0x08B3F6D0
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CFCBC:
	ldr r0, _080CFDB8 @ =0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CFDA2
	cmp r7, r0
	beq _080CFD2E
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r7, r0
	blt _080CFD2E
	cmp r7, #0xc8
	bgt _080CFD2E
	adds r5, r1, #0
	subs r5, #0x30
	ldr r6, _080CFDBC @ =0x000001FF
	ands r5, r6
	adds r4, r7, #0
	subs r4, #0x28
	movs r0, #0xff
	mov sb, r0
	ands r4, r0
	ldr r1, _080CFDC0 @ =0x08B3F690
	mov r8, r1
	ldr r0, _080CFDD4 @ =0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CFDD8 @ =0x00005258
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	adds r2, r7, #0
	subs r2, #0x20
	mov r0, sb
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CFDC8 @ =0x08B3F6D0
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CFD2E:
	ldr r0, _080CFDB8 @ =0x0000FFFF
	ldr r1, [sp, #8]
	cmp r1, r0
	beq _080CFDA2
	ldr r1, [sp, #0xc]
	cmp r1, r0
	beq _080CFDA2
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r1, r0
	blt _080CFDA2
	cmp r1, #0xc8
	bgt _080CFDA2
	ldr r5, [sp, #8]
	subs r5, #0x30
	ldr r6, _080CFDBC @ =0x000001FF
	ands r5, r6
	adds r4, r1, #0
	subs r4, #0x28
	movs r0, #0xff
	mov sb, r0
	ands r4, r0
	ldr r1, _080CFDC0 @ =0x08B3F690
	mov r8, r1
	ldr r0, _080CFDDC @ =0x000062D0
	str r0, [sp]
	movs r0, #1
	adds r1, r5, #0
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r1, [sp, #8]
	subs r1, #0x2c
	ands r1, r6
	movs r0, #0x80
	lsls r0, r0, #3
	orrs r4, r0
	ldr r0, _080CFDE0 @ =0x00007348
	str r0, [sp]
	movs r0, #2
	adds r2, r4, #0
	mov r3, r8
	bl PutSpriteExt
	ldr r2, [sp, #0xc]
	subs r2, #0x20
	mov r0, sb
	ands r2, r0
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r2, r0
	ldr r3, _080CFDC8 @ =0x08B3F6D0
	movs r0, #0
	str r0, [sp]
	adds r1, r5, #0
	bl PutSpriteExt
_080CFDA2:
	ldr r1, [sp, #4]
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x12
	bne _080CFDE4
	movs r0, #0
	strh r0, [r1, #0x2a]
	ldr r0, [sp, #4]
	bl sub_8002DE4
	b _080CFDEA
	.align 2, 0
_080CFDB8: .4byte 0x0000FFFF
_080CFDBC: .4byte 0x000001FF
_080CFDC0: .4byte 0x08B3F690
_080CFDC4: .4byte 0x00001078
_080CFDC8: .4byte 0x08B3F6D0
_080CFDCC: .4byte 0x000020F0
_080CFDD0: .4byte 0x00003168
_080CFDD4: .4byte 0x000041E0
_080CFDD8: .4byte 0x00005258
_080CFDDC: .4byte 0x000062D0
_080CFDE0: .4byte 0x00007348
_080CFDE4:
	adds r0, #1
	ldr r1, [sp, #4]
	strh r0, [r1, #0x2a]
_080CFDEA:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

