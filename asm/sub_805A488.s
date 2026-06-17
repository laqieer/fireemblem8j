	.syntax unified
	.set AnimScrAdvance, 0x0805A670 + 1
	.set GetAISLayerId, 0x0805AEF8 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set GetBattleAnimRoundType, 0x0805983C + 1
	.set sub_8059A04, 0x08059A04 + 1
	.set sub_805A6E0, 0x0805A6E0 + 1
	.set SwitchAISFrameDataFromBARoundType, 0x0805AE20 + 1
	.set sub_805B094, 0x0805B094 + 1
	.section .text.sub_805A488, "ax", %progbits
@ sub_805A488 @ JP 0x0805A488 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_805A488
	.thumb_func
sub_805A488:
	movs r0, #0x80
	lsls r0, r0, #6
	mov r3, r8
	ands r0, r3
	cmp r0, #0
	beq _0805A4EE
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A4E4
	ldr r4, _0805A544 @ =0x0203E1A0
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r0, [r0]
	cmp r0, #0
	bne _0805A4E4
	ldrh r1, [r7, #0x10]
	movs r0, #0x80
	lsls r0, r0, #7
	ands r0, r1
	cmp r0, #0
	bne _0805A4E4
	ldr r4, _0805A548 @ =0x0201FB1C
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r0]
	ldr r0, [r7, #0x28]
	cmp r1, r0
	beq _0805A4E4
	adds r0, r7, #0
	bl sub_805A6E0
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r1, [r7, #0x28]
	str r1, [r0]
_0805A4E4:
	ldrh r1, [r7, #0xc]
	movs r0, #0xd7
	lsls r0, r0, #8
	ands r0, r1
	strh r0, [r7, #0xc]
_0805A4EE:
	movs r0, #0x80
	lsls r0, r0, #7
	mov r1, r8
	ands r1, r0
	cmp r1, #0
	bne _0805A504
	ldr r0, _0805A54C @ =0x02000024
	ldr r0, [r0]
	cmp r0, #1
	beq _0805A504
	b _0805A650
_0805A504:
	ldrh r1, [r7, #0x10]
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _0805A590
	adds r0, r7, #0
	bl sub_805B094
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _0805A558
	ldr r6, _0805A550 @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
	ldrh r1, [r2, #0x10]
	ldr r4, _0805A554 @ =0x0000FFFD
	b _0805A5CC
	.align 2, 0
_0805A544: .4byte 0x0203E1A0
_0805A548: .4byte 0x0201FB1C
_0805A54C: .4byte 0x02000024
_0805A550: .4byte 0x02000000
_0805A554: .4byte 0x0000FFFD
_0805A558:
	ldr r5, _0805A588 @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r5
	ldr r2, [r0]
	ldrh r1, [r2, #0x10]
	ldr r4, _0805A58C @ =0x0000FFFD
	adds r0, r4, #0
	ands r0, r1
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r5
	ldr r6, [r0]
	ldrh r0, [r6, #0x10]
	ands r4, r0
	strh r4, [r6, #0x10]
	b _0805A650
	.align 2, 0
_0805A588: .4byte 0x02000000
_0805A58C: .4byte 0x0000FFFD
_0805A590:
	movs r0, #0x80
	lsls r0, r0, #8
	ands r0, r1
	cmp r0, #0
	beq _0805A61C
	adds r0, r7, #0
	bl sub_805B094
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	mov r8, r0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r8, r0
	beq _0805A650
	ldr r6, _0805A614 @ =0x02000000
	adds r0, r7, #0
	bl GetAnimPosition
	lsls r0, r0, #3
	adds r0, r0, r6
	ldr r2, [r0]
	adds r0, r2, #0
	mov r1, r8
	str r2, [sp]
	bl SwitchAISFrameDataFromBARoundType
	ldr r2, [sp]
	ldrh r1, [r2, #0x10]
	ldr r4, _0805A618 @ =0x00007FFF
_0805A5CC:
	adds r0, r4, #0
	ands r0, r1
	movs r5, #4
	orrs r0, r5
	strh r0, [r2, #0x10]
	adds r0, r7, #0
	str r2, [sp]
	bl GetAnimPosition
	lsls r0, r0, #1
	adds r0, #1
	lsls r0, r0, #2
	adds r0, r0, r6
	ldr r6, [r0]
	adds r0, r6, #0
	mov r1, r8
	bl SwitchAISFrameDataFromBARoundType
	ldrh r0, [r6, #0x10]
	ands r4, r0
	orrs r4, r5
	strh r4, [r6, #0x10]
	ldr r2, [sp]
	ldrh r0, [r2, #0xe]
	adds r0, #1
	strh r0, [r2, #0xe]
	ldrh r0, [r6, #0xe]
	adds r0, #1
	strh r0, [r6, #0xe]
	adds r0, r2, #0
	bl AnimScrAdvance
	adds r0, r6, #0
	bl AnimScrAdvance
	b _0805A650
	.align 2, 0
_0805A614: .4byte 0x02000000
_0805A618: .4byte 0x00007FFF
_0805A61C:
	adds r0, r7, #0
	bl GetAISLayerId
	cmp r0, #0
	bne _0805A650
	adds r0, r7, #0
	bl GetAnimPosition
	adds r1, r0, #0
	ldrh r0, [r7, #0xe]
	lsls r0, r0, #1
	adds r0, r0, r1
	bl GetBattleAnimRoundType
	lsls r0, r0, #0x10
	ldr r1, _0805A668 @ =0xFFFF0000
	cmp r0, r1
	bne _0805A650
	adds r0, r7, #0
	bl GetAnimPosition
	ldr r1, _0805A66C @ =0x0201FB04
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #1
	str r1, [r0]
_0805A650:
	mov r2, sb
	cmp r2, #3
	bhi _0805A65A
	bl sub_8059A04
_0805A65A:
	add sp, #4
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0805A668: .4byte 0xFFFF0000
_0805A66C: .4byte 0x0201FB04

