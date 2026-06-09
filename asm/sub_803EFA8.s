	.syntax unified
	.set AiIsUnitAtPositionDifferentAllegiance, 0x0803EF70 + 1
	.set GetUnitEquippedWeapon, 0x080168D0 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_803D864, 0x0803D864 + 1
	.section .text.sub_803EFA8, "ax", %progbits
@ sub_803EFA8 @ JP 0x0803EFA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803EFA8
	.thumb_func
sub_803EFA8:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	movs r7, #0
	ldr r4, _0803F040 @ =0x03004DF0
	ldr r0, [r4]
	movs r2, #0x1d
	ldrsb r2, [r0, r2]
	ldr r1, [r0, #4]
	ldrb r1, [r1, #0x12]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r2, r1
	mov r3, r8
	ldrb r1, [r3]
	muls r1, r2, r1
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x14
	bl GetUnitEquippedWeapon
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	mov r1, r8
	ldrb r0, [r1, #1]
	cmp r0, #0
	beq _0803F04C
	cmp r2, #0
	beq _0803F04C
	ldr r0, [r4]
	adds r1, r5, #0
	bl sub_803D864
	ldr r0, _0803F044 @ =0x0202E4D0
	movs r2, #2
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F0C2
_0803EFF6:
	ldr r0, _0803F044 @ =0x0202E4D0
	movs r3, #0
	ldrsh r0, [r0, r3]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803F036
_0803F004:
	ldr r0, _0803F048 @ =0x0202E4E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803F030
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiIsUnitAtPositionDifferentAllegiance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803F030
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803F030:
	subs r4, #1
	cmp r4, #0
	bge _0803F004
_0803F036:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803EFF6
	b _0803F0C2
	.align 2, 0
_0803F040: .4byte 0x03004DF0
_0803F044: .4byte 0x0202E4D0
_0803F048: .4byte 0x0202E4E0
_0803F04C:
	ldr r4, _0803F0DC @ =0x03004DF0
	ldr r0, [r4]
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0803F0E0 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	ldr r1, [r4]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	ldrb r1, [r1, #0x11]
	lsls r1, r1, #0x18
	asrs r1, r1, #0x18
	adds r2, r5, #0
	movs r3, #0
	bl sub_801A1B8
	ldr r0, _0803F0E4 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r5, r0, #1
	cmp r5, #0
	blt _0803F0C2
_0803F080:
	ldr r0, _0803F0E4 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r6, r5, #1
	cmp r4, #0
	blt _0803F0BC
_0803F08E:
	ldr r0, _0803F0E0 @ =0x0202E4E0
	ldr r1, [r0]
	lsls r0, r5, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803F0B6
	adds r0, r4, #0
	adds r1, r5, #0
	bl AiIsUnitAtPositionDifferentAllegiance
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0803F0B6
	adds r0, r7, #1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
_0803F0B6:
	subs r4, #1
	cmp r4, #0
	bge _0803F08E
_0803F0BC:
	adds r5, r6, #0
	cmp r5, #0
	bge _0803F080
_0803F0C2:
	ldr r0, _0803F0E8 @ =0x0203AA00
	adds r0, #0x86
	mov r3, r8
	ldrb r3, [r3, #2]
	adds r0, r0, r3
	strb r7, [r0]
	movs r0, #0
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803F0DC: .4byte 0x03004DF0
_0803F0E0: .4byte 0x0202E4E0
_0803F0E4: .4byte 0x0202E4D0
_0803F0E8: .4byte 0x0203AA00

