	.syntax unified
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_80BB58C, 0x080BB58C + 1
	.section .text.sub_80BB5C0, "ax", %progbits
@ sub_80BB5C0 @ JP 0x080BB5C0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BB5C0
	.thumb_func
sub_80BB5C0:
	push {r4, r5, r6, r7, lr}
	adds r4, r0, #0
	adds r0, r1, #0
	ldr r1, [r0]
	ldrb r6, [r1, #4]
	bl sub_80BB58C
	adds r5, r0, #0
	cmp r5, #0
	beq _080BB618
	adds r0, r6, #0
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	movs r7, #4
	ands r0, r7
	cmp r0, #0
	bne _080BB618
	adds r0, r5, #0
	bl GetUnitFromCharId
	ldr r0, [r0, #0xc]
	ands r0, r7
	cmp r0, #0
	beq _080BB612
	b _080BB618
_080BB5F4:
	movs r0, #1
	b _080BB61A
_080BB5F8:
	ldrb r0, [r4, #1]
	adds r1, r0, #0
	cmp r1, r6
	bne _080BB606
	ldrb r0, [r4, #2]
	cmp r0, r5
	beq _080BB5F4
_080BB606:
	cmp r1, r5
	bne _080BB610
	ldrb r0, [r4, #2]
	cmp r0, r6
	beq _080BB5F4
_080BB610:
	adds r4, #8
_080BB612:
	ldrb r0, [r4, #1]
	cmp r0, #0
	bne _080BB5F8
_080BB618:
	movs r0, #0
_080BB61A:
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1

