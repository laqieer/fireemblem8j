	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DrawIcon, 0x08003608 + 1
	.set DrawUiFrame, 0x0804EF40 + 1
	.set GetItemIconId, 0x080174A8 + 1
	.set PutText, 0x08003DA0 + 1
	.set ReadLastGameSaveId, 0x080A97E4 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003E0C, 0x08003E0C + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FE4, 0x08009FE4 + 1
	.set sub_801729C, 0x0801729C + 1
	.set sub_80A9A28, 0x080A9A28 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.set sub_80B56D8, 0x080B56D8 + 1
	.set sub_80B5C24, 0x080B5C24 + 1
	.section .text.sub_80B5FDC, "ax", %progbits
@ sub_80B5FDC @ JP 0x080B5FDC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B5FDC
	.thumb_func
sub_80B5FDC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x34
	adds r4, r0, #0
	adds r6, r4, #0
	adds r6, #0x29
	ldrb r0, [r6]
	ldr r1, _080B611C @ =0x08A9E500
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, _080B6120 @ =0x08A9E4F8
	ldr r1, [r0]
	lsls r0, r2, #2
	adds r0, r0, r2
	lsls r0, r0, #2
	str r0, [sp, #0x30]
	adds r1, r1, r0
	ldrb r1, [r1, #2]
	str r1, [sp, #0x2c]
	ldr r0, _080B6124 @ =0x08A9E508
	ldr r0, [r0]
	adds r5, r0, #0
	adds r5, #0x70
	ldr r2, _080B6128 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080B612C @ =0x02022CA8
	mov sl, r1
	mov r0, sl
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B6130 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	bl sub_80B56D8
	movs r0, #3
	bl BG_EnableSyncByMask
	adds r0, r4, #0
	bl sub_80B5C24
	bl ReadLastGameSaveId
	bl sub_80A9A28
	movs r0, #0
	str r0, [r4, #0x30]
	bl sub_80B1524
	ldrb r1, [r6]
	lsls r1, r1, #4
	movs r2, #0x2c
	ldrsh r0, [r4, r2]
	subs r0, #0x38
	subs r1, r1, r0
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x28
	movs r2, #0x13
	bl sub_80B1FBC
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r5, #0
	movs r1, #0
	movs r2, #0
	bl sub_8003D98
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D84
	ldr r0, [sp, #0x2c]
	bl sub_801729C
	adds r7, r0, #0
	ldr r0, _080B6134 @ =0x00000823
	add r1, sp, #0xc
	bl sub_8009FE4
	adds r6, r0, #0
	adds r0, r7, #0
	bl sub_8003E0C
	adds r4, r0, #0
	adds r0, r6, #0
	bl sub_8003E0C
	adds r4, r4, r0
	adds r0, r4, #7
	cmp r0, #0
	bge _080B60B8
	adds r0, #7
_080B60B8:
	asrs r0, r0, #3
	adds r0, #4
	mov sb, r0
	lsrs r0, r0, #0x1f
	add r0, sb
	asrs r0, r0, #1
	movs r1, #0xf
	subs r1, r1, r0
	mov r8, r1
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_8003F28
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8003F28
	mov r0, r8
	lsls r4, r0, #1
	ldr r1, _080B6138 @ =0x00000286
	add r1, sl
	adds r1, r4, r1
	adds r0, r5, #0
	bl PutText
	ldr r0, _080B613C @ =0x00000282
	add r0, sl
	adds r4, r4, r0
	ldr r0, [sp, #0x2c]
	bl GetItemIconId
	adds r1, r0, #0
	movs r2, #0x80
	lsls r2, r2, #7
	adds r0, r4, #0
	bl DrawIcon
	ldr r1, _080B6120 @ =0x08A9E4F8
	ldr r0, [r1]
	ldr r2, [sp, #0x30]
	adds r0, r0, r2
	ldrb r0, [r0, #1]
	cmp r0, #0
	blt _080B616A
	cmp r0, #1
	ble _080B6140
	cmp r0, #2
	beq _080B6158
	b _080B616A
	.align 2, 0
_080B611C: .4byte 0x08A9E500
_080B6120: .4byte 0x08A9E4F8
_080B6124: .4byte 0x08A9E508
_080B6128: .4byte 0x03003020
_080B612C: .4byte 0x02022CA8
_080B6130: .4byte 0x020234A8
_080B6134: .4byte 0x00000823
_080B6138: .4byte 0x00000286
_080B613C: .4byte 0x00000282
_080B6140:
	ldr r0, _080B6154 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B616A
	movs r0, #0x5a
	bl m4aSongNumStart
	b _080B616A
	.align 2, 0
_080B6154: .4byte 0x0202BCEC
_080B6158:
	ldr r0, _080B61F8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080B616A
	movs r0, #0xb9
	bl m4aSongNumStart
_080B616A:
	ldr r0, _080B61FC @ =0x020234A8
	movs r1, #3
	str r1, [sp]
	movs r1, #0
	str r1, [sp, #4]
	movs r1, #1
	str r1, [sp, #8]
	mov r1, r8
	movs r2, #0xa
	mov r3, sb
	bl DrawUiFrame
	ldr r0, _080B6200 @ =0x03003020
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2]
	mov r2, r8
	lsls r0, r2, #3
	mov r1, ip
	adds r1, #0x2d
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x50
	strb r0, [r1]
	mov r0, r8
	add r0, sb
	lsls r0, r0, #3
	subs r1, #5
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x68
	strb r0, [r1]
	movs r0, #3
	bl BG_EnableSyncByMask
	ldr r2, _080B6204 @ =0x0000FFFC
	movs r0, #0
	movs r1, #0
	bl BG_SetPosition
	add sp, #0x34
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B61F8: .4byte 0x0202BCEC
_080B61FC: .4byte 0x020234A8
_080B6200: .4byte 0x03003020
_080B6204: .4byte 0x0000FFFC

