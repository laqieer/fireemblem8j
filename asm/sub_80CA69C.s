	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80CA69C, "ax", %progbits
@ sub_80CA69C @ JP 0x080CA69C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA69C
	.thumb_func
sub_80CA69C:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #4
	bls _080CA6A8
	b _080CA82C
_080CA6A8:
	lsls r0, r0, #2
	ldr r1, _080CA6B4 @ =_080CA6B8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA6B4: .4byte _080CA6B8
_080CA6B8: @ jump table
	.4byte _080CA6CC @ case 0
	.4byte _080CA720 @ case 1
	.4byte _080CA770 @ case 2
	.4byte _080CA7BC @ case 3
	.4byte _080CA800 @ case 4
_080CA6CC:
	movs r1, #0xc0
	lsls r1, r1, #8
	movs r0, #0
	bl SetBackgroundTileDataOffset
	movs r1, #0xf0
	lsls r1, r1, #7
	movs r0, #0
	bl SetBackgroundMapDataOffset
	ldr r0, _080CA704 @ =0x08B48938
	ldr r1, _080CA708 @ =0x06008000
	bl sub_8013008
	ldr r0, _080CA70C @ =0x08B48B34
	ldr r1, _080CA710 @ =0x0600B000
	bl sub_8013008
	ldr r0, _080CA714 @ =0x08B48D38
	movs r1, #0
	movs r2, #0x20
	bl sub_8000D68
	ldr r1, _080CA718 @ =0x020228A8
	ldr r0, _080CA71C @ =0x00007FFF
	strh r0, [r1]
	b _080CA82C
	.align 2, 0
_080CA704: .4byte 0x08B48938
_080CA708: .4byte 0x06008000
_080CA70C: .4byte 0x08B48B34
_080CA710: .4byte 0x0600B000
_080CA714: .4byte 0x08B48D38
_080CA718: .4byte 0x020228A8
_080CA71C: .4byte 0x00007FFF
_080CA720:
	ldr r0, _080CA75C @ =0x08B4682C
	ldr r1, _080CA760 @ =0x0600C000
	bl sub_8013008
	ldr r0, _080CA764 @ =0x08B47240
	ldr r4, _080CA768 @ =0x02022CA8
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080CA76C @ =0x08B474F0
	movs r1, #0x20
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0x80
	lsls r0, r0, #5
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CA746:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080CA746
	movs r0, #1
	bl BG_EnableSyncByMask
	b _080CA82C
	.align 2, 0
_080CA75C: .4byte 0x08B4682C
_080CA760: .4byte 0x0600C000
_080CA764: .4byte 0x08B47240
_080CA768: .4byte 0x02022CA8
_080CA76C: .4byte 0x08B474F0
_080CA770:
	ldr r0, _080CA7A8 @ =0x08B47510
	ldr r1, _080CA7AC @ =0x0600D000
	bl sub_8013008
	ldr r0, _080CA7B0 @ =0x08B4854C
	ldr r4, _080CA7B4 @ =0x02022CA8
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080CA7B8 @ =0x08B48918
	movs r1, #0x40
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0x82
	lsls r0, r0, #6
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CA796:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080CA796
	b _080CA82C
	.align 2, 0
_080CA7A8: .4byte 0x08B47510
_080CA7AC: .4byte 0x0600D000
_080CA7B0: .4byte 0x08B4854C
_080CA7B4: .4byte 0x02022CA8
_080CA7B8: .4byte 0x08B48918
_080CA7BC:
	ldr r0, _080CA7E8 @ =0x08B4AC4C
	ldr r1, _080CA7EC @ =0x06014400
	bl sub_8013008
	ldr r0, _080CA7F0 @ =0x08B4B134
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x60
	bl sub_8000D68
	ldr r0, _080CA7F4 @ =0x08B4B194
	ldr r1, _080CA7F8 @ =0x06015400
	bl sub_8013008
	ldr r0, _080CA7FC @ =0x08B4B1E0
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	b _080CA82C
	.align 2, 0
_080CA7E8: .4byte 0x08B4AC4C
_080CA7EC: .4byte 0x06014400
_080CA7F0: .4byte 0x08B4B134
_080CA7F4: .4byte 0x08B4B194
_080CA7F8: .4byte 0x06015400
_080CA7FC: .4byte 0x08B4B1E0
_080CA800:
	ldr r0, _080CA820 @ =0x08B4B200
	ldr r1, _080CA824 @ =0x06015800
	bl sub_8013008
	ldr r0, _080CA828 @ =0x08B4BB80
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl sub_8002DE4
	b _080CA832
	.align 2, 0
_080CA820: .4byte 0x08B4B200
_080CA824: .4byte 0x06015800
_080CA828: .4byte 0x08B4BB80
_080CA82C:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CA832:
	pop {r4, r5}
	pop {r0}
	bx r0

