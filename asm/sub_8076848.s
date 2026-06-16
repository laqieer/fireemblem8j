	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set EkrGauge_Setup44, 0x08051EF4 + 1
	.set EndFaceById, 0x08005660 + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_805B80C, 0x0805B80C + 1
	.set sub_805BBB8, 0x0805BBB8 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8076848, "ax", %progbits
@ EkrLvup_ResetScreen @ JP 0x08076848 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global EkrLvup_ResetScreen
	.thumb_func
EkrLvup_ResetScreen:
	push {r4, r5, r6, lr}
	sub sp, #0x2c
	adds r5, r0, #0
	ldr r4, _0807695C @ =0x020200E0
	bl sub_805BDCC
	cmp r0, #0
	bne _0807685E
	adds r0, r4, #0
	bl sub_805BBB8
_0807685E:
	movs r1, #0xc0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	mov r4, sp
	ldr r2, _08076960 @ =0x0203E118
	ldrh r0, [r2]
	movs r6, #0
	strh r0, [r4]
	movs r0, #4
	strh r0, [r4, #2]
	movs r1, #0xa0
	lsls r1, r1, #2
	strh r1, [r4, #4]
	ldrh r0, [r2, #2]
	strh r0, [r4, #6]
	movs r0, #5
	strh r0, [r4, #8]
	strh r1, [r4, #0xa]
	ldr r0, _08076964 @ =0x0203E11C
	ldrh r0, [r0]
	strh r0, [r4, #0xc]
	movs r0, #2
	strh r0, [r4, #0xe]
	str r6, [sp, #0x1c]
	ldr r0, _08076968 @ =0x020145C8
	str r0, [sp, #0x20]
	ldr r0, _0807696C @ =0x0203E0FE
	ldrh r0, [r0]
	strh r0, [r4, #0x10]
	bl sub_805BDCC
	cmp r0, #0
	bne _080768D8
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	mov r0, sp
	bl sub_805B80C
_080768D8:
	ldr r3, [r5, #0x5c]
	ldrh r2, [r3, #8]
	ldr r1, _08076970 @ =0x0000F3FF
	adds r0, r1, #0
	ands r0, r2
	strh r0, [r3, #8]
	ldr r2, [r5, #0x5c]
	ldrh r0, [r2, #8]
	movs r4, #0x80
	lsls r4, r4, #4
	adds r3, r4, #0
	orrs r0, r3
	strh r0, [r2, #8]
	ldr r2, [r5, #0x60]
	ldrh r0, [r2, #8]
	ands r1, r0
	strh r1, [r2, #8]
	ldr r1, [r5, #0x60]
	ldrh r0, [r1, #8]
	orrs r0, r3
	strh r0, [r1, #8]
	str r6, [sp, #0x28]
	add r0, sp, #0x28
	ldr r1, _08076974 @ =0x020234A8
	ldr r2, _08076978 @ =0x01000200
	bl sub_80D636C
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #0
	bl EkrGauge_Setup44
	ldr r3, _0807697C @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0
	bl EndFaceById
	adds r0, r5, #0
	bl sub_8002DE4
	add sp, #0x2c
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807695C: .4byte 0x020200E0
_08076960: .4byte 0x0203E118
_08076964: .4byte 0x0203E11C
_08076968: .4byte 0x020145C8
_0807696C: .4byte 0x0203E0FE
_08076970: .4byte 0x0000F3FF
_08076974: .4byte 0x020234A8
_08076978: .4byte 0x01000200
_0807697C: .4byte 0x03003020

