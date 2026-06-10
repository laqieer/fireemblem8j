	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SioResult_GetNewHSScrollTarget, 0x0804723C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_8046EAC, 0x08046EAC + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D2F8, 0x0804D2F8 + 1
	.set sub_804E570, 0x0804E570 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_80AB3F4, 0x080AB3F4 + 1
	.section .text.sub_8047258, "ax", %progbits
@ sub_8047258 @ JP 0x08047258 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047258
	.thumb_func
sub_8047258:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #4
	adds r7, r0, #0
	bl sub_8042FC8
	bl sub_804D0DC
	movs r5, #0
	str r5, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl sub_8088FA4
	ldr r4, _08047454 @ =0x085D6C8C
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08047458 @ =0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0804745C @ =0x085D7F68
	movs r1, #0xc0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08047460 @ =0x085D6004
	ldr r1, _08047464 @ =0x06014800
	bl sub_8013008
	ldr r0, _08047468 @ =0x085D71AC
	ldr r1, _0804746C @ =0x06016000
	bl sub_8013008
	ldr r0, _08047470 @ =0x085D80A8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08047474 @ =0x02023DAA
	ldr r1, _08047478 @ =0x085D8704
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r0, _0804747C @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	adds r1, r7, #0
	adds r1, #0x34
	movs r0, #5
	strb r0, [r1]
	movs r1, #0
	movs r0, #0x8c
	lsls r0, r0, #1
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	ldr r0, [r7, #0x3c]
	bl SioResult_GetNewHSScrollTarget
	adds r1, r7, #0
	adds r1, #0x35
	strb r0, [r1]
	str r5, [r7, #0x40]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r5, _08047480 @ =0x0203DB10
	movs r4, #9
_08047306:
	adds r0, r5, #0
	movs r1, #0x18
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08047306
	ldr r4, _08047484 @ =0x0203DD08
	adds r0, r4, #0
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #0x18
	bl InitText
	adds r0, r4, #0
	bl sub_8003CF8
	movs r0, #0x5a
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x10
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x5b
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x5e
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x5d
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x84
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x5f
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x9c
	movs r2, #0
	bl sub_80043B8
	ldr r1, _08047488 @ =0x02022DF2
	adds r0, r4, #0
	bl PutText
	ldr r0, _0804748C @ =0x0203DC40
	bl sub_80AB3F4
	bl sub_8046EAC
	ldr r1, _08047490 @ =0x03003020
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r2, ip
	strb r0, [r2, #1]
	mov r0, ip
	adds r0, #0x2d
	movs r1, #0
	mov r8, r1
	mov r2, r8
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x31
	movs r0, #0x3a
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2c
	movs r6, #0xf0
	strb r6, [r0]
	subs r1, #1
	movs r0, #0x88
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r5, #1
	orrs r0, r5
	movs r1, #2
	orrs r0, r1
	movs r4, #4
	orrs r0, r4
	movs r3, #8
	orrs r0, r3
	movs r1, #0x10
	mov sb, r1
	mov r1, sb
	orrs r0, r1
	strb r0, [r2]
	mov r0, ip
	adds r0, #0x2f
	mov r2, r8
	strb r2, [r0]
	mov r1, ip
	adds r1, #0x33
	movs r0, #0x18
	strb r0, [r1]
	mov r0, ip
	adds r0, #0x2e
	strb r6, [r0]
	subs r1, #1
	movs r0, #0x38
	strb r0, [r1]
	mov r6, ip
	adds r6, #0x35
	ldrb r0, [r6]
	orrs r0, r5
	movs r2, #3
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r6]
	mov r1, ip
	adds r1, #0x36
	ldrb r0, [r1]
	orrs r0, r5
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, sb
	orrs r0, r2
	strb r0, [r1]
	bl sub_804D2F8
	ldr r1, [r7, #0x3c]
	lsls r1, r1, #4
	subs r1, #0x18
	movs r0, #0xe
	adds r2, r7, #0
	bl sub_804E570
	str r0, [r7, #0x2c]
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047454: .4byte 0x085D6C8C
_08047458: .4byte 0x06000F00
_0804745C: .4byte 0x085D7F68
_08047460: .4byte 0x085D6004
_08047464: .4byte 0x06014800
_08047468: .4byte 0x085D71AC
_0804746C: .4byte 0x06016000
_08047470: .4byte 0x085D80A8
_08047474: .4byte 0x02023DAA
_08047478: .4byte 0x085D8704
_0804747C: .4byte 0x0203DB60
_08047480: .4byte 0x0203DB10
_08047484: .4byte 0x0203DD08
_08047488: .4byte 0x02022DF2
_0804748C: .4byte 0x0203DC40
_08047490: .4byte 0x03003020

