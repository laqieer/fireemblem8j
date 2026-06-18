	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set GetTypedTrapAt, 0x0802E184 + 1
	.set GetUnit, 0x08019108 + 1
	.set InitTargets, 0x08050618 + 1
	.section .text.sub_8025A14, "ax", %progbits
@ MakeGorgonEggHatchTargetList @ JP 0x08025A14 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global MakeGorgonEggHatchTargetList
	.thumb_func
MakeGorgonEggHatchTargetList:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r7, r0, #0
	movs r0, #5
	mov r8, r0
	movs r0, #0
	movs r1, #0
	bl InitTargets
	adds r6, r7, #1
	b _08025AAA
_08025A2C:
	adds r0, r6, #0
	bl GetUnit
	adds r4, r0, #0
	cmp r4, #0
	beq _08025AA8
	ldr r0, [r4]
	cmp r0, #0
	beq _08025AA8
	ldr r5, [r4, #0xc]
	ldr r0, _08025A7C @ =0x0001002C
	ands r5, r0
	cmp r5, #0
	bne _08025AA8
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xa
	bne _08025AA8
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xc
	bl GetTypedTrapAt
	adds r2, r0, #0
	cmp r2, #0
	beq _08025AA8
	ldrb r0, [r2, #4]
	subs r0, #1
	cmp r0, #0
	ble _08025A80
	strb r0, [r2, #4]
	ldrb r0, [r2, #5]
	strb r0, [r2, #6]
	b _08025AA8
	.align 2, 0
_08025A7C: .4byte 0x0001002C
_08025A80:
	strb r5, [r2, #4]
	ldrb r0, [r2, #6]
	adds r0, #1
	strb r0, [r2, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #5
	ldrsb r1, [r2, r1]
	cmp r0, r1
	blt _08025AA8
	strb r5, [r2, #6]
	movs r0, #0x10
	ldrsb r0, [r4, r0]
	movs r1, #0x11
	ldrsb r1, [r4, r1]
	movs r2, #0xb
	ldrsb r2, [r4, r2]
	mov r3, r8
	bl AddTarget
_08025AA8:
	adds r6, #1
_08025AAA:
	adds r0, r7, #0
	adds r0, #0x40
	cmp r6, r0
	blt _08025A2C
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

