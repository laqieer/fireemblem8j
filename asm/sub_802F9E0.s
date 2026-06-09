	.syntax unified
	.set AddLightRune, 0x0802E990 + 1
	.set GetUnit, 0x08019108 + 1
	.set StartLightRuneAnim, 0x0802137C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802F9E0, "ax", %progbits
@ sub_802F9E0 @ JP 0x0802F9E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F9E0
	.thumb_func
sub_802F9E0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802FA18 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldrb r0, [r4, #0x13]
	ldrb r1, [r4, #0x14]
	bl AddLightRune
	adds r0, r5, #0
	bl sub_802CB8C
	ldrb r1, [r4, #0x13]
	ldrb r2, [r4, #0x14]
	adds r0, r5, #0
	bl StartLightRuneAnim
	ldr r0, _0802FA1C @ =0x0203A568
	adds r0, #0x6f
	movs r1, #0xff
	strb r1, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802FA18: .4byte 0x0203A954
_0802FA1C: .4byte 0x0203A568

