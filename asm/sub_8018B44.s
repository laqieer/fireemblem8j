	.syntax unified
	.set sub_801273C, 0x0801273C + 1
	.set sub_8018DC8, 0x08018DC8 + 1
	.set sub_8087750, 0x08087750 + 1
	.section .text.sub_8018B44, "ax", %progbits
@ LoadUnitPrepScreenPositions @ JP 0x08018B44 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global LoadUnitPrepScreenPositions
	.thumb_func
LoadUnitPrepScreenPositions:
	push {r4, lr}
	bl sub_8087750
	bl sub_8018DC8
	movs r3, #1
	ldr r4, _08018B78 @ =0x085C2A50
_08018B52:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08018BA6
	ldr r0, [r2]
	cmp r0, #0
	beq _08018BA6
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0xe
	ands r0, r1
	cmp r0, #0
	beq _08018B7C
	movs r0, #8
	orrs r1, r0
	b _08018B82
	.align 2, 0
_08018B78: .4byte 0x085C2A50
_08018B7C:
	movs r0, #9
	rsbs r0, r0, #0
	ands r1, r0
_08018B82:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #0x13
	ands r0, r1
	cmp r0, #0
	beq _08018B98
	movs r0, #0x80
	lsls r0, r0, #9
	orrs r1, r0
	b _08018B9C
_08018B98:
	ldr r0, _08018BC4 @ =0xFFFEFFFF
	ands r1, r0
_08018B9C:
	str r1, [r2, #0xc]
	ldr r0, [r2, #0xc]
	movs r1, #1
	orrs r0, r1
	str r0, [r2, #0xc]
_08018BA6:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018B52
	ldr r0, _08018BC8 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08018BBC
	bl sub_801273C
_08018BBC:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08018BC4: .4byte 0xFFFEFFFF
_08018BC8: .4byte 0x0202BCEC

