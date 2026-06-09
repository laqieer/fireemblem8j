	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EndFaceById, 0x08005660 + 1
	.set ResetFaces, 0x08005430 + 1
	.set ResetText, 0x08003BC4 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_80048D8, 0x080048D8 + 1
	.set sub_80153A4, 0x080153A4 + 1
	.set sub_801569C, 0x0801569C + 1
	.set sub_804F8F4, 0x0804F8F4 + 1
	.set sub_808B7E0, 0x0808B7E0 + 1
	.set sub_80B1524, 0x080B1524 + 1
	.set sub_80B1DBC, 0x080B1DBC + 1
	.set sub_80B2730, 0x080B2730 + 1
	.section .text.sub_80D11C8, "ax", %progbits
@ sub_80D11C8 @ JP 0x080D11C8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D11C8
	.thumb_func
sub_80D11C8:
	push {r4, r5, lr}
	adds r2, r0, #0
	adds r2, #0x29
	movs r1, #0
	strb r1, [r2]
	str r1, [r0, #0x30]
	str r1, [r0, #0x34]
	ldr r4, [r0, #0x14]
	adds r5, r4, #0
	adds r5, #0x31
	ldrb r0, [r5]
	cmp r0, #0
	bne _080D121E
	bl ResetFaces
	bl ResetText
	bl sub_804F8F4
	bl sub_801569C
	ldr r3, _080D12CC @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
_080D121E:
	ldrb r0, [r5]
	cmp r0, #1
	bne _080D1294
	ldr r4, [r4, #0x14]
	movs r0, #0
	bl sub_8001ACC
	bl sub_80048D8
	bl sub_80153A4
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	str r0, [r4, #0x40]
	bl sub_808B7E0
	bl sub_80B2730
	bl sub_80B1DBC
	movs r0, #0
	bl EndFaceById
	movs r0, #0
	bl sub_80B1524
	bl ResetFaces
	bl ResetText
	bl sub_804F8F4
	bl sub_801569C
	ldr r3, _080D12CC @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #2
	bl BG_EnableSyncByMask
_080D1294:
	ldrb r0, [r5]
	cmp r0, #2
	bne _080D12C6
	ldr r3, _080D12CC @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #2
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #1
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
_080D12C6:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080D12CC: .4byte 0x03003020

