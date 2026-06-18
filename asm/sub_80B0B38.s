	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set InitText, 0x08003C8C + 1
	.set ResetText, 0x08003BC4 + 1
	.set ResetTextFont, 0x08003C50 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_80B0A94, 0x080B0A94 + 1
	.set sub_80B0AE8, 0x080B0AE8 + 1
	.set sub_80B1138, 0x080B1138 + 1
	.section .text.sub_80B0B38, "ax", %progbits
@ InitDifficultySelectScreen @ JP 0x080B0B38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global InitDifficultySelectScreen
	.thumb_func
InitDifficultySelectScreen:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl ResetTextFont
	bl sub_804F8F4
	bl ResetText
	adds r4, r6, #0
	adds r4, #0x38
	movs r5, #4
_080B0B4E:
	adds r0, r4, #0
	movs r1, #0xe
	bl InitText
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bge _080B0B4E
	movs r5, #0
	ldr r0, _080B0C24 @ =0x08AA2D34
	movs r4, #0x80
	lsls r4, r4, #1
	adds r1, r4, #0
	adds r2, r4, #0
	bl sub_8000D68
	ldr r0, _080B0C28 @ =0x08AA3840
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B0C2C @ =0x08AA51BC
	movs r1, #0x90
	lsls r1, r1, #2
	adds r2, r4, #0
	bl sub_8000D68
	ldr r0, _080B0C30 @ =0x08AA7310
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080B0C34 @ =0x08AA65A8
	ldr r1, _080B0C38 @ =0x06010800
	bl sub_8013008
	ldr r0, _080B0C3C @ =0x08AA7094
	movs r1, #0x88
	lsls r1, r1, #2
	movs r2, #0xa0
	lsls r2, r2, #1
	bl sub_8000D68
	bl sub_8001EE4
	ldr r0, [r6, #0x14]
	ldr r0, [r0, #0x58]
	adds r0, #0x29
	strb r5, [r0]
	ldr r0, _080B0C40 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r4, _080B0C44 @ =0x020234A8
	adds r0, r4, #0
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xd1
	lsls r0, r0, #1
	adds r4, r4, r0
	ldr r1, _080B0C48 @ =0x08AA71D4
	movs r2, #0x80
	lsls r2, r2, #5
	adds r0, r4, #0
	bl j_TmApplyTsa
	adds r0, r6, #0
	bl sub_80B0A94
	adds r0, r6, #0
	bl sub_80B0AE8
	movs r0, #3
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	bl sub_80B1138
	str r0, [r6, #0x34]
	adds r1, r6, #0
	adds r1, #0x30
	strb r5, [r1]
	ldr r0, [r6, #0x34]
	adds r0, #0x2b
	strb r5, [r0]
	ldr r2, [r6, #0x34]
	ldr r3, _080B0C4C @ =0x08A9D964
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #0x2c]
	ldr r2, [r6, #0x34]
	ldrb r0, [r1]
	lsls r0, r0, #2
	adds r0, r0, r3
	ldrb r0, [r0, #1]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	strh r0, [r2, #0x2e]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B0C24: .4byte 0x08AA2D34
_080B0C28: .4byte 0x08AA3840
_080B0C2C: .4byte 0x08AA51BC
_080B0C30: .4byte 0x08AA7310
_080B0C34: .4byte 0x08AA65A8
_080B0C38: .4byte 0x06010800
_080B0C3C: .4byte 0x08AA7094
_080B0C40: .4byte 0x02022CA8
_080B0C44: .4byte 0x020234A8
_080B0C48: .4byte 0x08AA71D4
_080B0C4C: .4byte 0x08A9D964

