	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_8016D60, 0x08016D60 + 1
	.set sub_8018E64, 0x08018E64 + 1
	.set sub_801907C, 0x0801907C + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802EAD0, "ax", %progbits
@ sub_802EAD0 @ JP 0x0802EAD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802EAD0
	.thumb_func
sub_802EAD0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802EB4C @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xc]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r1, [r0]
	adds r0, r5, #0
	bl sub_8016D60
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r1, r5, #0
	bl sub_801907C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_8018E64
	ldr r1, _0802EB50 @ =0x0203A604
	ldr r2, [r1]
	ldr r5, _0802EB54 @ =0x0203A568
	ldrb r1, [r5, #0x13]
	subs r1, r1, r0
	strb r1, [r2, #3]
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_8018E64
	strb r0, [r5, #0x13]
	adds r0, r6, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802EB4C: .4byte 0x0203A954
_0802EB50: .4byte 0x0203A604
_0802EB54: .4byte 0x0203A568

