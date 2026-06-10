	.syntax unified
	.set ApplyMapChangesById, 0x0802E4C4 + 1
	.set EnableMapChange, 0x0802E530 + 1
	.set GetTrapAt, 0x0802E128 + 1
	.set UpdateRoofedUnits, 0x0802E5C8 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_801973C, 0x0801973C + 1
	.set sub_8019914, 0x08019914 + 1
	.set sub_8019994, 0x08019994 + 1
	.set sub_801DA28, 0x0801DA28 + 1
	.set sub_802E468, 0x0802E468 + 1
	.section .text.sub_802C8BC, "ax", %progbits
@ sub_802C8BC @ JP 0x0802C8BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C8BC
	.thumb_func
sub_802C8BC:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	adds r6, r0, #0
	ldrb r0, [r4, #0x13]
	strb r0, [r6, #3]
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _0802C938
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl sub_802E468
	adds r5, r0, #0
	movs r0, #0x11
	ldrsb r0, [r4, r0]
	ldr r1, _0802C940 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r4, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r0, [r0]
	cmp r0, #0x33
	bne _0802C912
	ldr r0, _0802C944 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _0802C912
	ldr r0, _0802C948 @ =0x000002D7
	bl m4aSongNumStart
_0802C912:
	bl sub_8019994
	adds r0, r5, #0
	bl ApplyMapChangesById
	movs r0, #0
	strb r0, [r6, #2]
	adds r0, r5, #0
	bl EnableMapChange
	bl sub_801973C
	bl UpdateRoofedUnits
	bl sub_8019914
	movs r0, #0
	bl sub_801DA28
_0802C938:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802C940: .4byte 0x0202E4D8
_0802C944: .4byte 0x0202BCEC
_0802C948: .4byte 0x000002D7

