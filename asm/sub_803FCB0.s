	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetAiBestSafeStaffTargetPosition, 0x0803C214 + 1
	.set GetUnit, 0x08019108 + 1
	.set MapAddInRange, 0x0801A798 + 1
	.set sub_8018730, 0x08018730 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B620, 0x0801B620 + 1
	.set sub_803BF60, 0x0803BF60 + 1
	.set sub_803C420, 0x0803C420 + 1
	.set sub_80D6374, 0x080D6374 + 1
	.set sub_80D65E0, 0x080D65E0 + 1
	.section .text.sub_803FCB0, "ax", %progbits
@ sub_803FCB0 @ JP 0x0803FCB0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803FCB0
	.thumb_func
sub_803FCB0:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x20
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
	ldr r4, _0803FE60 @ =0x0203AA00
	adds r5, r4, #0
	adds r5, #0x7b
	ldrb r1, [r5]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _0803FCE2
	b _0803FE50
_0803FCE2:
	ldr r0, _0803FE64 @ =0x03004DF0
	ldr r0, [r0]
	bl sub_803C420
	ldr r0, [sp, #0x18]
	bl sub_801B620
	adds r1, r4, #0
	adds r1, #0x7c
	ldrb r0, [r1]
	cmp r0, #0
	beq _0803FCFE
	adds r3, r0, #0
	mov sl, r3
_0803FCFE:
	movs r4, #1
	mov r8, r4
_0803FD02:
	mov r0, r8
	bl GetUnit
	adds r6, r0, #0
	cmp r6, #0
	bne _0803FD10
	b _0803FE20
_0803FD10:
	ldr r0, [r6]
	cmp r0, #0
	bne _0803FD18
	b _0803FE20
_0803FD18:
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803FE68 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldr r1, _0803FE6C @ =0x0202BE40
	ldrb r0, [r0]
	ldrb r1, [r1]
	cmp r0, r1
	beq _0803FE20
	ldr r0, [r6, #0xc]
	ldr r1, _0803FE70 @ =0x00010005
	ands r0, r1
	cmp r0, #0
	bne _0803FE20
	ldr r0, _0803FE74 @ =0x0203AA7B
	ldrb r1, [r0]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	bne _0803FD60
	mov r1, sb
	cmp r1, #0
	beq _0803FD60
	adds r0, r6, #0
	bl sub_80D65E0
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	beq _0803FE20
_0803FD60:
	ldr r2, _0803FE78 @ =0x0203AA7C
	ldrb r0, [r2]
	cmp r0, #0
	bne _0803FD72
	ldrb r1, [r6, #0xa]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _0803FE20
_0803FD72:
	ldr r7, _0803FE64 @ =0x03004DF0
	ldr r0, [r7]
	bl sub_8018730
	ldr r2, [r7]
	ldr r1, [r2, #4]
	ldrb r1, [r1, #0x12]
	ldrb r3, [r2, #0x1d]
	adds r1, r1, r3
	adds r0, r0, r1
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	movs r4, #0x10
	ldrsb r4, [r2, r4]
	movs r1, #0x11
	ldrsb r1, [r2, r1]
	ldrb r2, [r6, #0x10]
	ldrb r3, [r6, #0x11]
	str r0, [sp]
	adds r0, r4, #0
	bl sub_803BF60
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FE20
	ldr r0, _0803FE7C @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	movs r4, #0x10
	ldrsb r4, [r6, r4]
	movs r5, #0x11
	ldrsb r5, [r6, r5]
	ldr r0, [r7]
	bl sub_8018730
	adds r2, r0, #0
	adds r0, r4, #0
	adds r1, r5, #0
	movs r3, #1
	bl MapAddInRange
	add r5, sp, #0xc
	adds r0, r5, #0
	bl GetAiBestSafeStaffTargetPosition
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0803FE20
	adds r0, r6, #0
	bl sub_8018E64
	movs r1, #0x64
	adds r4, r0, #0
	muls r4, r1, r4
	adds r0, r6, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_80D6374
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, sl
	bhi _0803FE20
	mov sl, r0
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r4, [r0, r1]
	str r4, [sp, #0x14]
	movs r3, #2
	ldrsh r2, [r5, r3]
	str r2, [sp, #0x18]
	movs r1, #0x11
	ldrsb r1, [r6, r1]
	ldr r0, _0803FE68 @ =0x0202E4D4
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	movs r2, #0x10
	ldrsb r2, [r6, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	ldrb r0, [r0]
	str r0, [sp, #0x1c]
_0803FE20:
	movs r4, #1
	add r8, r4
	mov r0, r8
	cmp r0, #0xbf
	bgt _0803FE2C
	b _0803FD02
_0803FE2C:
	movs r0, #1
	rsbs r0, r0, #0
	ldr r1, [sp, #0x14]
	cmp r1, r0
	beq _0803FE50
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
_0803FE50:
	add sp, #0x20
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0803FE60: .4byte 0x0203AA00
_0803FE64: .4byte 0x03004DF0
_0803FE68: .4byte 0x0202E4D4
_0803FE6C: .4byte 0x0202BE40
_0803FE70: .4byte 0x00010005
_0803FE74: .4byte 0x0203AA7B
_0803FE78: .4byte 0x0203AA7C
_0803FE7C: .4byte 0x0202E4E0

