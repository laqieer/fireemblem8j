	.syntax unified
	.set GGM_IsCharacterKnown, 0x080A8234 + 1
	.set GetSupportScreenPartnerCharId, 0x080A4908 + 1
	.set GetSupportScreenPartnerCount, 0x080A5944 + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitSupportLevel, 0x080281D0 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8031438, 0x08031438 + 1
	.set sub_80A4954, 0x080A4954 + 1
	.set sub_80A776C, 0x080A776C + 1
	.set sub_80A8030, 0x080A8030 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_80A4A28, "ax", %progbits
@ sub_80A4A28 @ JP 0x080A4A28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4A28
	.thumb_func
sub_80A4A28:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x90
	adds r4, r0, #0
	mov r1, sp
	movs r0, #0
	strh r0, [r1]
	ldr r7, _080A4BA8 @ =0x08A95B10
	ldr r1, [r7]
	ldr r2, _080A4BAC @ =0x01000600
	mov r0, sp
	bl sub_80D6370
	ldr r5, _080A4BB0 @ =0x020136E8
	movs r1, #0
	str r1, [r5]
	adds r4, #0x42
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	bne _080A4A5A
	b _080A4BC0
_080A4A5A:
	add r0, sp, #0x24
	strh r1, [r0]
	add r1, sp, #4
	ldr r2, _080A4BB4 @ =0x01000010
	bl sub_80D6370
	movs r4, #1
