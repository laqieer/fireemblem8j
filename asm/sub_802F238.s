	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_8018EA4, 0x08018EA4 + 1
	.set sub_8019040, 0x08019040 + 1
	.set sub_802632C, 0x0802632C + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802F238, "ax", %progbits
@ sub_802F238 @ JP 0x0802F238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F238
	.thumb_func
sub_802F238:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F29C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_802632C
	bl GetSelectTargetCount
	adds r6, r0, #0
	movs r5, #0
	cmp r5, r6
	bge _0802F28C
_0802F260:
	adds r0, r5, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r4, r0, #0
	bl sub_8018EA4
	adds r1, r0, #0
	adds r0, r4, #0
	bl sub_8019040
	adds r0, r4, #0
	movs r1, #0
	bl SetUnitStatus
	adds r5, #1
	cmp r5, r6
	blt _0802F260
_0802F28C:
	adds r0, r7, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F29C: .4byte 0x0203A954

