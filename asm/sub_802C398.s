	.syntax unified
	.set GetUnitClassKillExpBonus, 0x0802C320 + 1
	.set GetUnitExpMultiplier, 0x0802C354 + 1
	.set sub_802C2E0, 0x0802C2E0 + 1
	.section .text.sub_802C398, "ax", %progbits
@ sub_802C398 @ JP 0x0802C398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802C398
	.thumb_func
sub_802C398:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r5, r1, #0
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	beq _0802C3AA
	movs r0, #0
	b _0802C422
_0802C3AA:
	movs r6, #0x14
	ldr r0, _0802C3C8 @ =0x0202BCEC
	ldrb r0, [r0, #0x1b]
	cmp r0, #1
	beq _0802C3CC
	adds r0, r5, #0
	bl sub_802C2E0
	adds r6, r0, #0
	adds r6, #0x14
	adds r0, r7, #0
	bl sub_802C2E0
	subs r6, r6, r0
	b _0802C406
	.align 2, 0
_0802C3C8: .4byte 0x0202BCEC
_0802C3CC:
	adds r0, r5, #0
	bl sub_802C2E0
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_802C2E0
	cmp r4, r0
	bgt _0802C3F4
	adds r0, r5, #0
	bl sub_802C2E0
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_802C2E0
	lsrs r1, r0, #0x1f
	adds r0, r0, r1
	asrs r0, r0, #1
	b _0802C402
_0802C3F4:
	adds r0, r5, #0
	bl sub_802C2E0
	adds r4, r0, #0
	adds r0, r7, #0
	bl sub_802C2E0
_0802C402:
	subs r4, r4, r0
	adds r6, r6, r4
_0802C406:
	adds r0, r7, #0
	adds r1, r5, #0
	bl GetUnitClassKillExpBonus
	adds r6, r6, r0
	adds r0, r7, #0
	adds r1, r5, #0
	bl GetUnitExpMultiplier
	muls r6, r0, r6
	cmp r6, #0
	bge _0802C420
	movs r6, #0
_0802C420:
	adds r0, r6, #0
_0802C422:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

