	.syntax unified
	.set GetNextChapterStatsSlot, 0x080A8D00 + 1
	.set IsChapterBelongCurGame, 0x080A8E48 + 1
	.set IsDifficultMode, 0x0803460C + 1
	.set sub_80A8CE0, 0x080A8CE0 + 1
	.set sub_80A93E8, 0x080A93E8 + 1
	.section .text.sub_80BAA28, "ax", %progbits
@ sub_80BAA28 @ JP 0x080BAA28 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BAA28
	.thumb_func
sub_80BAA28:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl sub_80A93E8
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080BAA3E:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080BAA3E
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080BAAF6
	ldr r6, _080BAB1C @ =0x08904E1C
	movs r7, #0x94
	movs r0, #0x3e
	adds r0, r0, r6
	mov sl, r0
_080BAA5C:
	adds r0, r5, #0
	bl sub_80A8CE0
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterBelongCurGame
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BAAF0
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x56
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [sp]
	adds r0, r0, r1
	str r0, [sp]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x4e
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #4]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x46
	adds r0, r0, r1
	ldrh r1, [r0]
	ldr r0, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #8]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x17
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldrh r1, [r0]
	ldr r0, [sp, #0xc]
	adds r0, r0, r1
	str r0, [sp, #0xc]
_080BAAF0:
	adds r5, #1
	cmp r5, r8
	blt _080BAA5C
_080BAAF6:
	movs r5, #0
	mov r1, sp
_080BAAFA:
	ldr r0, [r1]
	cmp sb, r0
	blt _080BAB08
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080BAAFA
_080BAB08:
	adds r0, r5, #0
	add sp, #0x10
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_080BAB1C: .4byte 0x08904E1C

