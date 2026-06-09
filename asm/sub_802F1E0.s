	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set MakeNewItem, 0x080162E8 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB00, 0x0802CB00 + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802F1E0, "ax", %progbits
@ sub_802F1E0 @ JP 0x0802F1E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F1E0
	.thumb_func
sub_802F1E0:
	push {r4, r5, r6, lr}
	adds r6, r0, #0
	ldr r4, _0802F234 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xd]
	bl GetUnit
	bl sub_802CB00
	ldrb r0, [r4, #0xd]
	bl GetUnit
	adds r5, r0, #0
	ldrb r0, [r4, #0xd]
	bl GetUnit
	ldrb r1, [r4, #0x15]
	lsls r1, r1, #1
	adds r0, #0x1e
	adds r0, r0, r1
	ldrh r0, [r0]
	bl MakeNewItem
	ldrb r1, [r4, #0x15]
	lsls r1, r1, #1
	adds r5, #0x1e
	adds r5, r5, r1
	strh r0, [r5]
	adds r0, r6, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0802F234: .4byte 0x0203A954

