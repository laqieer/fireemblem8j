	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.section .text.sub_80A4954, "ax", %progbits
@ sub_80A4954 @ JP 0x080A4954 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4954
	.thumb_func
sub_80A4954:
	push {r4, r5, lr}
	adds r5, r0, #0
	movs r4, #1
_080A495A:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _080A4988
	ldr r3, [r2]
	cmp r3, #0
	beq _080A4988
	ldr r0, [r2, #0xc]
	ldr r1, _080A4984 @ =0x00010004
	ands r0, r1
	cmp r0, #0
	bne _080A4988
	ldrb r0, [r3, #4]
	cmp r0, r5
	bne _080A4988
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	b _080A499A
	.align 2, 0
_080A4984: .4byte 0x00010004
_080A4988:
	adds r4, #1
	cmp r4, #0x3f
	ble _080A495A
	ldr r2, _080A49A0 @ =0x088582BC
	subs r1, r5, #1
	movs r0, #0x34
	muls r0, r1, r0
	adds r0, r0, r2
	ldrb r0, [r0, #5]
_080A499A:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_080A49A0: .4byte 0x088582BC

