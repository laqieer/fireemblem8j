	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80CA4C4, "ax", %progbits
@ sub_80CA4C4 @ JP 0x080CA4C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CA4C4
	.thumb_func
sub_80CA4C4:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x2a]
	cmp r0, #4
	bls _080CA4D0
	b _080CA60C
_080CA4D0:
	lsls r0, r0, #2
	ldr r1, _080CA4DC @ =_080CA4E0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CA4DC: .4byte _080CA4E0
_080CA4E0: @ jump table
	.4byte _080CA4F4 @ case 0
	.4byte _080CA504 @ case 1
	.4byte _080CA578 @ case 2
	.4byte _080CA5CC @ case 3
	.4byte _080CA5E0 @ case 4
_080CA4F4:
	ldr r0, _080CA500 @ =0x08B3FCF4
	movs r1, #0xc0
	lsls r1, r1, #0x13
	bl sub_8013008
	b _080CA60C
	.align 2, 0
_080CA500: .4byte 0x08B3FCF4
_080CA504:
	ldr r0, _080CA550 @ =0x08B41C9C
	ldr r1, _080CA554 @ =0x06003000
	bl sub_8013008
	ldr r0, _080CA558 @ =0x08B43424
	ldr r4, _080CA55C @ =0x020234A8
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080CA560 @ =0x08B43988
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	adds r2, r5, #0
	adds r2, #0x29
	movs r0, #0xe0
	lsls r0, r0, #8
	adds r3, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CA530:
	ldrh r6, [r4]
	adds r0, r3, r6
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080CA530
	movs r1, #0
	ldrsb r1, [r2, r1]
	cmp r1, #0
	beq _080CA56C
	ldr r1, _080CA564 @ =0x020228A8
	ldr r0, _080CA568 @ =0x00007FFF
	strh r0, [r1]
	b _080CA60C
	.align 2, 0
_080CA550: .4byte 0x08B41C9C
_080CA554: .4byte 0x06003000
_080CA558: .4byte 0x08B43424
_080CA55C: .4byte 0x020234A8
_080CA560: .4byte 0x08B43988
_080CA564: .4byte 0x020228A8
_080CA568: .4byte 0x00007FFF
_080CA56C:
	ldr r0, _080CA574 @ =0x020228A8
	strh r1, [r0]
	b _080CA60C
	.align 2, 0
_080CA574: .4byte 0x020228A8
_080CA578:
	ldr r0, _080CA5B4 @ =0x08B439A8
	ldr r1, _080CA5B8 @ =0x06005000
	bl sub_8013008
	ldr r0, _080CA5BC @ =0x08B44838
	ldr r4, _080CA5C0 @ =0x02022CA8
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _080CA5C4 @ =0x08B44B20
	movs r1, #0xf0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080CA5C8 @ =0x0000F280
	adds r2, r0, #0
	movs r1, #0xa0
	lsls r1, r1, #2
_080CA59E:
	ldrh r3, [r4]
	adds r0, r2, r3
	strh r0, [r4]
	adds r4, #2
	subs r1, #1
	cmp r1, #0
	bne _080CA59E
	movs r0, #1
	bl BG_EnableSyncByMask
	b _080CA60C
	.align 2, 0
_080CA5B4: .4byte 0x08B439A8
_080CA5B8: .4byte 0x06005000
_080CA5BC: .4byte 0x08B44838
_080CA5C0: .4byte 0x02022CA8
_080CA5C4: .4byte 0x08B44B20
_080CA5C8: .4byte 0x0000F280
_080CA5CC:
	ldr r0, _080CA5D8 @ =0x08B44B40
	ldr r1, _080CA5DC @ =0x06010000
	bl sub_8013008
	b _080CA60C
	.align 2, 0
_080CA5D8: .4byte 0x08B44B40
_080CA5DC: .4byte 0x06010000
_080CA5E0:
	ldr r0, _080CA600 @ =0x08B45958
	ldr r1, _080CA604 @ =0x06012800
	bl sub_8013008
	ldr r0, _080CA608 @ =0x08B4678C
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x80
	bl sub_8000D68
	movs r0, #0
	strh r0, [r5, #0x2a]
	adds r0, r5, #0
	bl sub_8002DE4
	b _080CA612
	.align 2, 0
_080CA600: .4byte 0x08B45958
_080CA604: .4byte 0x06012800
_080CA608: .4byte 0x08B4678C
_080CA60C:
	ldrh r0, [r5, #0x2a]
	adds r0, #1
	strh r0, [r5, #0x2a]
_080CA612:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

