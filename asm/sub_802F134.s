	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set Roll1RN, 0x08000C78 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8025EE8, 0x08025EE8 + 1
	.set sub_802CC14, 0x0802CC14 + 1
	.section .text.sub_802F134, "ax", %progbits
@ sub_802F134 @ JP 0x0802F134 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F134
	.thumb_func
sub_802F134:
	push {r4, r5, r6, lr}
	ldr r0, _0802F19C @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	bl sub_8025EE8
	bl GetSelectTargetCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0802F196
_0802F14E:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	ldr r0, _0802F19C @ =0x0203A954
	ldrb r0, [r0, #0xc]
	bl GetUnit
	adds r1, r4, #0
	bl sub_802CC14
	bl Roll1RN
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0802F190
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0
	bne _0802F190
	adds r0, r4, #0
	movs r1, #2
	bl SetUnitStatus
_0802F190:
	adds r5, #1
	cmp r5, r6
	blt _0802F14E
_0802F196:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F19C: .4byte 0x0203A954

