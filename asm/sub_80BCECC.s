	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set StartBgm, 0x08002424 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80B021C, 0x080B021C + 1
	.section .text.sub_80BCECC, "ax", %progbits
@ sub_80BCECC @ JP 0x080BCECC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCECC
	.thumb_func
sub_80BCECC:
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r6, _080BCFEC @ =0x02023CA8
	adds r0, r6, #0
	movs r1, #0
	bl sub_80011D0
	ldr r5, _080BCFF0 @ =0x020244A8
	adds r0, r5, #0
	movs r1, #0
	bl sub_80011D0
	ldr r2, _080BCFF4 @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0x10]
	ldrb r0, [r2, #0x14]
	ands r1, r0
	movs r3, #2
	orrs r1, r3
	strb r1, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r2, #0x18]
	ldrb r0, [r2, #1]
	orrs r0, r4
	orrs r0, r3
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r4, _080BCFF8 @ =0x08A9E5C0
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080BCFFC @ =0x08AA2D34
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl sub_8000D68
	ldr r1, _080BD000 @ =0x08AA2E34
	movs r2, #0x80
	lsls r2, r2, #8
	adds r0, r5, #0
	bl j_TmApplyTsa
	ldr r4, _080BD004 @ =0x08AA32E8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080BD008 @ =0x06004C00
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080BD00C @ =0x08AA3860
	ldr r4, _080BD010 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080BD014 @ =0x08AA3840
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8000D68
	ldr r2, _080BD018 @ =0x00007260
	adds r0, r6, #0
	adds r1, r4, #0
	bl j_TmApplyTsa
	movs r0, #0xc
	bl BG_EnableSyncByMask
	ldr r0, _080BD01C @ =0x02000000
	bl sub_80B021C
	movs r0, #0x46
	movs r1, #0
	bl StartBgm
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080BCFEC: .4byte 0x02023CA8
_080BCFF0: .4byte 0x020244A8
_080BCFF4: .4byte 0x03003020
_080BCFF8: .4byte 0x08A9E5C0
_080BCFFC: .4byte 0x08AA2D34
_080BD000: .4byte 0x08AA2E34
_080BD004: .4byte 0x08AA32E8
_080BD008: .4byte 0x06004C00
_080BD00C: .4byte 0x08AA3860
_080BD010: .4byte 0x02020188
_080BD014: .4byte 0x08AA3840
_080BD018: .4byte 0x00007260
_080BD01C: .4byte 0x02000000

