	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set SetUnitStatus, 0x08017680 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802EB58, "ax", %progbits
@ sub_802EB58 @ JP 0x0802EB58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EB58
	.thumb_func
sub_802EB58:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802EBBC @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r0, #0x30
	ldrb r1, [r0]
	movs r0, #0xf
	ands r0, r1
	cmp r0, #0xb
	bne _0802EBA0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldr r1, [r0, #0xc]
	ldr r2, _0802EBC0 @ =0xFFFFFBBD
	ands r1, r2
	str r1, [r0, #0xc]
_0802EBA0:
	ldrb r0, [r4, #0xd]
	bl GetUnit
	movs r1, #0
	bl SetUnitStatus
	adds r0, r5, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EBBC: .4byte 0x0203A954
_0802EBC0: .4byte 0xFFFFFBBD

