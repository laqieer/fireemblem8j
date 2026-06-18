	.syntax unified
	.set GetSelectTargetCount, 0x08050A9C + 1
	.set GetTarget, 0x08050AA8 + 1
	.set GetUnit, 0x08019108 + 1
	.set sub_8016D60, 0x08016D60 + 1
	.set sub_801907C, 0x0801907C + 1
	.set sub_8025E54, 0x08025E54 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802F08C, "ax", %progbits
@ ExecFortify @ JP 0x0802F08C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global ExecFortify
	.thumb_func
ExecFortify:
	push {r4, r5, r6, r7, lr}
	adds r7, r0, #0
	ldr r4, _0802F100 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0xc]
	bl GetUnit
	bl sub_8025E54
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
	adds r6, r0, #0
	bl GetSelectTargetCount
	adds r5, r0, #0
	movs r4, #0
	cmp r4, r5
	bge _0802F0F0
_0802F0D4:
	adds r0, r4, #0
	bl GetTarget
	ldrb r0, [r0, #2]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl GetUnit
	adds r1, r6, #0
	bl sub_801907C
	adds r4, #1
	cmp r4, r5
	blt _0802F0D4
_0802F0F0:
	adds r0, r7, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0802F100: .4byte 0x0203A954

