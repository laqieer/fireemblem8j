	.syntax unified
	.set GetItemMaxRange, 0x0801742C + 1
	.set GetItemMinRange, 0x08017414 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set SetWorkingMoveCosts, 0x0801A198 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801A1B8, 0x0801A1B8 + 1
	.set sub_801B668, 0x0801B668 + 1
	.set sub_801B674, 0x0801B674 + 1
	.section .text.sub_803D864, "ax", %progbits
@ sub_803D864 @ JP 0x0803D864 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803D864
	.thumb_func
sub_803D864:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r5, r0, #0
	adds r4, r1, #0
	lsls r4, r4, #0x10
	lsrs r4, r4, #0x10
	lsls r2, r2, #0x10
	lsrs r2, r2, #0x10
	mov sl, r2
	bl GetUnitMovementCost
	bl SetWorkingMoveCosts
	ldr r0, _0803D91C @ =0x0202E4DC
	ldr r0, [r0]
	bl sub_801B668
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r3, #0xb
	ldrsb r3, [r5, r3]
	adds r2, r4, #0
	bl sub_801A1B8
	ldr r0, _0803D920 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _0803D924 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803D90E
_0803D8B4:
	ldr r0, _0803D924 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r6, r0, #1
	subs r0, r7, #1
	mov sb, r0
	cmp r6, #0
	blt _0803D908
	lsls r1, r7, #0x10
	mov r8, r1
_0803D8C8:
	ldr r0, _0803D91C @ =0x0202E4DC
	ldr r1, [r0]
	lsls r0, r7, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D902
	lsls r5, r6, #0x10
	asrs r5, r5, #0x10
	mov r0, sl
	bl GetItemMinRange
	adds r4, r0, #0
	lsls r4, r4, #0x10
	asrs r4, r4, #0x10
	mov r0, sl
	bl GetItemMaxRange
	adds r3, r0, #0
	lsls r3, r3, #0x10
	asrs r3, r3, #0x10
	adds r0, r5, #0
	mov r2, r8
	asrs r1, r2, #0x10
	adds r2, r4, #0
	bl sub_801B674
_0803D902:
	subs r6, #1
	cmp r6, #0
	bge _0803D8C8
_0803D908:
	mov r7, sb
	cmp r7, #0
	bge _0803D8B4
_0803D90E:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803D91C: .4byte 0x0202E4DC
_0803D920: .4byte 0x0202E4E0
_0803D924: .4byte 0x0202E4D0

