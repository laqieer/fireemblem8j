	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_803144C, 0x0803144C + 1
	.set sub_809A320, 0x0809A320 + 1
	.section .text.sub_809A4BC, "ax", %progbits
@ sub_809A4BC @ JP 0x0809A4BC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A4BC
	.thumb_func
sub_809A4BC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov r8, r0
	mov sl, r1
	mov sb, r2
	ldr r6, _0809A584 @ =0x020122D4
	ldr r1, _0809A588 @ =0x02012F54
	movs r0, #0
	strh r0, [r1]
	movs r0, #2
	ands r0, r2
	cmp r0, #0
	beq _0809A536
	movs r5, #1
_0809A4DE:
	adds r0, r5, #0
	bl GetUnit
	adds r4, r0, #0
	adds r7, r5, #1
	cmp r4, #0
	beq _0809A530
	ldr r0, [r4]
	cmp r0, #0
	beq _0809A530
	ldr r0, [r4, #0xc]
	ldr r1, _0809A58C @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _0809A530
	cmp r4, r8
	beq _0809A530
	adds r0, r4, #0
	bl GetUnitItemCount
	adds r5, r0, #0
	movs r2, #0
	cmp r2, r5
	bge _0809A530
	ldr r3, _0809A588 @ =0x02012F54
	adds r1, r4, #0
	adds r1, #0x1e
_0809A514:
	ldr r0, [r4]
	ldrb r0, [r0, #4]
	strb r0, [r6]
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, r5
	blt _0809A514
_0809A530:
	adds r5, r7, #0
	cmp r5, #0x3f
	ble _0809A4DE
_0809A536:
	movs r0, #1
	mov r1, sb
	ands r0, r1
	cmp r0, #0
	beq _0809A570
	bl sub_803144C
	adds r1, r0, #0
	movs r2, #0
	ldrh r0, [r1]
	cmp r0, #0
	beq _0809A570
	movs r4, #0
	ldr r3, _0809A588 @ =0x02012F54
_0809A552:
	ldrh r0, [r1]
	strh r0, [r6, #2]
	strb r4, [r6]
	strb r2, [r6, #1]
	adds r6, #4
	ldrh r0, [r3]
	adds r0, #1
	strh r0, [r3]
	adds r1, #2
	adds r2, #1
	cmp r2, #0x63
	bgt _0809A570
	ldrh r0, [r1]
	cmp r0, #0
	bne _0809A552
_0809A570:
	mov r0, sl
	bl sub_809A320
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0809A584: .4byte 0x020122D4
_0809A588: .4byte 0x02012F54
_0809A58C: .4byte 0x00010004

