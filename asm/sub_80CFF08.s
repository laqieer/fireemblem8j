	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80CFF08, "ax", %progbits
@ sub_80CFF08 @ JP 0x080CFF08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CFF08
	.thumb_func
sub_80CFF08:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CF9D4
	adds r4, r0, #0
	ldr r0, _080D0050 @ =0x0000FFFF
	cmp r4, r0
	beq _080CFF74
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r4, r0
	blt _080CFF74
	cmp r4, #0xc8
	bgt _080CFF74
	movs r6, #0
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D0054 @ =0x08B3F690
	str r6, [sp]
	movs r0, #1
	movs r1, #0
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D0058 @ =0x00001078
	str r0, [sp]
	movs r0, #2
	movs r1, #4
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D005C @ =0x08B3F70A
	str r6, [sp]
	movs r0, #0
	movs r1, #0x10
	adds r2, r4, #0
	bl PutSpriteExt
_080CFF74:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #6
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CF9D4
	adds r4, r0, #0
	ldr r0, _080D0050 @ =0x0000FFFF
	cmp r4, r0
	beq _080CFFD8
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r4, r0
	blt _080CFFD8
	cmp r4, #0xc8
	bgt _080CFFD8
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D0054 @ =0x08B3F690
	ldr r0, _080D0060 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x48
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D0064 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	movs r1, #0x4c
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D005C @ =0x08B3F70A
	movs r0, #0
	str r0, [sp]
	movs r1, #0x58
	adds r2, r4, #0
	bl PutSpriteExt
_080CFFD8:
	ldrh r0, [r7, #0x2a]
	adds r2, r0, #2
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x50
	movs r3, #0xf
	bl sub_80CF9D4
	adds r4, r0, #0
	ldr r0, _080D0050 @ =0x0000FFFF
	cmp r4, r0
	beq _080D003C
	movs r0, #0x28
	rsbs r0, r0, #0
	cmp r4, r0
	blt _080D003C
	cmp r4, #0xc8
	bgt _080D003C
	subs r4, #0x28
	movs r0, #0xff
	ands r4, r0
	ldr r5, _080D0054 @ =0x08B3F690
	ldr r0, _080D0068 @ =0x000041E0
	str r0, [sp]
	movs r0, #1
	movs r1, #0x90
	adds r2, r4, #0
	adds r3, r5, #0
	bl PutSpriteExt
	movs r2, #0x80
	lsls r2, r2, #3
	orrs r2, r4
	ldr r0, _080D006C @ =0x00005258
	str r0, [sp]
	movs r0, #2
	movs r1, #0x94
	adds r3, r5, #0
	bl PutSpriteExt
	movs r0, #0x80
	lsls r0, r0, #4
	orrs r4, r0
	ldr r3, _080D005C @ =0x08B3F70A
	movs r0, #0
	str r0, [sp]
	movs r1, #0xa0
	adds r2, r4, #0
	bl PutSpriteExt
_080D003C:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0xf
	bne _080D0070
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	b _080D0074
	.align 2, 0
_080D0050: .4byte 0x0000FFFF
_080D0054: .4byte 0x08B3F690
_080D0058: .4byte 0x00001078
_080D005C: .4byte 0x08B3F70A
_080D0060: .4byte 0x000020F0
_080D0064: .4byte 0x00003168
_080D0068: .4byte 0x000041E0
_080D006C: .4byte 0x00005258
_080D0070:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080D0074:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

