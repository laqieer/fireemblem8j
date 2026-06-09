	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80CF9D4, 0x080CF9D4 + 1
	.section .text.sub_80D0570, "ax", %progbits
@ sub_80D0570 @ JP 0x080D0570 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D0570
	.thumb_func
sub_80D0570:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #6
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CF9D4
	adds r7, r0, #0
	ldr r0, _080D063C @ =0x0000FFFF
	mov sb, r0
	cmp r7, sb
	beq _080D05D6
	adds r1, r7, #0
	subs r1, #0x20
	ldr r4, _080D0640 @ =0x000001FF
	ands r1, r4
	ldr r5, _080D0644 @ =0x08B3F690
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r0, #1
	movs r2, #6
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x1c
	ands r1, r4
	ldr r2, _080D0648 @ =0x00000406
	ldr r0, _080D064C @ =0x00001078
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080D0650 @ =0x0000081E
	ldr r3, _080D0654 @ =0x08B3F6DE
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	bl PutSpriteExt
_080D05D6:
	ldrh r0, [r6, #0x2a]
	adds r2, r0, #2
	movs r0, #0xb4
	movs r1, #1
	movs r3, #9
	bl sub_80CF9D4
	adds r7, r0, #0
	cmp r7, sb
	beq _080D0628
	adds r1, r7, #0
	subs r1, #0x40
	ldr r4, _080D0640 @ =0x000001FF
	ands r1, r4
	ldr r5, _080D0644 @ =0x08B3F690
	ldr r0, _080D0658 @ =0x000020F0
	str r0, [sp]
	movs r0, #1
	movs r2, #0x3a
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x3c
	ands r1, r4
	ldr r2, _080D065C @ =0x0000043A
	ldr r0, _080D0660 @ =0x00003168
	str r0, [sp]
	movs r0, #2
	adds r3, r5, #0
	bl PutSpriteExt
	adds r1, r7, #0
	subs r1, #0x38
	ands r1, r4
	ldr r2, _080D0664 @ =0x00000852
	ldr r3, _080D0654 @ =0x08B3F6DE
	movs r0, #0
	str r0, [sp]
	bl PutSpriteExt
_080D0628:
	ldrh r0, [r6, #0x2a]
	cmp r0, #9
	bne _080D0668
	movs r0, #0
	strh r0, [r6, #0x2a]
	adds r0, r6, #0
	bl sub_8002DE4
	b _080D066C
	.align 2, 0
_080D063C: .4byte 0x0000FFFF
_080D0640: .4byte 0x000001FF
_080D0644: .4byte 0x08B3F690
_080D0648: .4byte 0x00000406
_080D064C: .4byte 0x00001078
_080D0650: .4byte 0x0000081E
_080D0654: .4byte 0x08B3F6DE
_080D0658: .4byte 0x000020F0
_080D065C: .4byte 0x0000043A
_080D0660: .4byte 0x00003168
_080D0664: .4byte 0x00000852
_080D0668:
	adds r0, #1
	strh r0, [r6, #0x2a]
_080D066C:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

