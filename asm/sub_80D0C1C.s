	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80D0C1C, "ax", %progbits
@ sub_80D0C1C @ JP 0x080D0C1C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D0C1C
	.thumb_func
sub_80D0C1C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	mov r8, r0
	ldrh r0, [r0, #0x2a]
	adds r0, #2
	mov sb, r0
	movs r1, #1
	rsbs r1, r1, #0
	movs r0, #0x3e
	mov r2, sb
	movs r3, #5
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D0D18 @ =0x0000FFFF
	mov sl, r0
	cmp r7, sl
	beq _080D0C88
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080D0D1C @ =0x000001FF
	ands r1, r4
	ldr r5, _080D0D20 @ =0x08B3F690
	movs r6, #0
	str r6, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080D0D24 @ =0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080D0D28 @ =0x00000828
	ldr r3, _080D0D2C @ =0x08B3F788
	str r6, [sp]
	movs r0, #0
	bl PutSpriteExt
_080D0C88:
	movs r0, #0xb2
	movs r1, #1
	mov r2, sb
	movs r3, #5
	bl sub_80CF9D4
	adds r7, r0, #0
	cmp r7, sl
	beq _080D0CDA
	adds r1, r7, #0
	subs r1, #0x30
	ldr r4, _080D0D1C @ =0x000001FF
	ands r1, r4
	ldr r5, _080D0D20 @ =0x08B3F690
	ldr r0, _080D0D30 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x28
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x2c
	ands r1, r4
	movs r2, #0x85
	lsls r2, r2, #3
	ldr r0, _080D0D34 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080D0D28 @ =0x00000828
	ldr r3, _080D0D2C @ =0x08B3F788
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080D0CDA:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #1
	bne _080D0D04
	ldr r0, _080D0D38 @ =0x08B8E138
	ldr r4, _080D0D3C @ =0x0600F000
	adds r1, r4, #0
	bl sub_8013008
	movs r3, #0x80
	lsls r3, r3, #8
	adds r2, r3, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080D0CF6:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	subs r1, #1
	adds r4, #2
	cmp r1, #0
	bne _080D0CF6
_080D0D04:
	mov r1, r8
	ldrh r0, [r1, #0x2a]
	cmp r0, #5
	bne _080D0D40
	movs r0, #0
	strh r0, [r1, #0x2a]
	mov r0, r8
	bl sub_8002DE4
	b _080D0D46
	.align 2, 0
_080D0D18: .4byte 0x0000FFFF
_080D0D1C: .4byte 0x000001FF
_080D0D20: .4byte 0x08B3F690
_080D0D24: .4byte 0x00001078
_080D0D28: .4byte 0x00000828
_080D0D2C: .4byte 0x08B3F788
_080D0D30: .4byte 0x000020F0
_080D0D34: .4byte 0x00003168
_080D0D38: .4byte 0x08B8E138
_080D0D3C: .4byte 0x0600F000
_080D0D40:
	adds r0, #1
	mov r3, r8
	strh r0, [r3, #0x2a]
_080D0D46:
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

