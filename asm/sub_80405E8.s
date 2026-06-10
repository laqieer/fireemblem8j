	.syntax unified
	.set AreUnitsAllied, 0x08024D3C + 1
	.set GetCurrentPhase, 0x08024D6C + 1
	.set GetUnit, 0x08019108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_8040FD4, 0x08040FD4 + 1
	.section .text.sub_80405E8, "ax", %progbits
@ sub_80405E8 @ JP 0x080405E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80405E8
	.thumb_func
sub_80405E8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp]
	movs r0, #0xff
	str r0, [sp, #4]
	mov r8, r0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #8]
	movs r0, #0
	str r0, [sp, #0xc]
	ldr r0, _080406BC @ =0x03004DF0
	ldr r0, [r0]
	bl GetUnitMovementCost
	str r0, [sp, #0x10]
	bl GetCurrentPhase
	str r0, [sp, #0x14]
	adds r4, r0, #0
	adds r4, #1
	adds r0, #0x80
	cmp r4, r0
	blt _08040622
	b _0804074A
_08040622:
	adds r0, r4, #0
	bl GetUnit
	adds r7, r0, #0
	ldr r1, [sp, #0x14]
	adds r1, #0x80
	str r1, [sp, #0x1c]
	adds r4, #1
	str r4, [sp, #0x18]
	cmp r7, #0
	bne _0804063A
	b _08040740
_0804063A:
	ldr r0, [r7]
	cmp r0, #0
	bne _08040642
	b _08040740
_08040642:
	ldr r0, [r7, #0xc]
	ldr r1, _080406C0 @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _08040740
	adds r0, r7, #0
	bl sub_8040FD4
	ldr r0, _080406C4 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	cmp r6, #0
	blt _0804071A
_0804065E:
	ldr r0, _080406C4 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r4, r0, #1
	subs r0, r6, #1
	mov sb, r0
	cmp r4, #0
	blt _08040714
	ldr r3, _080406C8 @ =0x0202E4E0
	lsls r5, r6, #2
_08040672:
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r2, r0, r4
	ldrb r0, [r2]
	cmp r0, #0x78
	bhi _0804070E
	ldr r0, _080406CC @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _080406D0
	movs r0, #0xb
	ldrsb r0, [r7, r0]
	ldrb r1, [r1]
	str r3, [sp, #0x20]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x20]
	cmp r0, #0
	bne _0804070E
	ldr r0, [r3]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r1, r0, r4
	movs r0, #0
	ldrsb r0, [r1, r0]
	cmp r8, r0
	ble _0804070E
	ldrb r1, [r1]
	mov r8, r1
	b _0804070E
	.align 2, 0
_080406BC: .4byte 0x03004DF0
_080406C0: .4byte 0x00010025
_080406C4: .4byte 0x0202E4D0
_080406C8: .4byte 0x0202E4E0
_080406CC: .4byte 0x0202E4D4
_080406D0:
	ldr r0, _08040754 @ =0x0202E4D8
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	ldr r1, [sp, #0x10]
	adds r0, r1, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0804070E
	ldr r0, _08040758 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r5, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x78
	ble _0804070E
	movs r0, #0
	ldrsb r0, [r2, r0]
	cmp sl, r0
	ble _0804070E
	str r4, [sp, #8]
	str r6, [sp, #0xc]
	ldrb r2, [r2]
	mov sl, r2
_0804070E:
	subs r4, #1
	cmp r4, #0
	bge _08040672
_08040714:
	mov r6, sb
	cmp r6, #0
	bge _0804065E
_0804071A:
	mov r0, r8
	cmp r0, #0xff
	beq _08040740
	ldr r1, [sp, #4]
	cmp r1, r8
	blo _08040740
	mov r0, sl
	cmp r0, #0xff
	beq _08040740
	mov r1, sp
	ldrh r0, [r1, #8]
	ldr r1, [sp]
	strh r0, [r1]
	mov r1, sp
	ldrh r0, [r1, #0xc]
	ldr r1, [sp]
	strh r0, [r1, #2]
	mov r1, r8
	str r1, [sp, #4]
_08040740:
	ldr r4, [sp, #0x18]
	ldr r0, [sp, #0x1c]
	cmp r4, r0
	bge _0804074A
	b _08040622
_0804074A:
	ldr r1, [sp, #4]
	cmp r1, #0xff
	bne _0804075C
	movs r0, #0
	b _0804075E
	.align 2, 0
_08040754: .4byte 0x0202E4D8
_08040758: .4byte 0x0202E4DC
_0804075C:
	movs r0, #1
_0804075E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

