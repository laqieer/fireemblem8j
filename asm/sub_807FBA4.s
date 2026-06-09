	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set PutTmRectSequential, 0x08014574 + 1
	.set StartPaletteAnimatorNormal, 0x080144F8 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.section .text.sub_807FBA4, "ax", %progbits
@ sub_807FBA4 @ JP 0x0807FBA4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807FBA4
	.thumb_func
sub_807FBA4:
	push {r4, r5, r6, lr}
	sub sp, #8
	adds r6, r0, #0
	ldr r2, _0807FC74 @ =0x03003020
	ldrb r3, [r2, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r3
	strb r0, [r2, #0xc]
	ldrb r3, [r2, #0x10]
	adds r0, r1, #0
	ands r0, r3
	movs r4, #1
	orrs r0, r4
	strb r0, [r2, #0x10]
	ldrb r3, [r2, #0x14]
	adds r0, r1, #0
	ands r0, r3
	orrs r0, r4
	strb r0, [r2, #0x14]
	ldrb r0, [r2, #0x18]
	ands r1, r0
	movs r0, #2
	orrs r1, r0
	strb r1, [r2, #0x18]
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r4, [r6, #0x50]
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _0807FC78 @ =0x06002800
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0807FC7C @ =0x02023CA8
	ldr r3, [r6, #0x2c]
	movs r1, #0x10
	ldrsb r1, [r3, r1]
	ldr r5, _0807FC80 @ =0x0202BCAC
	ldrh r2, [r5, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #1
	subs r1, #2
	movs r2, #0x11
	ldrsb r2, [r3, r2]
	ldrh r3, [r5, #0xe]
	lsls r3, r3, #0x10
	asrs r3, r3, #0x14
	subs r2, r2, r3
	lsls r2, r2, #1
	subs r2, #2
	ldr r3, _0807FC84 @ =0x00004140
	movs r4, #6
	str r4, [sp]
	str r4, [sp, #4]
	bl PutTmRectSequential
	movs r0, #4
	bl BG_EnableSyncByMask
	ldr r0, [r6, #0x54]
	str r6, [sp]
	movs r1, #0x80
	movs r2, #0x20
	movs r3, #4
	bl StartPaletteAnimatorNormal
	adds r1, r6, #0
	adds r1, #0x40
	movs r0, #0
	strh r0, [r1]
	adds r1, #2
	movs r0, #0x10
	strh r0, [r1]
	adds r0, r6, #0
	adds r0, #0x58
	ldrh r0, [r0]
	ldr r1, [r6, #0x2c]
	ldrb r1, [r1, #0x10]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldrh r2, [r5, #0xc]
	lsls r2, r2, #0x10
	asrs r2, r2, #0x14
	subs r1, r1, r2
	lsls r1, r1, #1
	adds r1, #1
	lsls r1, r1, #3
	bl sub_8014B50
	add sp, #8
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0807FC74: .4byte 0x03003020
_0807FC78: .4byte 0x06002800
_0807FC7C: .4byte 0x02023CA8
_0807FC80: .4byte 0x0202BCAC
_0807FC84: .4byte 0x00004140

