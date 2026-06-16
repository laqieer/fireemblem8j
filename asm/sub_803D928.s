	.syntax unified
	.set AiSimulateBestBallistaBattleAgainstTarget, 0x0803DD14 + 1
	.set GetUnit, 0x08019108 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8037A24, 0x08037A24 + 1
	.set sub_803AC5C, 0x0803AC5C + 1
	.set sub_803D810, 0x0803D810 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_803D928, "ax", %progbits
@ AiAttemptBallistaCombat @ JP 0x0803D928 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiAttemptBallistaCombat
	.thumb_func
AiAttemptBallistaCombat:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x18
	str r0, [sp, #0x10]
	mov r8, r1
	movs r0, #0
	mov sl, r0
	add r4, sp, #0xc
	ldr r1, _0803D99C @ =0x080DD358
	adds r0, r4, #0
	movs r2, #3
	bl memcpy
	ldr r0, _0803D9A0 @ =0x0202E4D0
	movs r1, #2
	ldrsh r0, [r0, r1]
	subs r7, r0, #1
	cmp r7, #0
	blt _0803D9C4
_0803D954:
	ldr r0, _0803D9A0 @ =0x0202E4D0
	movs r2, #0
	ldrsh r0, [r0, r2]
	subs r4, r0, #1
	subs r3, r7, #1
	mov sb, r3
	cmp r4, #0
	blt _0803D9BE
	ldr r2, _0803D9A4 @ =0x0202E4DC
	lsls r6, r7, #2
_0803D968:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	ldrb r0, [r0]
	cmp r0, #0x78
	bhi _0803D9B8
	adds r0, r4, #0
	adds r1, r7, #0
	str r2, [sp, #0x14]
	bl sub_8037A24
	lsls r0, r0, #0x10
	lsrs r5, r0, #0x10
	ldr r2, [sp, #0x14]
	cmp r5, #0
	beq _0803D9A8
	movs r0, #1
	add sl, r0
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	strb r5, [r0]
	b _0803D9B8
	.align 2, 0
_0803D99C: .4byte 0x080DD358
_0803D9A0: .4byte 0x0202E4D0
_0803D9A4: .4byte 0x0202E4DC
_0803D9A8:
	ldr r0, [r2]
	adds r0, r6, r0
	ldr r0, [r0]
	adds r0, r0, r4
	movs r3, #1
	rsbs r3, r3, #0
	adds r1, r3, #0
	strb r1, [r0]
_0803D9B8:
	subs r4, #1
	cmp r4, #0
	bge _0803D968
_0803D9BE:
	mov r7, sb
	cmp r7, #0
	bge _0803D954
_0803D9C4:
	mov r0, sl
	cmp r0, #0
	beq _0803DA84
	movs r0, #0
	mov r1, r8
	strb r0, [r1, #2]
	str r0, [r1, #8]
	movs r1, #0
	mov r6, sp
_0803D9D6:
	mov r0, sp
	adds r0, r0, r1
	adds r0, #0xc
	ldrb r5, [r0]
	ldr r0, _0803DA78 @ =0x0000FFFF
	mov r2, r8
	strh r0, [r2, #4]
	movs r7, #1
	adds r1, #1
	mov sb, r1
_0803D9EA:
	adds r0, r7, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _0803DA58
	ldr r0, [r4]
	cmp r0, #0
	beq _0803DA58
	ldr r0, [r4, #0xc]
	ldr r1, _0803DA7C @ =0x00010025
	ands r0, r1
	cmp r0, #0
	bne _0803DA58
	adds r0, r4, #0
	ldr r3, [sp, #0x10]
	bl sub_80D65C8
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DA58
	ldr r0, _0803DA80 @ =0x03004DF0
	ldr r0, [r0]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_803AC5C
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DA58
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_803D810
	ldrb r0, [r4, #0xb]
	strb r0, [r6, #2]
	mov r0, sp
	adds r1, r5, #0
	bl AiSimulateBestBallistaBattleAgainstTarget
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803DA58
	ldr r1, [sp, #8]
	mov r2, r8
	ldr r0, [r2, #8]
	cmp r1, r0
	blo _0803DA58
	ldrb r0, [r6]
	strb r0, [r2]
	ldrb r0, [r6, #1]
	strb r0, [r2, #1]
	ldrb r0, [r6, #2]
	strb r0, [r2, #2]
	str r1, [r2, #8]
_0803DA58:
	adds r7, #1
	cmp r7, #0xbf
	ble _0803D9EA
	mov r1, sb
	cmp r1, #2
	ble _0803D9D6
	mov r3, r8
	ldr r0, [r3, #8]
	cmp r0, #0
	bne _0803DA72
	ldrb r0, [r3, #2]
	cmp r0, #0
	beq _0803DA84
_0803DA72:
	movs r0, #1
	b _0803DA86
	.align 2, 0
_0803DA78: .4byte 0x0000FFFF
_0803DA7C: .4byte 0x00010025
_0803DA80: .4byte 0x03004DF0
_0803DA84:
	movs r0, #0
_0803DA86:
	add sp, #0x18
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0

