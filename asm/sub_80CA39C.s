	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundScreenSize, 0x08000FFC + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.section .text.sub_80CA39C, "ax", %progbits
@ sub_80CA39C @ JP 0x080CA39C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA39C
	.thumb_func
sub_80CA39C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _080CA4B0 @ =0x03003020
	ldrb r1, [r4]
	movs r0, #8
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4]
	movs r0, #0
	strb r0, [r4, #1]
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r0, #1
	movs r1, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xc0
	lsls r1, r1, #8
	movs r0, #3
	bl SetBackgroundTileDataOffset
	movs r1, #0xd0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	movs r1, #0xe0
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r1, #0xb0
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r1, #0xf0
	lsls r1, r1, #7
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
	ldr r0, _080CA4B4 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CA4B8 @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CA4BC @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CA4C0 @ =0x020244A8
	movs r1, #0
	bl sub_80011D0
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	bl SetDefaultColorEffects
	movs r0, #0xf
	bl BG_EnableSyncByMask
	movs r0, #0
	strh r0, [r5, #0x2a]
	str r0, [r5, #0x2c]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CA4B0: .4byte 0x03003020
_080CA4B4: .4byte 0x02022CA8
_080CA4B8: .4byte 0x020234A8
_080CA4BC: .4byte 0x02023CA8
_080CA4C0: .4byte 0x020244A8

