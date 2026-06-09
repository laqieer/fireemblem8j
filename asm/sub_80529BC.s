	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8052AF8, 0x08052AF8 + 1
	.set sub_8052C14, 0x08052C14 + 1
	.set sub_805BDCC, 0x0805BDCC + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80529BC, "ax", %progbits
@ sub_80529BC @ JP 0x080529BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80529BC
	.thumb_func
sub_80529BC:
	push {r4, r5, r6, lr}
	sub sp, #0x10
	ldr r4, _08052AB0 @ =0x03003020
	ldrb r0, [r4]
	movs r2, #8
	rsbs r2, r2, #0
	ands r2, r0
	ldrb r0, [r4, #1]
	movs r5, #1
	orrs r0, r5
	movs r6, #2
	orrs r0, r6
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
	movs r0, #0x41
	rsbs r0, r0, #0
	ands r2, r0
	strb r2, [r4]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #2
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #3
	bl SetBackgroundTileDataOffset
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
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #3
	bl SetBackgroundMapDataOffset
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	orrs r0, r5
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	orrs r1, r6
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	movs r4, #0
	str r4, [sp]
	ldr r1, _08052AB4 @ =0x02022CA8
	ldr r5, _08052AB8 @ =0x01000200
	mov r0, sp
	adds r2, r5, #0
	bl sub_80D636C
	str r4, [sp, #4]
	add r0, sp, #4
	ldr r1, _08052ABC @ =0x020234A8
	adds r2, r5, #0
	bl sub_80D636C
	str r4, [sp, #8]
	add r0, sp, #8
	ldr r6, _08052AC0 @ =0x02023CA8
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80D636C
	bl sub_805BDCC
	cmp r0, #0
	bne _08052AC4
	bl sub_8052AF8
	b _08052AD0
	.align 2, 0
_08052AB0: .4byte 0x03003020
_08052AB4: .4byte 0x02022CA8
_08052AB8: .4byte 0x01000200
_08052ABC: .4byte 0x020234A8
_08052AC0: .4byte 0x02023CA8
_08052AC4:
	str r4, [sp, #0xc]
	add r0, sp, #0xc
	adds r1, r6, #0
	adds r2, r5, #0
	bl sub_80D636C
_08052AD0:
	bl sub_8052C14
	bl sub_8001EE4
	movs r0, #1
	bl BG_EnableSyncByMask
	movs r0, #2
	bl BG_EnableSyncByMask
	movs r0, #4
	bl BG_EnableSyncByMask
	bl SetDefaultColorEffects
	add sp, #0x10
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

