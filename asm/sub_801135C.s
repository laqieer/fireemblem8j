	.syntax unified
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8003678, 0x08003678 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8011080, 0x08011080 + 1
	.set sub_8011184, 0x08011184 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.section .text.sub_801135C, "ax", %progbits
@ sub_801135C @ JP 0x0801135C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801135C
	.thumb_func
sub_801135C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	bl sub_8011080
	adds r2, r5, #0
	adds r2, #0x46
	strh r0, [r2]
	lsls r1, r0, #0x10
	lsrs r6, r1, #0x13
	movs r1, #7
	ands r1, r0
	cmp r1, #0
	beq _08011382
	adds r6, #1
_08011382:
	lsls r0, r6, #3
	ldrh r1, [r2]
	subs r0, r0, r1
	asrs r0, r0, #1
	mov sb, r0
	adds r2, r5, #0
	adds r2, #0x34
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	bne _080113A6
	movs r0, #0x1e
	subs r0, r0, r6
	asrs r0, r0, #1
	subs r7, r0, #1
	b _080113AA
_080113A6:
	movs r7, #0
	ldrsb r7, [r2, r7]
_080113AA:
	adds r2, r5, #0
	adds r2, #0x35
	movs r1, #0
	ldrsb r1, [r2, r1]
	movs r0, #1
	rsbs r0, r0, #0
	movs r3, #8
	mov r8, r3
	cmp r1, r0
	beq _080113C2
	adds r2, r1, #0
	mov r8, r2
_080113C2:
	adds r4, r6, #2
	adds r0, r5, #0
	adds r0, #0x36
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r7, #0
	mov r1, r8
	adds r2, r4, #0
	movs r3, #4
	bl sub_804F0EC
	movs r0, #0x37
	adds r0, r0, r5
	mov sl, r0
	strb r7, [r0]
	adds r1, r5, #0
	adds r1, #0x38
	str r1, [sp, #0xc]
	mov r2, r8
	strb r2, [r1]
	adds r0, r5, #0
	adds r0, #0x39
	strb r4, [r0]
	adds r1, #2
	movs r0, #3
	strb r0, [r1]
	adds r4, r5, #0
	adds r4, #0x44
	ldrb r0, [r4]
	add r0, sb
	strb r0, [r4]
	add r0, sp, #4
	adds r1, r6, #0
	bl InitText
	adds r0, r5, #0
	adds r0, #0x3b
	ldrb r1, [r0]
	add r0, sp, #4
	bl sub_8003D90
	add r0, sp, #4
	mov r1, sb
	bl sub_8003D84
	ldr r0, [r5, #0x2c]
	ldr r1, [sp, #4]
	ldr r2, [sp, #8]
	bl sub_8011184
	ldrh r0, [r5, #0x3e]
	ldr r6, _080114A0 @ =0x0000FFFF
	cmp r0, r6
	beq _08011438
	adds r1, r5, #0
	adds r1, #0x40
	ldrh r1, [r1]
	bl sub_8003678
_08011438:
	mov r1, r8
	adds r1, #1
	lsls r1, r1, #5
	adds r1, #1
	adds r1, r1, r7
	lsls r1, r1, #1
	ldr r0, _080114A4 @ =0x02022CA8
	adds r1, r1, r0
	add r0, sp, #4
	bl PutText
	bl ResetText
	ldrh r0, [r5, #0x3e]
	cmp r0, r6
	beq _08011490
	ldr r0, _080114A8 @ =0x085BA00C
	adds r1, r5, #0
	bl sub_8002BCC
	mov r3, sl
	ldrb r1, [r3]
	adds r1, #1
	lsls r1, r1, #3
	ldrb r4, [r4]
	adds r1, r1, r4
	str r1, [r0, #0x2c]
	ldr r2, [sp, #0xc]
	ldrb r1, [r2]
	adds r1, #1
	lsls r1, r1, #3
	str r1, [r0, #0x30]
	adds r3, r5, #0
	adds r3, #0x40
	adds r1, r5, #0
	adds r1, #0x42
	ldrb r2, [r1]
	movs r1, #0xf
	ands r1, r2
	lsls r1, r1, #0xc
	ldrh r2, [r3]
	orrs r1, r2
	adds r0, #0x4a
	strh r1, [r0]
_08011490:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080114A0: .4byte 0x0000FFFF
_080114A4: .4byte 0x02022CA8
_080114A8: .4byte 0x085BA00C

