	.syntax unified
	.set GetUnitStaffReachBits, 0x080170A0 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.section .text.sub_801B2F4, "ax", %progbits
@ sub_801B2F4 @ JP 0x0801B2F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801B2F4
	.thumb_func
sub_801B2F4:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	adds r4, r0, #0
	bl GetUnitStaffReachBits
	adds r5, r0, #0
	adds r0, r4, #0
	bl sub_8018730
	mov sl, r0
	cmp r5, #3
	beq _0801B3B4
	cmp r5, #3
	bgt _0801B31C
	cmp r5, #1
	beq _0801B324
	b _0801B4C8
_0801B31C:
	cmp r5, #0x20
	bne _0801B322
	b _0801B444
_0801B322:
	b _0801B4C8
_0801B324:
	ldr r0, _0801B3A4 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B332
	b _0801B4C8
_0801B332:
	ldr r0, _0801B3A4 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B39C
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B348:
	ldr r0, _0801B3A8 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B396
	ldr r0, _0801B3AC @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B396
	ldr r0, _0801B3B0 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B396
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #1
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801B396:
	subs r5, #1
	cmp r5, #0
	bge _0801B348
_0801B39C:
	mov r1, r8
	cmp r1, #0
	bge _0801B332
	b _0801B4C8
	.align 2, 0
_0801B3A4: .4byte 0x0202E4D0
_0801B3A8: .4byte 0x0202E4DC
_0801B3AC: .4byte 0x0202E4D4
_0801B3B0: .4byte 0x0202E4EC
_0801B3B4:
	ldr r0, _0801B434 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	bge _0801B3C2
	b _0801B4C8
_0801B3C2:
	ldr r0, _0801B434 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B42C
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
_0801B3D8:
	ldr r0, _0801B438 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B426
	ldr r0, _0801B43C @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B426
	ldr r0, _0801B440 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B426
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #2
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801B426:
	subs r5, #1
	cmp r5, #0
	bge _0801B3D8
_0801B42C:
	mov r1, r8
	cmp r1, #0
	bge _0801B3C2
	b _0801B4C8
	.align 2, 0
_0801B434: .4byte 0x0202E4D0
_0801B438: .4byte 0x0202E4DC
_0801B43C: .4byte 0x0202E4D4
_0801B440: .4byte 0x0202E4EC
_0801B444:
	ldr r0, _0801B4D8 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r1, r0, #1
	cmp r1, #0
	blt _0801B4C8
_0801B450:
	ldr r0, _0801B4D8 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r5, r0, #1
	subs r3, r1, #1
	mov r8, r3
	cmp r5, #0
	blt _0801B4C2
	lsls r6, r1, #2
	lsls r0, r1, #0x10
	asrs r7, r0, #0x10
	mov r0, sl
	lsls r0, r0, #0x10
	mov sb, r0
_0801B46C:
	ldr r0, _0801B4DC @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0801B4BC
	ldr r0, _0801B4E0 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B4BC
	ldr r0, _0801B4E4 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r5
	ldrb r0, [r0]
	cmp r0, #0
	bne _0801B4BC
	lsls r4, r5, #0x10
	asrs r4, r4, #0x10
	adds r0, r4, #0
	adds r1, r7, #0
	mov r3, sb
	asrs r2, r3, #0x10
	movs r3, #1
	bl MapAddInRange
	adds r0, r4, #0
	adds r1, r7, #0
	movs r2, #0
	movs r3, #1
	rsbs r3, r3, #0
	bl MapAddInRange
_0801B4BC:
	subs r5, #1
	cmp r5, #0
	bge _0801B46C
_0801B4C2:
	mov r1, r8
	cmp r1, #0
	bge _0801B450
_0801B4C8:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0801B4D8: .4byte 0x0202E4D0
_0801B4DC: .4byte 0x0202E4DC
_0801B4E0: .4byte 0x0202E4D4
_0801B4E4: .4byte 0x0202E4EC

