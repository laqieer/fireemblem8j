	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set InitText, 0x08003C8C + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8001BC0, 0x08001BC0 + 1
	.set sub_80034C4, 0x080034C4 + 1
	.set sub_8003508, 0x08003508 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_80063F8, 0x080063F8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_808BB14, 0x0808BB14 + 1
	.set sub_8097CFC, 0x08097CFC + 1
	.set sub_809A780, 0x0809A780 + 1
	.set sub_809A7A4, 0x0809A7A4 + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_809AF64, 0x0809AF64 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_80A2108, 0x080A2108 + 1
	.set sub_80A224C, 0x080A224C + 1
	.set sub_80A22D0, 0x080A22D0 + 1
	.set sub_80A2318, 0x080A2318 + 1
	.set sub_80B1460, 0x080B1460 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B1F1C, 0x080B1F1C + 1
	.set sub_80B1F40, 0x080B1F40 + 1
	.section .text.sub_80A2378, "ax", %progbits
@ sub_80A2378 @ JP 0x080A2378 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2378
	.thumb_func
sub_80A2378:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r5, _080A259C @ =0x03003020
	ldrb r1, [r5]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5]
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
	ldrb r2, [r5, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #0xc]
	ldrb r2, [r5, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	mov sb, r2
	mov r2, sb
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	strb r1, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
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
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080A25A0 @ =0x06014000
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
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #8
	bl sub_809AF64
	ldr r0, _080A25A4 @ =0x08A98668
	ldr r4, _080A25A8 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080A25AC @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #7
	bl BG_EnableSyncByMask
	ldr r0, [r7, #0x2c]
	bl sub_8018FCC
	adds r1, r0, #0
	ldr r0, _080A25B0 @ =0x00000503
	str r0, [sp]
	movs r0, #0
	movs r2, #0x44
	movs r3, #0x48
	bl sub_80063F8
	adds r0, r7, #0
	bl sub_80B1460
	adds r0, r7, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	ldrb r0, [r5, #1]
	movs r6, #0x20
	orrs r0, r6
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r5, #1]
	adds r1, r5, #0
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
	movs r0, #0x34
	adds r0, r0, r5
	mov r8, r0
	ldrb r1, [r0]
	movs r2, #1
	orrs r1, r2
	mov r0, sb
	orrs r1, r0
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r2
	mov r2, sb
	orrs r0, r2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	orrs r1, r6
	mov r2, r8
	strb r1, [r2]
	orrs r0, r6
	strb r0, [r5]
	movs r0, #0
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetBlendConfig
	adds r0, r7, #0
	bl sub_80048B4
	movs r0, #0x78
	movs r1, #0x8c
	movs r2, #2
	adds r3, r7, #0
	bl sub_808B750
	movs r0, #0xa5
	movs r1, #0x80
	movs r2, #0xa
	adds r3, r7, #0
	bl sub_809A780
	movs r0, #0xa5
	movs r1, #0x80
	bl sub_809A7A4
	ldr r4, _080A25B4 @ =0x02013658
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #2
	bl InitText
	bl sub_80A2108
	adds r4, #0x10
	movs r5, #4
_080A253A:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080A253A
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _080A25B8 @ =WmSell_OnHBlank
	bl SetPrimaryHBlankHandler
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _080A25BC @ =0x02022EEC
	ldr r1, _080A25C0 @ =0x02013668
	ldr r2, [r7, #0x2c]
	movs r3, #0
	bl sub_809DA14
	bl sub_80A2318
	ldr r0, _080A25C4 @ =sub_80A2210
	adds r1, r7, #0
	bl sub_80B1D98
	ldr r1, [r7, #0x2c]
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #1
	adds r1, #0x1e
	adds r1, r1, r0
	ldrh r0, [r1]
	bl sub_80A224C
	bl sub_80A22D0
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080A259C: .4byte 0x03003020
_080A25A0: .4byte 0x06014000
_080A25A4: .4byte 0x08A98668
_080A25A8: .4byte 0x02020188
_080A25AC: .4byte 0x020234A8
_080A25B0: .4byte 0x00000503
_080A25B4: .4byte 0x02013658
_080A25B8: .4byte 0x080A20BD  @ WmSell_OnHBlank
_080A25BC: .4byte 0x02022EEC
_080A25C0: .4byte 0x02013668
_080A25C4: .4byte 0x080A2211  @ sub_80A2210

