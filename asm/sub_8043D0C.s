	.syntax unified
	.set AreAllLinkArenaTeamsSelected, 0x08043CDC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set IsKeyInputSequenceComplete, 0x080431EC + 1
	.set MoveSioHold, 0x08042FC0 + 1
	.set Proc_End, 0x08002CBC + 1
	.set Proc_Goto, 0x08002E74 + 1
	.set SioStrCpy, 0x08042D4C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8014C7C, 0x08014C7C + 1
	.set sub_8042F80, 0x08042F80 + 1
	.set sub_8043190, 0x08043190 + 1
	.set sub_8043644, 0x08043644 + 1
	.set sub_804D9FC, 0x0804D9FC + 1
	.set sub_804DFE4, 0x0804DFE4 + 1
	.set sub_804F528, 0x0804F528 + 1
	.section .text.sub_8043D0C, "ax", %progbits
@ sub_8043D0C @ JP 0x08043D0C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8043D0C
	.thumb_func
sub_8043D0C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0xc
	adds r7, r0, #0
	ldr r0, [r7, #0x40]
	mov sb, r0
	ldr r1, [r7, #0x2c]
	str r1, [sp, #4]
	ldr r0, _08043D50 @ =0x085D32E8
	bl IsKeyInputSequenceComplete
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08043D58
	ldr r1, _08043D54 @ =0x0203DB78
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043D58
	adds r0, r7, #0
	movs r1, #8
	bl Proc_Goto
	b _080441F0
	.align 2, 0
_08043D50: .4byte 0x085D32E8
_08043D54: .4byte 0x0203DB78
_08043D58:
	ldr r1, [sp, #4]
	adds r1, #0x44
	movs r0, #0
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x48
	ldrb r1, [r2]
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	lsls r0, r0, #4
	adds r0, #0x28
	ldr r3, [sp, #4]
	str r0, [r3, #0x48]
	adds r0, r7, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsb r1, [r0, r1]
	mov sl, r2
	str r0, [sp, #8]
	cmp r1, #0
	ble _08043DB6
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r1, [sp, #8]
	ldrb r0, [r1]
	subs r0, #1
	strb r0, [r1]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08043DAA
	movs r1, #4
	bl MoveSioHold
_08043DAA:
	movs r0, #4
	bl sub_804D9FC
	mov r2, sl
	ldrb r0, [r2]
	b _08043DF0
_08043DB6:
	cmp r1, #0
	bge _08043E12
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r3, [sp, #8]
	ldrb r0, [r3]
	adds r0, #1
	strb r0, [r3]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08043DE4
	movs r1, #4
	rsbs r1, r1, #0
	bl MoveSioHold
_08043DE4:
	movs r0, #4
	rsbs r0, r0, #0
	bl sub_804D9FC
	mov r1, sl
	ldrb r0, [r1]
_08043DF0:
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl sub_804F528
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804DFE4
	b _080441F0
_08043E12:
	mov r2, sl
	ldrb r0, [r2]
	ldr r1, [r7, #0x40]
	subs r1, r1, r0
	lsls r1, r1, #4
	adds r1, #0x28
	movs r0, #0x50
	bl sub_804F528
	ldr r0, _08043E50 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	bne _08043E34
	b _08044046
_08043E34:
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	subs r0, #1
	adds r4, r1, #0
	cmp r0, #7
	bls _08043E44
	b _08044046
_08043E44:
	lsls r0, r0, #2
	ldr r1, _08043E54 @ =_08043E58
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08043E50: .4byte 0x085775CC
_08043E54: .4byte _08043E58
_08043E58: @ jump table
	.4byte _08043E78 @ case 0
	.4byte _08043EA8 @ case 1
	.4byte _08043ED0 @ case 2
	.4byte _08043EFC @ case 3
	.4byte _08043F60 @ case 4
	.4byte _08043F6E @ case 5
	.4byte _08044046 @ case 6
	.4byte _08043FBC @ case 7
_08043E78:
	ldr r1, _08043EA0 @ =0x0203DB78
	mov r3, sb
	lsls r0, r3, #2
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043E90
	b _08043FB4
_08043E90:
	movs r0, #2
	bl sub_8043190
	ldr r1, _08043EA4 @ =0x0203DA20
	ldr r0, [r7, #0x40]
	strb r0, [r1, #3]
	b _08043EC0
	.align 2, 0
_08043EA0: .4byte 0x0203DB78
_08043EA4: .4byte 0x0203DA20
_08043EA8:
	movs r0, #2
	bl sub_8043190
	ldr r2, _08043EC8 @ =0x0203DA20
	ldr r1, _08043ECC @ =0x0203DB78
	mov r3, sb
	lsls r0, r3, #2
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r0, [r0, #0xf]
	strb r0, [r2, #3]
_08043EC0:
	adds r0, r7, #0
	bl sub_8002DE4
	b _080441F0
	.align 2, 0
_08043EC8: .4byte 0x0203DA20
_08043ECC: .4byte 0x0203DB78
_08043ED0:
	ldr r1, _08043EF8 @ =0x0203DB78
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043FB4
	movs r0, #2
	bl sub_8043190
	adds r0, r7, #0
	movs r1, #4
	bl Proc_Goto
	b _080441F0
	.align 2, 0
_08043EF8: .4byte 0x0203DB78
_08043EFC:
	ldr r0, [r7, #0x38]
	cmp r0, #1
	bgt _08043F04
	b _08044046
_08043F04:
	movs r0, #2
	bl sub_8043190
	adds r0, r7, #0
	adds r0, #0x53
	mov r3, sb
	strb r3, [r0]
	ldrb r2, [r0]
	mov r1, sl
	ldrb r0, [r1]
	subs r2, r2, r0
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl sub_8042F80
	str r0, [r7, #0x30]
	mov r1, sb
	adds r1, #1
	ldr r0, [r7, #0x38]
	cmp r1, r0
	bge _08043F48
	ldr r0, _08043F44 @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x80
	b _08043F50
	.align 2, 0
_08043F44: .4byte 0x085775CC
_08043F48:
	ldr r0, _08043F5C @ =0x085775CC
	ldr r2, [r0]
	ldrh r1, [r2, #6]
	movs r0, #0x40
_08043F50:
	orrs r0, r1
	strh r0, [r2, #6]
	movs r0, #5
	strb r0, [r4]
	b _08044046
	.align 2, 0
_08043F5C: .4byte 0x085775CC
_08043F60:
	movs r0, #2
	bl sub_8043190
	adds r0, r7, #0
	bl sub_8043644
	b _08044046
_08043F6E:
	ldr r1, _08043FB0 @ =0x0203DB78
	mov r2, sb
	lsls r0, r2, #2
	add r0, sb
	lsls r0, r0, #2
	adds r0, r0, r1
	ldrb r1, [r0, #0xf]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	bne _08043FB4
	movs r0, #2
	bl sub_8043190
	mov r3, sl
	ldrb r2, [r3]
	mov r0, sb
	subs r2, r0, r2
	lsls r2, r2, #4
	adds r2, #0x28
	movs r0, #0x27
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0x50
	movs r3, #0x88
	bl sub_8042F80
	str r0, [r7, #0x30]
	adds r0, r7, #0
	movs r1, #7
	bl Proc_Goto
	b _08044046
	.align 2, 0
_08043FB0: .4byte 0x0203DB78
_08043FB4:
	movs r0, #0
	bl sub_8043190
	b _08044046
_08043FBC:
	movs r0, #2
	bl sub_8043190
	mov r1, sb
	lsls r4, r1, #2
	add r4, sb
	lsls r4, r4, #2
	ldr r0, _08044070 @ =0x0203DB78
	adds r4, r4, r0
	movs r2, #0x53
	adds r2, r2, r7
	mov r8, r2
	ldrb r0, [r2]
	lsls r1, r0, #4
	subs r1, r1, r0
	ldr r6, _08044074 @ =0x0203DD4C
	adds r1, r1, r6
	adds r0, r4, #0
	bl SioStrCpy
	ldr r5, _08044078 @ =0x0203DA20
	adds r0, r5, #6
	mov r3, r8
	ldrb r3, [r3]
	adds r0, r0, r3
	ldrb r1, [r4, #0xf]
	strb r1, [r0]
	mov r1, r8
	ldrb r0, [r1]
	lsls r0, r0, #3
	adds r5, #0x64
	adds r0, r0, r5
	bl sub_8003CF8
	mov r2, r8
	ldrb r1, [r2]
	lsls r0, r1, #3
	adds r0, r0, r5
	lsls r2, r1, #1
	adds r2, r2, r1
	adds r2, #5
	lsls r3, r1, #4
	subs r3, r3, r1
	adds r3, r3, r6
	movs r1, #0xa
	str r1, [sp]
	movs r1, #1
	bl sub_8014C7C
	bl AreAllLinkArenaTeamsSelected
	adds r1, r7, #0
	adds r1, #0x5c
	strb r0, [r1]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804403A
	ldr r3, [sp, #4]
	ldr r0, [r3, #0x40]
	cmp r0, #0
	bne _0804403A
	movs r0, #8
	str r0, [r3, #0x40]
_0804403A:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_08044046:
	ldr r0, _0804407C @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0804409A
	movs r0, #1
	bl sub_8043190
	adds r1, r7, #0
	adds r1, #0x52
	ldrb r0, [r1]
	cmp r0, #5
	bne _08044080
	movs r0, #4
	strb r0, [r1]
	ldr r0, [r7, #0x30]
	bl Proc_End
	b _080441F0
	.align 2, 0
_08044070: .4byte 0x0203DB78
_08044074: .4byte 0x0203DD4C
_08044078: .4byte 0x0203DA20
_0804407C: .4byte 0x085775CC
_08044080:
	cmp r0, #8
	beq _0804408E
	adds r0, r7, #0
	movs r1, #2
	bl Proc_Goto
	b _0804409A
_0804408E:
	movs r0, #0
	str r0, [r7, #0x44]
	adds r0, r7, #0
	movs r1, #6
	bl Proc_Goto
_0804409A:
	ldr r0, _08044144 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _080440D6
	adds r0, r7, #0
	adds r0, #0x5c
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _080440D6
	ldr r0, _08044148 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080440C8
	movs r0, #0x6a
	bl m4aSongNumStart
_080440C8:
	ldr r1, _0804414C @ =0x0203DA20
	movs r0, #0
	strb r0, [r1, #3]
	adds r0, r7, #0
	movs r1, #9
	bl Proc_Goto
_080440D6:
	ldr r0, _08044144 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x40
	ands r0, r1
	cmp r0, #0
	beq _0804415A
	mov r1, sl
	ldrb r0, [r1]
	cmp r0, #0
	beq _08044150
	adds r1, r0, #0
	ldr r0, [r7, #0x40]
	subs r0, r0, r1
	cmp r0, #1
	bgt _08044150
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	subs r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _0804410C
	movs r1, #4
	bl MoveSioHold
_0804410C:
	movs r0, #4
	bl sub_804D9FC
	mov r2, sl
	ldrb r0, [r2]
	subs r0, #1
	strb r0, [r2]
	movs r0, #3
	ldr r3, [sp, #8]
	strb r0, [r3]
	ldr r0, [r7, #0x40]
	subs r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804DFE4
	b _0804415A
	.align 2, 0
_08044144: .4byte 0x085775CC
_08044148: .4byte 0x0202BCEC
_0804414C: .4byte 0x0203DA20
_08044150:
	ldr r0, [r7, #0x40]
	cmp r0, #0
	ble _0804415A
	subs r0, #1
	str r0, [r7, #0x40]
_0804415A:
	ldr r0, _080441D4 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #6]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080441E4
	ldr r1, [r7, #0x38]
	cmp r1, #6
	ble _080441D8
	mov r0, sl
	ldrb r2, [r0]
	adds r0, r2, #6
	cmp r0, r1
	bge _080441D8
	ldr r0, [r7, #0x40]
	subs r0, r0, r2
	cmp r0, #3
	ble _080441D8
	adds r4, r7, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r0, #4
	strh r0, [r4]
	ldr r0, [r7, #0x30]
	cmp r0, #0
	beq _08044198
	movs r1, #4
	rsbs r1, r1, #0
	bl MoveSioHold
_08044198:
	movs r0, #4
	rsbs r0, r0, #0
	bl sub_804D9FC
	mov r1, sl
	ldrb r0, [r1]
	adds r0, #1
	strb r0, [r1]
	movs r0, #0xfd
	ldr r2, [sp, #8]
	strb r0, [r2]
	ldr r0, [r7, #0x40]
	adds r0, #1
	str r0, [r7, #0x40]
	ldrh r2, [r4]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r0, [r7, #0x38]
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldrh r1, [r4]
	adds r1, #0x28
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl sub_804DFE4
	b _080441E4
	.align 2, 0
_080441D4: .4byte 0x085775CC
_080441D8:
	subs r0, r1, #1
	ldr r1, [r7, #0x40]
	cmp r1, r0
	bge _080441E4
	adds r0, r1, #1
	str r0, [r7, #0x40]
_080441E4:
	ldr r0, [r7, #0x40]
	cmp sb, r0
	beq _080441F0
	movs r0, #3
	bl sub_8043190
_080441F0:
	add sp, #0xc
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

