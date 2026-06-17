	.syntax unified
	.set IsMultiArenaSaveReady, 0x080AB480 + 1
	.set LinkArenaBattleMap_InitConfig, 0x0804A5C8 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SetupFaceGfxData, 0x0800544C + 1
	.set StartBgm, 0x08002424 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_80430E8, 0x080430E8 + 1
	.set sub_8047970, 0x08047970 + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2A8, 0x0804D2A8 + 1
	.set sub_804D4F8, 0x0804D4F8 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_80AB458, 0x080AB458 + 1
	.section .text.SioMenu_RestartGraphicsMaybe, "ax", %progbits
@ SioMenu_RestartGraphicsMaybe @ JP 0x08047CA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioMenu_RestartGraphicsMaybe
	.thumb_func
SioMenu_RestartGraphicsMaybe:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08047D38 @ =0x0203DB0C
	adds r0, r4, #0
	bl sub_80AB458
	ldrb r0, [r4]
	lsls r0, r0, #0x1c
	lsrs r0, r0, #0x1f
	adds r5, r6, #0
	adds r5, #0x59
	movs r4, #0
	strb r0, [r5]
	bl sub_804D0DC
	str r4, [sp]
	adds r0, r6, #0
	movs r1, #0
	movs r2, #0x10
	movs r3, #4
	bl sub_8088FA4
	ldr r0, _08047D3C @ =0x085D53FC
	ldr r1, _08047D40 @ =0x06014800
	bl sub_8013008
	ldr r0, _08047D44 @ =0x085D7E88
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_8000D68
	ldr r0, _08047D48 @ =0x0203DB60
	bl SetTextFont
	bl sub_80042E0
	bl ResetTextFont
	bl sub_80430E8
	str r4, [r6, #0x4c]
	bl IsMultiArenaSaveReady
	adds r2, r6, #0
	adds r2, #0x58
	strb r0, [r2]
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #1
	strb r0, [r1]
	movs r1, #0
	ldrsb r1, [r2, r1]
	rsbs r0, r1, #0
	orrs r0, r1
	lsrs r1, r0, #0x1f
	adds r0, r6, #0
	adds r0, #0x41
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	adds r0, #1
	strb r1, [r0]
	movs r0, #0
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08047D4C
	movs r1, #0
	movs r0, #3
	b _08047D50
	.align 2, 0
_08047D38: .4byte 0x0203DB0C
_08047D3C: .4byte 0x085D53FC
_08047D40: .4byte 0x06014800
_08047D44: .4byte 0x085D7E88
_08047D48: .4byte 0x0203DB60
_08047D4C:
	movs r1, #1
	movs r0, #4
_08047D50:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08047E04 @ =0x0203DA20
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	ldr r1, [r6, #0x48]
	lsls r1, r1, #1
	movs r5, #4
	mov sb, r2
	ldr r2, _08047E08 @ =0x080DEEB0
	adds r0, r1, #1
	adds r0, r0, r2
	mov r8, r0
	adds r4, r6, #0
	adds r4, #0x3c
	adds r1, r1, r2
	mov sl, r1
_08047D80:
	lsls r3, r5, #0x18
	lsrs r3, r3, #0x18
	mov r1, sb
	adds r0, r1, r5
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	mov r2, sl
	ldrb r1, [r2]
	mov r7, r8
	ldrb r2, [r7]
	bl sub_804D4F8
	str r0, [r4]
	subs r4, #4
	subs r5, #1
	cmp r5, #0
	bge _08047D80
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2A8
	ldr r0, _08047E0C @ =0x085D3D70
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x65
	movs r2, #0xd0
	movs r3, #0x50
	bl sub_8005544
	adds r0, r6, #0
	movs r1, #0
	bl sub_8047970
	movs r1, #0
	bl sub_8043084
	adds r0, r6, #0
	movs r1, #1
	bl sub_8047970
	movs r1, #1
	bl sub_8043084
	bl LinkArenaBattleMap_InitConfig
	movs r0, #0x38
	movs r1, #0
	bl StartBgm
	movs r0, #0
	str r0, [r6, #0x54]
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047E04: .4byte 0x0203DA20
_08047E08: .4byte 0x080DEEB0
_08047E0C: .4byte 0x085D3D70

