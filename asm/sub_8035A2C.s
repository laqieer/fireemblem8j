	.syntax unified
	.set BattleHitTerminate, 0x0802D1FC + 1
	.set sub_801907C, 0x0801907C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_80358E4, 0x080358E4 + 1
	.set sub_807D9D4, 0x0807D9D4 + 1
	.section .text.sub_8035A2C, "ax", %progbits
@ sub_8035A2C @ JP 0x08035A2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8035A2C
	.thumb_func
sub_8035A2C:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_802CA5C
	ldr r5, _08035AA8 @ =0x0203A4E8
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_801907C
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _08035A52
	movs r0, #0
	strb r0, [r5, #0x13]
_08035A52:
	ldr r3, _08035AAC @ =0x0203A604
	ldr r2, [r3]
	adds r0, r5, #0
	adds r0, #0x72
	ldrb r0, [r0]
	ldrb r1, [r5, #0x13]
	subs r0, r0, r1
	strb r0, [r2, #3]
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bne _08035A92
	ldr r3, [r3]
	ldr r2, [r3]
	lsls r0, r2, #0xd
	lsrs r0, r0, #0xd
	movs r1, #1
	orrs r0, r1
	ldr r1, _08035AB0 @ =0xFFF80000
	ands r1, r2
	orrs r1, r0
	str r1, [r3]
	lsls r1, r1, #8
	lsrs r1, r1, #0x1b
	movs r0, #2
	orrs r1, r0
	lsls r1, r1, #3
	ldrb r2, [r3, #2]
	movs r0, #7
	ands r0, r2
	orrs r0, r1
	strb r0, [r3, #2]
_08035A92:
	bl BattleHitTerminate
	bl sub_807D9D4
	adds r0, r6, #0
	bl sub_80358E4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08035AA8: .4byte 0x0203A4E8
_08035AAC: .4byte 0x0203A604
_08035AB0: .4byte 0xFFF80000

