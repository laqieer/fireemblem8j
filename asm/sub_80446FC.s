	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CheckInLinkArena, 0x08042E1C + 1
	.set GetTacticianTextConf, 0x080444E4 + 1
	.set InitText, 0x08003C8C + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set Tactician_MapNameToConfIndices, 0x080444F4 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8031430, 0x08031430 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_80445A8, 0x080445A8 + 1
	.set sub_8044694, 0x08044694 + 1
	.set sub_80446E4, 0x080446E4 + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2A8, 0x0804D2A8 + 1
	.set sub_804DB28, 0x0804DB28 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.section .text.sub_80446FC, "ax", %progbits
@ Tactician_InitScreen @ JP 0x080446FC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global Tactician_InitScreen
	.thumb_func
Tactician_InitScreen:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	adds r6, r0, #0
	bl sub_8042FC8
	bl sub_804D0DC
	movs r0, #0
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8088FA4
	ldr r0, _08044770 @ =0x085D6004
	ldr r1, _08044774 @ =0x06014800
	bl sub_8013008
	ldr r0, _08044778 @ =0x085D7EE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _0804477C @ =0x085D8108
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08044780 @ =0x02023EA8
	ldr r1, _08044784 @ =0x085D8430
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r0, _08044788 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	bl CheckInLinkArena
	lsls r0, r0, #0x18
	asrs r1, r0, #0x18
	cmp r1, #0
	beq _0804478C
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #7
	b _08044796
	.align 2, 0
_08044770: .4byte 0x085D6004
_08044774: .4byte 0x06014800
_08044778: .4byte 0x085D7EE8
_0804477C: .4byte 0x085D8108
_08044780: .4byte 0x02023EA8
_08044784: .4byte 0x085D8430
_08044788: .4byte 0x0203DB60
_0804478C:
	ldr r0, _080448F8 @ =0x0203DA20
	strb r1, [r0]
	adds r1, r6, #0
	adds r1, #0x3c
	movs r0, #5
_08044796:
	strb r0, [r1]
	movs r4, #0
	adds r5, r1, #0
	ldrb r0, [r1]
	lsls r0, r0, #1
	adds r0, #1
	movs r2, #0x38
	adds r2, r2, r6
	mov r8, r2
	ldr r3, _080448FC @ =0x0203DD18
	mov ip, r3
	adds r7, r6, #0
	adds r7, #0x30
	movs r2, #0x39
	adds r2, r2, r6
	mov sb, r2
	movs r3, #0x31
	adds r3, r3, r6
	mov sl, r3
	adds r2, r6, #0
	adds r2, #0x32
	str r2, [sp, #0x14]
	cmp r4, r0
	bge _080447DA
	adds r2, #0xb
	movs r3, #0
_080447CA:
	adds r0, r2, r4
	strb r3, [r0]
	adds r4, #1
	ldrb r0, [r5]
	lsls r0, r0, #1
	adds r0, #1
	cmp r4, r0
	blt _080447CA
_080447DA:
	movs r4, #0
	ldrb r3, [r1]
	cmp r4, r3
	bge _080447F4
	movs r2, #0
	adds r0, r6, #0
	adds r0, #0x4c
_080447E8:
	strh r2, [r0]
	adds r0, #2
	adds r4, #1
	ldrb r3, [r1]
	cmp r4, r3
	blt _080447E8
_080447F4:
	movs r0, #0
	mov r1, r8
	strb r0, [r1]
	mov r0, ip
	movs r1, #8
	bl InitText
	movs r0, #1
	strb r0, [r7]
	movs r4, #0
	movs r0, #6
	strh r0, [r6, #0x34]
	bl GetTacticianTextConf
	ldrh r1, [r0, #0x30]
	subs r1, #4
	ldrh r2, [r0, #0x32]
	adds r2, #1
	adds r0, r6, #0
	bl sub_804DB28
	str r0, [r6, #0x2c]
	mov r2, sb
	strb r4, [r2]
	ldr r5, _08044900 @ =0x0203DB10
	movs r4, #9
_08044828:
	adds r0, r5, #0
	movs r1, #0x1a
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08044828
	ldr r0, _08044904 @ =0x0203DAAC
	movs r1, #0xc
	bl InitText
	ldr r0, [r6, #0x2c]
	movs r2, #0xa0
	lsls r2, r2, #3
	movs r1, #3
	bl sub_804D23C
	bl sub_804D2A8
	ldr r1, _08044908 @ =0x0203DD20
	movs r0, #0
	strb r0, [r1]
	movs r0, #0
	mov r3, sl
	strb r0, [r3]
	adds r0, r6, #0
	bl sub_80445A8
	ldr r1, [sp, #0x14]
	ldrb r0, [r1]
	cmp r0, #0
	beq _080448E0
	movs r5, #0
	bl sub_8031430
	adds r2, r0, #0
	ldrb r0, [r2]
	adds r7, r6, #0
	adds r7, #0x33
	cmp r0, #0
	beq _080448B4
	adds r3, r6, #0
	adds r3, #0x3d
_08044880:
	movs r4, #1
_08044882:
	adds r1, r3, r5
	ldrb r0, [r2]
	strb r0, [r1]
	mov r1, sp
	adds r1, r1, r5
	adds r1, #4
	ldrb r0, [r2]
	strb r0, [r1]
	adds r2, #1
	adds r5, #1
	subs r4, #1
	cmp r4, #0
	bge _08044882
	mov r1, r8
	ldrb r0, [r1]
	adds r1, r0, #2
	ldrb r0, [r7]
	lsls r0, r0, #1
	cmp r1, r0
	bgt _080448AE
	mov r0, r8
	strb r1, [r0]
_080448AE:
	ldrb r0, [r2]
	cmp r0, #0
	bne _08044880
_080448B4:
	adds r0, r6, #0
	add r1, sp, #4
	bl Tactician_MapNameToConfIndices
	adds r0, r6, #0
	bl sub_8044694
	ldrb r0, [r7]
	lsls r0, r0, #1
	subs r0, #2
	mov r1, sp
	adds r1, r1, r0
	adds r1, #4
	movs r0, #0
	strb r0, [r1]
	add r0, sp, #4
	bl sub_80446E4
	ldr r2, [r6, #0x2c]
	lsls r1, r0, #3
	adds r1, r1, r0
	str r1, [r2, #0x40]
_080448E0:
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080448F8: .4byte 0x0203DA20
_080448FC: .4byte 0x0203DD18
_08044900: .4byte 0x0203DB10
_08044904: .4byte 0x0203DAAC
_08044908: .4byte 0x0203DD20

