	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitText, 0x08003C8C + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_80043B8, 0x080043B8 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_8046EAC, 0x08046EAC + 1
	.set sub_804D08C, 0x0804D08C + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2F8, 0x0804D2F8 + 1
	.set sub_804DF78, 0x0804DF78 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_80AB3F4, 0x080AB3F4 + 1
	.section .text.sub_8046F4C, "ax", %progbits
@ sub_8046F4C @ JP 0x08046F4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioResult_Init
	.thumb_func
SioResult_Init:
	push {r4, r5, r6, r7, lr}
	sub sp, #8
	adds r7, r0, #0
	bl sub_8042FC8
	bl sub_804D0DC
	movs r0, #0
	str r0, [sp]
	adds r0, r7, #0
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	ldr r4, _08047104 @ =0x085D6C8C
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08047108 @ =0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0804710C @ =0x085D7F68
	movs r1, #0xc0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08047110 @ =0x085D6004
	ldr r1, _08047114 @ =0x06014800
	bl sub_8013008
	ldr r0, _08047118 @ =0x085D7EE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl sub_8000D68
	ldr r0, _0804711C @ =0x02023DAA
	ldr r1, _08047120 @ =0x085D8704
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r0, _08047124 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	movs r1, #0
	movs r0, #0xc8
	strh r0, [r7, #0x36]
	adds r0, r7, #0
	adds r0, #0x39
	strb r1, [r0]
	subs r0, #1
	strb r1, [r0]
	subs r0, #4
	strb r1, [r0]
	ldrh r2, [r7, #0x36]
	movs r0, #1
	movs r1, #0
	bl BG_SetPosition
	ldr r5, _08047128 @ =0x0203DB10
	movs r4, #9
_08046FD8:
	adds r0, r5, #0
	movs r1, #0x16
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _08046FD8
	ldr r4, _0804712C @ =0x0203DD08
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
	movs r1, #0x5c
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x5d
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x81
	movs r2, #0
	bl sub_80043B8
	movs r0, #0x5f
	bl sub_8009FA8
	adds r3, r0, #0
	adds r0, r4, #0
	movs r1, #0x9c
	movs r2, #0
	bl sub_80043B8
	ldr r1, _08047130 @ =0x02022DF2
	adds r0, r4, #0
	bl PutText
	ldr r0, _08047134 @ =0x000006CF
	movs r1, #1
	bl sub_8043084
	ldr r0, _08047138 @ =0x0203DC40
	bl sub_80AB3F4
	bl sub_8046EAC
	ldr r1, _0804713C @ =0x03003020
	mov ip, r1
	ldrb r0, [r1, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r1, ip
	strb r0, [r1, #1]
	adds r1, #0x2d
	movs r0, #0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x3a
	strb r0, [r1]
	subs r1, #5
	movs r0, #0xf0
	strb r0, [r1]
	adds r1, #4
	movs r0, #0x88
	strb r0, [r1]
	mov r2, ip
	adds r2, #0x34
	ldrb r0, [r2]
	movs r6, #1
	orrs r0, r6
	movs r1, #2
	orrs r0, r1
	movs r5, #4
	orrs r0, r5
	movs r4, #8
	orrs r0, r4
	movs r3, #0x10
	orrs r0, r3
	strb r0, [r2]
	adds r2, #2
	ldrb r0, [r2]
	orrs r0, r6
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	orrs r0, r5
	orrs r0, r4
	orrs r0, r3
	strb r0, [r2]
	ldrh r0, [r7, #0x36]
	adds r0, #0x38
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd9
	movs r1, #0x39
	movs r2, #0xa
	movs r3, #5
	bl sub_804DF78
	adds r0, r7, #0
	movs r1, #5
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2F8
	movs r0, #0xc0
	movs r1, #0x10
	adds r2, r7, #0
	bl sub_804D08C
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047104: .4byte 0x085D6C8C
_08047108: .4byte 0x06000F00
_0804710C: .4byte 0x085D7F68
_08047110: .4byte 0x085D6004
_08047114: .4byte 0x06014800
_08047118: .4byte 0x085D7EE8
_0804711C: .4byte 0x02023DAA
_08047120: .4byte 0x085D8704
_08047124: .4byte 0x0203DB60
_08047128: .4byte 0x0203DB10
_0804712C: .4byte 0x0203DD08
_08047130: .4byte 0x02022DF2
_08047134: .4byte 0x000006CF
_08047138: .4byte 0x0203DC40
_0804713C: .4byte 0x03003020

