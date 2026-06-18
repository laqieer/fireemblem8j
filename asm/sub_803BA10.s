	.syntax unified
	.set AiCheckDangerAt, 0x0803E3D8 + 1
	.set AiSetDecision, 0x08039C98 + 1
	.set GenerateExtendedMovementMapOnRange, 0x0801A108 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_8041044, 0x08041044 + 1
	.section .text.sub_803BA10, "ax", %progbits
@ AiTryMoveTowards @ JP 0x0803BA10 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiTryMoveTowards
	.thumb_func
AiTryMoveTowards:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	ldr r4, [sp, #0x34]
	lsls r0, r0, #0x10
	asrs r5, r0, #0x10
	lsls r1, r1, #0x10
	asrs r6, r1, #0x10
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #0xc]
	lsls r3, r3, #0x18
	lsrs r3, r3, #0x18
	mov sb, r3
	lsls r4, r4, #0x18
	asrs r4, r4, #0x18
	movs r0, #0
	mov sl, r0
	ldr r0, _0803BA64 @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, r5
	bne _0803BA68
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, r6
	bne _0803BA68
	mov r1, sl
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0
	bl AiSetDecision
	b _0803BB90
	.align 2, 0
_0803BA64: .4byte 0x03004DF0
_0803BA68:
	cmp r4, #0
	beq _0803BA84
	ldr r0, _0803BA80 @ =0x03004DF0
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl GenerateExtendedMovementMapOnRange
	b _0803BA90
	.align 2, 0
_0803BA80: .4byte 0x03004DF0
_0803BA84:
	ldr r0, _0803BAC0 @ =0x03004DF0
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8041044
_0803BA90:
	ldr r4, _0803BAC0 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_801A05C
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803BAC4 @ =0x0202E4E0
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	movs r1, #0x10
	ldrsb r1, [r2, r1]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	movs r3, #1
	rsbs r3, r3, #0
	ldr r0, _0803BAC8 @ =0x0202E4D0
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BB72
	.align 2, 0
_0803BAC0: .4byte 0x03004DF0
_0803BAC4: .4byte 0x0202E4E0
_0803BAC8: .4byte 0x0202E4D0
_0803BACC:
	ldr r0, _0803BBA0 @ =0x0202E4D0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0803BB6E
	lsls r6, r5, #2
_0803BAE0:
	ldr r0, _0803BBA4 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803BB64
	ldr r0, _0803BBA8 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803BB08
	ldr r0, _0803BBAC @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803BB64
_0803BB08:
	mov r1, sb
	cmp r1, #0
	bne _0803BB3A
	ldr r0, _0803BBB0 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _0803BBB4 @ =0x0203AA00
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803BB3A
	ldr r0, _0803BBB8 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803BB64
_0803BB3A:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sb
	str r3, [sp, #0x10]
	bl AiCheckDangerAt
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x10]
	cmp r0, #0
	beq _0803BB64
	ldr r0, _0803BBBC @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, r7
	bhi _0803BB64
	adds r7, r0, #0
	adds r3, r4, #0
	mov sl, r5
_0803BB64:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bge _0803BAE0
_0803BB6E:
	mov r1, r8
	lsls r0, r1, #0x10
_0803BB72:
	asrs r5, r0, #0x10
	cmp r5, #0
	bge _0803BACC
	cmp r3, #0
	blt _0803BB90
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	mov r1, sl
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
_0803BB90:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BBA0: .4byte 0x0202E4D0
_0803BBA4: .4byte 0x0202E4DC
_0803BBA8: .4byte 0x0202E4D4
_0803BBAC: .4byte 0x0202BE40
_0803BBB0: .4byte 0x03004DF0
_0803BBB4: .4byte 0x0203AA00
_0803BBB8: .4byte 0x0202E4EC
_0803BBBC: .4byte 0x0202E4E0

