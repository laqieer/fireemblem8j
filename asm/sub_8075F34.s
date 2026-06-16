	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set DisableEfxHpBarColorChange, 0x080553AC + 1
	.set DisableEfxStatusUnits, 0x0805583C + 1
	.set DisableEfxWeaponIcon, 0x08055BC0 + 1
	.set EfxUpdatePartsofScroll, 0x080769D4 + 1
	.set EkrGauge_Setup44, 0x08051EF4 + 1
	.set RegisterDataMove, 0x08001F64 + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_805B80C, 0x0805B80C + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_80769BC, 0x080769BC + 1
	.set sub_8076AF8, 0x08076AF8 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8075F34, "ax", %progbits
@ EkrLvup_InitScreen @ JP 0x08075F34 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EkrLvup_InitScreen
	.thumb_func
EkrLvup_InitScreen:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	ldr r7, _08075FE4 @ =0x020200E0
	movs r4, #0
	str r4, [sp]
	ldr r5, _08075FE8 @ =0x020234A8
	ldr r0, _08075FEC @ =0x01000200
	mov r8, r0
	mov r0, sp
	adds r1, r5, #0
	mov r2, r8
	bl sub_80D636C
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r6, _08075FF0 @ =0x02023CA8
	adds r1, r6, #0
	mov r2, r8
	bl sub_80D636C
	ldr r1, _08075FF4 @ =0x06006800
	movs r4, #0x80
	lsls r4, r4, #4
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08075FF8 @ =0x06007000
	adds r0, r5, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08075FFC @ =0x06005000
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08076000 @ =0x06005800
	adds r0, r6, #0
	adds r2, r4, #0
	bl RegisterDataMove
	ldr r1, _08076004 @ =0x0203E118
	ldrh r4, [r1]
	strh r4, [r7]
	movs r0, #3
	strh r0, [r7, #2]
	adds r0, #0xfd
	strh r0, [r7, #4]
	ldrh r3, [r1, #2]
	strh r3, [r7, #6]
	movs r0, #4
	strh r0, [r7, #8]
	movs r0, #0xa0
	lsls r0, r0, #1
	strh r0, [r7, #0xa]
	ldr r0, _08076008 @ =0x0203E11C
	ldrh r1, [r0]
	strh r1, [r7, #0xc]
	movs r0, #1
	rsbs r0, r0, #0
	adds r2, r0, #0
	ldr r0, _0807600C @ =0x0000FFFF
	strh r0, [r7, #0xe]
	ldr r0, _08076010 @ =0x06010000
	str r0, [r7, #0x1c]
	ldr r0, _08076014 @ =0x020145C8
	str r0, [r7, #0x20]
	ldr r0, _08076018 @ =0x0203E0FE
	ldrh r0, [r0]
	strh r0, [r7, #0x10]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #2
	bne _08076026
	ldr r0, _0807601C @ =0x02017744
	ldr r0, [r0]
	cmp r0, #0
	bne _08076020
	adds r0, r3, #0
	orrs r0, r2
	strh r0, [r7, #6]
	b _08076026
	.align 2, 0
_08075FE4: .4byte 0x020200E0
_08075FE8: .4byte 0x020234A8
_08075FEC: .4byte 0x01000200
_08075FF0: .4byte 0x02023CA8
_08075FF4: .4byte 0x06006800
_08075FF8: .4byte 0x06007000
_08075FFC: .4byte 0x06005000
_08076000: .4byte 0x06005800
_08076004: .4byte 0x0203E118
_08076008: .4byte 0x0203E11C
_0807600C: .4byte 0x0000FFFF
_08076010: .4byte 0x06010000
_08076014: .4byte 0x020145C8
_08076018: .4byte 0x0203E0FE
_0807601C: .4byte 0x02017744
_08076020:
	adds r0, r4, #0
	orrs r0, r2
	strh r0, [r7]
_08076026:
	bl sub_805BDCC
	cmp r0, #0
	bne _0807604E
	adds r0, r7, #0
	bl sub_805B80C
	ldr r3, [r7, #0x14]
	ldr r0, [r3, #0x4c]
	ldr r2, _08076158 @ =0x0000F3FF
	ands r0, r2
	movs r1, #0xc0
	lsls r1, r1, #4
	orrs r0, r1
	str r0, [r3, #0x4c]
	ldr r3, [r7, #0x18]
	ldr r0, [r3, #0x4c]
	ands r0, r2
	orrs r0, r1
	str r0, [r3, #0x4c]
_0807604E:
	mov r1, sb
	ldr r3, [r1, #0x5c]
	ldrh r2, [r3, #8]
	ldr r1, _08076158 @ =0x0000F3FF
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3, #8]
	mov r4, sb
	ldr r3, [r4, #0x5c]
	ldrh r0, [r3, #8]
	movs r4, #0xc0
	lsls r4, r4, #4
	adds r2, r4, #0
	orrs r0, r2
	strh r0, [r3, #8]
	mov r0, sb
	ldr r3, [r0, #0x60]
	ldrh r0, [r3, #8]
	ands r1, r0
	strh r1, [r3, #8]
	mov r4, sb
	ldr r1, [r4, #0x60]
	ldrh r0, [r1, #8]
	orrs r2, r0
	strh r2, [r1, #8]
	ldr r4, _0807615C @ =0x03003020
	ldrb r2, [r4, #0x14]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0x14]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0xc]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0xc]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldr r0, _08076160 @ =0x02020134
	movs r1, #0x90
	strh r1, [r0]
	ldr r0, _08076164 @ =0x02020136
	strh r1, [r0]
	movs r0, #2
	movs r1, #0
	movs r2, #8
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #8
	bl BG_SetPosition
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xa0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r0, #1
	movs r1, #1
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #1
	bl SetBackgroundScreenSize
	bl sub_80769BC
	ldr r1, _08076168 @ =0x020200D8
	str r0, [r1]
	bl sub_8076AF8
	ldr r1, _0807616C @ =0x020200DC
	str r0, [r1]
	bl EfxUpdatePartsofScroll
	movs r0, #2
	bl EkrGauge_Setup44
	mov r1, sb
	ldr r0, [r1, #0x5c]
	bl DisableEfxStatusUnits
	mov r1, sb
	ldr r0, [r1, #0x60]
	bl DisableEfxStatusUnits
	bl DisableEfxWeaponIcon
	bl DisableEfxHpBarColorChange
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	bl SetDefaultColorEffects
	mov r0, sb
	bl sub_8002DE4
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08076158: .4byte 0x0000F3FF
_0807615C: .4byte 0x03003020
_08076160: .4byte 0x02020134
_08076164: .4byte 0x02020136
_08076168: .4byte 0x020200D8
_0807616C: .4byte 0x020200DC

