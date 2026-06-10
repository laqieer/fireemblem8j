	.syntax unified
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set UnitHasMagicRank, 0x0801876C + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803D648, 0x0803D648 + 1
	.set sub_803D864, 0x0803D864 + 1
	.section .text.sub_803F0EC, "ax", %progbits
@ sub_803F0EC @ JP 0x0803F0EC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803F0EC
	.thumb_func
sub_803F0EC:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0803F188 @ =0x03004DF0
	ldr r0, [r5]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	ldrb r1, [r4, #4]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x14
	str r1, [sp, #4]
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r0, r0, #0x10
	mov sl, r0
	ldr r2, [r5]
	adds r0, r2, #0
	adds r0, #0x40
	ldrh r1, [r0]
	movs r0, #0xfe
	lsls r0, r0, #5
	ands r0, r1
	lsrs r0, r0, #8
	ldr r1, [r4]
	lsls r0, r0, #1
	adds r0, r0, r1
	ldrb r1, [r0]
	mov r8, r1
	ldrb r0, [r0, #1]
	mov sb, r0
	movs r6, #0x10
	ldrsb r6, [r2, r6]
	movs r7, #0x11
	ldrsb r7, [r2, r7]
	strb r1, [r2, #0x10]
	ldr r0, [r5]
	mov r2, sb
	strb r2, [r0, #0x11]
	ldrb r0, [r4, #5]
	cmp r0, #0
	beq _0803F190
	mov r0, sl
	cmp r0, #0
	beq _0803F190
	ldr r0, [r5]
	ldr r1, [sp, #4]
	mov r2, sl
	bl sub_803D864
	ldr r0, _0803F18C @ =0x0202E4E0
	ldr r1, [r0]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803F1CA
_0803F17C:
	ldr r0, [r5]
	strb r6, [r0, #0x10]
	ldr r0, [r5]
	strb r7, [r0, #0x11]
	b _0803F294
	.align 2, 0
_0803F188: .4byte 0x03004DF0
_0803F18C: .4byte 0x0202E4E0
_0803F190:
	ldr r5, _0803F240 @ =0x03004DF0
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r4, _0803F244 @ =0x0202E4E0
	ldr r0, [r4]
	bl sub_801B668
	ldr r1, [r5]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	ldr r2, [sp, #4]
	movs r3, #0
	bl sub_801A1B8
	ldr r1, [r4]
	mov r2, sb
	lsls r0, r2, #2
	adds r0, r0, r1
	ldr r0, [r0]
	add r0, r8
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803F17C
_0803F1CA:
	ldr r4, _0803F240 @ =0x03004DF0
	ldr r0, [r4]
	strb r6, [r0, #0x10]
	ldr r0, [r4]
	strb r7, [r0, #0x11]
	ldr r0, [r4]
	bl sub_801A05C
	ldr r0, [r4]
	bl UnitHasMagicRank
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803F1EE
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
_0803F1EE:
	ldr r1, _0803F248 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r1, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F282
_0803F1FA:
	ldr r1, _0803F248 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r1, r2]
	subs r3, r0, #1
	subs r0, r5, #1
	mov ip, r0
	cmp r3, #0
	blt _0803F27C
	ldr r7, _0803F24C @ =0x0202E4DC
	ldr r6, _0803F244 @ =0x0202E4E0
	movs r2, #1
	rsbs r2, r2, #0
	adds r1, r2, #0
_0803F214:
	mov r0, sl
	cmp r0, #0
	beq _0803F250
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803F274
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	bne _0803F276
	b _0803F274
	.align 2, 0
_0803F240: .4byte 0x03004DF0
_0803F244: .4byte 0x0202E4E0
_0803F248: .4byte 0x0202E4D0
_0803F24C: .4byte 0x0202E4DC
_0803F250:
	ldr r0, [r7]
	lsls r2, r5, #2
	adds r0, r2, r0
	ldr r0, [r0]
	adds r4, r0, r3
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0x77
	bgt _0803F274
	ldr r0, [r6]
	adds r0, r2, r0
	ldr r0, [r0]
	adds r0, r0, r3
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x77
	ble _0803F276
_0803F274:
	strb r1, [r4]
_0803F276:
	subs r3, #1
	cmp r3, #0
	bge _0803F214
_0803F27C:
	mov r5, ip
	cmp r5, #0
	bge _0803F1FA
_0803F282:
	ldr r0, _0803F2B8 @ =sub_803C7A8
	bl sub_803D648
	ldr r0, _0803F2BC @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803F2A4
_0803F294:
	mov r0, r8
	mov r1, sb
	movs r2, #1
	str r2, [sp]
	movs r2, #0
	movs r3, #0xff
	bl sub_803BA10
_0803F2A4:
	movs r0, #1
	add sp, #8
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F2B8: .4byte 0x0803C7A9  @ sub_803C7A8
_0803F2BC: .4byte 0x0203AA90

