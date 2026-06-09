	.syntax unified
	.set WriteAndVerifySramFast, 0x080D6548 + 1
	.set sub_801759C, 0x0801759C + 1
	.section .text.sub_80A9D54, "ax", %progbits
@ sub_80A9D54 @ JP 0x080A9D54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A9D54
	.thumb_func
sub_80A9D54:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x70
	adds r7, r0, #0
	str r1, [sp, #0x6c]
	mov r1, sp
	ldr r0, [r7]
	ldrb r0, [r0, #4]
	strb r0, [r1, #0x14]
	mov r3, sp
	ldr r0, [r7, #4]
	ldrb r1, [r0, #4]
	movs r0, #0x7f
	ands r1, r0
	ldrb r2, [r3]
	movs r5, #0x80
	rsbs r5, r5, #0
	adds r0, r5, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3]
	ldr r4, [r7]
	cmp r4, #0
	bne _080A9DA0
	add r7, sp, #0x24
	adds r0, r7, #0
	bl sub_801759C
	mov r0, sp
	strb r4, [r0, #0x14]
	mov r2, sp
	ldrb r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	strb r0, [r2]
_080A9DA0:
	mov r4, sp
	movs r1, #8
	ldrsb r1, [r7, r1]
	movs r0, #0x1f
	mov sb, r0
	mov r0, sb
	ands r1, r0
	lsls r1, r1, #7
	ldrh r2, [r4]
	ldr r3, _080AA160 @ =0xFFFFF07F
	adds r0, r3, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r4]
	ldrb r2, [r7, #9]
	movs r1, #0x7f
	mov sl, r1
	ands r2, r1
	lsls r2, r2, #0xc
	ldr r0, [sp]
	ldr r1, _080AA164 @ =0xFFF80FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp]
	movs r1, #0x10
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #3
	ldrh r2, [r4, #2]
	ldr r0, _080AA168 @ =0xFFFFFE07
	ands r0, r2
	orrs r0, r1
	strh r0, [r4, #2]
	movs r1, #0x11
	ldrsb r1, [r7, r1]
	movs r0, #0x3f
	ands r1, r0
	lsls r1, r1, #1
	ldrb r2, [r4, #3]
	movs r0, #0x7f
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #3]
	movs r2, #0x12
	ldrsb r2, [r7, r2]
	movs r6, #0x3f
	ands r2, r6
	lsls r2, r2, #0xc
	ldr r0, [sp, #4]
	ldr r1, _080AA16C @ =0xFFFC0FFF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #4]
	movs r1, #0x14
	ldrsb r1, [r7, r1]
	movs r5, #0x1f
	ands r1, r5
	lsls r1, r1, #2
	ldrb r2, [r4, #6]
	movs r0, #0x7d
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #6]
	mov r2, sp
	movs r0, #0x15
	ldrsb r0, [r7, r0]
	mov r4, sb
	ands r0, r4
	lsls r0, r0, #7
	ldrh r1, [r2, #6]
	ands r3, r1
	orrs r3, r0
	strh r3, [r2, #6]
	mov r4, sp
	movs r3, #0x16
	ldrsb r3, [r7, r3]
	movs r0, #0xf
	mov r8, r0
	adds r1, r3, #0
	ands r1, r0
	lsls r1, r1, #4
	ldrb r2, [r4, #7]
	ands r0, r2
	orrs r0, r1
	strb r0, [r4, #7]
	lsrs r3, r3, #4
	movs r1, #1
	mov ip, r1
	ands r3, r1
	ldrb r1, [r4, #8]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r3
	strb r0, [r4, #8]
	mov r3, sp
	movs r1, #0x17
	ldrsb r1, [r7, r1]
	ands r1, r5
	lsls r1, r1, #1
	movs r2, #0x3f
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #8]
	movs r1, #0x18
	ldrsb r1, [r7, r1]
	mov r4, sb
	ands r1, r4
	lsls r1, r1, #6
	ldrh r2, [r3, #8]
	ldr r0, _080AA170 @ =0xFFFFF83F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #8]
	movs r1, #0x19
	ldrsb r1, [r7, r1]
	lsls r1, r1, #3
	ldrb r2, [r3, #9]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #9]
	movs r1, #0x1a
	ldrsb r1, [r7, r1]
	ands r1, r5
	ldrb r2, [r3, #0xa]
	movs r0, #0x20
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0xa]
	movs r1, #0x1d
	ldrsb r1, [r7, r1]
	ands r1, r4
	lsls r1, r1, #5
	ldrh r2, [r3, #0xa]
	ldr r0, _080AA174 @ =0xFFFFFC1F
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #0xa]
	ldrh r2, [r7, #0x1e]
	adds r1, r2, #0
	ands r1, r6
	lsls r1, r1, #2
	ldrb r4, [r3, #0xb]
	movs r5, #3
	adds r0, r5, #0
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #0xb]
	lsrs r2, r2, #6
	strb r2, [r3, #0xc]
	ldrh r2, [r7, #0x20]
	ldr r4, _080AA178 @ =0x00003FFF
	ands r2, r4
	lsls r2, r2, #8
	ldr r0, [sp, #0xc]
	ldr r1, _080AA17C @ =0xFFC000FF
	ands r0, r1
	orrs r0, r2
	str r0, [sp, #0xc]
	ldrh r1, [r7, #0x22]
	ldr r0, _080AA180 @ =0x000003FF
	ands r0, r1
	lsls r0, r0, #6
	ldrh r2, [r3, #0xe]
	ands r6, r2
	orrs r6, r0
	strh r6, [r3, #0xe]
	lsrs r1, r1, #0xa
	mov r0, r8
	ands r1, r0
	ldrb r2, [r3, #0x10]
	movs r0, #0x10
	rsbs r0, r0, #0
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrh r1, [r7, #0x24]
	ands r1, r4
	lsls r1, r1, #4
	ldr r0, [sp, #0x10]
	ldr r2, _080AA184 @ =0xFFFC000F
	ands r0, r2
	orrs r0, r1
	str r0, [sp, #0x10]
	mov r2, sp
	ldrh r0, [r7, #0x26]
	lsls r0, r0, #2
	ldrh r1, [r2, #0x12]
	ands r5, r1
	orrs r5, r0
	strh r5, [r2, #0x12]
	mov r1, sp
	ldrb r0, [r1, #3]
	mov r5, sl
	ands r5, r0
	strb r5, [r1, #3]
	ldrh r2, [r1, #4]
	ldr r6, _080AA188 @ =0xFFFFF000
	adds r0, r6, #0
	ands r0, r2
	strh r0, [r1, #4]
	ldr r0, [r7, #0xc]
	movs r1, #4
	mov r8, r1
	ands r0, r1
	cmp r0, #0
	beq _080A9F6A
	mov r0, sp
	ldrh r2, [r0, #4]
	ldr r4, _080AA18C @ =0x00000FFF
	ands r2, r4
	mov r0, ip
	lsrs r1, r0, #1
	lsls r0, r0, #7
	orrs r0, r5
	strb r0, [r3, #3]
	orrs r1, r2
	ands r1, r4
	ldrh r2, [r3, #4]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A9F6A:
	ldr r0, [r7, #0xc]
	movs r1, #8
	mov sb, r1
	ands r0, r1
	cmp r0, #0
	beq _080A9FAA
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080AA18C @ =0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #2
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080A9FAA:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #7
	ands r0, r1
	cmp r0, #0
	beq _080A9FEA
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldrh r1, [r0, #4]
	ldr r5, _080AA18C @ =0x00000FFF
	ands r1, r5
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, r8
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	ldrh r2, [r3, #4]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080A9FEA:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080AA02A
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r2, r4, #7
	ldrh r1, [r0, #4]
	ldr r5, _080AA18C @ =0x00000FFF
	ands r1, r5
	lsls r1, r1, #1
	orrs r1, r2
	mov r0, sb
	orrs r1, r0
	adds r2, r1, #0
	mov r0, ip
	ands r2, r0
	lsls r2, r2, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r2
	strb r0, [r3, #3]
	lsrs r1, r1, #1
	ands r1, r5
	ldrh r2, [r3, #4]
	adds r0, r6, #0
	ands r0, r2
	orrs r0, r1
	strh r0, [r3, #4]
_080AA02A:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #6
	ands r0, r1
	cmp r0, #0
	beq _080AA06A
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080AA18C @ =0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x10
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080AA06A:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #9
	ands r0, r1
	cmp r0, #0
	beq _080AA0AA
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080AA18C @ =0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x20
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080AA0AA:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0x12
	ands r0, r1
	cmp r0, #0
	beq _080AA0EA
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080AA18C @ =0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x40
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080AA0EA:
	ldr r0, [r7, #0xc]
	movs r1, #0x80
	lsls r1, r1, #0xe
	ands r0, r1
	cmp r0, #0
	beq _080AA12A
	mov r3, sp
	mov r0, sp
	ldrb r4, [r0, #3]
	lsrs r1, r4, #7
	ldrh r2, [r0, #4]
	ldr r5, _080AA18C @ =0x00000FFF
	ands r2, r5
	lsls r2, r2, #1
	orrs r2, r1
	movs r0, #0x80
	orrs r2, r0
	adds r1, r2, #0
	mov r0, ip
	ands r1, r0
	lsls r1, r1, #7
	mov r0, sl
	ands r0, r4
	orrs r0, r1
	strb r0, [r3, #3]
	lsrs r2, r2, #1
	ands r2, r5
	ldrh r1, [r3, #4]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r2
	strh r0, [r3, #4]
_080AA12A:
	movs r2, #0
	mov r5, sp
	adds r5, #0x1d
	adds r6, r7, #0
	adds r6, #0x32
	mov r4, sp
	adds r4, #0x15
	adds r3, r7, #0
	adds r3, #0x28
_080AA13C:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #7
	ble _080AA13C
	movs r2, #0
	adds r4, r5, #0
	adds r3, r6, #0
_080AA150:
	adds r0, r4, r2
	adds r1, r3, r2
	ldrb r1, [r1]
	strb r1, [r0]
	adds r2, #1
	cmp r2, #6
	b _080AA190
	.align 2, 0
_080AA160: .4byte 0xFFFFF07F
_080AA164: .4byte 0xFFF80FFF
_080AA168: .4byte 0xFFFFFE07
_080AA16C: .4byte 0xFFFC0FFF
_080AA170: .4byte 0xFFFFF83F
_080AA174: .4byte 0xFFFFFC1F
_080AA178: .4byte 0x00003FFF
_080AA17C: .4byte 0xFFC000FF
_080AA180: .4byte 0x000003FF
_080AA184: .4byte 0xFFFC000F
_080AA188: .4byte 0xFFFFF000
_080AA18C: .4byte 0x00000FFF
_080AA190:
	ble _080AA150
	mov r0, sp
	ldr r1, [sp, #0x6c]
	movs r2, #0x24
	bl WriteAndVerifySramFast
	add sp, #0x70
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

