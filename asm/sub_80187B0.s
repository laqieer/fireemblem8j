	.syntax unified
	.set GetUnitItemSlot, 0x08016DD4 + 1
	.section .text.sub_80187B0, "ax", %progbits
@ sub_80187B0 @ JP 0x080187B0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80187B0
	.thumb_func
sub_80187B0:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	adds r5, r1, #0
	movs r6, #0
	ldr r0, [r4]
	ldr r1, [r4, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	beq _080187D6
	adds r0, r4, #0
	movs r1, #0x6b
	bl GetUnitItemSlot
	cmp r0, #0
	bge _080187FE
_080187D6:
	cmp r5, #0x1e
	beq _080187F4
	cmp r5, #0x21
	bne _080187F6
	adds r0, r4, #0
	movs r1, #0x69
	bl GetUnitItemSlot
	cmp r0, #0
	bge _080187FE
	adds r0, r4, #0
	movs r1, #0x79
	bl GetUnitItemSlot
	b _080187FE
_080187F4:
	movs r6, #0x6a
_080187F6:
	adds r0, r4, #0
	adds r1, r6, #0
	bl GetUnitItemSlot
_080187FE:
	pop {r4, r5, r6}
	pop {r1}
	bx r1

