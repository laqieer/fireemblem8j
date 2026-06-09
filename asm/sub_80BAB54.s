	.syntax unified
	.set GetNextChapterStatsSlot, 0x080A8D00 + 1
	.set IsChapterBelongCurGame, 0x080A8E48 + 1
	.set IsDifficultMode, 0x0803460C + 1
	.set sub_80171F8, 0x080171F8 + 1
	.set sub_80A8CE0, 0x080A8CE0 + 1
	.section .text.sub_80BAB54, "ax", %progbits
@ sub_80BAB54 @ JP 0x080BAB54 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BAB54
	.thumb_func
sub_80BAB54:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	bl sub_80171F8
	mov r8, r0
	movs r6, #0
	bl GetNextChapterStatsSlot
	adds r7, r0, #0
	movs r5, #0
	cmp r6, r7
	bge _080BABAC
	ldr r0, _080BABC0 @ =0x08904E7C
	mov sb, r0
_080BAB74:
	adds r0, r5, #0
	bl sub_80A8CE0
	adds r4, r0, #0
	ldr r0, [r4]
	lsls r0, r0, #0x19
	lsrs r0, r0, #0x19
	bl IsChapterBelongCurGame
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080BABA6
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r4]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x94
	muls r1, r2, r1
	adds r0, r0, r1
	add r0, sb
	ldr r0, [r0]
	adds r6, r6, r0
_080BABA6:
	adds r5, #1
	cmp r5, r7
	blt _080BAB74
_080BABAC:
	movs r0, #0x64
	mov r1, r8
	muls r1, r0, r1
	lsls r0, r6, #2
	adds r2, r0, r6
	lsls r0, r2, #4
	cmp r1, r0
	blo _080BABC4
	movs r0, #4
	b _080BABE8
	.align 2, 0
_080BABC0: .4byte 0x08904E7C
_080BABC4:
	lsls r0, r6, #4
	subs r0, r0, r6
	lsls r0, r0, #2
	cmp r1, r0
	blo _080BABD2
	movs r0, #3
	b _080BABE8
_080BABD2:
	lsls r0, r2, #3
	cmp r1, r0
	blo _080BABDC
	movs r0, #2
	b _080BABE8
_080BABDC:
	lsls r0, r2, #2
	cmp r1, r0
	bhs _080BABE6
	movs r0, #0
	b _080BABE8
_080BABE6:
	movs r0, #1
_080BABE8:
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

