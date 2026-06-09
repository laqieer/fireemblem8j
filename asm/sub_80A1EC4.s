	.syntax unified
	.set StartItemHelpBox, 0x0808B0EC + 1
	.set StartPrepErrorHelpbox, 0x0809A080 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_808B2A4, 0x0808B2A4 + 1
	.set sub_809A21C, 0x0809A21C + 1
	.set sub_80A1D28, 0x080A1D28 + 1
	.set sub_80A1E10, 0x080A1E10 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1FBC, 0x080B1FBC + 1
	.section .text.sub_80A1EC4, "ax", %progbits
@ sub_80A1EC4 @ JP 0x080A1EC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A1EC4
	.thumb_func
sub_80A1EC4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _080A1EEC
	ldr r0, _080A1EE8 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x81
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A1FAC
	bl sub_808B2A4
	movs r0, #0
	strh r0, [r5, #0x36]
	b _080A1FEE
	.align 2, 0
_080A1EE8: .4byte 0x085775CC
_080A1EEC:
	ldr r0, _080A1F20 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A1F24
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r3, [r1]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A1FEE
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
	movs r0, #1
	strh r0, [r5, #0x36]
	b _080A1FEE
	.align 2, 0
_080A1F20: .4byte 0x085775CC
_080A1F24:
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080A1F80
	ldr r0, [r5, #0x2c]
	adds r1, r5, #0
	adds r1, #0x30
	ldrb r1, [r1]
	ldr r4, _080A1F64 @ =0x020122D4
	adds r2, r5, #0
	adds r2, #0x33
	ldrb r3, [r2]
	lsls r3, r3, #1
	adds r2, #5
	adds r2, r2, r3
	ldrh r2, [r2]
	lsls r2, r2, #2
	adds r2, r2, r4
	ldrh r2, [r2, #2]
	bl sub_809A21C
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080A1F6C
	movs r1, #1
	rsbs r1, r1, #0
	ldr r2, _080A1F68 @ =0x000006FC
	adds r0, r1, #0
	adds r3, r5, #0
	bl StartPrepErrorHelpbox
	b _080A1FEE
	.align 2, 0
_080A1F64: .4byte 0x020122D4
_080A1F68: .4byte 0x000006FC
_080A1F6C:
	movs r0, #0
	bl sub_80B1524
	adds r0, r5, #0
	bl sub_8002DE4
	adds r0, r5, #0
	bl sub_80A1E10
	b _080A1FEE
_080A1F80:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080A1FAC
	movs r0, #0
	bl sub_80B1524
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r0, _080A1FA8 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080A1FEE
	movs r0, #0x6b
	bl m4aSongNumStart
	b _080A1FEE
	.align 2, 0
_080A1FA8: .4byte 0x0202BCEC
_080A1FAC:
	adds r0, r5, #0
	bl sub_80A1D28
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080A1FEE
	adds r4, r5, #0
	adds r4, #0x30
	ldrb r1, [r4]
	lsls r1, r1, #4
	adds r1, #0x48
	movs r3, #0x80
	lsls r3, r3, #4
	movs r0, #0x10
	movs r2, #0xb
	bl sub_80B1FBC
	ldrh r0, [r5, #0x36]
	cmp r0, #1
	bne _080A1FEE
	ldr r0, [r5, #0x2c]
	ldrb r3, [r4]
	lsls r1, r3, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r2, [r0]
	cmp r2, #0
	beq _080A1FEE
	lsls r1, r3, #4
	adds r1, #0x48
	movs r0, #0x10
	bl StartItemHelpBox
_080A1FEE:
	pop {r4, r5}
	pop {r0}
	bx r0

