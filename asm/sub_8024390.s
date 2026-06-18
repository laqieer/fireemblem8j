	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8025C48, 0x08025C48 + 1
	.section .text.sub_8024390, "ax", %progbits
@ SummonCommandUsability @ JP 0x08024390 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SummonCommandUsability
	.thumb_func
SummonCommandUsability:
	push {r4, r5, lr}
	ldr r4, _080243DC @ =0x03004DF0
	ldr r2, [r4]
	ldr r0, [r2]
	ldr r1, [r2, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #0x14
	ands r0, r1
	cmp r0, #0
	beq _0802440C
	ldr r0, [r2, #0xc]
	movs r1, #0x40
	ands r0, r1
	cmp r0, #0
	bne _0802440C
	adds r0, r2, #0
	bl sub_8025C48
	bl GetSelectTargetCount
	cmp r0, #0
	beq _0802440C
	movs r5, #1
	rsbs r5, r5, #0
	movs r2, #0
	ldr r0, [r4]
	ldr r0, [r0]
	ldr r1, _080243E0 @ =0x089CFD18
	ldrb r0, [r0, #4]
	adds r3, r1, #0
	ldrb r1, [r3]
	cmp r0, r1
	bne _080243E4
	movs r5, #0
	b _08024404
	.align 2, 0
_080243DC: .4byte 0x03004DF0
_080243E0: .4byte 0x089CFD18
_080243E4:
	adds r0, r2, #1
	lsls r0, r0, #0x10
	lsrs r2, r0, #0x10
	cmp r2, #2
	bhi _08024404
	ldr r0, _08024410 @ =0x03004DF0
	ldr r0, [r0]
	ldr r1, [r0]
	lsls r0, r2, #1
	adds r0, r0, r3
	ldrb r1, [r1, #4]
	ldrb r0, [r0]
	cmp r1, r0
	bne _080243E4
	lsls r0, r2, #0x10
	asrs r5, r0, #0x10
_08024404:
	movs r0, #1
	rsbs r0, r0, #0
	cmp r5, r0
	bne _08024420
_0802440C:
	movs r0, #3
	b _08024460
	.align 2, 0
_08024410: .4byte 0x03004DF0
_08024414:
	ldr r0, _0802441C @ =0xFFFEFFF3
	ands r1, r0
	str r1, [r2, #0xc]
	b _0802445E
	.align 2, 0
_0802441C: .4byte 0xFFFEFFF3
_08024420:
	movs r4, #1
	lsls r1, r5, #1
	ldr r0, _08024450 @ =0x089CFD19
	adds r5, r1, r0
_08024428:
	adds r0, r4, #0
	bl GetUnit
	adds r2, r0, #0
	cmp r2, #0
	beq _08024458
	ldr r0, [r2]
	cmp r0, #0
	beq _08024458
	ldrb r0, [r0, #4]
	ldrb r1, [r5]
	cmp r0, r1
	bne _08024458
	ldr r1, [r2, #0xc]
	ldr r0, _08024454 @ =0x0001000C
	ands r0, r1
	cmp r0, #0
	bne _08024414
	b _0802440C
	.align 2, 0
_08024450: .4byte 0x089CFD19
_08024454: .4byte 0x0001000C
_08024458:
	adds r4, #1
	cmp r4, #0x3f
	ble _08024428
_0802445E:
	movs r0, #1
_08024460:
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0

