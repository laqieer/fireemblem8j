	.syntax unified
	.set sub_8012700, 0x08012700 + 1
	.set sub_8087750, 0x08087750 + 1
	.section .text.sub_8018AC4, "ax", %progbits
@ sub_8018AC4 @ JP 0x08018AC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8018AC4
	.thumb_func
sub_8018AC4:
	push {r4, r5, lr}
	movs r3, #1
	ldr r5, _08018AF4 @ =0x0202BCEC
	ldr r4, _08018AF8 @ =0x085C2A50
_08018ACC:
	movs r0, #0xff
	ands r0, r3
	lsls r0, r0, #2
	adds r0, r0, r4
	ldr r2, [r0]
	cmp r2, #0
	beq _08018B22
	ldr r0, [r2]
	cmp r0, #0
	beq _08018B22
	ldr r1, [r2, #0xc]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	beq _08018AFC
	movs r0, #0x80
	lsls r0, r0, #0xe
	orrs r1, r0
	b _08018B00
	.align 2, 0
_08018AF4: .4byte 0x0202BCEC
_08018AF8: .4byte 0x085C2A50
_08018AFC:
	ldr r0, _08018B18 @ =0xFFDFFFFF
	ands r1, r0
_08018B00:
	str r1, [r2, #0xc]
	ldr r1, [r2, #0xc]
	movs r0, #0x80
	lsls r0, r0, #9
	ands r0, r1
	cmp r0, #0
	beq _08018B1C
	movs r0, #0x80
	lsls r0, r0, #0x13
	orrs r1, r0
	b _08018B20
	.align 2, 0
_08018B18: .4byte 0xFFDFFFFF
_08018B1C:
	ldr r0, _08018B40 @ =0xFBFFFFFF
	ands r1, r0
_08018B20:
	str r1, [r2, #0xc]
_08018B22:
	adds r3, #1
	cmp r3, #0x3f
	ble _08018ACC
	ldrb r1, [r5, #0x14]
	movs r0, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08018B36
	bl sub_8012700
_08018B36:
	bl sub_8087750
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08018B40: .4byte 0xFBFFFFFF

