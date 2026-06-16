	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitScanline, 0x080841B8 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set StartPaletteAnimatorReverse, 0x080144E0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014760, 0x08014760 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_8080CB8, 0x08080CB8 + 1
	.set sub_80841EC, 0x080841EC + 1
	.section .text.sub_8080B20, "ax", %progbits
@ MapAnimUnlock_Init @ JP 0x08080B20 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MapAnimUnlock_Init
	.thumb_func
MapAnimUnlock_Init:
	push {r4, r5, lr}
	sub sp, #0x10
	adds r5, r0, #0
	ldr r1, [r5, #0x30]
	movs r0, #0x8d
	bl sub_8014B50
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, _08080BCC @ =0x08A20DA8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08080BD0 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r4, _08080BD4 @ =0x02023CA8
	ldr r0, [r5, #0x30]
	cmp r0, #0
	bge _08080B56
	adds r0, #7
_08080B56:
	asrs r0, r0, #3
	subs r1, r0, #2
	ldr r2, [r5, #0x34]
	cmp r2, #0
	bge _08080B62
	adds r2, #7
_08080B62:
	asrs r2, r2, #3
	subs r2, #2
	ldr r3, _08080BD8 @ =0x00004140
	movs r0, #4
	str r0, [sp]
	str r0, [sp, #4]
	ldr r0, _08080BDC @ =0x08A20EC8
	str r0, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	bl sub_8014760
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, _08080BE0 @ =0x08A20D34
	ldr r1, _08080BE4 @ =0x06013800
	bl sub_8013008
	ldr r0, _08080BE8 @ =0x08A20D88
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _08080BEC @ =0x08A20EA8
	str r5, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorReverse
	bl InitScanline
	bl sub_80841EC
	bl sub_8080CB8
	movs r0, #1
	movs r1, #0x10
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	adds r1, r5, #0
	adds r1, #0x48
	movs r0, #1
	strh r0, [r1]
	add sp, #0x10
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08080BCC: .4byte 0x08A20DA8
_08080BD0: .4byte 0x06002800
_08080BD4: .4byte 0x02023CA8
_08080BD8: .4byte 0x00004140
_08080BDC: .4byte 0x08A20EC8
_08080BE0: .4byte 0x08A20D34
_08080BE4: .4byte 0x06013800
_08080BE8: .4byte 0x08A20D88
_08080BEC: .4byte 0x08A20EA8

