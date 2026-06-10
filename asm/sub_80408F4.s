	.syntax unified
	.set AiSetDecision, 0x08039C98 + 1
	.set GetUnitItemCount, 0x08017780 + 1
	.set sub_803BA10, 0x0803BA10 + 1
	.set sub_803BF60, 0x0803BF60 + 1
	.set sub_8040B34, 0x08040B34 + 1
	.section .text.sub_80408F4, "ax", %progbits
@ sub_80408F4 @ JP 0x080408F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80408F4
	.thumb_func
sub_80408F4:
	push {r4, r5, r6, r7, lr}
	sub sp, #0x10
	adds r7, r0, #0
	movs r5, #0
	ldr r6, _08040934 @ =0x0203AA00
	adds r0, r6, #0
	adds r0, #0x80
	ldr r0, [r0]
	movs r1, #2
	ands r0, r1
	cmp r0, #0
	beq _080409E4
	ldr r4, _08040938 @ =0x03004DF0
	ldr r0, [r4]
	bl GetUnitItemCount
	cmp r0, #4
	ble _0804093C
	ldr r2, [r4]
	ldrb r1, [r2, #0xa]
	movs r0, #8
	ands r0, r1
	cmp r0, #0
	bne _0804093C
	movs r0, #8
	orrs r0, r1
	strb r0, [r2, #0xa]
	adds r0, r6, #0
	adds r0, #0x79
	strb r5, [r0]
	b _080409E4
	.align 2, 0
_08040934: .4byte 0x0203AA00
_08040938: .4byte 0x03004DF0
_0804093C:
	ldr r6, _080409EC @ =0x03004DF0
	ldr r2, [r6]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r4, #4
	ands r0, r4
	cmp r0, #0
	beq _080409E4
	adds r0, r2, #0
	bl GetUnitItemCount
	cmp r0, #4
	ble _0804095E
	orrs r5, r4
_0804095E:
	ldr r1, [r6]
	ldr r0, [r1]
	ldrb r0, [r0, #4]
	cmp r0, #0x1c
	bne _08040976
	ldrb r1, [r1, #0xa]
	movs r2, #8
	adds r0, r2, #0
	ands r0, r1
	cmp r0, #0
	beq _08040976
	orrs r5, r2
_08040976:
	ldr r0, _080409EC @ =0x03004DF0
	ldr r0, [r0]
	add r6, sp, #0xc
	adds r1, r5, #0
	adds r2, r6, #0
	movs r3, #0
	bl sub_8040B34
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080409E4
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldr r2, _080409F0 @ =0x0203AA00
	adds r2, #0x7e
	ldrb r3, [r2]
	movs r5, #0
	str r5, [sp]
	movs r2, #0
	bl sub_803BA10
	ldr r4, _080409F4 @ =0x0203AA90
	movs r0, #0xa
	ldrsb r0, [r4, r0]
	cmp r0, #1
	bne _080409E4
	add r0, sp, #0xc
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #2
	ldrsh r1, [r6, r2]
	ldrb r2, [r4, #2]
	ldrb r3, [r4, #3]
	str r5, [sp]
	bl sub_803BF60
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _080409E4
	ldrb r0, [r4, #2]
	ldrb r1, [r4, #3]
	lsls r2, r7, #0x18
	lsrs r2, r2, #0x18
	str r2, [sp]
	str r5, [sp, #4]
	str r5, [sp, #8]
	movs r2, #6
	movs r3, #0
	bl AiSetDecision
_080409E4:
	add sp, #0x10
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080409EC: .4byte 0x03004DF0
_080409F0: .4byte 0x0203AA00
_080409F4: .4byte 0x0203AA90

