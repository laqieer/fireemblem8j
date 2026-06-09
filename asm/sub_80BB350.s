	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.section .text.sub_80BB350, "ax", %progbits
@ sub_80BB350 @ JP 0x080BB350 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB350
	.thumb_func
sub_80BB350:
	push {r4, r5, lr}
	ldr r0, _080BB3BC @ =0x08AC30D4
	movs r1, #0xc0
	lsls r1, r1, #1
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _080BB3C0 @ =0x08BB059C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x40
	bl sub_8000D68
	ldr r4, _080BB3C4 @ =0x020244A8
	movs r0, #3
	bl GetBackgroundTileDataOffset
	movs r1, #0x80
	lsls r1, r1, #8
	subs r1, r1, r0
	lsls r1, r1, #0xf
	lsrs r1, r1, #0x14
	movs r0, #0xe0
	lsls r0, r0, #8
	adds r1, r1, r0
	movs r2, #0
	ldr r3, _080BB3C8 @ =0x0000027F
_080BB386:
	adds r0, r2, r1
	strh r0, [r4]
	adds r4, #2
	adds r2, #1
	cmp r2, r3
	ble _080BB386
	ldr r4, _080BB3CC @ =0x02023CA8
	ldr r1, _080BB3D0 @ =0x08AC39B0
	ldr r5, _080BB3D4 @ =0x0000C260
	adds r0, r4, #0
	adds r2, r5, #0
	bl j_TmApplyTsa
	movs r0, #0x90
	lsls r0, r0, #3
	adds r4, r4, r0
	ldr r1, _080BB3D8 @ =0x08AC3A2C
	adds r0, r4, #0
	adds r2, r5, #0
	bl j_TmApplyTsa
	movs r0, #0xc
	bl BG_EnableSyncByMask
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080BB3BC: .4byte 0x08AC30D4
_080BB3C0: .4byte 0x08BB059C
_080BB3C4: .4byte 0x020244A8
_080BB3C8: .4byte 0x0000027F
_080BB3CC: .4byte 0x02023CA8
_080BB3D0: .4byte 0x08AC39B0
_080BB3D4: .4byte 0x0000C260
_080BB3D8: .4byte 0x08AC3A2C

