	.syntax unified
	.set AiCheckDangerAt, 0x0803E3D8 + 1
	.set AiSetDecision, 0x08039C98 + 1
	.set GetUnitMovementCost, 0x08018A60 + 1
	.set sub_801A05C, 0x0801A05C + 1
	.set sub_8040EA8, 0x08040EA8 + 1
	.set sub_8040ED4, 0x08040ED4 + 1
	.section .text.sub_803BBC0, "ax", %progbits
@ AiTryMoveTowardsNeglectWall @ JP 0x0803BBC0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiTryMoveTowardsNeglectWall
	.thumb_func
AiTryMoveTowardsNeglectWall:
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
	ldr r0, _0803BC14 @ =0x03004DF0
	ldr r1, [r0]
	movs r0, #0x10
	ldrsb r0, [r1, r0]
	cmp r0, r5
	bne _0803BC18
	movs r0, #0x11
	ldrsb r0, [r1, r0]
	cmp r0, r6
	bne _0803BC18
	mov r1, sl
	str r1, [sp]
	str r1, [sp, #4]
	str r1, [sp, #8]
	adds r0, r5, #0
	adds r1, r6, #0
	movs r3, #0
	bl AiSetDecision
	b _0803BD40
	.align 2, 0
_0803BC14: .4byte 0x03004DF0
_0803BC18:
	cmp r4, #0
	beq _0803BC34
	ldr r0, _0803BC30 @ =0x03004DF0
	ldr r0, [r0]
	bl GetUnitMovementCost
	adds r2, r0, #0
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8040EA8
	b _0803BC40
	.align 2, 0
_0803BC30: .4byte 0x03004DF0
_0803BC34:
	ldr r0, _0803BC70 @ =0x03004DF0
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r6, #0
	bl sub_8040ED4
_0803BC40:
	ldr r4, _0803BC70 @ =0x03004DF0
	ldr r0, [r4]
	bl sub_801A05C
	ldr r2, [r4]
	movs r0, #0x11
	ldrsb r0, [r2, r0]
	ldr r1, _0803BC74 @ =0x0202E4E0
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
	ldr r0, _0803BC78 @ =0x0202E4D0
	ldrh r0, [r0, #2]
	subs r0, #1
	lsls r0, r0, #0x10
	b _0803BD22
	.align 2, 0
_0803BC70: .4byte 0x03004DF0
_0803BC74: .4byte 0x0202E4E0
_0803BC78: .4byte 0x0202E4D0
_0803BC7C:
	ldr r0, _0803BD50 @ =0x0202E4D0
	ldrh r0, [r0]
	subs r0, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	subs r0, r5, #1
	mov r8, r0
	cmp r4, #0
	blt _0803BD1E
	lsls r6, r5, #2
_0803BC90:
	ldr r0, _0803BD54 @ =0x0202E4DC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803BD14
	ldr r0, _0803BD58 @ =0x0202E4D4
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r1, [r0]
	cmp r1, #0
	beq _0803BCB8
	ldr r0, _0803BD5C @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	bne _0803BD14
_0803BCB8:
	mov r1, sb
	cmp r1, #0
	bne _0803BCEA
	ldr r0, _0803BD60 @ =0x03004DF0
	ldr r0, [r0]
	movs r1, #0x1d
	ldrsb r1, [r0, r1]
	ldr r0, [r0, #4]
	ldrb r0, [r0, #0x12]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r1, r1, r0
	ldr r0, _0803BD64 @ =0x0203AA00
	adds r0, #0x85
	ldrb r0, [r0]
	cmp r1, r0
	bge _0803BCEA
	ldr r0, _0803BD68 @ =0x0202E4EC
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0
	bne _0803BD14
_0803BCEA:
	adds r0, r4, #0
	adds r1, r5, #0
	mov r2, sb
	str r3, [sp, #0x10]
	bl AiCheckDangerAt
	lsls r0, r0, #0x18
	ldr r3, [sp, #0x10]
	cmp r0, #0
	beq _0803BD14
	ldr r0, _0803BD6C @ =0x0202E4E0
	ldr r0, [r0]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, r7
	bhi _0803BD14
	adds r7, r0, #0
	adds r3, r4, #0
	mov sl, r5
_0803BD14:
	subs r0, r4, #1
	lsls r0, r0, #0x10
	asrs r4, r0, #0x10
	cmp r4, #0
	bge _0803BC90
_0803BD1E:
	mov r1, r8
	lsls r0, r1, #0x10
_0803BD22:
	asrs r5, r0, #0x10
	cmp r5, #0
	bge _0803BC7C
	cmp r3, #0
	blt _0803BD40
	movs r0, #0
	str r0, [sp]
	str r0, [sp, #4]
	str r0, [sp, #8]
	adds r0, r3, #0
	mov r1, sl
	ldr r2, [sp, #0xc]
	movs r3, #0
	bl AiSetDecision
_0803BD40:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803BD50: .4byte 0x0202E4D0
_0803BD54: .4byte 0x0202E4DC
_0803BD58: .4byte 0x0202E4D4
_0803BD5C: .4byte 0x0202BE40
_0803BD60: .4byte 0x03004DF0
_0803BD64: .4byte 0x0203AA00
_0803BD68: .4byte 0x0202E4EC
_0803BD6C: .4byte 0x0202E4E0

