	.syntax unified
	.set EfxDecodeSplitedPalette, 0x08073AE8 + 1
	.set EfxStatusUnitFlashing, 0x080558C8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetUnitEfxDebuff, 0x080558AC + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8027144, 0x08027144 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_807B4B8, 0x0807B4B8 + 1
	.section .text.sub_805596C, "ax", %progbits
@ sub_805596C @ JP 0x0805596C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805596C
	.thumb_func
sub_805596C:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	adds r4, r0, #0
	ldr r0, [r4, #0x5c]
	bl GetUnitEfxDebuff
	cmp r0, #0
	bne _0805597E
	b _08055B1A
_0805597E:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	bne _0805598A
	b _08055B1A
_0805598A:
	ldr r1, [r4, #0x4c]
	ldr r0, [r4, #0x50]
	cmp r1, r0
	beq _0805599A
	movs r0, #0
	strh r0, [r4, #0x2c]
	str r0, [r4, #0x44]
	str r1, [r4, #0x50]
_0805599A:
	adds r0, r4, #0
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r2, r0, #0x10
	cmp r2, #0
	blt _08055A34
	ldr r0, [r4, #0x4c]
	subs r0, #1
	cmp r0, #0xc
	bhi _08055A2E
	lsls r0, r0, #2
	ldr r1, _080559C4 @ =_080559C8
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080559C4: .4byte _080559C8
_080559C8: @ jump table
	.4byte _080559FC @ case 0
	.4byte _08055A04 @ case 1
	.4byte _08055A2E @ case 2
	.4byte _08055A0C @ case 3
	.4byte _08055A2E @ case 4
	.4byte _08055A2E @ case 5
	.4byte _08055A2E @ case 6
	.4byte _08055A2E @ case 7
	.4byte _08055A2E @ case 8
	.4byte _08055A2E @ case 9
	.4byte _08055A12 @ case 10
	.4byte _08055A1C @ case 11
	.4byte _08055A12 @ case 12
_080559FC:
	movs r0, #0
	strh r2, [r4, #0x32]
	strh r0, [r4, #0x34]
	b _08055A32
_08055A04:
	movs r0, #0
	strh r0, [r4, #0x32]
	strh r0, [r4, #0x34]
	b _08055A32
_08055A0C:
	movs r0, #0
	strh r2, [r4, #0x32]
	b _08055A16
_08055A12:
	movs r0, #0x10
	strh r0, [r4, #0x32]
_08055A16:
	strh r0, [r4, #0x34]
	strh r0, [r4, #0x36]
	b _08055A34
_08055A1C:
	strh r2, [r4, #0x32]
	strh r2, [r4, #0x34]
	adds r0, r2, #1
	cmp r0, #0
	bge _08055A28
	adds r0, r2, #4
_08055A28:
	asrs r0, r0, #2
	strh r0, [r4, #0x36]
	b _08055A34
_08055A2E:
	strh r2, [r4, #0x32]
	strh r2, [r4, #0x34]
_08055A32:
	strh r2, [r4, #0x36]
_08055A34:
	ldr r0, [r4, #0x4c]
	subs r0, #1
	cmp r0, #0xc
	bhi _08055B16
	lsls r0, r0, #2
	ldr r1, _08055A48 @ =_08055A4C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08055A48: .4byte _08055A4C
_08055A4C: @ jump table
	.4byte _08055A80 @ case 0
	.4byte _08055A80 @ case 1
	.4byte _08055B04 @ case 2
	.4byte _08055A80 @ case 3
	.4byte _08055B16 @ case 4
	.4byte _08055B16 @ case 5
	.4byte _08055B16 @ case 6
	.4byte _08055B16 @ case 7
	.4byte _08055B16 @ case 8
	.4byte _08055B16 @ case 9
	.4byte _08055A9C @ case 10
	.4byte _08055A88 @ case 11
	.4byte _08055A9C @ case 12
_08055A80:
	ldr r0, [r4, #0x5c]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	b _08055A8E
_08055A88:
	ldr r0, [r4, #0x5c]
	movs r6, #0x32
	ldrsh r1, [r4, r6]
_08055A8E:
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl EfxStatusUnitFlashing
	b _08055B16
_08055A9C:
	ldr r0, [r4, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08055AD0
	ldr r0, _08055AC8 @ =0x02022B88
	ldr r1, _08055ACC @ =0x020222A8
	adds r2, r1, #0
	adds r2, #0x30
	movs r6, #0xc0
	lsls r6, r6, #1
	adds r3, r1, r6
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
	b _08055AEE
	.align 2, 0
_08055AC8: .4byte 0x02022B88
_08055ACC: .4byte 0x020222A8
_08055AD0:
	ldr r0, _08055AFC @ =0x02022BC8
	ldr r1, _08055B00 @ =0x02022308
	adds r2, r1, #0
	adds r2, #0x30
	movs r5, #0xa8
	lsls r5, r5, #2
	adds r3, r1, r5
	movs r5, #0x10
	str r5, [sp]
	movs r6, #0x32
	ldrsh r4, [r4, r6]
	str r4, [sp, #4]
	str r5, [sp, #8]
	bl EfxDecodeSplitedPalette
_08055AEE:
	bl RefreshEntityBmMaps
	bl sub_8027144
	bl sub_807B4B8
	b _08055B16
	.align 2, 0
_08055AFC: .4byte 0x02022BC8
_08055B00: .4byte 0x02022308
_08055B04:
	ldr r0, [r4, #0x5c]
	movs r2, #0x32
	ldrsh r1, [r4, r2]
	movs r3, #0x34
	ldrsh r2, [r4, r3]
	movs r5, #0x36
	ldrsh r3, [r4, r5]
	bl EfxStatusUnitFlashing
_08055B16:
	bl sub_8001EE4
_08055B1A:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

