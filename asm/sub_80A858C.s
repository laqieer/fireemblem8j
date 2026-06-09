	.syntax unified
	.set FormatTime, 0x08000D14 + 1
	.set GetCurCompleteChapters, 0x080A8D30 + 1
	.set GetGameTotalTime, 0x080A8E8C + 1
	.set GetOverallRank, 0x080BABF4 + 1
	.set GetUnit, 0x08019108 + 1
	.set strcpy, 0x080D69BC + 1
	.set sub_80171F8, 0x080171F8 + 1
	.set sub_8031430, 0x08031430 + 1
	.set sub_80A9440, 0x080A9440 + 1
	.set sub_80BA8F8, 0x080BA8F8 + 1
	.set sub_80BA9F0, 0x080BA9F0 + 1
	.set sub_80BAA28, 0x080BAA28 + 1
	.set sub_80BAB20, 0x080BAB20 + 1
	.set sub_80BAB54, 0x080BAB54 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A858C, "ax", %progbits
@ sub_80A858C @ JP 0x080A858C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A858C
	.thumb_func
sub_80A858C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	adds r4, r1, #0
	adds r5, r2, #0
	movs r0, #0
	mov sb, r0
	add r0, sp, #4
	movs r1, #0
	mov r8, r1
	mov r3, sb
	strh r3, [r0]
	ldr r2, _080A8698 @ =0x0100000C
	adds r1, r7, #0
	bl sub_80D6370
	ldrb r0, [r7]
	movs r6, #1
	orrs r0, r6
	strb r0, [r7]
	movs r0, #3
	ands r4, r0
	lsls r4, r4, #3
	ldrb r1, [r7, #2]
	movs r0, #0x19
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r4
	ands r5, r6
	lsls r5, r5, #5
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	strb r0, [r7, #2]
	bl sub_80171F8
	movs r2, #7
	ands r2, r0
	lsls r2, r2, #5
	ldrb r3, [r7, #7]
	movs r1, #0x1f
	ands r1, r3
	orrs r1, r2
	strb r1, [r7, #7]
	lsls r0, r0, #8
	lsrs r0, r0, #0xb
	ldr r1, [r7, #8]
	ldr r2, _080A869C @ =0xFFE00000
	ands r1, r2
	orrs r1, r0
	str r1, [r7, #8]
	ldr r3, _080A86A0 @ =0x0202BCEC
	adds r0, r3, #0
	adds r0, #0x2b
	ldrb r1, [r0]
	lsls r1, r1, #0x1f
	lsrs r1, r1, #0x1f
	ands r1, r6
	lsls r1, r1, #6
	ldrb r2, [r7, #2]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #2]
	ldrh r1, [r3, #0x2c]
	lsls r1, r1, #0x13
	lsrs r1, r1, #0x17
	movs r0, #0xff
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r7, #2]
	ldr r0, _080A86A4 @ =0xFFFF807F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #2]
	bl GetGameTotalTime
	mov r4, sp
	adds r4, #6
	add r5, sp, #8
	mov r6, sp
	adds r6, #0xa
	adds r1, r4, #0
	adds r2, r5, #0
	adds r3, r6, #0
	bl FormatTime
	ldrh r2, [r4]
	ldr r0, _080A86A8 @ =0x000003FF
	ands r2, r0
	lsls r2, r2, #7
	ldr r0, [r7, #4]
	ldr r1, _080A86AC @ =0xFFFE007F
	ands r0, r1
	orrs r0, r2
	str r0, [r7, #4]
	ldrh r1, [r5]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r7, #6]
	movs r0, #0x7f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r7, #6]
	ldrh r1, [r6]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r7, #6]
	ldr r0, _080A86B0 @ =0xFFFFE07F
	ands r0, r2
	orrs r0, r1
	strh r0, [r7, #6]
	ldrb r1, [r7, #3]
	movs r0, #0x7f
	ands r0, r1
	strb r0, [r7, #3]
	ldrb r1, [r7, #4]
	movs r0, #0x80
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r7, #4]
	mov r0, r8
	strb r0, [r7, #0x17]
	movs r4, #1
	b _080A86BC
	.align 2, 0
_080A8698: .4byte 0x0100000C
_080A869C: .4byte 0xFFE00000
_080A86A0: .4byte 0x0202BCEC
_080A86A4: .4byte 0xFFFF807F
_080A86A8: .4byte 0x000003FF
_080A86AC: .4byte 0xFFFE007F
_080A86B0: .4byte 0xFFFFE07F
_080A86B4:
	ldrb r0, [r2, #4]
	strb r0, [r7, #0x17]
	b _080A86E4
_080A86BA:
	adds r4, #1
_080A86BC:
	cmp r4, #0x3f
	bgt _080A86E4
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080A86BA
	ldr r2, [r0]
	cmp r2, #0
	beq _080A86BA
	ldr r1, [r0, #0xc]
	movs r0, #0x80
	lsls r0, r0, #6
	ands r0, r1
	cmp r0, #0
	beq _080A86BA
	movs r0, #4
	ands r1, r0
	cmp r1, #0
	beq _080A86B4
_080A86E4:
	movs r5, #1
	movs r1, #0xc
	adds r1, r1, r7
	mov sl, r1
	movs r3, #0x7f
	mov r8, r3
	movs r6, #0x7f
_080A86F2:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _080A874C
	ldr r2, [r4]
	cmp r2, #0
	beq _080A874C
	ldr r0, [r4, #0xc]
	ldr r1, _080A8810 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A874C
	ldrb r0, [r2, #4]
	bl sub_80A9440
	cmp r0, sb
	ble _080A874C
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	bl sub_80A9440
	mov sb, r0
	ldr r0, [r4]
	ldrb r2, [r0, #4]
	movs r1, #1
	ands r1, r2
	lsls r1, r1, #7
	ldrb r3, [r7, #3]
	adds r0, r6, #0
	ands r0, r3
	orrs r0, r1
	strb r0, [r7, #3]
	lsrs r2, r2, #1
	ands r2, r6
	mov r0, r8
	ands r2, r0
	ldrb r0, [r7, #4]
	movs r3, #0x80
	rsbs r3, r3, #0
	adds r1, r3, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r7, #4]
_080A874C:
	adds r5, #1
	cmp r5, #0x3f
	ble _080A86F2
	bl sub_80BA8F8
	movs r5, #7
	ands r0, r5
	lsls r0, r0, #4
	ldrb r2, [r7]
	movs r1, #0x71
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl sub_80BAB54
	ands r0, r5
	lsls r0, r0, #2
	ldrb r2, [r7, #1]
	movs r1, #0x1d
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_80BA9F0
	movs r1, #7
	ands r0, r1
	lsls r0, r0, #7
	ldrh r2, [r7]
	ldr r1, _080A8814 @ =0xFFFFFC7F
	ands r1, r2
	orrs r1, r0
	strh r1, [r7]
	bl sub_80BAA28
	lsls r0, r0, #5
	ldrb r2, [r7, #1]
	movs r1, #0x1f
	ands r1, r2
	orrs r1, r0
	strb r1, [r7, #1]
	bl sub_80BAB20
	ands r0, r5
	ldrb r1, [r7, #2]
	movs r4, #8
	rsbs r4, r4, #0
	ands r4, r1
	orrs r4, r0
	strb r4, [r7, #2]
	ldrb r0, [r7]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x1d
	ldrh r1, [r7]
	lsls r1, r1, #0x16
	lsrs r1, r1, #0x1d
	ldrb r3, [r7, #1]
	lsls r2, r3, #0x1b
	lsrs r2, r2, #0x1d
	lsrs r3, r3, #5
	lsls r4, r4, #0x1d
	lsrs r4, r4, #0x1d
	str r4, [sp]
	bl GetOverallRank
	ands r0, r5
	lsls r0, r0, #1
	ldrb r2, [r7]
	movs r1, #0xf
	rsbs r1, r1, #0
	ands r1, r2
	orrs r1, r0
	strb r1, [r7]
	bl GetCurCompleteChapters
	movs r1, #0x3f
	ands r0, r1
	lsls r0, r0, #5
	ldrh r2, [r7, #0xa]
	ldr r1, _080A8818 @ =0xFFFFF81F
	ands r1, r2
	orrs r1, r0
	strh r1, [r7, #0xa]
	bl sub_8031430
	adds r1, r0, #0
	mov r0, sl
	bl strcpy
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A8810: .4byte 0x00010004
_080A8814: .4byte 0xFFFFFC7F
_080A8818: .4byte 0xFFFFF81F

