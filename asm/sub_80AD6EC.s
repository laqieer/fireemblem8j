	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SaveMenuCopyPalette, 0x080AF270 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002100, 0x08002100 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_80AD4B4, 0x080AD4B4 + 1
	.set sub_80AFDD4, 0x080AFDD4 + 1
	.set sub_80B0250, 0x080B0250 + 1
	.set sub_80B06C8, 0x080B06C8 + 1
	.set sub_80B083C, 0x080B083C + 1
	.set sub_80D6374, 0x080D6374 + 1
	.section .text.sub_80AD6EC, "ax", %progbits
@ sub_80AD6EC @ JP 0x080AD6EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AD6EC
	.thumb_func
sub_80AD6EC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	mov r8, r0
	bl ResetTextFont
	bl sub_804F8F4
	bl sub_801569C
	ldr r0, _080AD8C8 @ =0x08AA2D34
	movs r6, #0x80
	lsls r6, r6, #1
	adds r1, r6, #0
	adds r2, r6, #0
	bl sub_8000D68
	ldr r4, _080AD8CC @ =0x08A9E5C0
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080AD8D0 @ =0x020244A8
	ldr r1, _080AD8D4 @ =0x08AA2E34
	movs r2, #0x80
	lsls r2, r2, #8
	bl j_TmApplyTsa
	ldr r0, _080AD8D8 @ =0x08AA3840
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, _080AD8DC @ =0x08AA32E8
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _080AD8E0 @ =0x06004C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080AD8E4 @ =0x08AA3860
	ldr r4, _080AD8E8 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080AD8EC @ =0x02023CA8
	ldr r2, _080AD8F0 @ =0x00007260
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080AD8F4 @ =0x08AA39DC
	ldr r1, _080AD8F8 @ =0x06010800
	bl sub_8013008
	ldr r0, _080AD8FC @ =0x08AA51BC
	movs r1, #0x90
	lsls r1, r1, #2
	adds r2, r6, #0
	bl sub_8000D68
	ldr r0, _080AD900 @ =0x08AA7310
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080AD904 @ =0x02022AE8
	adds r1, r0, #0
	subs r1, #0x20
	movs r2, #1
	bl SaveMenuCopyPalette
	ldr r0, _080AD908 @ =0x08AAA3CC
	ldr r1, _080AD90C @ =0x020007A0
	movs r2, #2
	bl SaveMenuCopyPalette
	movs r0, #0xf
	bl BG_EnableSyncByMask
	mov r0, r8
	adds r0, #0x29
	movs r4, #0
	strb r4, [r0]
	ldr r1, _080AD910 @ =0x03003020
	adds r2, r1, #0
	adds r2, #0x34
	ldrb r0, [r2]
	movs r3, #0x20
	orrs r0, r3
	strb r0, [r2]
	adds r1, #0x35
	ldrb r0, [r1]
	orrs r0, r3
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x36
	strb r4, [r0]
	mov r1, r8
	adds r1, #0x2d
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3d
	strb r4, [r0]
	movs r7, #0
	ldr r0, _080AD914 @ =0x080DC15C
	mov sb, r0
	movs r1, #0x80
	add r1, sb
	mov sl, r1
	adds r5, r6, #0
_080AD7E2:
	mov r2, sl
	movs r1, #0
	ldrsh r0, [r2, r1]
	lsls r0, r0, #4
	adds r1, r5, #0
	bl sub_80D6374
	adds r6, r0, #0
	lsls r6, r6, #0x10
	asrs r6, r6, #0x10
	mov r2, sb
	movs r1, #0
	ldrsh r0, [r2, r1]
	rsbs r0, r0, #0
	lsls r0, r0, #4
	adds r1, r5, #0
	bl sub_80D6374
	lsls r2, r0, #0x10
	asrs r0, r2, #0x10
	str r0, [sp, #8]
	mov r1, sb
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r5, #0
	bl sub_80D6374
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r1, sl
	movs r2, #0
	ldrsh r0, [r1, r2]
	lsls r0, r0, #4
	adds r1, r5, #0
	bl sub_80D6374
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	str r0, [sp]
	adds r0, r7, #0
	adds r1, r6, #0
	ldr r2, [sp, #8]
	adds r3, r4, #0
	bl sub_8002100
	adds r7, #1
	cmp r7, #3
	ble _080AD7E2
	mov r1, r8
	adds r1, #0x44
	movs r2, #0
	movs r0, #0x80
	lsls r0, r0, #1
	strh r0, [r1]
	subs r1, #5
	movs r0, #0xff
	strb r0, [r1]
	mov r0, r8
	adds r0, #0x3e
	strb r2, [r0]
	adds r0, #2
	strb r2, [r0]
	movs r7, #0
	mov r4, r8
	adds r4, #0x2c
_080AD868:
	lsls r0, r7, #0x18
	lsrs r0, r0, #0x18
	mov r1, r8
	bl sub_80B06C8
	adds r7, #1
	cmp r7, #3
	ble _080AD868
	ldrb r0, [r4]
	bl sub_80B083C
	bl sub_80B0250
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r2, _080AD910 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	ldr r1, _080AD918 @ =0x020228A8
	movs r0, #0
	strh r0, [r1]
	bl sub_8001EE4
	mov r0, r8
	bl sub_80AD4B4
	mov r0, r8
	bl sub_80AFDD4
	mov r1, r8
	str r0, [r1, #0x58]
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080AD8C8: .4byte 0x08AA2D34
_080AD8CC: .4byte 0x08A9E5C0
_080AD8D0: .4byte 0x020244A8
_080AD8D4: .4byte 0x08AA2E34
_080AD8D8: .4byte 0x08AA3840
_080AD8DC: .4byte 0x08AA32E8
_080AD8E0: .4byte 0x06004C00
_080AD8E4: .4byte 0x08AA3860
_080AD8E8: .4byte 0x02020188
_080AD8EC: .4byte 0x02023CA8
_080AD8F0: .4byte 0x00007260
_080AD8F4: .4byte 0x08AA39DC
_080AD8F8: .4byte 0x06010800
_080AD8FC: .4byte 0x08AA51BC
_080AD900: .4byte 0x08AA7310
_080AD904: .4byte 0x02022AE8
_080AD908: .4byte 0x08AAA3CC
_080AD90C: .4byte 0x020007A0
_080AD910: .4byte 0x03003020
_080AD914: .4byte 0x080DC15C
_080AD918: .4byte 0x020228A8

