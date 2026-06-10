	.syntax unified
	.set BattleHitTerminate, 0x0802D1FC + 1
	.set sub_801907C, 0x0801907C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_807D97C, 0x0807D97C + 1
	.section .text.sub_80359C0, "ax", %progbits
@ sub_80359C0 @ JP 0x080359C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80359C0
	.thumb_func
sub_80359C0:
	push {r4, r5, lr}
	adds r4, r1, #0
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_802CA5C
	ldr r5, _08035A24 @ =0x0203A4E8
	rsbs r4, r4, #0
	adds r0, r5, #0
	adds r1, r4, #0
	bl sub_801907C
	movs r0, #0x13
	ldrsb r0, [r5, r0]
	cmp r0, #0
	bge _080359E4
	movs r0, #0
	strb r0, [r5, #0x13]
_080359E4:
	ldr r3, _08035A28 @ =0x0203A604
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
	bne _08035A14
	ldr r3, [r3]
	ldr r1, [r3]
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
_08035A14:
	bl BattleHitTerminate
	bl sub_807D97C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08035A24: .4byte 0x0203A4E8
_08035A28: .4byte 0x0203A604

