	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetUnit, 0x08019108 + 1
	.set MarkMovementMapEdges, 0x0801A5C0 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_803C420, 0x0803C420 + 1
	.set sub_803FA68, 0x0803FA68 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_803FB38, "ax", %progbits
@ AiStaffHealMendRecover @ JP 0x0803FB38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiStaffHealMendRecover
	.thumb_func
AiStaffHealMendRecover:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x24
	str r0, [sp, #0x10]
	mov sb, r1
	movs r0, #0x64
	mov sl, r0
	movs r1, #1
	rsbs r1, r1, #0
	str r1, [sp, #0x18]
	str r1, [sp, #0x14]
	movs r2, #0
	str r2, [sp, #0x1c]
	ldr r0, _0803FC90 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	ldr r0, [sp, #0x18]
	bl sub_801B620
	bl MarkMovementMapEdges
	ldr r0, _0803FC94 @ =0x0203AA00
	adds r1, r0, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FB7A
	adds r1, r0, #0
	mov sl, r1
_0803FB7A:
	ldr r0, _0803FC98 @ =0x0202E4D0
	movs r4, #2
	ldrsh r0, [r0, r4]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803FC5A
_0803FB86:
	ldr r0, _0803FC98 @ =0x0202E4D0
	movs r1, #0
	ldrsh r0, [r0, r1]
	subs r6, r0, #1
	subs r2, r7, #1
	str r2, [sp, #0x20]
	cmp r6, #0
	blt _0803FC54
	lsls r4, r7, #2
	mov r8, r4
_0803FB9A:
	ldr r0, _0803FC9C @ =0x0202E4DC
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803FC4E
	ldr r0, _0803FCA0 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r2, r0, r6
	ldrb r1, [r2]
	cmp r1, #0
	beq _0803FC4E
	ldr r0, _0803FCA4 @ =0x0202BE40
	ldrb r0, [r0]
	cmp r1, r0
	beq _0803FC4E
	adds r0, r1, #0
	bl GetUnit
	adds r5, r0, #0
	ldr r0, _0803FCA8 @ =0x0203AA7B
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803FBEA
	mov r1, sb
	cmp r1, #0
	beq _0803FBEA
	adds r0, r5, #0
	bl sub_80D65E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803FC4E
_0803FBEA:
	ldr r2, _0803FCAC @ =0x0203AA7C
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803FBFC
	ldrb r1, [r5, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803FC4E
_0803FBFC:
	adds r0, r5, #0
	bl sub_8018E64
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r5, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80D6374
	lsls r0, r0, #0x18
	lsrs r4, r0, #0x18
	cmp r4, sl
	bhi _0803FC4E
	add r5, sp, #0xc
	adds r0, r6, #0
	adds r1, r7, #0
	adds r2, r5, #0
	bl sub_803FA68
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FC4E
	mov sl, r4
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r4, #2
	ldrsh r2, [r5, r4]
	str r2, [sp, #0x18]
	ldr r0, _0803FCA0 @ =0x0202E4D4
	ldr r0, [r0]
	add r0, r8
	ldr r0, [r0]
	adds r0, r0, r6
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803FC4E:
	subs r6, #1
	cmp r6, #0
	bge _0803FB9A
_0803FC54:
	ldr r7, [sp, #0x20]
	cmp r7, #0
	bge _0803FB86
_0803FC5A:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0803FC7E
	adds r0, r1, #0
	ldr r1, [sp, #0x18]
	ldr r3, [sp, #0x1c]
	ldr r4, [sp, #0x10]
	lsls r2, r4, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	movs r2, #0
	str r2, [sp, #4]
	str r2, [sp, #8]
	movs r2, #5
	bl AiSetDecision
_0803FC7E:
	add sp, #0x24
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FC90: .4byte 0x03004DF0
_0803FC94: .4byte 0x0203AA00
_0803FC98: .4byte 0x0202E4D0
_0803FC9C: .4byte 0x0202E4DC
_0803FCA0: .4byte 0x0202E4D4
_0803FCA4: .4byte 0x0202BE40
_0803FCA8: .4byte 0x0203AA7B
_0803FCAC: .4byte 0x0203AA7C

