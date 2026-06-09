	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set FormatTime, 0x08000D14 + 1
	.set GetChapterCombatRank, 0x080BAF74 + 1
	.set GetGameTotalTime_unused, 0x080A8DF0 + 1
	.set GetOverallRank, 0x080BABF4 + 1
	.set GetOverallRankFrom3, 0x080BAC4C + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutSpecialChar, 0x08004A14 + 1
	.set StartBgm, 0x08002424 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8004C84, 0x08004C84 + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_80B1D98, 0x080B1D98 + 1
	.set sub_80B33E0, 0x080B33E0 + 1
	.set sub_80BA8F8, 0x080BA8F8 + 1
	.set sub_80BA9F0, 0x080BA9F0 + 1
	.set sub_80BAA28, 0x080BAA28 + 1
	.set sub_80BAB20, 0x080BAB20 + 1
	.set sub_80BAB54, 0x080BAB54 + 1
	.set sub_80BACC8, 0x080BACC8 + 1
	.set sub_80BAD48, 0x080BAD48 + 1
	.section .text.sub_80BCA74, "ax", %progbits
@ sub_80BCA74 @ JP 0x080BCA74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BCA74
	.thumb_func
sub_80BCA74:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	adds r5, r0, #0
	movs r0, #0
	str r0, [r5, #0x30]
	str r0, [r5, #0x2c]
	bl sub_804F8E0
	ldr r0, _080BCB50 @ =0x020234A8
	ldr r1, _080BCB54 @ =0x08AC718C
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	ldr r0, _080BCB58 @ =0x08AC5558
	movs r1, #0xc0
	lsls r1, r1, #2
	movs r2, #0x40
	bl sub_8000D68
	ldr r0, _080BCB5C @ =0x08AC5598
	ldr r1, _080BCB60 @ =0x06011000
	bl sub_8013008
	movs r4, #0
	movs r0, #0xa
	add r0, sp
	mov sb, r0
	add r1, sp, #0xc
	mov sl, r1
_080BCAB8:
	adds r1, r4, #0
	adds r1, #0x1a
	lsls r1, r1, #5
	ldr r0, _080BCB64 @ =0x08AC6BD8
	movs r2, #0x20
	bl sub_8000D68
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #4
	bls _080BCAB8
	ldr r0, _080BCB68 @ =0x08AC6C58
	movs r1, #0xf8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080BCB6C @ =0x08AC6BF8
	movs r1, #0xb0
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080BCB70 @ =0x08AC6C18
	movs r1, #0xb8
	lsls r1, r1, #2
	movs r2, #0x20
	bl sub_8000D68
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r4, _080BCB74 @ =0x0202BCEC
	ldrb r1, [r4, #0x14]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _080BCB78
	bl sub_8000CD8
	ldr r1, [r4, #4]
	subs r0, r0, r1
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_80BACC8
	adds r6, r5, #0
	adds r6, #0x3a
	strb r0, [r6]
	bl sub_80BAD48
	adds r4, r5, #0
	adds r4, #0x3b
	strb r0, [r4]
	bl GetChapterCombatRank
	adds r2, r5, #0
	adds r2, #0x3c
	strb r0, [r2]
	ldrb r0, [r6]
	ldrb r1, [r4]
	ldrb r2, [r2]
	bl GetOverallRankFrom3
	adds r1, r5, #0
	adds r1, #0x3d
	strb r0, [r1]
	movs r0, #0x40
	movs r1, #0
	bl StartBgm
	b _080BCBDE
	.align 2, 0
_080BCB50: .4byte 0x020234A8
_080BCB54: .4byte 0x08AC718C
_080BCB58: .4byte 0x08AC5558
_080BCB5C: .4byte 0x08AC5598
_080BCB60: .4byte 0x06011000
_080BCB64: .4byte 0x08AC6BD8
_080BCB68: .4byte 0x08AC6C58
_080BCB6C: .4byte 0x08AC6BF8
_080BCB70: .4byte 0x08AC6C18
_080BCB74: .4byte 0x0202BCEC
_080BCB78:
	bl GetGameTotalTime_unused
	add r1, sp, #8
	mov r2, sb
	mov r3, sl
	bl FormatTime
	bl sub_80BA8F8
	movs r6, #0x3a
	adds r6, r6, r5
	mov r8, r6
	strb r0, [r6]
	bl sub_80BA9F0
	adds r7, r5, #0
	adds r7, #0x3b
	strb r0, [r7]
	bl sub_80BAB54
	adds r4, r5, #0
	adds r4, #0x3c
	strb r0, [r4]
	bl sub_80BAA28
	adds r6, r5, #0
	adds r6, #0x3d
	strb r0, [r6]
	bl sub_80BAB20
	movs r1, #0x3e
	adds r1, r1, r5
	mov ip, r1
	strb r0, [r1]
	mov r1, r8
	ldrb r0, [r1]
	ldrb r1, [r7]
	ldrb r2, [r4]
	ldrb r3, [r6]
	mov r6, ip
	ldrb r4, [r6]
	str r4, [sp]
	bl GetOverallRank
	adds r1, r5, #0
	adds r1, #0x3f
	strb r0, [r1]
	movs r0, #0x40
	movs r1, #0
	bl StartBgm
_080BCBDE:
	ldr r4, _080BCC84 @ =0x020230E8
	adds r0, r4, #0
	adds r0, #0xa
	add r1, sp, #8
	ldrh r2, [r1]
	movs r1, #2
	bl PutNumber
	adds r0, r4, #0
	adds r0, #0xc
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x10
	mov r7, sb
	ldrh r2, [r7]
	movs r1, #2
	bl sub_8004C84
	adds r0, r4, #0
	adds r0, #0x12
	movs r1, #2
	movs r2, #0x20
	bl PutSpecialChar
	adds r0, r4, #0
	adds r0, #0x16
	mov r1, sl
	ldrh r2, [r1]
	movs r1, #2
	bl sub_8004C84
	movs r4, #0
	adds r3, r5, #0
	adds r3, #0x4c
	movs r6, #0
	mov r8, r6
	movs r7, #0
	mov sb, r7
	adds r2, r5, #0
	adds r2, #0x46
	movs r6, #1
	adds r1, r5, #0
	adds r1, #0x40
_080BCC3A:
	lsls r0, r4, #1
	adds r0, r3, r0
	mov r7, sb
	strh r7, [r0]
	adds r0, r2, r4
	strb r6, [r0]
	adds r0, r1, r4
	mov r7, r8
	strb r7, [r0]
	adds r0, r4, #1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #5
	bls _080BCC3A
	ldr r0, _080BCC88 @ =sub_80BC638
	adds r1, r5, #0
	bl sub_80B1D98
	ldr r0, _080BCC8C @ =0x08AC6C18
	adds r1, r0, #0
	adds r1, #0x20
	movs r2, #1
	str r2, [sp]
	str r5, [sp, #4]
	movs r2, #2
	movs r3, #0x17
	bl sub_80B33E0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080BCC84: .4byte 0x020230E8
_080BCC88: .4byte 0x080BC639  @ sub_80BC638
_080BCC8C: .4byte 0x08AC6C18

