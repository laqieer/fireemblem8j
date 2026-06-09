	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DrawAllLinkArenaTeamNames, 0x080434B0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set ResetUnitSprites, 0x0802662C + 1
	.set SetTextFont, 0x08003C68 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80265CC, 0x080265CC + 1
	.set sub_8026F38, 0x08026F38 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_80430E8, 0x080430E8 + 1
	.set sub_8043344, 0x08043344 + 1
	.set sub_8043744, 0x08043744 + 1
	.set sub_8043840, 0x08043840 + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2F8, 0x0804D2F8 + 1
	.set sub_804D88C, 0x0804D88C + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.section .text.sub_8043884, "ax", %progbits
@ sub_8043884 @ JP 0x08043884 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043884
	.thumb_func
sub_8043884:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r5, _08043A50 @ =0x085C7420
	bl sub_8042FC8
	bl sub_804D0DC
	movs r4, #0
	str r4, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	ldr r0, _08043A54 @ =0x085D6004
	ldr r1, _08043A58 @ =0x06014800
	bl sub_8013008
	ldr r0, _08043A5C @ =0x02023DBA
	ldr r1, _08043A60 @ =0x085D81E0
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r0, _08043A64 @ =0x085D7EE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl sub_8000D68
	ldr r0, _08043A68 @ =0x085D68B4
	ldr r1, _08043A6C @ =0x06016000
	bl sub_8013008
	ldr r0, _08043A70 @ =0x08A98798
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	ldr r1, _08043A74 @ =0x020228A8
	adds r0, r1, #0
	adds r0, #0x40
	strh r4, [r0]
	adds r1, #0x42
	movs r2, #2
_080438E8:
	ldrh r0, [r5, #8]
	strh r0, [r1]
	adds r5, #2
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bge _080438E8
	bl sub_8001EE4
	ldr r0, _08043A78 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	bl sub_80430E8
	bl sub_80265CC
	bl ResetUnitSprites
	bl sub_8026F38
	ldr r0, [r7, #0x3c]
	ldr r1, _08043A7C @ =0x0203DA20
	ldrb r1, [r1]
	bl sub_8043344
	str r0, [r7, #0x38]
	adds r6, r7, #0
	adds r6, #0x5c
	adds r5, r7, #0
	adds r5, #0x4a
	movs r1, #0
	add r0, sp, #8
_08043930:
	strb r1, [r0]
	subs r0, #1
	add r2, sp, #4
	cmp r0, r2
	bge _08043930
	ldr r0, [r7, #0x3c]
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #1
	strb r0, [r1]
	ldr r4, _08043A7C @ =0x0203DA20
	ldrb r0, [r4]
	adds r1, r7, #0
	bl sub_8043744
	str r0, [r7, #0x34]
	adds r0, r7, #0
	bl DrawAllLinkArenaTeamNames
	ldr r1, [r7, #0x34]
	adds r0, r7, #0
	add r2, sp, #4
	bl sub_804D88C
	str r0, [r7, #0x2c]
	movs r2, #0
	adds r4, #6
	movs r3, #0xff
_0804396A:
	adds r1, r2, r4
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	adds r2, #1
	cmp r2, #3
	ble _0804396A
	movs r4, #0
	strb r4, [r6]
	ldrh r2, [r5]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _08043A80 @ =0x03003020
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
	mov r0, ip
	adds r0, #0x2d
	strb r4, [r0]
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r2, #0xf0
	strb r2, [r0]
	adds r0, #4
	movs r1, #0x88
	strb r1, [r0]
	subs r0, #1
	strb r4, [r0]
	adds r0, #4
	strb r1, [r0]
	subs r0, #5
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x32
	movs r0, #0xa0
	strb r0, [r1]
	mov r5, ip
	adds r5, #0x34
	ldrb r0, [r5]
	movs r4, #1
	orrs r0, r4
	movs r1, #2
	orrs r0, r1
	movs r3, #4
	orrs r0, r3
	movs r2, #8
	orrs r0, r2
	movs r6, #0x10
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0x35
	add r0, ip
	mov r8, r0
	ldrb r0, [r0]
	orrs r0, r4
	movs r5, #3
	rsbs r5, r5, #0
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	mov r1, ip
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r4
	ands r0, r5
	orrs r0, r3
	orrs r0, r2
	orrs r0, r6
	strb r0, [r1]
	ldr r0, [r7, #0x2c]
	ldr r2, _08043A84 @ =0x080DED3A
	ldr r1, _08043A7C @ =0x0203DA20
	ldrb r1, [r1]
	adds r1, r1, r2
	ldrb r1, [r1]
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2F8
	adds r0, r7, #0
	bl sub_8043840
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	movs r1, #1
	bl sub_8043084
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0xc
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08043A50: .4byte 0x085C7420
_08043A54: .4byte 0x085D6004
_08043A58: .4byte 0x06014800
_08043A5C: .4byte 0x02023DBA
_08043A60: .4byte 0x085D81E0
_08043A64: .4byte 0x085D7EE8
_08043A68: .4byte 0x085D68B4
_08043A6C: .4byte 0x06016000
_08043A70: .4byte 0x08A98798
_08043A74: .4byte 0x020228A8
_08043A78: .4byte 0x0203DB60
_08043A7C: .4byte 0x0203DA20
_08043A80: .4byte 0x03003020
_08043A84: .4byte 0x080DED3A

