	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set BuildAndPutGuideEntryList, 0x080D3110 + 1
	.set CheckFlag, 0x080860D0 + 1
	.set InitText, 0x08003C8C + 1
	.set PutGuideCategoryList, 0x080D2F44 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set UnlockMenuScrollBar, 0x0809994C + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_80D2E44, 0x080D2E44 + 1
	.set sub_80D37E4, 0x080D37E4 + 1
	.set sub_80D38A0, 0x080D38A0 + 1
	.section .text.sub_80D39AC, "ax", %progbits
@ sub_80D39AC @ JP 0x080D39AC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D39AC
	.thumb_func
sub_80D39AC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	str r0, [sp, #4]
	movs r0, #0
	mov sl, r0
	bl sub_8001ACC
	ldr r5, _080D3BCC @ =0x08BABAF4
	ldr r0, [r5]
	adds r0, #0x2f
	mov r1, sl
	strb r1, [r0]
	movs r0, #0xb3
	bl CheckFlag
	ldr r1, [r5]
	adds r1, #0x30
	strb r0, [r1]
	ldr r0, [r5]
	adds r0, #0x29
	mov r2, sl
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2a
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2b
	strb r2, [r0]
	ldr r0, [r5]
	adds r0, #0x2c
	strb r2, [r0]
	bl sub_80D37E4
	bl sub_80D38A0
	bl sub_804F8F4
	ldr r7, _080D3BD0 @ =0x03003020
	ldrb r0, [r7, #1]
	movs r1, #1
	mov sb, r1
	mov r2, sb
	orrs r0, r2
	movs r1, #2
	orrs r0, r1
	movs r2, #4
	mov r8, r2
	mov r1, r8
	orrs r0, r1
	movs r6, #8
	orrs r0, r6
	movs r4, #0x10
	orrs r0, r4
	strb r0, [r7, #1]
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
	ldr r0, _080D3BD4 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080D3BD8 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080D3BDC @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080D3BE0 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	ldrb r0, [r7, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r7, #1]
	adds r0, r7, #0
	adds r0, #0x2d
	mov r2, sl
	strb r2, [r0]
	adds r1, r7, #0
	adds r1, #0x31
	movs r0, #0x28
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	adds r1, #4
	ldrb r0, [r1]
	mov r2, sb
	orrs r0, r2
	movs r2, #2
	orrs r0, r2
	mov r2, r8
	orrs r0, r2
	orrs r0, r6
	orrs r0, r4
	strb r0, [r1]
	adds r2, r7, #0
	adds r2, #0x36
	ldrb r0, [r2]
	mov r1, sb
	orrs r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	mov r1, r8
	orrs r0, r1
	orrs r0, r6
	orrs r0, r4
	strb r0, [r2]
	ldr r0, _080D3BE4 @ =0x08BB0B98
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080D3BE8 @ =0x08BB08B4
	ldr r1, _080D3BEC @ =0x06011000
	bl sub_8013008
	ldr r0, _080D3BF0 @ =0x08BB0810
	ldr r1, _080D3BF4 @ =0x06011800
	bl sub_8013008
	ldr r0, _080D3BF8 @ =0x08BB071C
	ldr r4, _080D3BFC @ =0x02020288
	adds r1, r4, #0
	bl sub_8013008
	movs r2, #0x80
	lsls r2, r2, #5
	ldr r0, _080D3BDC @ =0x02023CA8
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080D3C00 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1e
	adds r0, #4
	lsls r0, r0, #5
	ldr r1, _080D3C04 @ =0x085E0D94
	adds r0, r0, r1
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	bl ResetTextFont
	ldr r0, [r5]
	adds r0, #0xec
	movs r1, #0x16
	bl InitText
	bl sub_80D2E44
	ldr r0, [r5]
	adds r0, #0xac
	movs r1, #9
	bl InitText
	ldr r0, [r5]
	adds r0, #0xe4
	movs r1, #0x12
	bl InitText
	movs r6, #0xb4
	movs r4, #0x7c
	movs r2, #5
	mov sl, r2
_080D3B40:
	ldr r0, [r5]
	adds r0, r0, r4
	movs r1, #9
	bl InitText
	ldr r0, [r5]
	adds r0, r0, r6
	movs r1, #0x12
	bl InitText
	adds r6, #8
	adds r4, #8
	movs r0, #1
	rsbs r0, r0, #0
	add sl, r0
	mov r1, sl
	cmp r1, #0
	bge _080D3B40
	bl PutGuideCategoryList
	bl BuildAndPutGuideEntryList
	movs r0, #0
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	ldr r0, _080D3C08 @ =0x08BABB6C
	ldr r1, [sp, #4]
	bl sub_8002BCC
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #4
	str r0, [sp]
	ldr r0, [sp, #4]
	movs r1, #0xe0
	movs r2, #0x2f
	bl StartMenuScrollBarExt
	ldr r0, _080D3BCC @ =0x08BABAF4
	ldr r0, [r0]
	adds r1, r0, #0
	adds r1, #0x2c
	ldrb r1, [r1]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	lsls r1, r1, #4
	adds r0, #0x3e
	ldrb r2, [r0]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	bl UnlockMenuScrollBar
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080D3BCC: .4byte 0x08BABAF4
_080D3BD0: .4byte 0x03003020
_080D3BD4: .4byte 0x02022CA8
_080D3BD8: .4byte 0x020234A8
_080D3BDC: .4byte 0x02023CA8
_080D3BE0: .4byte 0x020244A8
_080D3BE4: .4byte 0x08BB0B98
_080D3BE8: .4byte 0x08BB08B4
_080D3BEC: .4byte 0x06011000
_080D3BF0: .4byte 0x08BB0810
_080D3BF4: .4byte 0x06011800
_080D3BF8: .4byte 0x08BB071C
_080D3BFC: .4byte 0x02020288
_080D3C00: .4byte 0x0202BCEC
_080D3C04: .4byte 0x085E0D94
_080D3C08: .4byte 0x08BABB6C

