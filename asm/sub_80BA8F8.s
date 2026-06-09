	.syntax unified
	.set GetGameTotalTurnCount2, 0x080A8ECC + 1
	.set GetNextChapterStatsSlot, 0x080A8D00 + 1
	.set IsChapterBelongCurGame, 0x080A8E48 + 1
	.set IsDifficultMode, 0x0803460C + 1
	.set sub_80A8CE0, 0x080A8CE0 + 1
	.section .text.sub_80BA8F8, "ax", %progbits
@ sub_80BA8F8 @ JP 0x080BA8F8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BA8F8
	.thumb_func
sub_80BA8F8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x10
	bl GetGameTotalTurnCount2
	mov sb, r0
	movs r1, #0
	add r0, sp, #0xc
_080BA90E:
	str r1, [r0]
	subs r0, #4
	cmp r0, sp
	bge _080BA90E
	bl GetNextChapterStatsSlot
	mov r8, r0
	movs r5, #0
	cmp r5, r8
	bge _080BA9C6
	ldr r6, _080BA9EC @ =0x08904E1C
	movs r7, #0x94
	movs r0, #0x2d
	adds r0, r0, r6
	mov sl, r0
_080BA92C:
	adds r0, r5, #0
	bl sub_80A8CE0
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterBelongCurGame
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BA9C0
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x39
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, [sp]
	adds r0, r0, r1
	str r0, [sp]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x35
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, [sp, #4]
	adds r0, r0, r1
	str r0, [sp, #4]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	adds r1, r6, #0
	adds r1, #0x31
	adds r0, r0, r1
	ldrb r1, [r0]
	ldr r0, [sp, #8]
	adds r0, r0, r1
	str r0, [sp, #8]
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	muls r1, r7, r1
	adds r0, r0, r1
	add r0, sl
	ldrb r1, [r0]
	ldr r0, [sp, #0xc]
	adds r0, r0, r1
	str r0, [sp, #0xc]
_080BA9C0:
	adds r5, #1
	cmp r5, r8
	blt _080BA92C
_080BA9C6:
	movs r5, #0
	mov r1, sp
_080BA9CA:
	ldr r0, [r1]
	cmp sb, r0
	bgt _080BA9D8
	adds r1, #4
	adds r5, #1
	cmp r5, #3
	ble _080BA9CA
_080BA9D8:
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
_080BA9EC: .4byte 0x08904E1C

