	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.set sub_80D65C0, 0x080D65C0 + 1
	.section .text.sub_80B2F94, "ax", %progbits
@ sub_80B2F94 @ JP 0x080B2F94 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B2F94
	.thumb_func
sub_80B2F94:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r5, r0, #0
	ldr r6, [r5, #0x2c]
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _080B2FC8
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #0
	strb r0, [r1]
	ldr r1, [r5, #0x58]
	adds r0, r5, #0
	bl sub_80D65C0
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080B2FBE
	b _080B318A
_080B2FBE:
	b _080B2FCA
_080B2FC0:
	adds r0, r5, #0
	bl sub_8002DE4
	b _080B3182
_080B2FC8:
	str r0, [r5, #0x58]
_080B2FCA:
	movs r0, #0x37
	adds r0, r0, r5
	mov sb, r0
_080B2FD0:
	ldrb r0, [r6]
	cmp r0, #4
	bne _080B2FD8
	adds r6, #0xc
_080B2FD8:
	ldrb r0, [r6]
	cmp r0, #5
	bne _080B302A
	adds r0, r5, #0
	adds r0, #0x3a
	movs r1, #0
	ldrsb r1, [r0, r1]
	cmp r1, #0
	beq _080B3022
	subs r0, #4
	ldrb r3, [r0]
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r2, r0, #0
	cmp r1, #0
	bne _080B2FFC
	ldrb r0, [r6, #0xa]
	b _080B3002
_080B2FFC:
	cmp r1, #0
	ble _080B3004
	subs r0, r3, #1
_080B3002:
	strb r0, [r2]
_080B3004:
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp r0, #0
	beq _080B3028
	adds r1, r6, #0
	subs r1, #0xc
	ldrb r0, [r1]
	cmp r0, #4
	beq _080B302A
_080B3016:
	adds r6, r1, #0
	subs r1, #0xc
	ldrb r0, [r1]
	cmp r0, #4
	bne _080B3016
	b _080B302A
_080B3022:
	adds r0, r5, #0
	adds r0, #0x36
	strb r1, [r0]
_080B3028:
	adds r6, #0xc
_080B302A:
	ldrb r0, [r6]
	cmp r0, #8
	bne _080B304E
	ldr r0, [r5, #0x58]
	cmp r0, #0
	beq _080B304C
	ldr r0, [r5, #0x54]
	adds r0, #1
	str r0, [r5, #0x54]
	adds r1, r5, #0
	adds r1, #0x39
	movs r0, #1
	strb r0, [r1]
	ldr r1, [r5, #0x58]
	adds r0, r5, #0
	bl sub_80D65C0
_080B304C:
	adds r6, #0xc
_080B304E:
	ldrb r0, [r6]
	cmp r0, #6
	bne _080B3056
	b _080B3182
_080B3056:
	subs r0, #9
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #1
	bls _080B2FC0
	adds r0, r5, #0
	adds r0, #0x38
	ldrb r1, [r0]
	mov r8, r0
	cmp r1, #0
	bne _080B3166
	ldrb r0, [r6]
	cmp r0, #1
	bgt _080B3086
	cmp r0, #0
	blt _080B3086
	ldr r0, [r5, #0x44]
	cmp r0, #0
	bne _080B3086
	mov r2, sb
	ldrb r1, [r2]
	movs r0, #1
	subs r0, r0, r1
	strb r0, [r2]
_080B3086:
	ldrb r0, [r6]
	cmp r0, #1
	beq _080B30C6
	cmp r0, #1
	bgt _080B3096
	cmp r0, #0
	beq _080B30A0
	b _080B3166
_080B3096:
	cmp r0, #2
	beq _080B30F0
	cmp r0, #3
	beq _080B3154
	b _080B3166
_080B30A0:
	ldr r0, [r6, #4]
	ldr r2, [r5, #0x40]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	mov r2, sb
	ldrb r3, [r2]
	ldr r2, [r5, #0x48]
	muls r2, r3, r2
	adds r1, r1, r2
	ldrh r2, [r6, #8]
	lsrs r2, r2, #2
	bl sub_80D636C
	b _080B30E6
_080B30C6:
	ldr r0, [r6, #4]
	ldr r2, [r5, #0x40]
	movs r1, #0xc0
	lsls r1, r1, #0x13
	adds r2, r2, r1
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, [r5, #0x44]
	adds r1, r1, r2
	mov r2, sb
	ldrb r3, [r2]
	ldr r2, [r5, #0x48]
	muls r2, r3, r2
	adds r1, r1, r2
	bl sub_8013008
_080B30E6:
	ldrh r1, [r6, #8]
	ldr r0, [r5, #0x44]
	adds r0, r0, r1
	str r0, [r5, #0x44]
	b _080B3166
_080B30F0:
	ldr r1, [r5, #0x48]
	movs r0, #0x80
	lsls r0, r0, #8
	adds r4, r5, #0
	adds r4, #0x37
	adds r7, r5, #0
	adds r7, #0x34
	cmp r1, r0
	bne _080B3116
	ldrb r0, [r7]
	mov r1, sb
	ldrb r2, [r1]
	lsls r2, r2, #0xf
	ldr r1, [r5, #0x3c]
	adds r1, r1, r2
	ldr r2, _080B3150 @ =0x0000FFFF
	ands r1, r2
	bl SetBackgroundTileDataOffset
_080B3116:
	ldrb r0, [r7]
	bl sub_8001BC0
	ldr r1, [r6, #4]
	adds r2, r5, #0
	adds r2, #0x35
	ldrb r2, [r2]
	lsls r2, r2, #0xc
	ldrb r4, [r4]
	ldr r3, [r5, #0x48]
	muls r4, r3, r4
	ldr r3, [r5, #0x40]
	adds r3, r3, r4
	lsls r3, r3, #0x11
	lsrs r3, r3, #0x16
	adds r2, r2, r3
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	bl j_TmApplyTsa
	movs r0, #0
	str r0, [r5, #0x44]
	movs r0, #1
	ldrb r7, [r7]
	lsls r0, r7
	bl BG_EnableSyncByMask
	b _080B3166
	.align 2, 0
_080B3150: .4byte 0x0000FFFF
_080B3154:
	ldr r0, [r6, #4]
	adds r1, r5, #0
	adds r1, #0x35
	ldrb r1, [r1]
	lsls r1, r1, #5
	ldrh r2, [r6, #8]
	lsls r2, r2, #5
	bl sub_8000D68
_080B3166:
	mov r2, r8
	ldrb r0, [r2]
	adds r0, #1
	movs r1, #0
	strb r0, [r2]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrb r2, [r6, #0xa]
	cmp r0, r2
	bls _080B3182
	adds r6, #0xc
	mov r0, r8
	strb r1, [r0]
	b _080B2FD0
_080B3182:
	str r6, [r5, #0x2c]
	ldr r0, [r5, #0x50]
	adds r0, #1
	str r0, [r5, #0x50]
_080B318A:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

