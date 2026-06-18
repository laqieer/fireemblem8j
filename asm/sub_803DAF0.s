	.syntax unified
	.set AiGetItemStealRank, 0x0803B79C + 1
	.set AiSetDecision, 0x08039C98 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_803B720, 0x0803B720 + 1
	.set sub_803B7D0, 0x0803B7D0 + 1
	.section .text.sub_803DAF0, "ax", %progbits
@ AiAttemptStealActionWithinMovement @ JP 0x0803DAF0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiAttemptStealActionWithinMovement
	.thumb_func
AiAttemptStealActionWithinMovement:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	movs r0, #0
	str r0, [sp, #0x10]
	movs r1, #0xff
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	ldr r0, _0803DBFC @ =0x0202E4D0
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r0, #1
	mov r8, r0
	cmp r0, #0
	blt _0803DBF2
_0803DB16:
	ldr r0, _0803DBFC @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	mov r2, r8
	subs r2, #1
	str r2, [sp, #0x20]
	cmp r5, #0
	blt _0803DBEA
	mov r4, r8
	lsls r7, r4, #2
_0803DB2C:
	ldr r0, _0803DC00 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803DBE4
	ldr r0, _0803DC04 @ =0x0202E4D4
	mov sl, r0
	ldr r0, [r0]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r1, r0, r5
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803DBE4
	ldr r0, _0803DC08 @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803DBE4
	mov r1, sp
	adds r1, #0xc
	str r1, [sp, #0x1c]
	adds r0, r5, #0
	mov r1, r8
	ldr r2, _0803DC0C @ =sub_803DA98
	add r3, sp, #0xc
	bl sub_803B720
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DBE4
	mov r2, sl
	ldr r0, [r2]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0803DC10 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x16
	ldrsb r1, [r0, r1]
	movs r0, #0x16
	ldrsb r0, [r4, r0]
	cmp r1, r0
	blt _0803DBE4
	adds r0, r4, #0
	bl sub_803B7D0
	lsls r0, r0, #0x18
	asrs r6, r0, #0x18
	cmp r6, #0
	blt _0803DBE4
	lsls r1, r6, #1
	adds r0, r4, #0
	adds r0, #0x1e
	adds r0, r0, r1
	ldrb r0, [r0]
	bl AiGetItemStealRank
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	ldr r4, [sp, #0x14]
	cmp r4, r0
	blo _0803DBE4
	str r0, [sp, #0x14]
	add r1, sp, #0xc
	ldr r2, [sp, #0x1c]
	ldrh r0, [r2, #2]
	lsls r0, r0, #0x10
	ldrh r1, [r1]
	mov sb, r1
	mov r4, sb
	orrs r4, r0
	mov sb, r4
	mov r1, sl
	ldr r0, [r1]
	adds r0, r7, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	str r0, [sp, #0x18]
	str r6, [sp, #0x10]
_0803DBE4:
	subs r5, #1
	cmp r5, #0
	bge _0803DB2C
_0803DBEA:
	ldr r2, [sp, #0x20]
	mov r8, r2
	cmp r2, #0
	bge _0803DB16
_0803DBF2:
	ldr r4, [sp, #0x14]
	cmp r4, #0xff
	bne _0803DC14
	movs r0, #0
	b _0803DC40
	.align 2, 0
_0803DBFC: .4byte 0x0202E4D0
_0803DC00: .4byte 0x0202E4DC
_0803DC04: .4byte 0x0202E4D4
_0803DC08: .4byte 0x0202BE40
_0803DC0C: .4byte 0x0803DA99  @ sub_803DA98
_0803DC10: .4byte 0x03004DF0
_0803DC14:
	ldr r0, _0803DC50 @ =0x03004DF0
	ldr r1, [r0]
	adds r1, #0x46
	ldrb r0, [r1]
	adds r0, #1
	movs r3, #0
	strb r0, [r1]
	mov r1, sb
	lsls r0, r1, #0x10
	asrs r0, r0, #0x10
	asrs r1, r1, #0x10
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r3, [sp, #4]
	str r3, [sp, #8]
	movs r2, #3
	ldr r3, [sp, #0x18]
	bl AiSetDecision
	movs r0, #1
_0803DC40:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803DC50: .4byte 0x03004DF0

