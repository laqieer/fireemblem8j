	.syntax unified
	.set GetUnit, 0x08019108 + 1
	.set sub_802C94C, 0x0802C94C + 1
	.set sub_802CA5C, 0x0802CA5C + 1
	.set sub_802CB8C, 0x0802CB8C + 1
	.section .text.sub_802F1A0, "ax", %progbits
@ sub_802F1A0 @ JP 0x0802F1A0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_802F1A0
	.thumb_func
sub_802F1A0:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r4, _0802F1D8 @ =0x0203A954
	ldrb r0, [r4, #0xc]
	bl GetUnit
	ldrb r1, [r4, #0x12]
	bl sub_802CA5C
	ldr r0, _0802F1DC @ =0x0203A568
	ldrb r1, [r4, #0x13]
	strb r1, [r0, #0x10]
	ldrb r2, [r4, #0x14]
	strb r2, [r0, #0x11]
	adds r3, r0, #0
	adds r3, #0x73
	strb r1, [r3]
	adds r0, #0x74
	strb r2, [r0]
	adds r0, r5, #0
	bl sub_802CB8C
	bl sub_802C94C
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0802F1D8: .4byte 0x0203A954
_0802F1DC: .4byte 0x0203A568

