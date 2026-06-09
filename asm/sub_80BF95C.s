	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GMapScreen_ApplyTilePalettes, 0x080BF368 + 1
	.set GMapScreen_FillBg3TileIndices, 0x080BF2F0 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80BF6B4, 0x080BF6B4 + 1
	.set sub_80BF73C, 0x080BF73C + 1
	.section .text.sub_80BF95C, "ax", %progbits
@ sub_80BF95C @ JP 0x080BF95C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BF95C
	.thumb_func
sub_80BF95C:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, #0x29
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BFA36
	ldr r0, _080BF984 @ =0x03005270
	ldrh r1, [r0, #2]
	strh r1, [r4, #0x34]
	ldrh r0, [r0, #4]
	strh r0, [r4, #0x36]
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	cmp r1, #0
	bge _080BF988
	movs r0, #0
	b _080BF98E
	.align 2, 0
_080BF984: .4byte 0x03005270
_080BF988:
	cmp r1, #0xf0
	ble _080BF990
	movs r0, #0xf0
_080BF98E:
	strh r0, [r4, #0x34]
_080BF990:
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BF99C
	movs r0, #0
	strh r0, [r4, #0x36]
_080BF99C:
	movs r1, #0x34
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BF9A6
	adds r0, #7
_080BF9A6:
	asrs r0, r0, #3
	adds r7, r4, #0
	adds r7, #0x2d
	strb r0, [r7]
	movs r1, #0x36
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _080BF9B8
	adds r0, #7
_080BF9B8:
	asrs r0, r0, #3
	adds r6, r4, #0
	adds r6, #0x2e
	strb r0, [r6]
	adds r5, r4, #0
	adds r5, #0x2a
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _080BF9E2
	ldr r0, _080BFA3C @ =0x08B1B278
	movs r1, #0x90
	lsls r1, r1, #1
	movs r2, #0x80
	bl sub_8000D68
	ldrb r1, [r5]
	movs r0, #0xfb
	ands r0, r1
	strb r0, [r5]
_080BF9E2:
	ldrb r1, [r5]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080BFA02
	ldr r0, [r4, #0x48]
	movs r1, #0
	ldrsb r1, [r7, r1]
	movs r2, #0
	ldrsb r2, [r6, r2]
	bl sub_80BF6B4
	ldrb r1, [r5]
	movs r0, #0xfd
	ands r0, r1
	strb r0, [r5]
_080BFA02:
	ldrb r1, [r5]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080BFA1E
	bl GMapScreen_FillBg3TileIndices
	adds r0, r4, #0
	bl GMapScreen_ApplyTilePalettes
	ldrb r1, [r5]
	movs r0, #0xfe
	ands r0, r1
	strb r0, [r5]
_080BFA1E:
	adds r0, r4, #0
	bl sub_80BF73C
	ldrh r1, [r4, #0x34]
	ldrh r2, [r4, #0x36]
	movs r0, #3
	bl BG_SetPosition
	ldrh r0, [r4, #0x34]
	strh r0, [r4, #0x38]
	ldrh r0, [r4, #0x36]
	strh r0, [r4, #0x3a]
_080BFA36:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BFA3C: .4byte 0x08B1B278

