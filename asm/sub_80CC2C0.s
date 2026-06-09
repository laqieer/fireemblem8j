	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CC2C0, "ax", %progbits
@ sub_80CC2C0 @ JP 0x080CC2C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC2C0
	.thumb_func
sub_80CC2C0:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #6
	bls _080CC2CC
	b _080CC514
_080CC2CC:
	lsls r0, r0, #2
	ldr r1, _080CC2D8 @ =_080CC2DC
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CC2D8: .4byte _080CC2DC
_080CC2DC: @ jump table
	.4byte _080CC2F8 @ case 0
	.4byte _080CC364 @ case 1
	.4byte _080CC390 @ case 2
	.4byte _080CC3C0 @ case 3
	.4byte _080CC3FC @ case 4
	.4byte _080CC420 @ case 5
	.4byte _080CC45C @ case 6
_080CC2F8:
	ldr r4, _080CC34C @ =0x08B51798
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080CC350 @ =0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CC354 @ =0x08B521A8
	ldr r1, _080CC358 @ =0x020244A8
	bl sub_8013008
	ldr r0, _080CC35C @ =0x020228A8
	ldr r1, _080CC360 @ =0x00007FFF
	movs r2, #0xe1
	lsls r2, r2, #1
	adds r0, r0, r2
	movs r2, #0xe
_080CC320:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080CC320
	movs r4, #0xe1
	lsls r4, r4, #8
	adds r3, r4, #0
	ldr r1, _080CC358 @ =0x020244A8
	movs r2, #0xa0
	lsls r2, r2, #2
_080CC336:
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080CC336
	movs r0, #8
	bl BG_EnableSyncByMask
	b _080CC514
	.align 2, 0
_080CC34C: .4byte 0x08B51798
_080CC350: .4byte 0x06002000
_080CC354: .4byte 0x08B521A8
_080CC358: .4byte 0x020244A8
_080CC35C: .4byte 0x020228A8
_080CC360: .4byte 0x00007FFF
_080CC364:
	ldr r4, _080CC384 @ =0x08B58B30
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CC388 @ =0x08B5B240
	ldr r1, _080CC38C @ =0x02020188
	bl sub_8013008
	b _080CC514
	.align 2, 0
_080CC384: .4byte 0x08B58B30
_080CC388: .4byte 0x08B5B240
_080CC38C: .4byte 0x02020188
_080CC390:
	ldr r4, _080CC3B0 @ =0x08B5A5A0
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _080CC3B4 @ =0x06002000
	adds r1, r1, r2
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CC3B8 @ =0x08B5B560
	ldr r1, _080CC3BC @ =0x02020988
	bl sub_8013008
	b _080CC514
	.align 2, 0
_080CC3B0: .4byte 0x08B5A5A0
_080CC3B4: .4byte 0x06002000
_080CC3B8: .4byte 0x08B5B560
_080CC3BC: .4byte 0x02020988
_080CC3C0:
	ldr r4, _080CC3EC @ =0x08B54B14
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r3, #0xc0
	lsls r3, r3, #0x13
	adds r1, r1, r3
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CC3F0 @ =0x08B55A3C
	ldr r1, _080CC3F4 @ =0x02021188
	bl sub_8013008
	ldr r0, _080CC3F8 @ =0x08B5B654
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	b _080CC514
	.align 2, 0
_080CC3EC: .4byte 0x08B54B14
_080CC3F0: .4byte 0x08B55A3C
_080CC3F4: .4byte 0x02021188
_080CC3F8: .4byte 0x08B5B654
_080CC3FC:
	ldr r0, _080CC410 @ =0x08B57CCC
	ldr r1, _080CC414 @ =0x06008000
	bl sub_8013008
	ldr r0, _080CC418 @ =0x08B58938
	ldr r1, _080CC41C @ =0x0600C000
	bl sub_8013008
	b _080CC514
	.align 2, 0
_080CC410: .4byte 0x08B57CCC
_080CC414: .4byte 0x06008000
_080CC418: .4byte 0x08B58938
_080CC41C: .4byte 0x0600C000
_080CC420:
	ldr r0, _080CC44C @ =0x08B56D10
	ldr r1, _080CC450 @ =0x0600A000
	bl sub_8013008
	ldr r0, _080CC454 @ =0x08B57AE8
	ldr r4, _080CC458 @ =0x0600C800
	adds r1, r4, #0
	bl sub_8013008
	movs r0, #0x80
	lsls r0, r0, #1
	adds r1, r0, #0
	movs r2, #0xa0
	lsls r2, r2, #2
_080CC43C:
	ldrh r3, [r4]
	adds r0, r1, r3
	strh r0, [r4]
	adds r4, #2
	subs r2, #1
	cmp r2, #0
	bne _080CC43C
	b _080CC514
	.align 2, 0
_080CC44C: .4byte 0x08B56D10
_080CC450: .4byte 0x0600A000
_080CC454: .4byte 0x08B57AE8
_080CC458: .4byte 0x0600C800
_080CC45C:
	ldr r3, _080CC4FC @ =0x02021188
	ldr r0, _080CC500 @ =0x020228A8
	movs r1, #0
	movs r4, #0xf1
	lsls r4, r4, #1
	adds r0, r0, r4
	movs r2, #0xe
_080CC46A:
	strh r1, [r0]
	adds r0, #2
	subs r2, #1
	cmp r2, #0
	bge _080CC46A
	movs r0, #0x80
	lsls r0, r0, #4
	adds r4, r3, r0
	movs r2, #0x80
	lsls r2, r2, #2
	adds r0, r3, #0
	adds r1, r4, #0
	bl sub_80D636C
	adds r7, r4, #0
	ldr r6, _080CC504 @ =0x00000FFF
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r4, r2, #0
	adds r3, r7, #0
	movs r2, #0xa0
	lsls r2, r2, #2
_080CC496:
	ldrh r1, [r3]
	adds r0, r6, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r3]
	adds r3, #2
	subs r2, #1
	cmp r2, #0
	bne _080CC496
	ldr r1, _080CC508 @ =0x0600F000
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r7, #0
	bl sub_80D636C
	bl sub_8001EE4
	ldr r2, _080CC50C @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r0, #0
	strh r0, [r5, #0x2a]
	strh r0, [r5, #0x30]
	strh r0, [r5, #0x32]
	ldr r1, _080CC510 @ =0x02022188
	strh r0, [r1]
	strh r0, [r1, #2]
	strh r0, [r1, #4]
	movs r2, #0xa0
	strh r2, [r1, #6]
	strh r0, [r1, #0xc]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	adds r0, r5, #0
	bl sub_8002DE4
	b _080CC51A
	.align 2, 0
_080CC4FC: .4byte 0x02021188
_080CC500: .4byte 0x020228A8
_080CC504: .4byte 0x00000FFF
_080CC508: .4byte 0x0600F000
_080CC50C: .4byte 0x03003020
_080CC510: .4byte 0x02022188
_080CC514:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CC51A:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

