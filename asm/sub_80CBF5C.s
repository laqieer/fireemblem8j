	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80CBF5C, "ax", %progbits
@ sub_80CBF5C @ JP 0x080CBF5C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CBF5C
	.thumb_func
sub_80CBF5C:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r6, r0, #0
	ldr r5, _080CC0A8 @ =0x03003020
	ldrb r1, [r5]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r5]
	movs r0, #0
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r4, #0x80
	lsls r4, r4, #7
	movs r0, #2
	adds r1, r4, #0
	bl SetBackgroundTileDataOffset
	movs r0, #3
	adds r1, r4, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xd8
	lsls r1, r1, #8
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xe0
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xe8
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
	ldrb r2, [r5, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r5, #0xc]
	ldrb r2, [r5, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r5, #0x10]
	ldrb r0, [r5, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r5, #0x14]
	ldrb r0, [r5, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r5, #0x18]
	movs r0, #0
	strb r0, [r5, #1]
	ldr r0, _080CC0AC @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CC0B0 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CC0B4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CC0B8 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	strh r4, [r6, #0x2a]
	strh r4, [r6, #0x38]
	strh r4, [r6, #0x3a]
	strh r4, [r6, #0x3c]
	adds r1, r6, #0
	adds r1, #0x46
	strb r0, [r1]
	strh r4, [r6, #0x3e]
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080CC0A8: .4byte 0x03003020
_080CC0AC: .4byte 0x02022CA8
_080CC0B0: .4byte 0x020234A8
_080CC0B4: .4byte 0x02023CA8
_080CC0B8: .4byte 0x020244A8

