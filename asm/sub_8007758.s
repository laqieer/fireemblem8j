	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set SetTalkFaceLayer, 0x08007890 + 1
	.set StartFaceAuto, 0x08005518 + 1
	.set sub_8005DF4, 0x08005DF4 + 1
	.set sub_80065E4, 0x080065E4 + 1
	.set sub_800773C, 0x0800773C + 1
	.set sub_8007748, 0x08007748 + 1
	.set sub_8008830, 0x08008830 + 1
	.set sub_80142F0, 0x080142F0 + 1
	.set sub_8018FCC, 0x08018FCC + 1
	.set sub_8050B14, 0x08050B14 + 1
	.section .text.sub_8007758, "ax", %progbits
@ TalkLoadFace @ JP 0x08007758 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global TalkLoadFace
	.thumb_func
TalkLoadFace:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _08007780 @ =0x085B90D4
	ldr r0, [r0]
	ldrb r0, [r0, #0x11]
	cmp r0, #0xff
	bne _0800776E
	movs r0, #1
	bl sub_800773C
_0800776E:
	bl sub_8050B14
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08007784
	bl sub_8007748
	b _08007786
	.align 2, 0
_08007780: .4byte 0x085B90D4
_08007784:
	movs r6, #2
_08007786:
	ldr r4, _080077B8 @ =0x085B90D4
	ldr r0, [r4]
	ldrb r0, [r0, #0x11]
	bl sub_8008830
	cmp r0, #0xe
	bgt _08007798
	movs r0, #1
	orrs r6, r0
_08007798:
	ldr r0, [r4]
	ldr r0, [r0]
	ldrb r4, [r0]
	ldrb r0, [r0, #1]
	lsls r0, r0, #8
	adds r4, r4, r0
	ldr r0, _080077BC @ =0x0000FFFF
	cmp r4, r0
	bne _080077C4
	ldr r0, _080077C0 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_8018FCC
	adds r4, r0, #0
	b _080077C8
	.align 2, 0
_080077B8: .4byte 0x085B90D4
_080077BC: .4byte 0x0000FFFF
_080077C0: .4byte 0x03004DF0
_080077C4:
	ldr r0, _080077E4 @ =0xFFFFFF00
	adds r4, r4, r0
_080077C8:
	ldr r5, _080077E8 @ =0x085B90D4
	ldr r0, [r5]
	ldrb r2, [r0, #0x11]
	lsls r1, r2, #2
	adds r0, #0x18
	adds r0, r0, r1
	ldr r0, [r0]
	cmp r0, #0
	beq _080077EC
	adds r1, r4, #0
	bl sub_80065E4
	b _08007834
	.align 2, 0
_080077E4: .4byte 0xFFFFFF00
_080077E8: .4byte 0x085B90D4
_080077EC:
	adds r0, r2, #0
	bl sub_8008830
	adds r1, r0, #0
	lsls r1, r1, #3
	adds r0, r4, #0
	movs r2, #0x50
	adds r3, r6, #0
	bl StartFaceAuto
	ldr r3, [r5]
	ldrb r1, [r3, #0x11]
	lsls r1, r1, #2
	adds r2, r3, #0
	adds r2, #0x18
	adds r1, r2, r1
	str r0, [r1]
	ldrb r0, [r3, #0x11]
	lsls r0, r0, #2
	adds r2, r2, r0
	ldr r0, [r2]
	bl sub_8005DF4
	ldr r0, [r5]
	ldrb r4, [r0, #0x11]
	movs r0, #0x10
	bl CheckTalkFlag
	adds r1, r0, #0
	adds r0, r4, #0
	bl SetTalkFaceLayer
	adds r0, r7, #0
	movs r1, #8
	bl sub_80142F0
_08007834:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

