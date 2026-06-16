	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8009608, 0x08009608 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.section .text.sub_8080810, "ax", %progbits
@ MapAnimSilence_InitGfx @ JP 0x08080810 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnimSilence_InitGfx
	.thumb_func
MapAnimSilence_InitGfx:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r1, [r6, #0x30]
	movs r0, #0x83
	bl sub_8014B50
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8080CB8
	ldr r4, _080808A8 @ =0x08A22CA0
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080808AC @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080808B0 @ =0x08A22860
	ldr r1, _080808B4 @ =0x06013800
	bl sub_8013008
	ldr r4, _080808B8 @ =0x08A22DB0
	adds r0, r4, #0
	movs r1, #0x80
	movs r2, #0x20
	bl sub_8000D68
	movs r1, #0xa0
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080808BC @ =0x08A22DD0
	ldr r1, [r6, #0x30]
	ldr r2, [r6, #0x34]
	movs r3, #0x80
	lsls r3, r3, #3
	orrs r2, r3
	ldr r3, _080808C0 @ =0x000041C0
	movs r5, #0
	str r5, [sp]
	movs r4, #2
	str r4, [sp, #4]
	bl sub_8009608
	adds r6, #0x48
	strh r5, [r6]
	movs r0, #1
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080808A8: .4byte 0x08A22CA0
_080808AC: .4byte 0x06002800
_080808B0: .4byte 0x08A22860
_080808B4: .4byte 0x06013800
_080808B8: .4byte 0x08A22DB0
_080808BC: .4byte 0x08A22DD0
_080808C0: .4byte 0x000041C0

