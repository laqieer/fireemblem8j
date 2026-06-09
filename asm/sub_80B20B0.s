	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80B20B0, "ax", %progbits
@ sub_80B20B0 @ JP 0x080B20B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B20B0
	.thumb_func
sub_80B20B0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #4]
	movs r1, #0
_080B20C0:
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r0, #0x2c
	ldr r2, [sp, #4]
	adds r5, r2, r0
	movs r0, #0
	ldrsb r0, [r5, r0]
	adds r1, #1
	str r1, [sp, #0xc]
	cmp r0, #0
	bne _080B20DA
	b _080B23D4
_080B20DA:
	ldr r1, [r2, #0x60]
	movs r0, #0xf
	ands r1, r0
	lsls r1, r1, #0xc
	ldr r0, [r2, #0x5c]
	adds r0, r0, r1
	ldrh r3, [r5, #8]
	adds r0, r0, r3
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov r8, r0
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	ldr r1, _080B2358 @ =0x000001FF
	ands r1, r2
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080B235C @ =0x085B8CDC
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080B2358 @ =0x000001FF
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080B235C @ =0x085B8CDC
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	ldr r3, _080B2358 @ =0x000001FF
	ands r1, r3
	movs r2, #0xc0
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080B235C @ =0x085B8CDC
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	ldr r1, _080B2358 @ =0x000001FF
	ands r1, r2
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	mov r3, r8
	str r3, [sp]
	ldr r3, _080B235C @ =0x085B8CDC
	bl PutSpriteExt
	movs r7, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	bge _080B21F0
	ldr r0, _080B2358 @ =0x000001FF
	mov sl, r0
	ldr r1, _080B2360 @ =0x085B8D34
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080B21A0:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r7, r0
	blt _080B21A0
_080B21F0:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	bge _080B2254
	ldr r0, _080B2358 @ =0x000001FF
	mov sl, r0
	ldr r1, _080B2364 @ =0x085B8D14
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080B2204:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #2
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r7, r0
	blt _080B2204
_080B2254:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	bge _080B22B8
	ldr r0, _080B2358 @ =0x000001FF
	mov sl, r0
	ldr r1, _080B235C @ =0x085B8CDC
	mov sb, r1
	mov r6, r8
	adds r6, #1
_080B2268:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r4, r7, #3
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	ldrh r3, [r5, #4]
	movs r2, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	adds r1, r1, r4
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #6
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	ldrb r3, [r5, #7]
	subs r3, #1
	lsls r3, r3, #3
	adds r2, r2, r3
	movs r3, #0xff
	ands r2, r3
	str r6, [sp]
	mov r3, sb
	bl PutSpriteExt
	adds r7, #1
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r7, r0
	blt _080B2268
_080B22B8:
	movs r7, #1
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	blt _080B22C4
	b _080B23D4
_080B22C4:
	ldr r0, _080B2358 @ =0x000001FF
	mov sl, r0
	movs r1, #0xff
	mov sb, r1
	mov r2, r8
	adds r2, #9
	str r2, [sp, #8]
_080B22D2:
	ldrb r0, [r5, #1]
	ldrh r2, [r5, #2]
	mov r1, sl
	ands r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	lsls r4, r7, #3
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080B235C @ =0x085B8CDC
	bl PutSpriteExt
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	ldrb r2, [r5, #6]
	subs r2, #1
	lsls r2, r2, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r1, r2
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	ldr r3, [sp, #8]
	str r3, [sp]
	ldr r3, _080B235C @ =0x085B8CDC
	bl PutSpriteExt
	movs r6, #1
	ldrb r0, [r5, #6]
	subs r0, #4
	adds r7, #1
	cmp r6, r0
	bge _080B238E
_080B2328:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080B2360 @ =0x085B8D34
	bl PutSpriteExt
	adds r6, #4
	ldrb r0, [r5, #6]
	subs r0, #4
	cmp r6, r0
	blt _080B2328
	b _080B238E
	.align 2, 0
_080B2358: .4byte 0x000001FF
_080B235C: .4byte 0x085B8CDC
_080B2360: .4byte 0x085B8D34
_080B2364: .4byte 0x085B8D14
_080B2368:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080B2398 @ =0x085B8D14
	bl PutSpriteExt
	adds r6, #2
_080B238E:
	ldrb r0, [r5, #6]
	subs r0, #2
	cmp r6, r0
	blt _080B2368
	b _080B23C2
	.align 2, 0
_080B2398: .4byte 0x085B8D14
_080B239C:
	ldrb r0, [r5, #1]
	movs r2, #2
	ldrsh r1, [r5, r2]
	lsls r2, r6, #3
	adds r1, r1, r2
	mov r3, sl
	ands r1, r3
	movs r3, #4
	ldrsh r2, [r5, r3]
	adds r2, r2, r4
	mov r3, sb
	ands r2, r3
	mov r3, r8
	adds r3, #5
	str r3, [sp]
	ldr r3, _080B23EC @ =0x085B8CDC
	bl PutSpriteExt
	adds r6, #1
_080B23C2:
	ldrb r0, [r5, #6]
	subs r0, #1
	cmp r6, r0
	blt _080B239C
	ldrb r0, [r5, #7]
	subs r0, #1
	cmp r7, r0
	bge _080B23D4
	b _080B22D2
_080B23D4:
	ldr r1, [sp, #0xc]
	cmp r1, #3
	bgt _080B23DC
	b _080B20C0
_080B23DC:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B23EC: .4byte 0x085B8CDC

