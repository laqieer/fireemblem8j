	.syntax unified
	.set GetNextChapterStatsSlot, 0x080A8D00 + 1
	.set IsDifficultMode, 0x0803460C + 1
	.set sub_80171F8, 0x080171F8 + 1
	.set sub_80A8CE0, 0x080A8CE0 + 1
	.section .text.sub_80BAE60, "ax", %progbits
@ sub_80BAE60 @ JP 0x080BAE60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BAE60
	.thumb_func
sub_80BAE60:
	push {r4, r5, r6, lr}
	bl sub_80171F8
	ldr r1, _080BAEA8 @ =0x0202BCEC
	ldr r5, [r1, #0x30]
	subs r5, r0, r5
	str r0, [r1, #0x30]
	bl GetNextChapterStatsSlot
	subs r0, #1
	bl sub_80A8CE0
	adds r6, r0, #0
	ldr r4, _080BAEAC @ =0x08904E1C
	bl IsDifficultMode
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x16
	ldr r1, [r6]
	lsls r1, r1, #0x19
	lsrs r1, r1, #0x19
	movs r2, #0x94
	muls r1, r2, r1
	adds r0, r0, r1
	adds r4, #0x60
	adds r0, r0, r4
	ldr r1, [r0]
	movs r0, #0x64
	muls r5, r0, r5
	lsls r0, r1, #2
	adds r2, r0, r1
	lsls r0, r2, #4
	cmp r5, r0
	blt _080BAEB0
	movs r0, #4
	b _080BAED4
	.align 2, 0
_080BAEA8: .4byte 0x0202BCEC
_080BAEAC: .4byte 0x08904E1C
_080BAEB0:
	lsls r0, r1, #4
	subs r0, r0, r1
	lsls r0, r0, #2
	cmp r5, r0
	blt _080BAEBE
	movs r0, #3
	b _080BAED4
_080BAEBE:
	lsls r0, r2, #3
	cmp r5, r0
	blt _080BAEC8
	movs r0, #2
	b _080BAED4
_080BAEC8:
	lsls r0, r2, #2
	cmp r5, r0
	bge _080BAED2
	movs r0, #0
	b _080BAED4
_080BAED2:
	movs r0, #1
_080BAED4:
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

