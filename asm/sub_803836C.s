	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set BG_SetPosition, 0x08001448 + 1
	.set DungeonRecordUi_InitText, 0x08037C44 + 1
	.set GetBackgroundTileDataOffset, 0x08000F3C + 1
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendBackdropB, 0x08001EB4 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001ACC, 0x08001ACC + 1
	.set sub_8013008, 0x08013008 + 1
	.set sub_8038C1C, 0x08038C1C + 1
	.set sub_804F8E0, 0x0804F8E0 + 1
	.set sub_80B021C, 0x080B021C + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_803836C, "ax", %progbits
@ sub_803836C @ JP 0x0803836C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803836C
	.thumb_func
sub_803836C:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #4
	adds r7, r0, #0
	ldr r0, _08038520 @ =0x08A9CF7C
	bl sub_8001ACC
	ldr r0, _08038524 @ =0x02022CA8
	movs r1, #0
	bl sub_80011D0
	ldr r0, _08038528 @ =0x020234A8
	mov r8, r0
	movs r1, #0
	bl sub_80011D0
	ldr r2, _0803852C @ =0x02023CA8
	mov sl, r2
	mov r0, sl
	movs r1, #0
	bl sub_80011D0
	ldr r4, _08038530 @ =0x020244A8
	mov sb, r4
	mov r0, sb
	movs r1, #0
	bl sub_80011D0
	ldr r4, _08038534 @ =0x03003020
	ldrb r2, [r4, #0xc]
	movs r1, #4
	rsbs r1, r1, #0
	adds r0, r1, #0
	ands r0, r2
	strb r0, [r4, #0xc]
	ldrb r2, [r4, #0x10]
	adds r0, r1, #0
	ands r0, r2
	movs r6, #1
	orrs r0, r6
	strb r0, [r4, #0x10]
	ldrb r0, [r4, #0x14]
	ands r1, r0
	movs r5, #2
	orrs r1, r5
	strb r1, [r4, #0x14]
	ldrb r0, [r4, #0x18]
	movs r1, #3
	orrs r0, r1
	strb r0, [r4, #0x18]
	bl sub_804F8E0
	ldrb r0, [r4, #1]
	orrs r0, r6
	orrs r0, r5
	movs r1, #4
	orrs r0, r1
	movs r1, #8
	orrs r0, r1
	movs r1, #0x10
	orrs r0, r1
	strb r0, [r4, #1]
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
	movs r0, #3
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #0
	bl SetBlendTargetA
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #0
	bl SetBlendBackdropA
	movs r0, #0
	bl SetBlendBackdropB
	movs r0, #1
	movs r1, #6
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	ldr r4, _08038538 @ =0x08A9E5C0
	movs r0, #3
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	movs r0, #0xc0
	lsls r0, r0, #0x13
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0803853C @ =0x08AA2D34
	movs r2, #0x80
	lsls r2, r2, #1
	adds r1, r2, #0
	bl sub_8000D68
	ldr r1, _08038540 @ =0x08AA2E34
	movs r2, #0x80
	lsls r2, r2, #8
	mov r0, sb
	bl j_TmApplyTsa
	ldr r4, _08038544 @ =0x08AA32E8
	movs r0, #2
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r2, _08038548 @ =0x06004C00
	adds r1, r1, r2
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _0803854C @ =0x08AA3860
	ldr r4, _08038550 @ =0x02020188
	adds r1, r4, #0
	bl sub_8013008
	ldr r0, _08038554 @ =0x08AA3840
	movs r1, #0xe0
	movs r2, #0x20
	bl sub_8000D68
	ldr r2, _08038558 @ =0x00007260
	mov r0, sl
	adds r1, r4, #0
	bl j_TmApplyTsa
	ldr r4, _0803855C @ =0x08A12AC0
	movs r0, #1
	bl GetBackgroundTileDataOffset
	adds r1, r0, #0
	ldr r0, _08038560 @ =0x06004000
	adds r1, r1, r0
	adds r0, r4, #0
	bl sub_8013008
	ldr r0, _08038564 @ =0x08A12E44
	mov r1, r8
	bl sub_8013008
	ldr r0, _08038568 @ =0x08A12F68
	movs r1, #0x40
	movs r2, #0x40
	bl sub_8000D68
	movs r2, #0x88
	lsls r2, r2, #6
	adds r3, r2, #0
	mov r1, r8
	movs r2, #0xa0
	lsls r2, r2, #2
_080384DE:
	ldrh r4, [r1]
	adds r0, r3, r4
	strh r0, [r1]
	adds r1, #2
	subs r2, #1
	cmp r2, #0
	bne _080384DE
	bl DungeonRecordUi_InitText
	adds r0, r7, #0
	bl sub_8038C1C
	movs r0, #0xf
	bl BG_EnableSyncByMask
	ldr r0, _0803856C @ =0x0200310C
	bl sub_80B021C
	ldr r0, _08038570 @ =0x020228A8
	movs r2, #0xa8
	lsls r2, r2, #2
	adds r1, r0, r2
	movs r2, #8
	bl sub_80D636C
	add sp, #4
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08038520: .4byte 0x08A9CF7C
_08038524: .4byte 0x02022CA8
_08038528: .4byte 0x020234A8
_0803852C: .4byte 0x02023CA8
_08038530: .4byte 0x020244A8
_08038534: .4byte 0x03003020
_08038538: .4byte 0x08A9E5C0
_0803853C: .4byte 0x08AA2D34
_08038540: .4byte 0x08AA2E34
_08038544: .4byte 0x08AA32E8
_08038548: .4byte 0x06004C00
_0803854C: .4byte 0x08AA3860
_08038550: .4byte 0x02020188
_08038554: .4byte 0x08AA3840
_08038558: .4byte 0x00007260
_0803855C: .4byte 0x08A12AC0
_08038560: .4byte 0x06004000
_08038564: .4byte 0x08A12E44
_08038568: .4byte 0x08A12F68
_0803856C: .4byte 0x0200310C
_08038570: .4byte 0x020228A8

