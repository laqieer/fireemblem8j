	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set StartBgmExt, 0x08002434 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CBB30, "ax", %progbits
@ sub_80CBB30 @ JP 0x080CBB30 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBB30
	.thumb_func
sub_80CBB30:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r4, _080CBCF4 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r0, #3
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xd8
	lsls r1, r1, #8
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r1, #0xf8
	lsls r1, r1, #8
	movs r0, #3
	bl SetBackgroundMapDataOffset
	movs r0, #0
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #1
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #2
	movs r1, #0
	bl SetBackgroundScreenSize
	movs r0, #3
	movs r1, #0
	bl SetBackgroundScreenSize
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
	ldr r4, _080CBCF8 @ =0x08B4BBA0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CBCFC @ =0x08B4F758
	ldr r1, _080CBD00 @ =0x0600F000
	bl sub_8013008
	movs r0, #0
	str r0, [sp, #4]
	ldr r1, _080CBD04 @ =0x020228A8
	ldr r2, _080CBD08 @ =0x01000008
	add r0, sp, #4
	bl sub_80D636C
	ldr r0, _080CBD0C @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #1
	bl BG_EnableSyncByMask
	ldr r4, _080CBD10 @ =0x08B4FCF4
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CBD14 @ =0x08B51778
	movs r1, #0x40
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r4, _080CBD18 @ =0x0600E800
	ldr r0, _080CBD1C @ =0x08B51488
	adds r1, r4, #0
	bl sub_8013008
	movs r0, #0x80
	lsls r0, r0, #6
	adds r1, r0, #0
	movs r5, #0x80
	lsls r5, r5, #3
_080CBC7E:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	subs r5, #1
	adds r4, #2
	cmp r5, #0
	bne _080CBC7E
	bl sub_8001EE4
	movs r0, #1
	movs r1, #0
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #1
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	strh r5, [r6, #0x2a]
	strh r5, [r6, #0x34]
	strh r5, [r6, #0x36]
	ldr r2, _080CBCF4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl StartBgmExt
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CBCF4: .4byte 0x03003020
_080CBCF8: .4byte 0x08B4BBA0
_080CBCFC: .4byte 0x08B4F758
_080CBD00: .4byte 0x0600F000
_080CBD04: .4byte 0x020228A8
_080CBD08: .4byte 0x01000008
_080CBD0C: .4byte 0x02022CA8
_080CBD10: .4byte 0x08B4FCF4
_080CBD14: .4byte 0x08B51778
_080CBD18: .4byte 0x0600E800
_080CBD1C: .4byte 0x08B51488

