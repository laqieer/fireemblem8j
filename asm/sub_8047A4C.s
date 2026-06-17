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
	.set sub_80430E8, 0x080430E8 + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2A8, 0x0804D2A8 + 1
	.set sub_804D4F8, 0x0804D4F8 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.set sub_80AB458, 0x080AB458 + 1
	.section .text.sub_8047A4C, "ax", %progbits
@ sub_8047A4C @ JP 0x08047A4C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8047A4C
	.thumb_func
sub_8047A4C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r4, _08047ADC @ =0x0203DB0C
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
	ldr r0, _08047AE0 @ =0x085D53FC
	ldr r1, _08047AE4 @ =0x06014800
	bl sub_8013008
	ldr r0, _08047AE8 @ =0x085D7E88
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_8000D68
	ldr r0, _08047AEC @ =0x0203DB60
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
	bne _08047AF0
	movs r1, #0
	movs r0, #3
	b _08047AF4
	.align 2, 0
_08047ADC: .4byte 0x0203DB0C
_08047AE0: .4byte 0x085D53FC
_08047AE4: .4byte 0x06014800
_08047AE8: .4byte 0x085D7E88
_08047AEC: .4byte 0x0203DB60
_08047AF0:
	movs r1, #1
	movs r0, #4
_08047AF4:
	str r0, [r6, #0x50]
	adds r0, r6, #0
	adds r0, #0x44
	strb r1, [r0]
	ldr r0, _08047B70 @ =0x0203DA20
	ldrb r0, [r0, #1]
	str r0, [r6, #0x48]
	adds r2, r6, #0
	adds r2, #0x40
	adds r0, r2, r0
	movs r1, #2
	strb r1, [r0]
	movs r4, #4
	adds r7, r2, #0
	adds r5, r6, #0
	adds r5, #0x3c
_08047B14:
	lsls r3, r4, #0x18
	lsrs r3, r3, #0x18
	adds r0, r7, r4
	ldrb r0, [r0]
	str r0, [sp]
	adds r0, r6, #0
	movs r1, #0xb0
	movs r2, #0xa0
	bl sub_804D4F8
	str r0, [r5]
	subs r5, #4
	subs r4, #1
	cmp r4, #0
	bge _08047B14
	ldr r0, [r6, #0x2c]
	movs r1, #0
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2A8
	ldr r0, _08047B74 @ =0x085D3D50
	bl SetupFaceGfxData
	movs r0, #2
	str r0, [sp]
	movs r0, #3
	movs r1, #0x65
	movs r2, #0xd0
	movs r3, #0x50
	bl sub_8005544
	movs r0, #0
	str r0, [r6, #0x54]
	movs r0, #0x38
	movs r1, #0
	bl StartBgm
	bl LinkArenaBattleMap_InitConfig
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047B70: .4byte 0x0203DA20
_08047B74: .4byte 0x085D3D50

