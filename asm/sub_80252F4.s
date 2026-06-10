	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set AreUnitsAllied, 0x08024D3C + 1
	.set CanUnitRescue, 0x08018030 + 1
	.section .text.sub_80252F4, "ax", %progbits
@ sub_80252F4 @ JP 0x080252F4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80252F4
	.thumb_func
sub_80252F4:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r5, _08025360 @ =0x02033F38
	ldr r0, [r5]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r4, r1]
	bl AreUnitsAllied
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802535A
	ldr r2, [r5]
	ldr r0, [r2, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _0802535A
	ldr r0, [r4, #4]
	ldrb r0, [r0, #4]
	cmp r0, #0x51
	beq _0802535A
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #4
	beq _0802535A
	ldr r0, [r4, #0xc]
	movs r1, #0x30
	ands r0, r1
	cmp r0, #0
	bne _0802535A
	adds r0, r2, #0
	adds r1, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0802535A
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	movs r3, #0
	bl AddTarget
_0802535A:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08025360: .4byte 0x02033F38

