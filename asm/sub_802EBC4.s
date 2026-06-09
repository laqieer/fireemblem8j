	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802EBC4, "ax", %progbits
@ sub_802EBC4 @ JP 0x0802EBC4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EBC4
	.thumb_func
sub_802EBC4:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802EC04 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r0, #0x31
	ldrb r2, [r0]
	movs r1, #0xf
	ands r1, r2
	movs r2, #0x70
	orrs r1, r2
	strb r1, [r0]
	adds r0, r5, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802EC04: .4byte 0x0203A954

