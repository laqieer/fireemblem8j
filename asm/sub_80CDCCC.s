	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BlendPaletteToColor, 0x080CB8BC + 1
	.set CopyToPalOpAnim, 0x080CB6AC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8012E84, 0x08012E84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_80D637C, 0x080D637C + 1
	.section .text.sub_80CDCCC, "ax", %progbits
@ sub_80CDCCC @ JP 0x080CDCCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CDCCC
	.thumb_func
sub_80CDCCC:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldrh r0, [r7, #0x3e]
	movs r1, #0x4c
	bl sub_80D637C
	adds r4, r0, #0
	movs r0, #0x4c
	str r0, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0x1a
	adds r3, r4, #0
	bl sub_8012E84
	adds r4, r0, #0
	cmp r4, #0xc
	bgt _080CDD02
	lsls r1, r4, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
	b _080CDD14
_080CDD02:
	movs r1, #0x19
	subs r1, r1, r4
	lsls r1, r1, #0x18
	lsrs r1, r1, #0x18
	movs r0, #1
	movs r2, #0x10
	movs r3, #8
	bl SetBlendConfig
_080CDD14:
	ldrh r0, [r7, #0x3e]
	adds r0, #1
	strh r0, [r7, #0x3e]
	ldr r0, _080CDD64 @ =0x08BAA1E0
	movs r2, #0x80
	lsls r2, r2, #1
	movs r1, #0
	bl CopyToPalOpAnim
	ldrh r3, [r7, #0x2a]
	movs r0, #0x26
	str r0, [sp]
	movs r0, #0
	movs r1, #0xc
	movs r2, #0
	bl sub_8012E84
	ldr r5, _080CDD68 @ =0x020228A8
	lsls r6, r0, #0x10
	movs r4, #7
_080CDD3C:
	adds r0, r5, #0
	movs r1, #0
	lsrs r2, r6, #0x10
	bl BlendPaletteToColor
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080CDD3C
	ldrh r0, [r7, #0x2a]
	subs r0, #1
	cmp r0, #4
	bls _080CDD58
	b _080CDE90
_080CDD58:
	lsls r0, r0, #2
	ldr r1, _080CDD6C @ =_080CDD70
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080CDD64: .4byte 0x08BAA1E0
_080CDD68: .4byte 0x020228A8
_080CDD6C: .4byte _080CDD70
_080CDD70: @ jump table
	.4byte _080CDD84 @ case 0
	.4byte _080CDDD4 @ case 1
	.4byte _080CDE0C @ case 2
	.4byte _080CDE40 @ case 3
	.4byte _080CDE74 @ case 4
_080CDD84:
	ldr r4, _080CDDC4 @ =0x08B53254
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _080CDDC8 @ =0x06002000
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080CDDCC @ =0x08B546D8
	ldr r4, _080CDDD0 @ =0x020244A8
	adds r1, r4, #0
	bl sub_8013008
	movs r3, #0xe1
	lsls r3, r3, #8
	adds r2, r3, #0
	adds r1, r4, #0
	movs r4, #0xa0
	lsls r4, r4, #2
_080CDDAE:
	ldrh r3, [r1]
	adds r0, r2, r3
	strh r0, [r1]
	adds r1, #2
	subs r4, #1
	cmp r4, #0
	bne _080CDDAE
	movs r0, #8
	bl BG_EnableSyncByMask
	b _080CDE90
	.align 2, 0
_080CDDC4: .4byte 0x08B53254
_080CDDC8: .4byte 0x06002000
_080CDDCC: .4byte 0x08B546D8
_080CDDD0: .4byte 0x020244A8
_080CDDD4:
	ldr r4, _080CDE08 @ =0x08B75840
	movs r1, #0x88
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	movs r1, #0x98
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	movs r1, #0xa8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	movs r1, #0xb8
	lsls r1, r1, #2
	adds r0, r4, #0
	movs r2, #0x20
	bl CopyToPalOpAnim
	b _080CDE90
	.align 2, 0
_080CDE08: .4byte 0x08B75840
_080CDE0C:
	ldr r0, _080CDE2C @ =0x08B75860
	ldr r1, _080CDE30 @ =0x06010000
	bl sub_8013008
	ldr r0, _080CDE34 @ =0x08B760D0
	movs r1, #0x80
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CDE38 @ =0x08B75D88
	ldr r1, _080CDE3C @ =0x06010F00
	bl sub_8013008
	b _080CDE90
	.align 2, 0
_080CDE2C: .4byte 0x08B75860
_080CDE30: .4byte 0x06010000
_080CDE34: .4byte 0x08B760D0
_080CDE38: .4byte 0x08B75D88
_080CDE3C: .4byte 0x06010F00
_080CDE40:
	ldr r0, _080CDE60 @ =0x08B760F0
	ldr r1, _080CDE64 @ =0x06011E00
	bl sub_8013008
	ldr r0, _080CDE68 @ =0x08B76A18
	movs r1, #0x90
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CDE6C @ =0x08B76680
	ldr r1, _080CDE70 @ =0x06012D00
	bl sub_8013008
	b _080CDE90
	.align 2, 0
_080CDE60: .4byte 0x08B760F0
_080CDE64: .4byte 0x06011E00
_080CDE68: .4byte 0x08B76A18
_080CDE6C: .4byte 0x08B76680
_080CDE70: .4byte 0x06012D00
_080CDE74:
	ldr r0, _080CDEA4 @ =0x08B76A38
	ldr r1, _080CDEA8 @ =0x06013C00
	bl sub_8013008
	ldr r0, _080CDEAC @ =0x08B7741C
	movs r1, #0xa0
	lsls r1, r1, #2
	movs r2, #0x20
	bl CopyToPalOpAnim
	ldr r0, _080CDEB0 @ =0x08B770B4
	ldr r1, _080CDEB4 @ =0x06014B00
	bl sub_8013008
_080CDE90:
	ldrh r0, [r7, #0x2a]
	cmp r0, #0x26
	bne _080CDEB8
	movs r0, #0
	strh r0, [r7, #0x2a]
	adds r0, r7, #0
	bl sub_8002DE4
	b _080CDEBC
	.align 2, 0
_080CDEA4: .4byte 0x08B76A38
_080CDEA8: .4byte 0x06013C00
_080CDEAC: .4byte 0x08B7741C
_080CDEB0: .4byte 0x08B770B4
_080CDEB4: .4byte 0x06014B00
_080CDEB8:
	adds r0, #1
	strh r0, [r7, #0x2a]
_080CDEBC:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

