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
	.set sub_804DC48, 0x0804DC48 + 1
	.set sub_8088FA4, 0x08088FA4 + 1
	.section .text.sub_8046798, "ax", %progbits
@ sub_8046798 @ JP 0x08046798 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global DrawLinkArenaRuleScreen
	.thumb_func
DrawLinkArenaRuleScreen:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	mov sb, r0
	bl sub_8042FC8
	bl sub_804D0DC
	movs r0, #0
	str r0, [sp]
	mov r0, sb
	movs r1, #0
	movs r2, #0x12
	movs r3, #2
	bl sub_8088FA4
	ldr r4, _080468CC @ =0x085D6C8C
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080468D0 @ =0x06000F00
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080468D4 @ =0x085D7F68
	movs r1, #0xc0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080468D8 @ =0x085D6004
	ldr r1, _080468DC @ =0x06014800
	bl sub_8013008
	ldr r0, _080468E0 @ =0x085D7EE8
	movs r1, #0x98
	lsls r1, r1, #2
	movs r2, #0x80
	bl sub_8000D68
	movs r0, #0
	bl nullsub_46
	ldr r0, _080468E4 @ =0x085D8A18
	ldr r4, _080468E8 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080468EC @ =0x02023DEA
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r0, _080468F0 @ =0x0203DB60
	bl SetTextFont
	bl ResetTextFont
	bl sub_80430E8
	bl sub_804DC48
	add r0, sp, #4
	bl LoadLinkArenaRuleSettings
	movs r0, #1
	movs r1, #0xfe
	movs r2, #0
	bl BG_SetPosition
	movs r5, #0
	movs r7, #0xc0
	lsls r7, r7, #1
	ldr r6, _080468F4 @ =0x080DEE28
_08046834:
	lsls r4, r5, #3
	ldr r0, _080468F8 @ =0x0203DA2C
	mov r8, r0
	add r4, r8
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	movs r1, #0
	bl sub_8003D90
	ldr r0, [r6]
	bl sub_8009FA8
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8003F28
	ldr r1, _080468FC @ =0x02022CB4
	adds r1, r7, r1
	adds r0, r4, #0
	bl PutText
	mov r0, sp
	adds r0, r0, r5
	adds r0, #4
	ldrb r1, [r0]
	adds r0, r5, #0
	bl SioRuleSettings_DrawRuleOptions
	adds r7, #0xc0
	adds r6, #0x14
	adds r5, #1
	cmp r5, #2
	ble _08046834
	ldr r5, _080468F4 @ =0x080DEE28
	ldr r0, [r5, #0x18]
	lsls r0, r0, #1
	ldr r4, _08046900 @ =0x020236E4
	adds r0, r0, r4
	movs r1, #0
	bl DrawLinkArenaModeIcon
	ldr r0, [r5, #0x1c]
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #1
	bl DrawLinkArenaModeIcon
	ldr r1, _08046904 @ =0x080DED3A
	mov r0, r8
	subs r0, #0xc
	ldrb r0, [r0]
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r0, sb
	movs r2, #0
	bl sub_804D23C
	bl sub_804D2A8
	ldr r0, _08046908 @ =0x000006D6
	movs r1, #1
	bl sub_8043084
	movs r0, #0xf
	bl BG_EnableSyncByMask
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080468CC: .4byte 0x085D6C8C
_080468D0: .4byte 0x06000F00
_080468D4: .4byte 0x085D7F68
_080468D8: .4byte 0x085D6004
_080468DC: .4byte 0x06014800
_080468E0: .4byte 0x085D7EE8
_080468E4: .4byte 0x085D8A18
_080468E8: .4byte 0x02020188
_080468EC: .4byte 0x02023DEA
_080468F0: .4byte 0x0203DB60
_080468F4: .4byte 0x080DEE28
_080468F8: .4byte 0x0203DA2C
_080468FC: .4byte 0x02022CB4
_08046900: .4byte 0x020236E4
_08046904: .4byte 0x080DED3A
_08046908: .4byte 0x000006D6

