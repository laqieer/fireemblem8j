	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set GetClassData, 0x0801911C + 1
	.set InitText, 0x08003C8C + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetBanimTerrainPos, 0x0805BBE4 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set SetTalkFlag, 0x080069AC + 1
	.set SetTalkPrintDelay, 0x080069F4 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D84, 0x08003D84 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_800687C, 0x0800687C + 1
	.set sub_8006934, 0x08006934 + 1
	.set sub_8006980, 0x08006980 + 1
	.set sub_8006A14, 0x08006A14 + 1
	.set sub_800814C, 0x0800814C + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_805B7A4, 0x0805B7A4 + 1
	.set sub_805B80C, 0x0805B80C + 1
	.set sub_80B8C64, 0x080B8C64 + 1
	.section .text.sub_80B83A8, "ax", %progbits
@ sub_80B83A8 @ JP 0x080B83A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B83A8
	.thumb_func
sub_80B83A8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x3c
	mov sb, r0
	movs r0, #0
	str r0, [sp, #0x34]
	add r1, sp, #4
	ldr r0, _080B83DC @ =0x081F5900
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	ldm r0!, {r2, r3, r4}
	stm r1!, {r2, r3, r4}
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldr r0, [r0, #0x18]
	str r0, [r1, #0x38]
	movs r7, #4
	b _080B83E2
	.align 2, 0
_080B83DC: .4byte 0x081F5900
_080B83E0:
	adds r7, #1
_080B83E2:
	cmp r7, #7
	bgt _080B83FE
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xe]
	bl GetClassData
	adds r0, #0x2c
	adds r0, r0, r7
	ldrb r0, [r0]
	cmp r0, #0
	beq _080B83E0
	movs r3, #1
	str r3, [sp, #0x34]
_080B83FE:
	movs r0, #0
	bl sub_8001ACC
	movs r0, #0
	mov r4, sb
	strh r0, [r4, #0x2a]
	strh r0, [r4, #0x2c]
	mov r1, sb
	adds r1, #0x46
	movs r0, #0xfa
	strb r0, [r1]
	ldr r6, _080B85D4 @ =0x02022CA8
	adds r0, r6, #0
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B85D8 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080B85DC @ =0x02023CA8
	mov r8, r0
	movs r1, #0
	bl sub_80011D0
	ldr r4, _080B85E0 @ =0x03003020
	ldrb r1, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	bl SetDefaultColorEffects
	bl ResetTextFont
	bl ResetText
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r3, #2
	orrs r0, r3
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r3
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r3
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _080B85E4 @ =0x08AB1C58
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080B85E8 @ =0x08AB6768
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0xe0
	bl sub_8000D68
	ldr r0, _080B85EC @ =0x020244A8
	ldr r1, _080B85F0 @ =0x08AB62B4
	movs r2, #0xe0
	lsls r2, r2, #7
	bl j_TmApplyTsa
	ldr r4, _080B85F4 @ =0x08AB162C
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080B85F8 @ =0x085E0D94
	movs r1, #0xc0
	movs r2, #0x20
	bl sub_8000D68
	ldr r1, _080B85FC @ =0x08AB17A4
	movs r2, #0xc0
	lsls r2, r2, #7
	mov r0, r8
	bl j_TmApplyTsa
	movs r0, #0xf
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	movs r1, #0
	bl sub_80011D0
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xe]
	bl GetClassData
	ldrb r0, [r0, #0xb]
	mov r4, sb
	adds r4, #0x40
	strb r0, [r4]
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xe]
	bl GetClassData
	ldrb r0, [r0, #0xc]
	mov r1, sb
	adds r1, #0x41
	strb r0, [r1]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xe]
	bl GetClassData
	ldrb r0, [r0, #0xd]
	mov r1, sb
	adds r1, #0x42
	strb r0, [r1]
	mov r1, sb
	ldr r0, [r1, #0x34]
	ldrb r0, [r0, #0xe]
	bl GetClassData
	ldrb r0, [r0, #0xe]
	mov r1, sb
	adds r1, #0x43
	strb r0, [r1]
	mov r2, sb
	ldr r0, [r2, #0x34]
	ldrb r0, [r0, #0xe]
	bl GetClassData
	ldrb r1, [r0, #0xf]
	mov r0, sb
	adds r0, #0x44
	strb r1, [r0]
	mov r3, sb
	ldr r0, [r3, #0x34]
	ldrb r0, [r0, #0xe]
	bl GetClassData
	ldrb r0, [r0, #0x10]
	mov r1, sb
	adds r1, #0x45
	strb r0, [r1]
	movs r7, #0
	str r4, [sp, #0x38]
	movs r4, #0x4a
	adds r4, r4, r6
	mov sl, r4
	adds r6, #0x42
	mov r8, r6
	movs r6, #0
	movs r4, #0
_080B8598:
	ldr r0, _080B8600 @ =0x0201FB28
	adds r5, r4, r0
	adds r0, r5, #0
	movs r1, #3
	bl InitText
	adds r0, r5, #0
	bl sub_8003CF8
	adds r0, r5, #0
	movs r1, #3
	bl sub_8003D90
	adds r0, r5, #0
	movs r1, #0
	bl sub_8003D84
	ldr r0, [sp, #0x34]
	cmp r0, #0
	beq _080B8604
	add r0, sp, #0x1c
	adds r0, r0, r6
	ldr r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
	b _080B8618
	.align 2, 0
_080B85D4: .4byte 0x02022CA8
_080B85D8: .4byte 0x020234A8
_080B85DC: .4byte 0x02023CA8
_080B85E0: .4byte 0x03003020
_080B85E4: .4byte 0x08AB1C58
_080B85E8: .4byte 0x08AB6768
_080B85EC: .4byte 0x020244A8
_080B85F0: .4byte 0x08AB62B4
_080B85F4: .4byte 0x08AB162C
_080B85F8: .4byte 0x085E0D94
_080B85FC: .4byte 0x08AB17A4
_080B8600: .4byte 0x0201FB28
_080B8604:
	mov r0, sp
	adds r0, r0, r6
	adds r0, #4
	ldr r0, [r0]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r5, #0
	bl sub_8003F28
_080B8618:
	ldr r0, _080B877C @ =0x0201FB28
	adds r0, r4, r0
	mov r1, r8
	bl PutText
	ldr r1, [sp, #0x38]
	adds r0, r1, r7
	ldrb r2, [r0]
	mov r0, sl
	movs r1, #0
	bl PutNumber
	movs r2, #0x80
	add sl, r2
	add r8, r2
	adds r6, #4
	adds r4, #8
	adds r7, #1
	cmp r7, #5
	ble _080B8598
	movs r5, #0
	mov r0, sb
	bl sub_80B8C64
	mov r3, sb
	str r0, [r3, #0x3c]
	movs r0, #0x80
	lsls r0, r0, #1
	movs r1, #2
	movs r2, #0
	bl sub_8006710
	bl sub_800687C
	bl sub_800814C
	bl sub_8006980
	mov r4, sb
	ldr r0, [r4, #0x34]
	ldr r2, [r0, #4]
	movs r0, #2
	movs r1, #0xf
	bl sub_8006934
	movs r0, #0
	bl sub_8006A14
	movs r0, #1
	bl SetTalkFlag
	movs r0, #2
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkFlag
	movs r0, #8
	bl SetTalkFlag
	movs r0, #0x40
	bl SetTalkFlag
	movs r0, #4
	bl SetTalkPrintDelay
	ldr r0, _080B8780 @ =0x02000000
	ldr r3, [r4, #0x34]
	movs r1, #0xd
	ldrsb r1, [r3, r1]
	strh r1, [r0, #8]
	movs r1, #0x82
	lsls r1, r1, #1
	strh r1, [r0, #2]
	movs r1, #0x58
	strh r1, [r0, #4]
	ldrb r1, [r3, #0x10]
	strh r1, [r0, #6]
	movs r1, #6
	strh r1, [r0, #0xa]
	ldrb r1, [r3, #0xf]
	strb r1, [r0, #1]
	movs r4, #1
	strh r4, [r0, #0xc]
	movs r1, #0xc0
	lsls r1, r1, #1
	strh r1, [r0, #0xe]
	movs r1, #2
	strh r1, [r0, #0x10]
	ldr r1, _080B8784 @ =0x02000038
	str r1, [r0, #0x1c]
	ldr r1, _080B8788 @ =0x02002038
	str r1, [r0, #0x24]
	ldr r1, _080B878C @ =0x02007838
	str r1, [r0, #0x20]
	ldr r1, _080B8790 @ =0x020078D8
	str r1, [r0, #0x28]
	ldr r1, _080B8794 @ =0x0200A2D8
	str r1, [r0, #0x30]
	ldrb r2, [r3, #0x11]
	strh r2, [r1]
	ldrb r2, [r3, #0x12]
	strh r2, [r1, #2]
	ldrb r2, [r3, #0x13]
	strh r2, [r1, #4]
	ldrb r2, [r3, #0x14]
	strh r2, [r1, #6]
	ldrb r2, [r3, #0x15]
	strh r2, [r1, #8]
	movs r2, #0xa0
	lsls r2, r2, #2
	strh r2, [r1, #0xe]
	movs r3, #0xf
	strh r3, [r1, #0x10]
	subs r2, #0x80
	strh r2, [r1, #0xa]
	strh r3, [r1, #0xc]
	strh r4, [r1, #0x12]
	ldr r2, _080B8798 @ =0x020234A8
	str r2, [r1, #0x14]
	ldr r2, _080B879C @ =0x0200A300
	str r2, [r1, #0x18]
	ldr r2, _080B87A0 @ =0x0200C300
	str r2, [r1, #0x1c]
	ldr r2, _080B87A4 @ =0x0200CB00
	str r2, [r1, #0x20]
	ldr r2, _080B87A8 @ =sub_80B82EC
	str r2, [r1, #0x24]
	bl sub_805B7A4
	ldr r4, _080B87AC @ =0x0201DB00
	mov r0, sb
	ldr r1, [r0, #0x34]
	ldrb r0, [r1, #0x16]
	strh r0, [r4]
	movs r0, #0xa
	strh r0, [r4, #2]
	movs r0, #0xe0
	lsls r0, r0, #2
	strh r0, [r4, #4]
	ldrb r0, [r1, #0x17]
	strh r0, [r4, #6]
	movs r0, #0xb
	strh r0, [r4, #8]
	movs r0, #0xf0
	lsls r0, r0, #2
	strh r0, [r4, #0xa]
	strh r5, [r4, #0xc]
	ldr r0, _080B87B0 @ =0x0000FFFF
	strh r0, [r4, #0xe]
	ldr r0, _080B87B4 @ =0x06010000
	str r0, [r4, #0x1c]
	ldr r0, _080B87B8 @ =0x0201DB28
	str r0, [r4, #0x20]
	adds r0, r4, #0
	bl sub_805B80C
	movs r3, #0x98
	lsls r3, r3, #1
	movs r0, #0x68
	str r0, [sp]
	adds r0, r4, #0
	movs r1, #0xd0
	movs r2, #0x68
	bl SetBanimTerrainPos
	ldr r0, _080B87BC @ =ClassInfoDisplay_HBlankHandler
	bl SetPrimaryHBlankHandler
	add sp, #0x3c
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B877C: .4byte 0x0201FB28
_080B8780: .4byte 0x02000000
_080B8784: .4byte 0x02000038
_080B8788: .4byte 0x02002038
_080B878C: .4byte 0x02007838
_080B8790: .4byte 0x020078D8
_080B8794: .4byte 0x0200A2D8
_080B8798: .4byte 0x020234A8
_080B879C: .4byte 0x0200A300
_080B87A0: .4byte 0x0200C300
_080B87A4: .4byte 0x0200CB00
_080B87A8: .4byte 0x080B82ED  @ sub_80B82EC
_080B87AC: .4byte 0x0201DB00
_080B87B0: .4byte 0x0000FFFF
_080B87B4: .4byte 0x06010000
_080B87B8: .4byte 0x0201DB28
_080B87BC: .4byte 0x080B828D  @ ClassInfoDisplay_HBlankHandler

