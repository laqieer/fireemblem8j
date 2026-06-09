	.syntax unified
	.set AddTarget, 0x08050630 + 1
	.set CanUnitRescue, 0x08018030 + 1
	.set GetUnit, 0x08019108 + 1
	.set IsSameAllegiance, 0x08024D54 + 1
	.section .text.sub_8025424, "ax", %progbits
@ sub_8025424 @ JP 0x08025424 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8025424
	.thumb_func
sub_8025424:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802548C @ =0x02033F38
	ldr r0, [r4]
	ldrb r0, [r0, #0xb]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	movs r1, #0xb
	ldrsb r1, [r5, r1]
	bl IsSameAllegiance
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025486
	ldr r0, [r5, #0xc]
	movs r1, #0x10
	ands r0, r1
	cmp r0, #0
	beq _08025486
	ldr r0, [r5]
	ldr r1, [r5, #4]
	ldr r0, [r0, #0x28]
	ldr r1, [r1, #0x28]
	orrs r0, r1
	movs r1, #0x80
	lsls r1, r1, #2
	ands r0, r1
	cmp r0, #0
	bne _08025486
	ldr r4, [r4]
	ldrb r0, [r5, #0x1b]
	bl GetUnit
	adds r1, r0, #0
	adds r0, r4, #0
	bl CanUnitRescue
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _08025486
	movs r0, #0x10
	ldrsb r0, [r5, r0]
	movs r1, #0x11
	ldrsb r1, [r5, r1]
	movs r2, #0xb
	ldrsb r2, [r5, r2]
	movs r3, #0
	bl AddTarget
_08025486:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802548C: .4byte 0x02033F38

