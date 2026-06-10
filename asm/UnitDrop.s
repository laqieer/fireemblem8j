	.syntax unified
	.section .text.UnitDrop, "ax", %progbits
@ UnitDrop @ JP 0x08018084 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitDrop
	.thumb_func
UnitDrop:
	push {r4, r5, r6, r7, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r7, r2, #0
	ldr r1, _080180D4 @ =0x085C2A50
	ldrb r0, [r5, #0x1b]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r2, [r0]
	adds r4, r2, #0
	ldr r0, [r5, #0xc]
	movs r1, #0x31
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r5, #0xc]
	ldr r3, [r2, #0xc]
	movs r0, #0x32
	rsbs r0, r0, #0
	ands r3, r0
	str r3, [r2, #0xc]
	movs r0, #0xb
	ldrsb r0, [r2, r0]
	movs r1, #0xc0
	ands r0, r1
	ldr r1, _080180D8 @ =0x0202BCEC
	ldrb r1, [r1, #0xf]
	cmp r0, r1
	bne _080180C2
	movs r0, #2
	orrs r3, r0
	str r3, [r2, #0xc]
_080180C2:
	movs r0, #0
	strb r0, [r5, #0x1b]
	strb r0, [r4, #0x1b]
	strb r6, [r4, #0x10]
	strb r7, [r4, #0x11]
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080180D4: .4byte 0x085C2A50
_080180D8: .4byte 0x0202BCEC

