	.syntax unified
	.set AdvanceGetLCGRNValue, 0x08000CC0 + 1
	.set PutSpriteExt, 0x08005330 + 1
	.set __divsi3, 0x080D65F8 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80B0028, "ax", %progbits
@ sub_80B0028 @ JP 0x080B0028 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B0028
	.thumb_func
sub_80B0028:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	mov sb, r0
	movs r0, #0
	mov r8, r0
	ldr r6, _080B0084 @ =0x020007E0
	movs r7, #0x13
_080B003C:
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	cmp r0, #0
	beq _080B0130
	ldr r2, [r6]
	adds r1, r2, #0
	adds r1, #0xc0
	ldr r0, _080B0088 @ =0x00000C5F
	cmp r1, r0
	bhi _080B00C2
	ldr r5, [r6, #4]
	ldr r0, _080B008C @ =0x000003BF
	cmp r5, r0
	bgt _080B0098
	adds r0, r2, #0
	movs r1, #0xc
	bl __divsi3
	adds r4, r0, #0
	ldr r0, _080B0090 @ =0x000001FF
	ands r4, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl __divsi3
	movs r2, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xe
	adds r1, r4, #0
	ldr r3, _080B0094 @ =0x08A9D4AC
	bl PutSpriteExt
	b _080B00C2
	.align 2, 0
_080B0084: .4byte 0x020007E0
_080B0088: .4byte 0x00000C5F
_080B008C: .4byte 0x000003BF
_080B0090: .4byte 0x000001FF
_080B0094: .4byte 0x08A9D4AC
_080B0098:
	adds r0, r2, #0
	movs r1, #0xc
	bl __divsi3
	adds r4, r0, #0
	ldr r0, _080B0118 @ =0x000001FF
	ands r4, r0
	adds r0, r5, #0
	movs r1, #0xc
	bl __divsi3
	movs r2, #0xff
	ands r2, r0
	movs r0, #0xc0
	lsls r0, r0, #6
	str r0, [sp]
	movs r0, #0xe
	adds r1, r4, #0
	ldr r3, _080B011C @ =0x08A9D4A4
	bl PutSpriteExt
_080B00C2:
	movs r2, #8
	ldrsh r1, [r6, r2]
	ldr r0, [r6]
	adds r0, r0, r1
	str r0, [r6]
	movs r0, #0xa
	ldrsh r1, [r6, r0]
	ldr r0, [r6, #4]
	adds r0, r0, r1
	str r0, [r6, #4]
	movs r0, #3
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	bne _080B00F4
	movs r0, #0xc
	ldrsb r0, [r6, r0]
	ldrh r2, [r6, #8]
	adds r0, r0, r2
	strh r0, [r6, #8]
	movs r0, #0xd
	ldrsb r0, [r6, r0]
	ldrh r1, [r6, #0xa]
	adds r0, r0, r1
	strh r0, [r6, #0xa]
_080B00F4:
	ldr r0, [r6]
	movs r2, #0xb4
	lsls r2, r2, #3
	adds r0, r0, r2
	ldr r1, _080B0120 @ =0x0000167F
	cmp r0, r1
	bhi _080B0110
	ldr r1, [r6, #4]
	ldr r0, _080B0124 @ =0xFFFFFC40
	cmp r1, r0
	blt _080B0110
	ldr r0, _080B0128 @ =0x00000B3F
	cmp r1, r0
	ble _080B012C
_080B0110:
	movs r0, #0
	strb r0, [r6, #0xe]
	b _080B0130
	.align 2, 0
_080B0118: .4byte 0x000001FF
_080B011C: .4byte 0x08A9D4A4
_080B0120: .4byte 0x0000167F
_080B0124: .4byte 0xFFFFFC40
_080B0128: .4byte 0x00000B3F
_080B012C:
	movs r0, #1
	add r8, r0
_080B0130:
	subs r7, #1
	adds r6, #0x10
	cmp r7, #0
	blt _080B013A
	b _080B003C
_080B013A:
	ldr r0, _080B01D8 @ =0x020007E0
	mov r1, r8
	cmp r1, #0x12
	bgt _080B01CA
	adds r6, r0, #0
	movs r5, #0
	movs r7, #0x13
_080B0148:
	movs r0, #0xe
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _080B01C2
	bl AdvanceGetLCGRNValue
	movs r1, #0xb
	bl sub_80D637C
	cmp r0, #0
	bne _080B01C2
	bl AdvanceGetLCGRNValue
	movs r1, #0x11
	bl sub_80D637C
	adds r4, r0, #0
	bl AdvanceGetLCGRNValue
	movs r1, #0x1f
	bl sub_80D637C
	subs r4, #8
	lsls r1, r4, #4
	subs r1, r1, r4
	lsls r1, r1, #1
	adds r1, r1, r0
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	str r0, [r6]
	movs r0, #0xf0
	lsls r0, r0, #3
	str r0, [r6, #4]
	bl AdvanceGetLCGRNValue
	movs r1, #7
	bl sub_80D637C
	adds r0, #6
	strh r0, [r6, #8]
	bl AdvanceGetLCGRNValue
	movs r1, #0x19
	bl sub_80D637C
	movs r2, #0x18
	rsbs r2, r2, #0
	adds r1, r2, #0
	subs r1, r1, r0
	strh r1, [r6, #0xa]
	bl AdvanceGetLCGRNValue
	movs r1, #3
	bl sub_80D637C
	adds r0, #1
	strb r0, [r6, #0xc]
	strb r5, [r6, #0xd]
	movs r0, #1
	strb r0, [r6, #0xe]
_080B01C2:
	subs r7, #1
	adds r6, #0x10
	cmp r7, #0
	bge _080B0148
_080B01CA:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B01D8: .4byte 0x020007E0

