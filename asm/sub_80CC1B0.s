	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set SetDefaultColorEffects, 0x08001ED0 + 1
	.section .text.sub_80CC1B0, "ax", %progbits
@ sub_80CC1B0 @ JP 0x080CC1B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC1B0
	.thumb_func
sub_80CC1B0:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	lsls r4, r4, #0x18
	lsrs r4, r4, #0x18
	bl SetDefaultColorEffects
	cmp r4, #0
	bne _080CC1E8
	ldr r2, _080CC1E4 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	b _080CC28A
	.align 2, 0
_080CC1E4: .4byte 0x03003020
_080CC1E8:
	ldr r4, _080CC2B4 @ =0x03003020
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r2, #2
	orrs r1, r2
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	ldrb r1, [r4, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	movs r1, #4
	orrs r0, r1
	movs r1, #9
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r4, #1]
	movs r1, #0x80
	lsls r1, r1, #7
	movs r0, #1
	bl SetBackgroundTileDataOffset
	movs r1, #0xf0
	lsls r1, r1, #8
	movs r0, #1
	bl SetBackgroundMapDataOffset
	movs r5, #0
	str r5, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r5, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080CC2B8 @ =0x08B8E5F8
	movs r1, #0x80
	lsls r1, r1, #1
	movs r2, #0x80
	bl CopyToPalOpAnim
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldrb r1, [r4, #1]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #0x41
	rsbs r1, r1, #0
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r4, #1]
_080CC28A:
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	ldr r0, _080CC2BC @ =0x08BAA1E0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080CC2B4: .4byte 0x03003020
_080CC2B8: .4byte 0x08B8E5F8
_080CC2BC: .4byte 0x08BAA1E0

