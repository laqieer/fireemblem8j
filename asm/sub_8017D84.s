	.syntax unified
	.set sub_8017E3C, 0x08017E3C + 1
	.section .text.sub_8017D84, "ax", %progbits
@ UnitAutolevelPenalty @ JP 0x08017D84 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global UnitAutolevelPenalty
	.thumb_func
UnitAutolevelPenalty:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r5, #8
	ldrsb r5, [r4, r5]
	cmp r2, #0
	beq _08017DE2
	ldr r3, [r4]
	movs r0, #0xb
	ldrsb r0, [r3, r0]
	cmp r5, r0
	ble _08017DE2
	subs r2, r5, r2
	cmp r2, r0
	bge _08017DA2
	adds r2, r0, #0
_08017DA2:
	ldr r1, [r4, #4]
	ldrb r0, [r1, #0xb]
	ldrb r6, [r3, #0xc]
	adds r0, r0, r6
	strb r0, [r4, #0x12]
	ldrb r0, [r1, #0xc]
	ldrb r6, [r3, #0xd]
	adds r0, r0, r6
	strb r0, [r4, #0x14]
	ldrb r0, [r1, #0xd]
	ldrb r6, [r3, #0xe]
	adds r0, r0, r6
	strb r0, [r4, #0x15]
	ldrb r0, [r1, #0xe]
	ldrb r6, [r3, #0xf]
	adds r0, r0, r6
	strb r0, [r4, #0x16]
	ldrb r0, [r1, #0xf]
	ldrb r6, [r3, #0x10]
	adds r0, r0, r6
	strb r0, [r4, #0x17]
	ldrb r0, [r1, #0x10]
	ldrb r1, [r3, #0x11]
	adds r0, r0, r1
	strb r0, [r4, #0x18]
	ldrb r0, [r3, #0x12]
	strb r0, [r4, #0x19]
	strb r2, [r4, #8]
	adds r0, r4, #0
	bl sub_8017E3C
	strb r5, [r4, #8]
_08017DE2:
	pop {r4, r5, r6}
	pop {r0}
	bx r0

