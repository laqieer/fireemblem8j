	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80D1844, "ax", %progbits
@ sub_80D1844 @ JP 0x080D1844 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D1844
	.thumb_func
sub_80D1844:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #4
	mov r8, r0
	adds r0, #0x41
	ldrb r1, [r0]
	lsls r1, r1, #1
	subs r0, #0x15
	adds r0, r0, r1
	ldrh r1, [r0]
	movs r7, #0x74
	movs r6, #0
	ldr r2, _080D18CC @ =0x089CF318
	lsls r0, r1, #2
	adds r0, r0, r1
	lsls r0, r0, #2
	adds r1, r0, r2
	ldrb r0, [r1]
	cmp r0, #0
	beq _080D18B2
	adds r5, r1, #0
_080D1870:
	ldrb r0, [r5]
	bl GetClassDisplayFontInfo
	adds r4, r0, #0
	ldr r3, [r4]
	cmp r3, #0
	beq _080D18A4
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r1, r7, r1
	subs r1, #2
	movs r2, #6
	ldrsb r2, [r4, r2]
	adds r2, #6
	movs r0, #0x81
	lsls r0, r0, #7
	str r0, [sp]
	movs r0, #4
	bl PutSpriteExt
	movs r0, #5
	ldrsb r0, [r4, r0]
	movs r1, #4
	ldrsb r1, [r4, r1]
	subs r0, r0, r1
	adds r7, r7, r0
_080D18A4:
	adds r5, #1
	adds r6, #1
	cmp r6, #0x13
	bgt _080D18B2
	ldrb r0, [r5]
	cmp r0, #0
	bne _080D1870
_080D18B2:
	mov r1, r8
	adds r1, #0x44
	ldrh r0, [r1]
	cmp r0, #0xfe
	bhi _080D18C0
	adds r0, #1
	strh r0, [r1]
_080D18C0:
	add sp, #4
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D18CC: .4byte 0x089CF318

