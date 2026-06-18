	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetEscapePointStructThingMaybe, 0x0803E808 + 1
	.set sub_801A09C, 0x0801A09C + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.section .text.sub_803E760, "ax", %progbits
@ AiTryMoveTowardsEscape @ JP 0x0803E760 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiTryMoveTowardsEscape
	.thumb_func
AiTryMoveTowardsEscape:
	push {r4, r5, r6, lr}
	sub sp, #0xc
	ldr r6, _0803E7D0 @ =0x03004DF0
	ldr r0, [r6]
	movs r1, #0x7c
	bl sub_801A09C
	bl GetEscapePointStructThingMaybe
	adds r4, r0, #0
	cmp r4, #0
	beq _0803E7FC
	ldrb r5, [r4, #1]
	ldr r0, _0803E7D4 @ =0x0202E4DC
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldrb r3, [r4]
	ldr r0, [r0]
	adds r0, r0, r3
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r1, [r6]
	movs r0, #0x1d
	ldrsb r0, [r1, r0]
	ldr r1, [r1, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r0, r1
	cmp r2, r0
	bgt _0803E7DC
	movs r0, #1
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
	ldr r1, _0803E7D8 @ =0x0203AA90
	ldrb r0, [r1, #2]
	ldrb r1, [r1, #3]
	ldrb r3, [r4]
	ldrb r2, [r4, #1]
	str r2, [sp]
	ldrb r2, [r4, #2]
	str r2, [sp, #4]
	movs r2, #0
	str r2, [sp, #8]
	movs r2, #2
	bl AiSetDecision
	movs r0, #1
	b _0803E7FE
	.align 2, 0
_0803E7D0: .4byte 0x03004DF0
_0803E7D4: .4byte 0x0202E4DC
_0803E7D8: .4byte 0x0203AA90
_0803E7DC:
	movs r0, #0
	str r0, [sp]
	adds r0, r3, #0
	adds r1, r5, #0
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
	ldr r0, _0803E7F8 @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	b _0803E7FE
	.align 2, 0
_0803E7F8: .4byte 0x0203AA90
_0803E7FC:
	movs r0, #0
_0803E7FE:
	add sp, #0xc
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0

