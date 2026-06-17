	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DrawLinkArenaModeIcon, 0x08046DF4 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set LoadLinkArenaRuleSettings, 0x08047590 + 1
	.set PutText, 0x08003DA0 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set SetTextFont, 0x08003C68 + 1
	.set SioRuleSettings_DrawRuleOptions, 0x080475F0 + 1
	.set UpdateRuleSettingSprites, 0x0804DC5C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set nullsub_46, 0x0804D144 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8042FC8, 0x08042FC8 + 1
	.set sub_8043084, 0x08043084 + 1
	.set sub_80430E8, 0x080430E8 + 1
	.set sub_804D0DC, 0x0804D0DC + 1
	.set sub_804D23C, 0x0804D23C + 1
	.set sub_804D2A8, 0x0804D2A8 + 1
	.set sub_804DC24, 0x0804DC24 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.section .text.sub_80476A4, "ax", %progbits
@ sub_80476A4 @ JP 0x080476A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioRuleSettings_Init
	.thumb_func
SioRuleSettings_Init:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	sub sp, #8
	mov r8, r0
	bl sub_8042FC8
	bl sub_804D0DC
	movs r5, #0
	str r5, [sp]
	mov r0, r8
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	ldr r4, _08047810 @ =0x085D6C8C
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08047814 @ =0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _08047818 @ =0x085D7F68
	movs r1, #0xc0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _0804781C @ =0x085D6004
	ldr r1, _08047820 @ =0x06014800
	bl sub_8013008
	ldr r0, _08047824 @ =0x085D7EE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl sub_8000D68
	movs r0, #0
	bl nullsub_46
	ldr r0, _08047828 @ =0x085D8A18
	ldr r4, _0804782C @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _08047830 @ =0x02023DEA
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _08047834 @ =0x0203DB60
	bl SetTextFont
	bl ResetTextFont
	bl sub_80430E8
	mov r1, r8
	str r5, [r1, #0x30]
	mov r0, r8
	bl sub_804DC24
	mov r2, r8
	str r0, [r2, #0x2c]
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl BG_SetPosition
	add r0, sp, #4
	bl LoadLinkArenaRuleSettings
	mov r3, r8
	ldr r0, [r3, #0x2c]
	ldr r4, [r3, #0x30]
	movs r2, #0x30
	ldrsh r1, [r3, r2]
	ldr r5, _08047838 @ =0x080DEE28
	mov r3, sp
	adds r3, r3, r4
	adds r3, #4
	lsls r2, r4, #2
	adds r2, r2, r4
	ldrb r3, [r3]
	adds r2, r2, r3
	lsls r2, r2, #2
	adds r3, r5, #4
	adds r2, r2, r3
	ldr r2, [r2]
	lsls r2, r2, #0x13
	asrs r2, r2, #0x10
	lsls r3, r4, #1
	adds r3, r3, r4
	lsls r3, r3, #0x13
	movs r4, #0xc0
	lsls r4, r4, #0xe
	adds r3, r3, r4
	asrs r3, r3, #0x10
	bl UpdateRuleSettingSprites
	movs r6, #0
	movs r7, #0xc0
	lsls r7, r7, #1
_0804777E:
	lsls r4, r6, #3
	ldr r0, _0804783C @ =0x0203DA2C
	adds r4, r4, r0
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	ldr r0, [r5]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, _08047840 @ =0x02022CB4
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r6
	adds r0, #4
	ldrb r1, [r0]
	adds r0, r6, #0
	bl SioRuleSettings_DrawRuleOptions
	adds r7, #0xc0
	adds r5, #0x14
	adds r6, #1
	cmp r6, #2
	ble _0804777E
	ldr r5, _08047838 @ =0x080DEE28
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _08047844 @ =0x020236E4
	adds r0, r0, r4
	movs r1, #0
	bl DrawLinkArenaModeIcon
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl DrawLinkArenaModeIcon
	mov r1, r8
	ldr r0, [r1, #0x2c]
	movs r1, #6
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2A8
	mov r2, r8
	ldr r0, [r2, #0x30]
	movs r3, #0xda
	lsls r3, r3, #3
	adds r0, r0, r3
	movs r1, #1
	bl sub_8043084
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08047810: .4byte 0x085D6C8C
_08047814: .4byte 0x06000F00
_08047818: .4byte 0x085D7F68
_0804781C: .4byte 0x085D6004
_08047820: .4byte 0x06014800
_08047824: .4byte 0x085D7EE8
_08047828: .4byte 0x085D8A18
_0804782C: .4byte 0x02020188
_08047830: .4byte 0x02023DEA
_08047834: .4byte 0x0203DB60
_08047838: .4byte 0x080DEE28
_0804783C: .4byte 0x0203DA2C
_08047840: .4byte 0x02022CB4
_08047844: .4byte 0x020236E4

