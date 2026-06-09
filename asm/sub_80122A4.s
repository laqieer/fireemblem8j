	.syntax unified
	.set AiRefreshMap, 0x0803A09C + 1
	.set GetUnit, 0x08019108 + 1
	.set RefreshEntityBmMaps, 0x08019ECC + 1
	.set sub_8027144, 0x08027144 + 1
	.section .text.sub_80122A4, "ax", %progbits
@ sub_80122A4 @ JP 0x080122A4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80122A4
	.thumb_func
sub_80122A4:
	push {r4, r5, r6, r7, lr}
	ldr r5, _08012328 @ =0x0203A4E8
	movs r0, #0xb
	ldrsb r0, [r5, r0]
	bl GetUnit
	adds r6, r0, #0
	ldr r4, _0801232C @ =0x0203A568
	movs r0, #0xb
	ldrsb r0, [r4, r0]
	bl GetUnit
	adds r7, r0, #0
	ldrb r0, [r5, #0x13]
	movs r1, #0
	strb r0, [r6, #0x13]
	ldrb r0, [r4, #0x13]
	strb r0, [r7, #0x13]
	ldr r0, _08012330 @ =0x0203A954
	str r1, [r0, #0x18]
	bl AiRefreshMap
	ldr r0, _08012334 @ =0x030005F4
	ldrh r1, [r0]
	ldr r0, _08012338 @ =0x0000FFFF
	cmp r1, r0
	beq _080122DC
	strh r1, [r6, #0x1e]
_080122DC:
	ldr r0, [r6, #0xc]
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	str r0, [r6, #0xc]
	ldr r0, [r7, #0xc]
	ands r0, r1
	str r0, [r7, #0xc]
	ldr r0, _0801233C @ =0x0203A4D0
	ldrh r1, [r0]
	movs r0, #0x80
	ands r0, r1
	cmp r0, #0
	beq _08012318
	movs r0, #0x13
	ldrsb r0, [r6, r0]
	cmp r0, #0
	bne _08012308
	ldr r0, [r6, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r6, #0xc]
_08012308:
	movs r0, #0x13
	ldrsb r0, [r7, r0]
	cmp r0, #0
	bne _08012318
	ldr r0, [r7, #0xc]
	movs r1, #5
	orrs r0, r1
	str r0, [r7, #0xc]
_08012318:
	bl RefreshEntityBmMaps
	bl sub_8027144
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08012328: .4byte 0x0203A4E8
_0801232C: .4byte 0x0203A568
_08012330: .4byte 0x0203A954
_08012334: .4byte 0x030005F4
_08012338: .4byte 0x0000FFFF
_0801233C: .4byte 0x0203A4D0

