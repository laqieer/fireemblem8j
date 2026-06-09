	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80CFA14, "ax", %progbits
@ sub_80CFA14 @ JP 0x080CFA14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CFA14
	.thumb_func
sub_80CFA14:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov sb, r0
	ldrh r0, [r0, #0x2a]
	adds r2, r0, #0
	adds r2, #0xa
	movs r0, #0x78
	movs r1, #1
	rsbs r1, r1, #0
	movs r3, #0x14
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080CFB3C @ =0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080CFA7E
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CFB40 @ =0x000001FF
	ands r4, r5
	ldr r6, _080CFB44 @ =0x08B3F690
	movs r1, #0
	mov r8, r1
	str r1, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0xec
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CFB48 @ =0x000004EC
	ldr r0, _080CFB4C @ =0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CFB50 @ =0x00000804
	ldr r3, _080CFB54 @ =0x08B3F6B0
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	adds r1, r4, #0
	bl PutSpriteExt
_080CFA7E:
	mov r1, sb
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #6
	movs r0, #0x78
	movs r1, #1
	rsbs r1, r1, #0
	movs r3, #0x14
	bl sub_80CF9D4
	adds r7, r0, #0
	cmp r7, sl
	beq _080CFAD4
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CFB40 @ =0x000001FF
	ands r4, r5
	ldr r6, _080CFB44 @ =0x08B3F690
	ldr r0, _080CFB58 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x20
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	movs r2, #0x84
	lsls r2, r2, #3
	ldr r0, _080CFB5C @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CFB60 @ =0x00000838
	ldr r3, _080CFB54 @ =0x08B3F6B0
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CFAD4:
	mov r1, sb
	ldrh r0, [r1, #0x2a]
	adds r2, r0, #2
	movs r0, #0x78
	movs r1, #1
	rsbs r1, r1, #0
	movs r3, #0x14
	bl sub_80CF9D4
	adds r7, r0, #0
	cmp r7, sl
	beq _080CFB28
	adds r4, r7, #0
	subs r4, #0x30
	ldr r5, _080CFB40 @ =0x000001FF
	ands r4, r5
	ldr r6, _080CFB44 @ =0x08B3F690
	ldr r0, _080CFB64 @ =0x000041E0
	str r0, [sp]
	movs r0, #1
	adds r1, r4, #0
	movs r2, #0x54
	adds r3, r6, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r5
	ldr r2, _080CFB68 @ =0x00000454
	ldr r0, _080CFB6C @ =0x00005258
	str r0, [sp]
	movs r0, #2
	adds r3, r6, #0
	bl PutSpriteExt
	ldr r2, _080CFB70 @ =0x0000086C
	ldr r3, _080CFB54 @ =0x08B3F6B0
	movs r0, #0
	str r0, [sp]
	adds r1, r4, #0
	bl PutSpriteExt
_080CFB28:
	mov r1, sb
	ldrh r0, [r1, #0x2a]
	cmp r0, #0x14
	bne _080CFB74
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, sb
	bl sub_8002DE4
	b _080CFB7A
	.align 2, 0
_080CFB3C: .4byte 0x0000FFFF
_080CFB40: .4byte 0x000001FF
_080CFB44: .4byte 0x08B3F690
_080CFB48: .4byte 0x000004EC
_080CFB4C: .4byte 0x00001078
_080CFB50: .4byte 0x00000804
_080CFB54: .4byte 0x08B3F6B0
_080CFB58: .4byte 0x000020F0
_080CFB5C: .4byte 0x00003168
_080CFB60: .4byte 0x00000838
_080CFB64: .4byte 0x000041E0
_080CFB68: .4byte 0x00000454
_080CFB6C: .4byte 0x00005258
_080CFB70: .4byte 0x0000086C
_080CFB74:
	adds r0, #1
	mov r1, sb
	strh r0, [r1, #0x2a]
_080CFB7A:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

