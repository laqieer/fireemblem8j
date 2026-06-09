	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set InitText, 0x08003C8C + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set PrepItemSupply_DrawConvoyWeaponIconTiles, 0x0809FB74 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set UnlockMenuScrollBar, 0x0809994C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_809A4BC, 0x0809A4BC + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_809F560, 0x0809F560 + 1
	.set sub_809F59C, 0x0809F59C + 1
	.set sub_80A0E90, 0x080A0E90 + 1
	.set sub_80A0ED8, 0x080A0ED8 + 1
	.set sub_80A1894, 0x080A1894 + 1
	.set sub_80B1460, 0x080B1460 + 1
	.set sub_80B1780, 0x080B1780 + 1
	.set sub_80B1794, 0x080B1794 + 1
	.set sub_80B1800, 0x080B1800 + 1
	.set sub_80B181C, 0x080B181C + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.set sub_80B261C, 0x080B261C + 1
	.set sub_80B269C, 0x080B269C + 1
	.section .text.sub_80A102C, "ax", %progbits
@ sub_80A102C @ JP 0x080A102C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A102C
	.thumb_func
sub_80A102C:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	ldr r0, _080A1360 @ =0x03003020
	mov r8, r0
	ldrb r1, [r0]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	mov r1, r8
	strb r0, [r1]
	movs r0, #0
	bl sub_8001ACC
	movs r0, #0
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	movs r0, #2
	bl sub_8001BC0
	movs r1, #0
	bl sub_80011D0
	mov r0, r8
	ldrb r2, [r0, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	mov r2, r8
	strb r0, [r2, #0xc]
	ldrb r2, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r5, #2
	orrs r0, r5
	mov r2, r8
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	bl ResetFaces
	bl ResetText
	bl sub_80034C4
	bl sub_804F8F4
	bl sub_801569C
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	adds r0, r7, #0
	adds r0, #0x33
	ldrb r1, [r0]
	lsls r1, r1, #1
	adds r0, #0x17
	adds r0, r0, r1
	ldrh r2, [r0]
	subs r2, #0x28
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	movs r0, #2
	movs r1, #0
	bl BG_SetPosition
	ldr r0, _080A1364 @ =0x06012000
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_808BB14
	movs r0, #4
	bl sub_8003508
	bl sub_8097CFC
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	ldr r0, _080A1368 @ =0x08A98484
	ldr r4, _080A136C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080A1370 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #7
	bl BG_EnableSyncByMask
	adds r0, r7, #0
	bl sub_80B1460
	adds r0, r7, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	mov r1, r8
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, r8
	strb r0, [r2, #1]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0x80
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xe0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x98
	strb r0, [r1]
	adds r2, #0x34
	ldrb r0, [r2]
	mov r1, sb
	orrs r0, r1
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	mov r1, sb
	orrs r0, r1
	orrs r0, r5
	movs r1, #5
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	adds r0, r7, #0
	bl sub_80048B4
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl sub_808B750
	ldr r4, _080A1374 @ =0x02013658
	adds r0, r4, #0
	movs r1, #6
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #5
	bl InitText
	adds r0, r4, #0
	adds r0, #0x78
	movs r1, #4
	bl InitText
	adds r4, #0x10
	movs r5, #4
_080A11CC:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A11CC
	movs r2, #0x33
	adds r2, r2, r7
	mov r8, r2
	adds r6, r7, #0
	adds r6, #0x4a
	ldr r4, _080A1378 @ =0x02013690
	movs r5, #7
_080A11EA:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A11EA
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl sub_809F560
	ldr r0, _080A137C @ =0x02022D86
	mov sb, r0
	adds r1, r4, #0
	movs r2, #6
	bl PrepItemSupply_DrawConvoyWeaponIconTiles
	ldr r0, _080A1380 @ =0x08A9651C
	ldr r1, _080A1384 @ =0x06015000
	bl sub_8013008
	ldr r0, _080A1388 @ =0x08A968D4
	movs r4, #0xa0
	lsls r4, r4, #2
	adds r1, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	movs r3, #0xb0
	lsls r3, r3, #7
	movs r0, #9
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0xe1
	movs r2, #0x2f
	bl StartMenuScrollBarExt
	bl UnlockMenuScrollBar
	ldr r0, [r7, #0x2c]
	mov r2, r8
	ldrb r1, [r2]
	movs r2, #3
	bl sub_809A4BC
	adds r0, r7, #0
	bl sub_80A1894
	ldr r5, _080A1378 @ =0x02013690
	ldr r1, _080A138C @ =0x02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	adds r0, r6, r0
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r5, #0
	bl sub_809F59C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	add r0, sb
	adds r1, r5, #0
	subs r1, #0x28
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809DA14
	bl sub_80A0E90
	adds r0, r7, #0
	bl sub_80B1780
	movs r0, #0
	adds r1, r4, #0
	movs r2, #2
	bl sub_80B1794
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80B181C
	movs r0, #3
	bl sub_80B1800
	ldr r0, _080A1390 @ =sub_80A0F9C
	adds r1, r7, #0
	bl sub_80B1D98
	ldr r0, [r7, #0x2c]
	bl sub_8018FCC
	adds r1, r0, #0
	movs r3, #4
	rsbs r3, r3, #0
	ldr r0, _080A1394 @ =0x00000203
	str r0, [sp]
	movs r0, #0
	movs r2, #0x40
	bl sub_80063F8
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	mov r8, r0
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0x80
	lsls r0, r0, #3
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80B261C
	movs r1, #0x28
	rsbs r1, r1, #0
	movs r2, #1
	rsbs r2, r2, #0
	movs r0, #0
	movs r3, #1
	bl sub_80B269C
	movs r0, #1
	movs r1, #0x98
	movs r2, #6
	movs r3, #2
	bl sub_80B269C
	movs r0, #1
	movs r1, #0xe
	movs r2, #4
	movs r3, #0
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0x30
	mov r1, r8
	bl sub_8003EAC
	adds r3, r0, #0
	subs r5, #0x38
	str r4, [sp]
	mov r0, r8
	str r0, [sp, #4]
	adds r0, r5, #0
	ldr r1, _080A1398 @ =0x02022CA8
	movs r2, #0
	bl sub_8004374
	adds r0, r7, #0
	bl sub_80A0ED8
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A1360: .4byte 0x03003020
_080A1364: .4byte 0x06012000
_080A1368: .4byte 0x08A98484
_080A136C: .4byte 0x02020188
_080A1370: .4byte 0x020234A8
_080A1374: .4byte 0x02013658
_080A1378: .4byte 0x02013690
_080A137C: .4byte 0x02022D86
_080A1380: .4byte 0x08A9651C
_080A1384: .4byte 0x06015000
_080A1388: .4byte 0x08A968D4
_080A138C: .4byte 0x02023CC6
_080A1390: .4byte 0x080A0F9D  @ sub_80A0F9C
_080A1394: .4byte 0x00000203
_080A1398: .4byte 0x02022CA8

