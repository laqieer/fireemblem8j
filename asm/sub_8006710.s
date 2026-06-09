	.syntax unified
	.set ClearTalkFaceRefs, 0x080066EC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitText, 0x08003C8C + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8003BE8, 0x08003BE8 + 1
	.set sub_8003D90, 0x08003D90 + 1
	.set sub_800687C, 0x0800687C + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_8006710, "ax", %progbits
@ sub_8006710 @ JP 0x08006710 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8006710
	.thumb_func
sub_8006710:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	lsls r2, r2, #0x18
	asrs r7, r2, #0x18
	ldr r4, _08006794 @ =0x030000E8
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08006798 @ =0x000003FF
	ands r0, r5
	lsls r0, r0, #5
	movs r2, #0xc0
	lsls r2, r2, #0x13
	adds r0, r0, r2
	adds r1, r1, r0
	adds r0, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl sub_8003BE8
	bl sub_800687C
	ldr r0, _0800679C @ =0x085B90D4
	ldr r0, [r0]
	strb r6, [r0, #0xa]
	cmp r6, #0
	ble _08006766
	ldr r4, _080067A0 @ =0x030000C8
	adds r5, r6, #0
_0800674E:
	adds r0, r4, #0
	movs r1, #0x1e
	bl InitText
	adds r0, r4, #0
	movs r1, #1
	bl sub_8003D90
	adds r4, #8
	subs r5, #1
	cmp r5, #0
	bne _0800674E
_08006766:
	cmp r7, #0
	beq _08006788
	ldr r4, _080067A4 @ =0x08A5A35C
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080067A8 @ =0x06000200
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080067AC @ =0x08A5A5F8
	movs r1, #0x60
	movs r2, #0x20
	bl sub_8000D68
_08006788:
	bl ClearTalkFaceRefs
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08006794: .4byte 0x030000E8
_08006798: .4byte 0x000003FF
_0800679C: .4byte 0x085B90D4
_080067A0: .4byte 0x030000C8
_080067A4: .4byte 0x08A5A35C
_080067A8: .4byte 0x06000200
_080067AC: .4byte 0x08A5A5F8

