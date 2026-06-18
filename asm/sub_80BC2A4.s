	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set GetGameTotalTurnCount, 0x080A8E1C + 1
	.set GetROMChapterStruct, 0x08034520 + 1
	.set PutNumber, 0x08004A90 + 1
	.set PutText, 0x08003DA0 + 1
	.set __modsi3, 0x080D6690 + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8004374, 0x08004374 + 1
	.set sub_8009FA8, 0x08009FA8 + 1
	.section .text.sub_80BC2A4, "ax", %progbits
@ HandleTurnRecordText @ JP 0x080BC2A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global HandleTurnRecordText
	.thumb_func
HandleTurnRecordText:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	str r0, [sp, #8]
	adds r4, r1, #0
	movs r0, #0
	str r0, [sp, #0xc]
	adds r0, r4, #0
	movs r1, #9
	bl __modsi3
	mov sb, r0
	lsls r6, r4, #1
	movs r0, #0x1f
	ands r6, r0
	lsls r7, r6, #5
	lsls r0, r6, #6
	ldr r1, _080BC35C @ =0x020234A8
	mov sl, r1
	add r0, sl
	movs r1, #0x1f
	movs r2, #1
	movs r3, #0
	bl j_TmFillRect
	movs r0, #2
	bl BG_EnableSyncByMask
	ldr r3, _080BC360 @ =0x08AC0EDC
	mov r8, r3
	mov r0, sb
	lsls r4, r0, #3
	ldr r0, [r3]
	adds r0, r0, r4
	bl sub_8003CF8
	adds r5, r4, #0
	adds r5, #0x48
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r5
	bl sub_8003CF8
	movs r0, #1
	rsbs r0, r0, #0
	ldr r3, [sp, #8]
	cmp r3, r0
	bne _080BC368
	bl GetGameTotalTurnCount
	adds r4, r0, #0
	ldr r0, _080BC364 @ =0x000004CF
	bl sub_8009FA8
	adds r2, r0, #0
	mov r1, r8
	ldr r0, [r1]
	adds r0, r0, r5
	adds r1, r7, #0
	adds r1, #0xb
	lsls r1, r1, #1
	add r1, sl
	ldr r3, [sp, #0xc]
	str r3, [sp]
	str r2, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	adds r0, r7, #0
	adds r0, #0x15
	lsls r0, r0, #1
	add r0, sl
	movs r1, #2
	adds r2, r4, #0
	bl PutNumber
	mov r1, r8
	ldr r0, [r1]
	adds r0, #0x90
	adds r1, r7, #0
	adds r1, #0x16
	lsls r1, r1, #1
	add r1, sl
	bl PutText
	movs r0, #0
	b _080BC576
	.align 2, 0
_080BC35C: .4byte 0x020234A8
_080BC360: .4byte 0x08AC0EDC
_080BC364: .4byte 0x000004CF
_080BC368:
	ldr r3, [sp, #8]
	cmp r3, #0
	bne _080BC370
	b _080BC574
_080BC370:
	ldr r0, [r3]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	mov r8, r0
	bl GetROMChapterStruct
	adds r0, #0x80
	ldrb r0, [r0]
	lsrs r2, r0, #1
	mov r0, r8
	cmp r0, #0x23
	bls _080BC38A
	b _080BC4AC
_080BC38A:
	lsls r0, r0, #2
	ldr r1, _080BC394 @ =_080BC398
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_080BC394: .4byte _080BC398
_080BC398: @ jump table
	.4byte _080BC428 @ case 0
	.4byte _080BC4AC @ case 1
	.4byte _080BC4AC @ case 2
	.4byte _080BC4AC @ case 3
	.4byte _080BC4AC @ case 4
	.4byte _080BC468 @ case 5
	.4byte _080BC4AC @ case 6
	.4byte _080BC4AC @ case 7
	.4byte _080BC4AC @ case 8
	.4byte _080BC4AC @ case 9
	.4byte _080BC4AC @ case 10
	.4byte _080BC4AC @ case 11
	.4byte _080BC4AC @ case 12
	.4byte _080BC4AC @ case 13
	.4byte _080BC4AC @ case 14
	.4byte _080BC4AC @ case 15
	.4byte _080BC4AC @ case 16
	.4byte _080BC4AC @ case 17
	.4byte _080BC4AC @ case 18
	.4byte _080BC4AC @ case 19
	.4byte _080BC4AC @ case 20
	.4byte _080BC42C @ case 21
	.4byte _080BC42C @ case 22
	.4byte _080BC4AC @ case 23
	.4byte _080BC4AC @ case 24
	.4byte _080BC4AC @ case 25
	.4byte _080BC4AC @ case 26
	.4byte _080BC4AC @ case 27
	.4byte _080BC4AC @ case 28
	.4byte _080BC4AC @ case 29
	.4byte _080BC4AC @ case 30
	.4byte _080BC4AC @ case 31
	.4byte _080BC4AC @ case 32
	.4byte _080BC4AC @ case 33
	.4byte _080BC42C @ case 34
	.4byte _080BC42C @ case 35
_080BC428:
	movs r0, #0xe3
	b _080BC42E
_080BC42C:
	movs r0, #0xe2
_080BC42E:
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r0, _080BC460 @ =0x08AC0EDC
	mov r1, sb
	lsls r5, r1, #3
	ldr r0, [r0]
	adds r0, r0, r5
	lsls r4, r6, #5
	subs r1, r4, #1
	adds r1, #6
	lsls r1, r1, #1
	ldr r2, _080BC464 @ =0x020234A8
	adds r1, r1, r2
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	adds r7, r4, #0
	adds r4, r5, #0
	b _080BC4E8
	.align 2, 0
_080BC460: .4byte 0x08AC0EDC
_080BC464: .4byte 0x020234A8
_080BC468:
	lsls r4, r6, #5
	subs r0, r4, #1
	adds r0, #6
	lsls r0, r0, #1
	ldr r5, _080BC4A4 @ =0x020234A8
	adds r0, r0, r5
	movs r1, #2
	bl PutNumber
	movs r0, #0xe4
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r0, _080BC4A8 @ =0x08AC0EDC
	mov r1, sb
	lsls r6, r1, #3
	ldr r0, [r0]
	adds r0, r0, r6
	adds r1, r4, #6
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl sub_8004374
	b _080BC4E4
	.align 2, 0
_080BC4A4: .4byte 0x020234A8
_080BC4A8: .4byte 0x08AC0EDC
_080BC4AC:
	lsls r4, r6, #5
	subs r0, r4, #1
	adds r0, #6
	lsls r0, r0, #1
	ldr r5, _080BC510 @ =0x020234A8
	adds r0, r0, r5
	movs r1, #2
	bl PutNumber
	movs r0, #0xe0
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r0, _080BC514 @ =0x08AC0EDC
	mov r1, sb
	lsls r6, r1, #3
	ldr r0, [r0]
	adds r0, r0, r6
	adds r1, r4, #6
	lsls r1, r1, #1
	adds r1, r1, r5
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r2, #3
	movs r3, #0
	bl sub_8004374
_080BC4E4:
	adds r7, r4, #0
	adds r4, r6, #0
_080BC4E8:
	mov r3, r8
	cmp r3, #0x15
	blt _080BC518
	cmp r3, #0x16
	ble _080BC4FA
	cmp r3, #0x23
	bgt _080BC518
	cmp r3, #0x22
	blt _080BC518
_080BC4FA:
	ldr r1, [sp, #8]
	ldm r1!, {r0}
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x17
	ldr r0, [r1]
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x17
	adds r6, r6, r0
	movs r3, #1
	str r3, [sp, #0xc]
	b _080BC520
	.align 2, 0
_080BC510: .4byte 0x020234A8
_080BC514: .4byte 0x08AC0EDC
_080BC518:
	ldr r1, [sp, #8]
	ldr r0, [r1]
	lsls r0, r0, #0x10
	lsrs r6, r0, #0x17
_080BC520:
	mov r0, r8
	bl GetROMChapterStruct
	adds r0, #0x70
	ldrh r0, [r0]
	bl sub_8009FA8
	adds r3, r0, #0
	ldr r5, _080BC588 @ =0x08AC0EDC
	adds r1, r4, #0
	adds r1, #0x48
	ldr r0, [r5]
	adds r0, r0, r1
	adds r1, r7, #4
	adds r1, #6
	lsls r1, r1, #1
	ldr r4, _080BC58C @ =0x020234A8
	adds r1, r1, r4
	movs r2, #0
	str r2, [sp]
	str r3, [sp, #4]
	movs r3, #0
	bl sub_8004374
	adds r0, r7, #0
	adds r0, #0xf
	adds r0, #6
	lsls r0, r0, #1
	adds r0, r0, r4
	movs r1, #2
	adds r2, r6, #0
	bl PutNumber
	ldr r0, [r5]
	adds r0, #0x90
	adds r1, r7, #0
	adds r1, #0x10
	adds r1, #6
	lsls r1, r1, #1
	adds r1, r1, r4
	bl PutText
_080BC574:
	ldr r0, [sp, #0xc]
_080BC576:
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BC588: .4byte 0x08AC0EDC
_080BC58C: .4byte 0x020234A8

