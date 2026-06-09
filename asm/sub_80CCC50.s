	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBackgroundMapDataOffset, 0x08000FB4 + 1
	.set SetBackgroundTileDataOffset, 0x08000F8C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80CCC50, "ax", %progbits
@ sub_80CCC50 @ JP 0x080CCC50 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CCC50
	.thumb_func
sub_80CCC50:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r6, r0, #0
	ldrh r0, [r6, #0x2a]
	cmp r0, #6
	bls _080CCC5E
	b _080CCED8
_080CCC5E:
	lsls r0, r0, #2
	ldr r1, _080CCC68 @ =_080CCC6C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CCC68: .4byte _080CCC6C
_080CCC6C: @ jump table
	.4byte _080CCC88 @ case 0
	.4byte _080CCD44 @ case 1
	.4byte _080CCD70 @ case 2
	.4byte _080CCDA0 @ case 3
	.4byte _080CCDDC @ case 4
	.4byte _080CCE00 @ case 5
	.4byte _080CCE3C @ case 6
_080CCC88:
	ldr r2, _080CCD34 @ =0x03003020
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
	movs r1, #0x21
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #0x20
	ands r0, r1
	movs r1, #0x7f
	ands r0, r1
	strb r0, [r2, #1]
	movs r1, #0xe8
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundMapDataOffset
	movs r0, #0
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r0, #2
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	ldr r0, _080CCD38 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CCD3C @ =0x020234A8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _080CCD40 @ =0x02023CA8
	movs r1, #0
	bl sub_80011D0
	movs r0, #7
	bl BG_EnableSyncByMask
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #8
	movs r2, #8
	movs r3, #8
	bl SetBlendConfig
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #1
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	b _080CCED8
	.align 2, 0
_080CCD34: .4byte 0x03003020
_080CCD38: .4byte 0x02022CA8
_080CCD3C: .4byte 0x020234A8
_080CCD40: .4byte 0x02023CA8
_080CCD44:
	ldr r4, _080CCD64 @ =0x08B5EFDC
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CCD68 @ =0x08B627A4
	ldr r1, _080CCD6C @ =0x02020188
	bl sub_8013008
	b _080CCED8
	.align 2, 0
_080CCD64: .4byte 0x08B5EFDC
_080CCD68: .4byte 0x08B627A4
_080CCD6C: .4byte 0x02020188
_080CCD70:
	ldr r4, _080CCD90 @ =0x08B60D3C
	movs r0, #0
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _080CCD94 @ =0x06002000
	adds r1, r1, r2
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CCD98 @ =0x08B62BC0
	ldr r1, _080CCD9C @ =0x02020988
	bl sub_8013008
	b _080CCED8
	.align 2, 0
_080CCD90: .4byte 0x08B60D3C
_080CCD94: .4byte 0x06002000
_080CCD98: .4byte 0x08B62BC0
_080CCD9C: .4byte 0x02020988
_080CCDA0:
	ldr r4, _080CCDCC @ =0x08B5B7B4
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CCDD0 @ =0x08B5C4EC
	ldr r1, _080CCDD4 @ =0x02021188
	bl sub_8013008
	ldr r0, _080CCDD8 @ =0x08B62D04
	movs r2, #0xb0
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	b _080CCED8
	.align 2, 0
_080CCDCC: .4byte 0x08B5B7B4
_080CCDD0: .4byte 0x08B5C4EC
_080CCDD4: .4byte 0x02021188
_080CCDD8: .4byte 0x08B62D04
_080CCDDC:
	ldr r0, _080CCDF0 @ =0x08B5E2F0
	ldr r1, _080CCDF4 @ =0x06008000
	bl sub_8013008
	ldr r0, _080CCDF8 @ =0x08B5EDE8
	ldr r1, _080CCDFC @ =0x0600C000
	bl sub_8013008
	b _080CCED8
	.align 2, 0
_080CCDF0: .4byte 0x08B5E2F0
_080CCDF4: .4byte 0x06008000
_080CCDF8: .4byte 0x08B5EDE8
_080CCDFC: .4byte 0x0600C000
_080CCE00:
	ldr r0, _080CCE2C @ =0x08B5D590
	ldr r1, _080CCE30 @ =0x0600A000
	bl sub_8013008
	ldr r0, _080CCE34 @ =0x08B5E128
	ldr r4, _080CCE38 @ =0x0600C800
	adds r1, r4, #0
	bl sub_8013008
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080CCE1C:
	ldrh r2, [r4]
	adds r0, r1, r2
	strh r0, [r4]
	adds r4, #2
	subs r3, #1
	cmp r3, #0
	bne _080CCE1C
	b _080CCED8
	.align 2, 0
_080CCE2C: .4byte 0x08B5D590
_080CCE30: .4byte 0x0600A000
_080CCE34: .4byte 0x08B5E128
_080CCE38: .4byte 0x0600C800
_080CCE3C:
	ldr r0, _080CCEC4 @ =0x02021188
	movs r1, #0x80
	lsls r1, r1, #4
	adds r4, r0, r1
	movs r2, #0x80
	lsls r2, r2, #2
	adds r1, r4, #0
	bl sub_80D636C
	adds r7, r4, #0
	ldr r5, _080CCEC8 @ =0x00000FFF
	movs r2, #0xf0
	lsls r2, r2, #8
	adds r4, r2, #0
	adds r2, r7, #0
	movs r3, #0xa0
	lsls r3, r3, #2
_080CCE5E:
	ldrh r1, [r2]
	adds r0, r5, #0
	ands r0, r1
	orrs r0, r4
	strh r0, [r2]
	adds r2, #2
	subs r3, #1
	cmp r3, #0
	bne _080CCE5E
	ldr r1, _080CCECC @ =0x0600F000
	movs r2, #0xa0
	lsls r2, r2, #1
	adds r0, r7, #0
	bl sub_80D636C
	bl sub_8001EE4
	ldr r2, _080CCED0 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r2, #1]
	movs r2, #0
	strh r2, [r6, #0x2a]
	strh r2, [r6, #0x30]
	strh r2, [r6, #0x32]
	ldr r1, _080CCED4 @ =0x02022188
	movs r0, #0xf0
	strh r0, [r1]
	strh r2, [r1, #2]
	strh r2, [r1, #4]
	movs r0, #0xa0
	strh r0, [r1, #6]
	movs r1, #0x80
	lsls r1, r1, #8
	movs r0, #2
	bl SetBackgroundTileDataOffset
	adds r0, r6, #0
	bl sub_8002DE4
	b _080CCEDE
	.align 2, 0
_080CCEC4: .4byte 0x02021188
_080CCEC8: .4byte 0x00000FFF
_080CCECC: .4byte 0x0600F000
_080CCED0: .4byte 0x03003020
_080CCED4: .4byte 0x02022188
_080CCED8:
	ldrh r0, [r6, #0x2a]
	adds r0, #1
	strh r0, [r6, #0x2a]
_080CCEDE:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