_080A4A68:
	adds r0, r4, #0
	bl GetUnit
	cmp r0, #0
	beq _080A4A98
	ldr r2, [r0]
	cmp r2, #0
	beq _080A4A98
	ldr r0, [r0, #0xc]
	ldr r1, _080A4BB8 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A4A98
	ldrb r1, [r2, #4]
	lsrs r2, r1, #5
	lsls r2, r2, #2
	add r2, sp
	movs r0, #0x1f
	ands r0, r1
	movs r1, #1
	lsls r1, r0
	ldr r0, [r2, #4]
	orrs r0, r1
	str r0, [r2, #4]
_080A4A98:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A4A68
	movs r4, #1
	ldr r0, _080A4BB0 @ =0x020136E8
	mov sl, r0
_080A4AA4:
	adds r0, r4, #0
	bl GetUnit
	adds r5, r0, #0
	adds r4, #1
	str r4, [sp, #0x8c]
	cmp r5, #0
	beq _080A4B9E
	ldr r2, [r5]
	cmp r2, #0
	beq _080A4B9E
	ldr r0, [r5, #0xc]
	ldr r1, _080A4BB8 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A4B9E
	ldrb r0, [r2, #4]
	bl GetSupportScreenPartnerCount
	cmp r0, #0
	beq _080A4B9E
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A4BA8 @ =0x08A95B10
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5]
	ldrb r1, [r1, #4]
	strb r1, [r0]
	mov r0, sl
	ldr r1, [r0]
	ldr r0, _080A4BA8 @ =0x08A95B10
	ldr r2, [r0]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	ldr r1, [r5, #4]
	ldrb r1, [r1, #4]
	strb r1, [r0, #1]
	movs r6, #0
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A4BBC @ =0x088582E8
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	bge _080A4B96
	ldr r7, _080A4BB0 @ =0x020136E8
	ldr r0, _080A4BA8 @ =0x08A95B10
	mov r8, r0
_080A4B18:
	ldr r0, [r7]
	adds r1, r6, #0
	bl GetSupportScreenPartnerCharId
	adds r4, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GetUnitSupportLevel
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #2
	adds r1, r1, r6
	strb r0, [r1]
	adds r0, r4, #0
	bl sub_80A4954
	ldr r2, [r7]
	mov r1, r8
	ldr r3, [r1]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #9
	adds r1, r1, r6
	strb r0, [r1]
	ldr r0, [r7]
	mov r1, r8
	ldr r2, [r1]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	adds r1, #0x10
	add r1, sb
	asrs r0, r4, #5
	lsls r0, r0, #2
	add r0, sp
	movs r2, #0x1f
	ands r2, r4
	ldr r0, [r0, #4]
	lsrs r0, r2
	movs r2, #1
	ands r0, r2
	strb r0, [r1]
	adds r6, #1
	ldr r0, [r5]
	ldrb r0, [r0, #4]
	subs r0, #1
	movs r1, #0x34
	muls r0, r1, r0
	ldr r1, _080A4BBC @ =0x088582E8
	adds r0, r0, r1
	ldr r0, [r0]
	ldrb r0, [r0, #0x15]
	cmp r6, r0
	blt _080A4B18
_080A4B96:
	mov r1, sl
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
_080A4B9E:
	ldr r4, [sp, #0x8c]
	cmp r4, #0x3f
	bgt _080A4BA6
	b _080A4AA4
_080A4BA6:
	b _080A4C96
	.align 2, 0
_080A4BA8: .4byte 0x08A95B10
_080A4BAC: .4byte 0x01000600
_080A4BB0: .4byte 0x020136E8
_080A4BB4: .4byte 0x01000010
_080A4BB8: .4byte 0x00010004
_080A4BBC: .4byte 0x088582E8
_080A4BC0:
	add r4, sp, #0x28
	adds r0, r4, #0
	bl sub_80A776C
	ldr r0, _080A4C38 @ =0x000001F1
	bl sub_8009FA8
	bl sub_8031438
	movs r6, #0
	add r0, sp, #0x28
	mov sl, r0
	ldr r1, _080A4C3C @ =0x088582BC
	mov r8, r1
_080A4BDC:
	adds r0, r6, #0
	mov r1, sl
	bl GGM_IsCharacterKnown
	lsls r0, r0, #0x18
	adds r4, r6, #1
	cmp r0, #0
	beq _080A4C90
	adds r0, r6, #0
	bl GetSupportScreenPartnerCount
	cmp r0, #0
	beq _080A4C90
	ldr r1, [r5]
	ldr r2, [r7]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	adds r0, r0, r2
	strb r6, [r0]
	ldr r0, [r5]
	ldr r2, [r7]
	lsls r1, r0, #1
	adds r1, r1, r0
	lsls r1, r1, #3
	adds r1, r1, r2
	subs r2, r6, #1
	movs r0, #0x34
	muls r0, r2, r0
	add r0, r8
	ldrb r0, [r0, #5]
	strb r0, [r1, #1]
	ldr r1, [r5]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #3
	ldr r1, [r7]
	adds r1, r1, r0
	adds r1, #2
	adds r0, r6, #0
	mov r2, sl
	bl sub_80A8030
	movs r0, #0
	mov sb, r0
	b _080A4C80
	.align 2, 0
_080A4C38: .4byte 0x000001F1
_080A4C3C: .4byte 0x088582BC
_080A4C40:
	ldr r0, [r5]
	mov r1, sb
	bl GetSupportScreenPartnerCharId
	ldr r1, [r5]
	ldr r3, [r7]
	lsls r2, r1, #1
	adds r2, r2, r1
	lsls r2, r2, #3
	adds r2, r2, r3
	adds r2, #9
	add r2, sb
	subs r3, r0, #1
	movs r1, #0x34
	muls r1, r3, r1
	add r1, r8
	ldrb r1, [r1, #5]
	strb r1, [r2]
	add r1, sp, #0x28
	bl GGM_IsCharacterKnown
	ldr r2, [r5]
	ldr r3, [r7]
	lsls r1, r2, #1
	adds r1, r1, r2
	lsls r1, r1, #3
	adds r1, r1, r3
	adds r1, #0x10
	add r1, sb
	strb r0, [r1]
	movs r1, #1
	add sb, r1
_080A4C80:
	adds r0, r6, #0
	bl GetSupportScreenPartnerCount
	cmp sb, r0
	blt _080A4C40
	ldr r0, [r5]
	adds r0, #1
	str r0, [r5]
_080A4C90:
	adds r6, r4, #0
	cmp r6, #0xff
	ble _080A4BDC
_080A4C96:
	add sp, #0x90
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

