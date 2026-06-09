	.syntax unified
	.set GetNonActiveFaction, 0x08024D80 + 1
	.set GetUnit, 0x08019108 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A09C, 0x0801A09C + 1
	.set sub_801A998, 0x0801A998 + 1
	.set sub_801B2F4, 0x0801B2F4 + 1
	.set sub_801B620, 0x0801B620 + 1
	.section .text.sub_801B4E8, "ax", %progbits
@ sub_801B4E8 @ JP 0x0801B4E8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B4E8
	.thumb_func
sub_801B4E8:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	mov sb, r0
	movs r0, #1
	rsbs r0, r0, #0
	mov sl, r0
	ldr r0, _0801B514 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	bl GetNonActiveFaction
	mov r8, r0
	mov r6, r8
	adds r6, #1
	b _0801B604
	.align 2, 0
_0801B514: .4byte 0x0202E4E0
_0801B518:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0801B600
	ldr r0, [r4]
	cmp r0, #0
	beq _0801B600
	mov r0, sb
	cmp r0, #0
	beq _0801B53C
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0801B600
_0801B53C:
	ldr r0, _0801B5CC @ =0x0202BCEC
	ldrb r0, [r0, #0xd]
	cmp r0, #0
	beq _0801B55E
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B5D0 @ =0x0202E4E4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	cmp r0, #0
	beq _0801B600
_0801B55E:
	ldr r5, [r4, #0xc]
	movs r0, #0x80
	ands r5, r0
	cmp r5, #0
	bne _0801B600
	ldr r0, [r4, #4]
	ldrb r1, [r0, #0x12]
	ldrb r0, [r4, #0x1d]
	adds r1, r1, r0
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r0, r4, #0
	bl sub_801A09C
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B5D4 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r7, [r0]
	strb r5, [r0]
	adds r0, r4, #0
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	asrs r5, r0, #0x18
	cmp sl, r5
	beq _0801B5B6
	ldr r0, _0801B5D8 @ =0x0202E4EC
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	cmp r5, #0
	beq _0801B5B4
	movs r0, #1
	bl sub_801B620
_0801B5B4:
	mov sl, r5
_0801B5B6:
	ldr r0, _0801B5DC @ =0x0202E4E0
	ldr r1, [r0]
	ldr r0, _0801B5E0 @ =0x03004940
	str r1, [r0]
	mov r0, sb
	cmp r0, #0
	beq _0801B5E4
	adds r0, r4, #0
	bl sub_801B2F4
	b _0801B5EA
	.align 2, 0
_0801B5CC: .4byte 0x0202BCEC
_0801B5D0: .4byte 0x0202E4E4
_0801B5D4: .4byte 0x0202E4D4
_0801B5D8: .4byte 0x0202E4EC
_0801B5DC: .4byte 0x0202E4E0
_0801B5E0: .4byte 0x03004940
_0801B5E4:
	adds r0, r4, #0
	bl sub_801A998
_0801B5EA:
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	ldr r0, _0801B61C @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r4, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	strb r7, [r0]
_0801B600:
	adds r6, #1
	mov r0, r8
_0801B604:
	adds r0, #0x80
	cmp r6, r0
	bge _0801B60C
	b _0801B518
_0801B60C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B61C: .4byte 0x0202E4D4

