	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set GetUnitFromCharId, 0x08017FB0 + 1
	.set sub_801263C, 0x0801263C + 1
	.set sub_8033168, 0x08033168 + 1
	.section .text.sub_8012684, "ax", %progbits
@ sub_8012684 @ JP 0x08012684 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8012684
	.thumb_func
sub_8012684:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	bl sub_8033168
	adds r5, r0, #0
	bl GetUnitFromCharId
	adds r2, r0, #0
	cmp r2, #0
	beq _080126BA
	ldr r0, [r2, #0xc]
	movs r1, #8
	ands r0, r1
	cmp r0, #0
	bne _080126BA
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	strb r0, [r4]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	strb r0, [r4, #1]
	ldrb r1, [r4, #3]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	strb r0, [r4, #3]
	adds r4, #0x14
_080126BA:
	movs r5, #0
	movs r0, #2
	rsbs r0, r0, #0
	adds r6, r0, #0
	b _080126E2
_080126C4:
	adds r0, r5, #0
	bl GetUnit
	adds r2, r0, #0
	adds r5, #1
	ldr r0, [r2]
	ldrb r0, [r0, #4]
	strb r0, [r4]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	strb r0, [r4, #1]
	ldrb r0, [r4, #3]
	ands r0, r6
	strb r0, [r4, #3]
	adds r4, #0x14
_080126E2:
	ldrb r0, [r4]
	cmp r0, #0
	beq _080126F4
	adds r0, r5, #0
	bl sub_801263C
	adds r5, r0, #0
	cmp r5, #0
	bne _080126C4
_080126F4:
	movs r0, #0
	strb r0, [r4]
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0

