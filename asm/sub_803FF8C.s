	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetUnit, 0x08019108 + 1
	.set MarkMovementMapEdges, 0x0801A5C0 + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_803C420, 0x0803C420 + 1
	.set sub_803FA68, 0x0803FA68 + 1
	.set sub_80405E8, 0x080405E8 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_803FF8C, "ax", %progbits
@ AiStaffWarp @ JP 0x0803FF8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiStaffWarp
	.thumb_func
AiStaffWarp:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0
	mov sl, r0
	movs r1, #0
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x18]
	movs r5, #0
	str r5, [sp, #0x1c]
	ldr r0, _080400D0 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803FFBC
	b _080400BE
_0803FFBC:
	ldr r0, _080400D4 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	movs r0, #1
	rsbs r0, r0, #0
	bl sub_801B620
	bl MarkMovementMapEdges
	ldr r0, _080400D8 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _08040088
_0803FFDC:
	ldr r0, _080400D8 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r5, r7, #1
	str r5, [sp, #0x20]
	cmp r4, #0
	blt _08040082
	lsls r0, r7, #2
	mov r8, r0
_0803FFF0:
	ldr r0, _080400DC @ =0x0202E4DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0804007C
	ldr r0, _080400E0 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r1, r0, r4
	ldrb r0, [r1]
	cmp r0, #0
	beq _0804007C
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _080400D0 @ =0x0203AA00
	adds r0, #0x7b
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _08040038
	mov r1, sb
	cmp r1, #0
	beq _08040038
	adds r0, r5, #0
	bl sub_80D65E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0804007C
_08040038:
	ldrb r1, [r5, #0xa]
	movs r0, #9
	ands r0, r1
	cmp r0, #0
	bne _0804007C
	movs r0, #8
	ldrsb r0, [r5, r0]
	cmp r0, sl
	blt _0804007C
	add r6, sp, #0xc
	adds r0, r4, #0
	adds r1, r7, #0
	adds r2, r6, #0
	bl sub_803FA68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804007C
	ldrb r5, [r5, #8]
	mov sl, r5
	add r0, sp, #0xc
	movs r5, #0
	ldrsh r2, [r0, r5]
	str r2, [sp, #0x14]
	movs r1, #2
	ldrsh r0, [r6, r1]
	str r0, [sp, #0x18]
	ldr r0, _080400E0 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0804007C:
	subs r4, #1
	cmp r4, #0
	bge _0803FFF0
_08040082:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803FFDC
_08040088:
	mov r2, sl
	cmp r2, #0
	beq _080400BE
	add r4, sp, #0xc
	adds r0, r4, #0
	bl sub_80405E8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080400BE
	ldr r0, [sp, #0x14]
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r5, [sp, #0x10]
	lsls r2, r5, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	add r2, sp, #0xc
	ldrb r2, [r2]
	str r2, [sp, #4]
	ldrh r2, [r4, #2]
	lsls r2, r2, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_080400BE:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080400D0: .4byte 0x0203AA00
_080400D4: .4byte 0x03004DF0
_080400D8: .4byte 0x0202E4D0
_080400DC: .4byte 0x0202E4DC
_080400E0: .4byte 0x0202E4D4

