	.syntax unified
	.set GetTrapAt, 0x0802E128 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.section .text.sub_80376A8, "ax", %progbits
@ sub_80376A8 @ JP 0x080376A8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80376A8
	.thumb_func
sub_80376A8:
	push {r4, lr}
	adds r4, r0, #0
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	bl GetTrapAt
	cmp r0, #0
	beq _08037712
	ldrb r3, [r0, #2]
	cmp r3, #4
	beq _080376D2
	cmp r3, #4
	bgt _080376CC
	cmp r3, #1
	beq _08037712
	b _08037716
_080376CC:
	cmp r3, #0xb
	beq _080376E8
	b _08037716
_080376D2:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _08037716
	movs r0, #0xf
	b _08037718
_080376E8:
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r2, [r0, #0x28]
	ldr r0, [r1, #0x28]
	orrs r2, r0
	movs r0, #0x80
	lsls r0, r0, #0x12
	ands r0, r2
	cmp r0, #0
	beq _0803770A
	adds r0, r4, #0
	bl GetUnitItemCount
	cmp r0, #5
	beq _08037712
	movs r0, #0x10
	b _08037718
_0803770A:
	movs r0, #4
	ands r2, r0
	cmp r2, #0
	beq _08037716
_08037712:
	movs r0, #0
	b _08037718
_08037716:
	adds r0, r3, #0
_08037718:
	pop {r4}
	pop {r1}
	bx r1
	.align 2, 0

