	.syntax unified
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80C8FF0, "ax", %progbits
@ EndingCredits_UpdateStaffReel @ JP 0x080C8FF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EndingCredits_UpdateStaffReel
	.thumb_func
EndingCredits_UpdateStaffReel:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r3, r0, #0
	ldr r0, [r3, #0x30]
	asrs r0, r0, #8
	cmp r0, #0
	bge _080C9008
	adds r0, #0xff
_080C9008:
	asrs r4, r0, #8
	adds r1, r3, #0
	adds r1, #0x35
	strb r4, [r1]
	ldr r0, [r3, #0x30]
	asrs r2, r0, #8
	adds r0, r2, #0
	mov r8, r1
	cmp r2, #0
	bge _080C901E
	adds r0, #0xff
_080C901E:
	asrs r0, r0, #8
	lsls r0, r0, #8
	subs r0, r2, r0
	cmp r0, #0xf
	bgt _080C902A
	b _080C9150
_080C902A:
	adds r0, r3, #0
	adds r0, #0x34
	lsls r1, r4, #0x18
	asrs r1, r1, #0x18
	movs r2, #0
	ldrsb r2, [r0, r2]
	str r0, [sp, #4]
	cmp r1, r2
	bne _080C903E
	b _080C9150
_080C903E:
	adds r4, r3, #0
	adds r4, #0x29
	ldrb r1, [r4]
	movs r0, #4
	ands r0, r1
	ldr r1, _080C908C @ =0x081F6AE8
	mov sb, r1
	ldr r2, _080C9090 @ =0x081F6C8C
	mov sl, r2
	cmp r0, #0
	bne _080C90BA
	mov r1, r8
	movs r0, #0
	ldrsb r0, [r1, r0]
	adds r2, r0, #1
	cmp r2, #0x15
	bhi _080C90BA
	adds r6, r3, #0
	adds r6, #0x48
	mov r7, sb
	subs r7, #0x14
	ldr r0, _080C9094 @ =0x0202BCEC
	mov ip, r0
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r1, r0, #2
_080C9072:
	adds r5, r1, r7
	ldr r0, [r5, #4]
	cmp r0, #0
	beq _080C90B2
	movs r0, #0
	strb r0, [r6]
	mov r1, ip
	ldrb r0, [r1, #0x1b]
	cmp r0, #2
	bne _080C9098
	ldr r0, [r5, #4]
	b _080C909A
	.align 2, 0
_080C908C: .4byte 0x081F6AE8
_080C9090: .4byte 0x081F6C8C
_080C9094: .4byte 0x0202BCEC
_080C9098:
	ldr r0, [r5, #8]
_080C909A:
	str r0, [r3, #0x44]
	ldr r0, [r5, #0xc]
	str r0, [r3, #0x3c]
	ldr r0, [r5, #0x10]
	str r0, [r3, #0x40]
	ldrb r1, [r4]
	movs r0, #4
	orrs r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4]
	b _080C90BA
_080C90B2:
	adds r1, #0x14
	adds r2, #1
	cmp r2, #0x15
	bls _080C9072
_080C90BA:
	mov r2, r8
	movs r0, #0
	ldrsb r0, [r2, r0]
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	mov r2, sb
	adds r5, r1, r2
	adds r2, r0, #1
	movs r0, #1
	ands r2, r0
	ldr r0, [r5]
	cmp r0, #0
	beq _080C9114
	ldr r0, [r0]
	lsls r1, r2, #2
	add r1, sl
	ldr r4, [r1]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	bl sub_8013008
	ldr r0, [r5]
	ldr r0, [r0, #4]
	ldr r5, _080C910C @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	ldr r0, _080C9110 @ =0x0201C5D4
	lsrs r4, r4, #5
	movs r1, #0xe0
	lsls r1, r1, #7
	adds r4, r4, r1
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	adds r1, r5, #0
	adds r2, r4, #0
	bl j_TmApplyTsa
	b _080C9148
	.align 2, 0
_080C910C: .4byte 0x02020188
_080C9110: .4byte 0x0201C5D4
_080C9114:
	movs r0, #1
	rsbs r0, r0, #0
	str r0, [sp]
	ldr r1, _080C9160 @ =0x081F6C8C
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r4, [r0]
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r1, r4, r2
	ldr r2, _080C9164 @ =0x01000008
	mov r0, sp
	bl sub_80D636C
	lsrs r4, r4, #5
	movs r1, #0xe0
	lsls r1, r1, #7
	adds r0, r4, r1
	ldr r3, _080C9168 @ =0x0201C5D4
	movs r2, #0x80
	lsls r2, r2, #3
_080C913E:
	strh r0, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _080C913E
_080C9148:
	mov r2, r8
	ldrb r0, [r2]
	ldr r1, [sp, #4]
	strb r0, [r1]
_080C9150:
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080C9160: .4byte 0x081F6C8C
_080C9164: .4byte 0x01000008
_080C9168: .4byte 0x0201C5D4

