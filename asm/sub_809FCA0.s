	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitText, 0x08003C8C + 1
	.set InitTextDb, 0x08003CB4 + 1
	.set PrepItemSupply_DrawConvoyWeaponIconTiles, 0x0809FB74 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetPrimaryHBlankHandler, 0x08001D28 + 1
	.set StartMenuScrollBarExt, 0x08099A2C + 1
	.set UnlockMenuScrollBar, 0x0809994C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80048B4, 0x080048B4 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_808B750, 0x0808B750 + 1
	.set sub_809A4BC, 0x0809A4BC + 1
	.set sub_809AF14, 0x0809AF14 + 1
	.set sub_809AF64, 0x0809AF64 + 1
	.set sub_809DA14, 0x0809DA14 + 1
	.set sub_809F560, 0x0809F560 + 1
	.set sub_809F59C, 0x0809F59C + 1
	.set sub_809F8A4, 0x0809F8A4 + 1
	.set sub_809F968, 0x0809F968 + 1
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
	.section .text.sub_809FCA0, "ax", %progbits
@ sub_809FCA0 @ JP 0x0809FCA0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PrepItemSupply_InitGfx
	.thumb_func
PrepItemSupply_InitGfx:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	sub sp, #8
	adds r7, r0, #0
	movs r0, #0xa0
	lsls r0, r0, #7
	movs r1, #5
	bl sub_809AF14
	movs r0, #0x80
	lsls r0, r0, #4
	movs r1, #0xa
	bl sub_809AF64
	ldr r0, _0809FED8 @ =0x08A98484
	ldr r4, _0809FEDC @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r5, _0809FEE0 @ =0x020234A8
	movs r6, #0x80
	lsls r6, r6, #5
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	ldr r0, _0809FEE4 @ =0x08A98758
	adds r1, r4, #0
	bl sub_8013008
	adds r0, r5, #0
	adds r1, r4, #0
	adds r2, r6, #0
	bl j_TmApplyTsa
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r1, #0xe0
	lsls r1, r1, #4
	movs r3, #0xc0
	lsls r3, r3, #4
	movs r0, #0
	str r0, [sp]
	str r7, [sp, #4]
	movs r0, #0xd
	movs r2, #0xf
	bl sub_80B261C
	movs r0, #0
	movs r1, #0x90
	movs r2, #6
	movs r3, #2
	bl sub_80B269C
	ldr r0, [r7, #0x2c]
	ldr r0, [r0]
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r0, r7, #0
	bl sub_80B1460
	adds r0, r7, #0
	bl sub_80B1F1C
	movs r0, #0xc0
	lsls r0, r0, #3
	movs r1, #1
	bl sub_80B1F40
	ldr r5, _0809FEE8 @ =0x03003020
	ldrb r0, [r5, #1]
	movs r1, #0x20
	mov r8, r1
	mov r2, r8
	orrs r0, r2
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
	mov sb, r0
	ldrb r1, [r0]
	movs r6, #1
	orrs r1, r6
	movs r2, #2
	orrs r1, r2
	movs r0, #4
	orrs r1, r0
	movs r4, #8
	orrs r1, r4
	movs r3, #0x10
	orrs r1, r3
	adds r5, #0x36
	ldrb r0, [r5]
	orrs r0, r6
	orrs r0, r2
	movs r2, #5
	rsbs r2, r2, #0
	ands r0, r2
	orrs r0, r4
	orrs r0, r3
	mov r2, r8
	orrs r1, r2
	mov r2, sb
	strb r1, [r2]
	mov r1, r8
	orrs r0, r1
	strb r0, [r5]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	adds r0, r7, #0
	bl sub_80048B4
	movs r0, #0xc3
	movs r1, #0x93
	movs r2, #9
	adds r3, r7, #0
	bl sub_808B750
	ldr r4, _0809FEEC @ =0x02013658
	adds r0, r4, #0
	movs r1, #4
	bl InitText
	adds r0, r4, #0
	adds r0, #8
	movs r1, #3
	bl InitText
	bl sub_809F8A4
	adds r4, #0x10
	movs r5, #4
_0809FDDC:
	adds r0, r4, #0
	movs r1, #7
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809FDDC
	movs r2, #0x35
	adds r2, r2, r7
	mov r8, r2
	movs r0, #0x4c
	adds r0, r0, r7
	mov sb, r0
	ldr r4, _0809FEF0 @ =0x02013690
	movs r5, #7
_0809FDFC:
	adds r0, r4, #0
	movs r1, #7
	bl InitTextDb
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _0809FDFC
	movs r0, #0
	bl SetPrimaryHBlankHandler
	ldr r0, _0809FEF4 @ =PrepItemSupply_OnHBlank
	bl SetPrimaryHBlankHandler
	movs r4, #0x80
	lsls r4, r4, #7
	adds r0, r4, #0
	movs r1, #6
	bl sub_809F560
	ldr r5, _0809FEF8 @ =0x02022D86
	adds r0, r5, #0
	adds r1, r4, #0
	movs r2, #6
	bl PrepItemSupply_DrawConvoyWeaponIconTiles
	ldr r0, _0809FEFC @ =0x08A9651C
	ldr r1, _0809FF00 @ =0x06015000
	bl sub_8013008
	ldr r0, _0809FF04 @ =0x08A968D4
	movs r6, #0xa0
	lsls r6, r6, #2
	adds r1, r6, #0
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
	movs r2, #1
	bl sub_809A4BC
	ldr r4, _0809FEF0 @ =0x02013690
	ldr r1, _0809FF08 @ =0x02023CC6
	mov r2, r8
	ldrb r0, [r2]
	lsls r0, r0, #1
	add r0, sb
	ldrh r2, [r0]
	lsrs r2, r2, #4
	ldr r3, [r7, #0x2c]
	adds r0, r4, #0
	bl sub_809F59C
	movs r0, #4
	bl BG_EnableSyncByMask
	movs r0, #0xb3
	lsls r0, r0, #1
	adds r5, r5, r0
	subs r4, #0x28
	ldr r2, [r7, #0x2c]
	adds r0, r5, #0
	adds r1, r4, #0
	movs r3, #0
	bl sub_809DA14
	bl sub_809F968
	adds r0, r7, #0
	bl sub_80B1780
	movs r0, #0
	adds r1, r6, #0
	movs r2, #2
	bl sub_80B1794
	movs r0, #0x78
	movs r1, #0x18
	movs r2, #0xe9
	movs r3, #0x18
	bl sub_80B181C
	movs r0, #3
	bl sub_80B1800
	ldr r0, _0809FF0C @ =sub_809FAE4
	adds r1, r7, #0
	bl sub_80B1D98
	add sp, #8
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809FED8: .4byte 0x08A98484
_0809FEDC: .4byte 0x02020188
_0809FEE0: .4byte 0x020234A8
_0809FEE4: .4byte 0x08A98758
_0809FEE8: .4byte 0x03003020
_0809FEEC: .4byte 0x02013658
_0809FEF0: .4byte 0x02013690
_0809FEF4: .4byte 0x0809F7CD  @ PrepItemSupply_OnHBlank
_0809FEF8: .4byte 0x02022D86
_0809FEFC: .4byte 0x08A9651C
_0809FF00: .4byte 0x06015000
_0809FF04: .4byte 0x08A968D4
_0809FF08: .4byte 0x02023CC6
_0809FF0C: .4byte 0x0809FAE5  @ sub_809FAE4

