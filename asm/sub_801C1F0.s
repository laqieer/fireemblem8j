	.syntax unified
	.set sub_801C14C, 0x0801C14C + 1
	.section .text.sub_801C1F0, "ax", %progbits
@ sub_801C1F0 @ JP 0x0801C1F0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801C1F0
	.thumb_func
sub_801C1F0:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	adds r6, r1, #0
	ldr r2, _0801C220 @ =0x085775CC
	ldr r0, [r2]
	ldrh r1, [r0, #8]
	movs r0, #0x31
	ands r0, r1
	adds r5, r2, #0
	cmp r0, #0
	beq _0801C296
	adds r0, r6, #0
	adds r0, #0x3c
	movs r1, #0
	ldrsb r1, [r0, r1]
	adds r4, r0, #0
	cmp r1, #0
	beq _0801C228
	ldr r1, _0801C224 @ =0x0202BCEC
	adds r0, r1, #0
	adds r0, #0x43
	ldrb r0, [r0]
	lsls r0, r0, #0x1d
	b _0801C232
	.align 2, 0
_0801C220: .4byte 0x085775CC
_0801C224: .4byte 0x0202BCEC
_0801C228:
	ldr r1, _0801C278 @ =0x0202BCEC
	adds r0, r1, #0
	adds r0, #0x42
	ldrh r0, [r0]
	lsls r0, r0, #0x17
_0801C232:
	lsrs r2, r0, #0x1e
	adds r3, r1, #0
	ldr r0, [r5]
	ldrh r1, [r0, #8]
	movs r0, #0x20
	ands r0, r1
	cmp r0, #0
	beq _0801C244
	subs r2, #1
_0801C244:
	movs r0, #0x11
	ands r0, r1
	cmp r0, #0
	beq _0801C24E
	adds r2, #1
_0801C24E:
	cmp r2, #2
	ble _0801C254
	movs r2, #2
_0801C254:
	cmp r2, #0
	bge _0801C25A
	movs r2, #0
_0801C25A:
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #0
	beq _0801C27C
	adds r3, #0x43
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #1
	ldrb r1, [r3]
	movs r0, #7
	rsbs r0, r0, #0
	ands r0, r1
	orrs r0, r2
	strb r0, [r3]
	b _0801C28E
	.align 2, 0
_0801C278: .4byte 0x0202BCEC
_0801C27C:
	adds r3, #0x42
	movs r0, #3
	ands r2, r0
	lsls r2, r2, #7
	ldrh r1, [r3]
	ldr r0, _0801C2A0 @ =0xFFFFFE7F
	ands r0, r1
	orrs r0, r2
	strh r0, [r3]
_0801C28E:
	adds r0, r7, #0
	adds r1, r6, #0
	bl sub_801C14C
_0801C296:
	movs r0, #0
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0801C2A0: .4byte 0xFFFFFE7F

