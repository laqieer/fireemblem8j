	.syntax unified
	.set GetAiStaffFuncIndex, 0x0803F958 + 1
	.set GetItemAttributes, 0x08017314 + 1
	.set GetItemRequiredExp, 0x08017460 + 1
	.set sub_80D65C4, 0x080D65C4 + 1
	.section .text.sub_803F9C0, "ax", %progbits
@ AiTryDoStaff @ JP 0x0803F9C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AiTryDoStaff
	.thumb_func
AiTryDoStaff:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r6, #0
	ldr r0, _0803FA5C @ =0x03004DF0
	ldr r2, [r0]
	adds r0, r2, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #3
	beq _0803FA4A
	movs r5, #0
	ldrh r4, [r2, #0x1e]
	cmp r4, #0
	beq _0803FA4A
	ldr r0, _0803FA60 @ =0x080DD36C
	mov r8, r0
_0803F9E8:
	adds r0, r4, #0
	bl GetItemAttributes
	movs r1, #4
	ands r1, r0
	cmp r1, #0
	beq _0803FA34
	adds r0, r4, #0
	bl GetItemRequiredExp
	cmp r0, r6
	blt _0803FA34
	adds r0, r4, #0
	bl GetAiStaffFuncIndex
	adds r1, r0, #0
	movs r0, #1
	rsbs r0, r0, #0
	cmp r1, r0
	beq _0803FA34
	lsls r0, r1, #3
	add r0, r8
	ldr r2, [r0]
	adds r0, r5, #0
	adds r1, r7, #0
	bl sub_80D65C4
	ldr r0, _0803FA64 @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	beq _0803FA34
	adds r0, r4, #0
	bl GetItemRequiredExp
	lsls r0, r0, #0x18
	lsrs r6, r0, #0x18
_0803FA34:
	adds r5, #1
	cmp r5, #4
	bgt _0803FA4A
	ldr r0, _0803FA5C @ =0x03004DF0
	ldr r0, [r0]
	lsls r1, r5, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r4, [r0]
	cmp r4, #0
	bne _0803F9E8
_0803FA4A:
	ldr r0, _0803FA64 @ =0x0203AA90
	ldrb r0, [r0, #0xa]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0803FA5C: .4byte 0x03004DF0
_0803FA60: .4byte 0x080DD36C
_0803FA64: .4byte 0x0203AA90

