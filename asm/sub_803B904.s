	.syntax unified
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_803AD58, 0x0803AD58 + 1
	.set sub_803B99C, 0x0803B99C + 1
	.section .text.sub_803B904, "ax", %progbits
@ sub_803B904 @ JP 0x0803B904 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803B904
	.thumb_func
sub_803B904:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r4, r1, #0
	ldr r5, _0803B984 @ =0x03004DF0
	ldr r0, [r5]
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0803B988 @ =0x0202E4E0
	ldr r0, [r0]
	bl sub_801B668
	ldr r2, [r5]
	movs r0, #0x10
	ldrsb r0, [r2, r0]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	movs r3, #0xb
	ldrsb r3, [r2, r3]
	movs r2, #0x7c
	bl sub_801A1B8
	adds r0, r4, #0
	bl sub_803B99C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	ldr r6, _0803B98C @ =0x085D2028
	cmp r0, #1
	bne _0803B944
	ldr r6, _0803B990 @ =0x085D202C
_0803B944:
	adds r0, r6, #0
	movs r1, #1
	adds r2, r7, #0
	bl sub_803AD58
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B994
	ldr r0, [r5]
	movs r4, #0x10
	ldrsb r4, [r0, r4]
	movs r5, #0x11
	ldrsb r5, [r0, r5]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	bl GenerateExtendedMovementMapOnRange
	adds r0, r6, #0
	movs r1, #0
	adds r2, r7, #0
	bl sub_803AD58
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803B994
	movs r0, #0
	b _0803B996
	.align 2, 0
_0803B984: .4byte 0x03004DF0
_0803B988: .4byte 0x0202E4E0
_0803B98C: .4byte 0x085D2028
_0803B990: .4byte 0x085D202C
_0803B994:
	movs r0, #1
_0803B996:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

