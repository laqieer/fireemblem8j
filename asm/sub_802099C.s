	.syntax unified
	.set GetROMChapterStruct, 0x08034520 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set StartBgm, 0x08002424 + 1
	.set WfxFlamesInitGradientPublic, 0x080306A8 + 1
	.set j_ColorFadeTick, 0x080DC0EC + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8030B90, 0x08030B90 + 1
	.set sub_80C1E74, 0x080C1E74 + 1
	.section .text.sub_802099C, "ax", %progbits
@ sub_802099C @ JP 0x0802099C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802099C
	.thumb_func
sub_802099C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	bl sub_8000CD8
	adds r4, r0, #0
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _080209B0
	b _08020AA6
_080209B0:
	bl j_ColorFadeTick
	ldr r5, _08020A28 @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrb r0, [r0, #0x12]
	cmp r0, #5
	bne _080209C8
	bl WfxFlamesInitGradientPublic
_080209C8:
	bl sub_80C1E74
	cmp r0, #2
	beq _080209E0
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	adds r0, #0x87
	ldrb r0, [r0]
	cmp r0, #0
	beq _08020A34
_080209E0:
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r1, [r0, #0x28]
	ldr r0, _08020A2C @ =0x0000FFFF
	cmp r1, r0
	beq _08020A00
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl StartBgm
_08020A00:
	adds r3, r6, #0
	adds r3, #0x4c
	strh r4, [r3]
	ldr r2, _08020A30 @ =0x03003020
	ldrb r0, [r2, #1]
	movs r1, #1
	orrs r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	adds r4, r3, #0
	b _08020A64
	.align 2, 0
_08020A28: .4byte 0x0202BCEC
_08020A2C: .4byte 0x0000FFFF
_08020A30: .4byte 0x03003020
_08020A34:
	bl sub_8001EE4
	adds r0, r6, #0
	adds r0, #0x4c
	movs r1, #0
	ldrsh r2, [r0, r1]
	adds r1, r2, #7
	adds r4, r0, #0
	cmp r1, #0
	bge _08020A4A
	adds r1, #7
_08020A4A:
	asrs r0, r1, #3
	adds r1, r0, #0
	adds r1, #0xc
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r2, #4
	subs r2, r2, r0
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	movs r0, #1
	movs r3, #0
	bl SetBlendConfig
_08020A64:
	ldrh r0, [r4]
	subs r0, #1
	strh r0, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0x18
	bne _08020A94
	ldr r5, _08020AAC @ =0x0202BCEC
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r1, [r0, #0x28]
	ldr r0, _08020AB0 @ =0x0000FFFF
	cmp r1, r0
	beq _08020A94
	movs r0, #0xe
	ldrsb r0, [r5, r0]
	bl GetROMChapterStruct
	ldrh r0, [r0, #0x28]
	movs r1, #0
	bl StartBgm
_08020A94:
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bge _08020AA6
	bl sub_8030B90
	adds r0, r6, #0
	bl sub_8002DE4
_08020AA6:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08020AAC: .4byte 0x0202BCEC
_08020AB0: .4byte 0x0000FFFF

