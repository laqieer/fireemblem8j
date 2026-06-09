	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set InitText, 0x08003C8C + 1
	.set ResetFaces, 0x08005430 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set Shop_GetPortraitIndex, 0x080B8CDC + 1
	.set StartBgm, 0x08002424 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8002EE8, 0x08002EE8 + 1
	.set sub_8006710, 0x08006710 + 1
	.set sub_800783C, 0x0800783C + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_804F0EC, 0x0804F0EC + 1
	.set sub_80B99AC, 0x080B99AC + 1
	.set sub_80B9B18, 0x080B9B18 + 1
	.set sub_80B9E50, 0x080B9E50 + 1
	.set sub_80B9F40, 0x080B9F40 + 1
	.section .text.sub_80B9774, "ax", %progbits
@ sub_80B9774 @ JP 0x080B9774 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B9774
	.thumb_func
sub_80B9774:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r6, r0, #0
	adds r0, #0x61
	ldrb r0, [r0]
	cmp r0, #0
	bne _080B9794
	movs r0, #0x36
	movs r1, #0
	bl StartBgm
	b _080B979C
_080B9794:
	movs r0, #0x35
	movs r1, #0
	bl StartBgm
_080B979C:
	ldr r0, _080B9980 @ =0x08A132D0
	ldr r1, _080B9984 @ =HideMu
	bl sub_8002EE8
	bl sub_80B9E50
	ldr r3, _080B9988 @ =0x03003020
	ldrb r1, [r3, #0xc]
	movs r2, #4
	rsbs r2, r2, #0
	adds r0, r2, #0
	ands r0, r1
	strb r0, [r3, #0xc]
	ldrb r1, [r3, #0x10]
	adds r0, r2, #0
	ands r0, r1
	movs r1, #2
	orrs r0, r1
	strb r0, [r3, #0x10]
	ldrb r0, [r3, #0x14]
	ands r2, r0
	strb r2, [r3, #0x14]
	ldrb r0, [r3, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r3, #0x18]
	movs r0, #0x80
	lsls r0, r0, #2
	movs r1, #2
	movs r2, #0
	bl sub_8006710
	bl ResetFaces
	adds r0, r6, #0
	adds r0, #0x5c
	movs r4, #0
	strb r4, [r0]
	adds r0, #2
	strb r4, [r0]
	adds r0, #1
	strb r4, [r0]
	subs r0, #2
	strb r4, [r0]
	adds r0, #3
	strb r4, [r0]
	adds r0, #2
	strb r4, [r0]
	movs r0, #0x90
	lsls r0, r0, #2
	movs r1, #3
	bl sub_80B9F40
	adds r0, r6, #0
	bl Shop_GetPortraitIndex
	movs r1, #1
	str r1, [sp]
	movs r1, #0x20
	movs r2, #8
	movs r3, #3
	bl sub_800783C
	ldr r0, _080B998C @ =0x08A1DFBC
	ldr r5, _080B9990 @ =0x02020188
	adds r1, r5, #0
	bl sub_8013008
	ldr r0, _080B9994 @ =0x020234A8
	movs r2, #0x80
	lsls r2, r2, #5
	adds r1, r5, #0
	bl j_TmApplyTsa
	str r4, [sp]
	movs r0, #6
	movs r1, #8
	movs r2, #0x14
	movs r3, #0xc
	bl sub_804F0EC
	movs r0, #2
	bl BG_EnableSyncByMask
	adds r0, r6, #0
	bl sub_80B99AC
	ldr r5, _080B9998 @ =0x0203EF64
	movs r4, #5
_080B984E:
	adds r0, r5, #0
	movs r1, #0x14
	bl InitText
	adds r5, #8
	subs r4, #1
	cmp r4, #0
	bge _080B984E
	adds r0, r6, #0
	bl sub_80B9B18
	ldr r0, _080B9988 @ =0x03003020
	mov ip, r0
	ldrb r0, [r0, #1]
	movs r1, #0x20
	orrs r0, r1
	movs r1, #0x40
	orrs r0, r1
	movs r1, #0x7f
	ands r0, r1
	mov r3, ip
	strb r0, [r3, #1]
	movs r5, #0x34
	add r5, ip
	mov sb, r5
	ldrb r4, [r5]
	movs r6, #1
	orrs r4, r6
	movs r5, #2
	orrs r4, r5
	movs r0, #4
	orrs r4, r0
	movs r3, #8
	orrs r4, r3
	movs r0, #0x10
	orrs r4, r0
	movs r1, #0x35
	add r1, ip
	mov sl, r1
	ldrb r2, [r1]
	orrs r2, r6
	orrs r2, r5
	movs r1, #5
	rsbs r1, r1, #0
	mov r8, r1
	ands r2, r1
	orrs r2, r3
	orrs r2, r0
	mov r7, ip
	adds r7, #0x36
	ldrb r1, [r7]
	orrs r1, r6
	orrs r1, r5
	mov r5, r8
	ands r1, r5
	orrs r1, r3
	orrs r1, r0
	mov r0, ip
	adds r0, #0x2d
	movs r6, #0
	movs r3, #0x38
	mov r8, r3
	mov r5, r8
	strb r5, [r0]
	mov r3, ip
	adds r3, #0x31
	movs r0, #0x48
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2c
	movs r5, #0xf0
	strb r5, [r0]
	subs r3, #1
	movs r0, #0x98
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2f
	strb r6, [r0]
	adds r3, #3
	movs r0, #8
	strb r0, [r3]
	mov r0, ip
	adds r0, #0x2e
	strb r5, [r0]
	adds r0, #4
	mov r3, r8
	strb r3, [r0]
	movs r0, #0x21
	rsbs r0, r0, #0
	ands r4, r0
	mov r5, sb
	strb r4, [r5]
	movs r3, #0x20
	orrs r2, r3
	mov r5, sl
	strb r2, [r5]
	ands r1, r0
	strb r1, [r7]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #8
	bl SetBlendConfig
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetA
	str r6, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetB
	ldr r0, _080B999C @ =0x08BB059C
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	ldr r4, _080B99A0 @ =0x08BABE04
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _080B99A4 @ =0x020244A8
	ldr r1, _080B99A8 @ =0x08AA7330
	movs r2, #0xe0
	lsls r2, r2, #8
	bl j_TmApplyTsa
	movs r0, #8
	bl BG_EnableSyncByMask
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B9980: .4byte 0x08A132D0
_080B9984: .4byte 0x0807BBE9  @ HideMu
_080B9988: .4byte 0x03003020
_080B998C: .4byte 0x08A1DFBC
_080B9990: .4byte 0x02020188
_080B9994: .4byte 0x020234A8
_080B9998: .4byte 0x0203EF64
_080B999C: .4byte 0x08BB059C
_080B99A0: .4byte 0x08BABE04
_080B99A4: .4byte 0x020244A8
_080B99A8: .4byte 0x08AA7330

