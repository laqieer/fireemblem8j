	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set RestorePalette, 0x0800BD24 + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_80042E0, 0x080042E0 + 1
	.set sub_800F338, 0x0800F338 + 1
	.set sub_80156F0, 0x080156F0 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_800F15C, "ax", %progbits
@ sub_800F15C @ JP 0x0800F15C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800F15C
	.thumb_func
sub_800F15C:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	sub sp, #0x10
	adds r3, r0, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #1
	beq _0800F1A4
	cmp r0, #1
	bgt _0800F178
	cmp r0, #0
	beq _0800F17E
	b _0800F1F6
_0800F178:
	cmp r0, #2
	beq _0800F1D0
	b _0800F1F6
_0800F17E:
	ldr r2, _0800F1A0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	b _0800F1F6
	.align 2, 0
_0800F1A0: .4byte 0x03003020
_0800F1A4:
	ldr r2, _0800F1CC @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x11
	rsbs r1, r1, #0
	ands r0, r1
	strb r0, [r2, #1]
	ldr r0, [r3, #0x34]
	bl sub_800F338
	b _0800F1F6
	.align 2, 0
_0800F1CC: .4byte 0x03003020
_0800F1D0:
	ldr r2, _0800F2D0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	bl sub_80042E0
	bl sub_80156F0
_0800F1F6:
	ldr r3, _0800F2D0 @ =0x03003020
	ldrb r2, [r3, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r3, #0xc]
	ldrb r2, [r3, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r2, #1
	orrs r0, r2
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #0
	movs r1, #0x10
	movs r2, #0
	movs r3, #0
	bl SetBlendConfig
	movs r0, #0
	mov r8, r0
	str r0, [sp]
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	mov r0, r8
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	movs r0, #1
	bl SetBlendBackdropA
	movs r0, #1
	bl SetBlendBackdropB
	bl RestorePalette
	ldr r0, _0800F2D4 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #4
	bl BG_EnableSyncByMask
	mov r0, r8
	str r0, [sp, #4]
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r5, #0xc0
	lsls r5, r5, #0x13
	adds r1, r1, r5
	ldr r6, _0800F2D8 @ =0x01000008
	add r0, sp, #4
	adds r2, r6, #0
	bl sub_80D636C
	mov r0, r8
	str r0, [sp, #8]
	add r4, sp, #8
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	adds r2, r6, #0
	bl sub_80D636C
	mov r0, r8
	str r0, [sp, #0xc]
	add r4, sp, #0xc
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	adds r1, r1, r5
	adds r0, r4, #0
	adds r2, r6, #0
	bl sub_80D636C
	add sp, #0x10
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0800F2D0: .4byte 0x03003020
_0800F2D4: .4byte 0x02023CA8
_0800F2D8: .4byte 0x01000008

